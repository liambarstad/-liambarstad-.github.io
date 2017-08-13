class PersonalPage < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  require_relative "../models/post.rb"
  require_relative "../models/subpost.rb"

  def create_post(page_name)
    new_post = Post.new(params[:post])
    new_post.save
    redirect page_name
  end

  get "/" do
    erb :personal_main_page
  end

  get "/main" do
    @main_posts = Post.all_personal
    erb :personal_main_page
  end

  post "/main" do
    create_post("/main")
  end

  get "/discussions" do
    @discussion_posts = Post.all_discussions
    erb :discussion_board
  end

  post "/discussions" do
    create_post("/discussions")
  end

  get "/contact" do
    erb :contact_page
  end

end
