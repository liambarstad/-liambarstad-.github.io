class Subpost
  attr_reader :id,
              :title,
              :description,
              :created_at,
              :post_id
  def initialize(params)
    @id = params[:id]
    @title = params[:title]
    @description = params[:description]
    @created_at = params[:created_at]
    @post_id = params[:post_id]
  end
end
