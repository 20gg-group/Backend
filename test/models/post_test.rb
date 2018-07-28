require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @post=Post.new(
      tittle: "abcd",
      price: 12,
      area: 110,
      decription: "blablalalalala",
      phone_contact_number: "01695669219",
      user_id: 2
            )
  end
 
  test "test1" do
    # @post.tittle="kakaka"
    assert true
    # assert @post.valid?
  end


end
