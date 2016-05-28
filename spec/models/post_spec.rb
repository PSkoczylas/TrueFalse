require 'spec_helper'

describe "Post" do
  let!(:post) {build(:post)}

  it "has a valid factory" do
    post.should be_valid
  end

  it "is invalid without content" do
    post = build(:post, body: "")
    post.should_not be_valid
  end

  it "is invalid with two the same contents" do
    post_dup = post.dup
    post.save
    post_dup.should_not be_valid
  end
end
