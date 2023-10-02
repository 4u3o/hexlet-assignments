require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:without_comments)
    @post_comment = post_comments(:one)
    @attrs = {
      body: Faker::ChuckNorris.fact
    }
  end

  test 'should get new' do
    get new_post_comment_url(@post)
    assert_response :success
  end

  test 'should create comment' do
    post post_comments_url(@post), params: { post_comment: @attrs }

    comment = PostComment.find_by @attrs

    assert { comment }
    assert_redirected_to post_url(@post)
  end

  test 'should get edit' do
    get edit_post_comment_url(@post_comment)
    assert_response :success
  end

  test 'should update comment' do
    patch post_comment_url(@post_comment), params: { post_comment: @attrs }

    @post_comment.reload

    assert { @post_comment.body == @attrs[:body] }
    assert_redirected_to @post_comment.post
  end

  test 'should destroy comment' do
    delete post_comment_url(@post_comment)

    assert { !PostComment.exists?(@post_comment.id) }

    assert_redirected_to @post_comment.post
  end
end
