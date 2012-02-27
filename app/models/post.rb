class Post < ActiveRecord::Base
  belongs_to :poster, :polymorphic => true

  has_many :votes, :as => :votable
  has_many :comments

  before_validation :ensure_url_xor_body
  before_validation Proc.new { |post| post.points ||= 1 }

  validates_presence_of :title
  validates_presence_of :poster_id

  def sorted_children
    Comment.where("post_id = ? AND parent_id IS NULL", self.id).order("points DESC")
  end

  def to_s
    self.title
  end

  # TODO: This should check for time expiration
  def editable?
    true
  end

  def ensure_url_xor_body
    if both_url_and_body?
      self.errors.add(:url, "Post can only have a body or a url, not both.")
      return false
    end
    
    if no_body_or_url?
      self.errors.add(:url, "Post must have either a body or a url.")
      return false
    end

    return true
  end

  def both_url_and_body?
    return false if !self.url.blank? && !self.title.blank?
  end

  def no_body_or_url?
    return true if self.body.blank? && self.url.blank?
  end

  # Deprecated
  def posted_by?(user)
    self.poster && (self.poster == user)
  end

  def created_by?(poster)
    posted_by?(poster)
  end

  def already_voted?(voter)
    Vote.already_voted?(voter, self)
  end
end
