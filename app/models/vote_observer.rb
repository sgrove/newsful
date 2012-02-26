class VoteObserver < ActiveRecord::Observer
  observe :vote

  def after_create(vote)
    votable = vote.votable
    votable.points += 1 if vote.positive?
    votable.points -= 1 if vote.negative? && !votable.class == Post # Don't allow downvotes of post
    votable.save
  end
end
