class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, :polymorphic => true

  validates_presence_of :author_id

  before_validation Proc.new { |user| user.points ||= 1 }

  def parent
    Comment.find(self.parent_id)
  end

  def ancestors
    ancestors = []
    ancestor = self.parent
    until ancestor.nil?
      ancestors << ancestor
      ancestor = ancestor.parent
    end

    ancestors
  end

  # Used for threading comments on the frontend
  def depth
    ancestors.length
  end

  # Only returns children of comment, not grandchildren
  def children
    Comment.order("created_at").where("parent_id = ?", self.id).all
  end

  def to_s
    self.body
  end

  def already_voted?(voter)
    Vote.already_voted?(voter, self)
  end

  def created_by?(author)
    self.author == author
  end
end
