class Articles::CommentsController < ApplicationController
  def index
    # TODO param check
    validate_index_param(params)
    logger.debug(" Articles::CommentController index params[:article_id] #{params[:article_id]}")
    if params[:article_id].present?
      @result = ArticleComment.where(article_id: params[:article_id]).order("created_at ASC").limit(params[:count] ||= 20)
      if @result.present?
        return render json: "{}"
      end
    end
    logger.debug(" Articles::CommentController NO Data")
    render json: "{}"
  end

  def create
  end

  private
    def validate_index_param(params)
      return false unless params[:article_id].empty?
      return false unless params[:article_id].to_i
    end
end
