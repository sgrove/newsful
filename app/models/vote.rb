class Vote < ActiveRecord::Base
  belongs_to :voter,   :polymorphic => true
  belongs_to :votable, :polymorphic => true

  validates_presence_of   :voter_id
  validates_presence_of   :votable_id
  validates_uniqueness_of :votable_id, :scope => :voter_id

  before_validation :cannot_vote_for_self

  ## Class methods
  class << self
    def already_voted?(voter, votable)
      Vote.where("voter_id = ? AND votable_id = ?", voter.id, votable.id).first
    end

    def desperate?(voter, votable)
      votable.created_by?(voter)
    end
  end

  ## Instance methods
  def cannot_vote_for_self
    if votable.created_by?(voter)
      errors << "Cannot vote for that"
      return false
    end

    true
  end

  def negative?
    !self.positive
  end
end
