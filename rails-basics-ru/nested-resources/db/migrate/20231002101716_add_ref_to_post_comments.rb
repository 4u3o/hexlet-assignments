class AddRefToPostComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :post_comments, :post, foreign_key: true
  end
end
