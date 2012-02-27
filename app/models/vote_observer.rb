class VoteObserver < ActiveRecord::Observer
  observe :vote

  def after_create(vote)
    # Update scorecard
    votable = vote.votable
    votable.points += 1 if vote.positive?
    votable.points -= 1 if vote.negative? && !votable.is_a?(Post) # Don't allow downvotes of post
    votable.save

    # We'll also up/downvote the poster/author
    target = votable.is_a?(Post) ? votable.poster : votable.author
    target.points += 1 if vote.positive?
    target.points -= 1 if vote.negative?
    target.save
  end
end
