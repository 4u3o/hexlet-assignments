# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def edit
    @comment = Post::Comment.find params[:id]
  end

  def create
    @comment = @resource_post.comments.build(comment_params)

    if @comment.save
      redirect_to @resource_post, notice: t('.success')
    else
      redirect_to @resource_post
    end
  end

  def update
    @comment = Post::Comment.find params[:id]

    if @comment.update(comment_params)
      redirect_to @resource_post, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Post::Comment.find params[:id]

    @comment.destroy

    redirect_to @resource_post
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:post_comment).permit(:body)
  end
end
