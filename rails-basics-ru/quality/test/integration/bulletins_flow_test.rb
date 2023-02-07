require 'test_helper'

class BulletinsFlowTest < ActionDispatch::IntegrationTest
  test 'can see index page' do
    get bulletins_path

    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'can see show page' do
    get bulletin_path(bulletins(:one))

    assert_response :success
    assert_select 'h1', 'First'
    assert_select 'p', 'First body'
  end
end
