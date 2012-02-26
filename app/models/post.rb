class Post < ActiveRecord::Base
  belongs_to :poster
  has_many :votes, :as => :votable
  has_many :comments

  before_validation :ensure_url_xor_body
  before_validation Proc.new { |post| post.points ||= 0 }

  def to_s
    self.title
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
    return false if !(self.body.nil? || self.body.blank?) &&
      !(self.url.nil? || self.url.nil?)
  end

  def no_body_or_url?
    return true if self.body.nil? && self.url.nil?
    return true if self.body.blank? && self.url.blank?
  end

  def posted_by?(user)
    self.poster && (self.poster == user)
  end
end
