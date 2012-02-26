class Vote < ActiveRecord::Base
  def positive?
    self.direction == "up"
  end

  def negative?
    !self.positive
  end
end
