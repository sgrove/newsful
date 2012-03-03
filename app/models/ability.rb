class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [:read, :search], Post

    if user.persisted? and user.kind_of?(User)
      can :create, Post
      # can :update, Post { |post| post.poster_id == user.id && post.editable? }

      can :create, Comment
      # can :update, Comment { |post| comment.author_id == user.id && comment.editable? }
    end

    can :manage, :all if user.kind_of?(Admin)
  end
end
