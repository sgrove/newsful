class VoteObserver < ActiveRecord::Observer
  observe :vote

  def after_create(vote)
    votable = vote.votable
    votable.points += 1 if vote.positive?
    votable.points -= 1 if vote.negative? && !votable.class == Post # Don't allow downvotes of post
    votable.save

    # We'll also upvote the poster if the vote was on a post
    if votable.is_a?(Post)
      poster = votable.poster
      poster.points += 1 if vote.positive?
      poster.save
    end
  end
end
