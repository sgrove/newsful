class Comment < ActiveRecord::Base
  belongs_to :author

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

  # Only returns children of comment, not grandchildren
  def children
    Comment.order("created_at").where("parent_id = ?", self.id).all
  end
end
