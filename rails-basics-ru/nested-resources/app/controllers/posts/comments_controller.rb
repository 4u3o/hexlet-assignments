class Posts::CommentsController < Posts::ApplicationController
  before_action :set_comment, only: %i[edit show update destroy]

  def show
  end

  def new
    @post_comment = resource_post.post_comments.new
  end

  def edit
  end

  def create
    @post_comment = resource_post.post_comments.build(comment_params)

    if @post_comment.save
      redirect_to resource_post, notice: 'Comment was created'
    else
      render :new
    end
  end

  def update
    if @post_comment.update(comment_params)
      redirect_to @post_comment.post
    else
      render :edit
    end
  end

  def destroy
    @post_comment.destroy

    redirect_to @post_comment.post
  end

  private

    def set_comment
      @post_comment = PostComment.find(params[:id])
    end

    def comment_params
      params.require(:post_comment).permit(:body)
    end
end
