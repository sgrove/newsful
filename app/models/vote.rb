class Vote < ActiveRecord::Base
  belongs_to :voter,   :polymorphic => true
  belongs_to :votable, :polymorphic => true

  def negative?
    !self.positive
  end
end
