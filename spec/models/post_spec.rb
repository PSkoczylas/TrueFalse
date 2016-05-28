require 'spec_helper'

describe "User" do
  it "has a valid factory" do
    build(:post).should be_valid
  end
end
