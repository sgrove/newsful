namespace :bushido do
  desc "Run the initial setup for a Busido app. Copies config files and seeds db."
  task :install => :environment do
    user = User.new
    user.first_name = "Joe"
    user.last_name  = "User"
    user.email      = "joe.user@kandan.me"
    user.username   = "joe_the_user"
    user.password   = "password"
    user.save!

    5.times do
      post = Post.new
      post.title  = "First prost"
      post.url    = "http://kandan.me/"
      post.poster = user
      post.points = rand(20)
      post.save!

      comment = post.comments.new
      comment.author = user
      comment.body = "This is totally awesome you guys!"
      comment.points = rand(10)
      comment.save!
    end
  end
end

