namespace :bushido do
  desc "Run the initial setup for a Busido app. Copies config files and seeds db."
  task :install do
    user = User.new
    user.first_name = "Joe"
    user.last_name  = "User"
    user.email      = "joe.user@kanda.me"
    user.save
    
    post = Post.new
    post.title  = "First prost"
    post.url    = "http://kandan.me/"
    post.poster_id = user.id
    post.save

    comment = post.comments.new
    comment.author_id = user.id
    comment.body = "This is totally awesome you guys!"
    comment.points = rand(10)
    comment.save
  end
end
