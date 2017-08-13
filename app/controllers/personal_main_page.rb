class PersonalPage < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  require_relative "../models/post.rb"

  get "/" do
    erb :personal_main_page
  end

  get "/main" do
    erb :personal_main_page
  end

  get "/discussions" do
    erb :discussion_board
  end

  get "/contact" do
    erb :contact_page
  end

end
