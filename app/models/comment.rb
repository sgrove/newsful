class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, :polymorphic => true

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

    ancestor
  end

  # Used for threading comments on the frontend
  def depth
    ancestor.length
  end

  # Only returns children of comment, not grandchildren
  def children
    Comment.order("created_at").where("parent_id = ?", self.id).all
  end
end
