class Post
  attr_reader :id,
              :title,
              :description,
              :created_at,
              :subposts
  def initialize(params)
    @id = params[:id]
    @title = params[:title]
    @description = params[:description]
    @created_at = params[:created_at]
    @page = params[:page]
  end

  def self.database
    database = SQLite3::Database.new('db/posts.db')
    database.results_as_hash = true
    database
  end

  def self.all_personal
    database = Post.database
    posts = database.execute("SELECT * FROM posts WHERE page=?;", 1)
    posts.map do |post|
      Post.new(post)
    end
  end

  def self.all_discussions
    database = Post.database
    posts = database.execute("SELECT * FROM posts WHERE page=?;", 2)
    posts.map do |post|
      Post.new(post)
    end
  end

  def subposts
    database = Post.database
    subposts = database.excecute("SELECT * FROM subposts WHERE post_id=?", id)
    subposts.map do |subpost|
      Subpost.new(subpost)
    end
  end

  def find_by_id(id)
    database = Post.database
    post = database.excecute("SELECT * FROM posts WHERE id=?", id)
    Post.new(post)
  end
end
