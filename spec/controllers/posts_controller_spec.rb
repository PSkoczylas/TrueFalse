require 'spec_helper'

describe PostsController do
  render_views

  let!(:post1) { create(:post) }
  let!(:post2) { create(:post, body: "Better information", answer: false) }
  let!(:post3) { create(:post, body: "The best information") }
  let!(:user) { create(:user) }
  let!(:user_answer) { create(:user_answer, answer: false, user_id: user.id, post_id: post1.id) }

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "respnds successfuly HTTP 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "loads all of the posts into @posts" do
      get :index 
      expect(assigns(:posts)).to match([post1, post2, post3])
    end
  end

  describe "GET #show" do
    it "responds successfuly HTTP 200 status code" do
      get :show, {format: :html, id: post2.id}
      expect(response.status).to eq(200)
    end

    it "loads post into @post" do
      get :show, {format: :html, id: post2.id}
      expect(assigns(:post)).to match(post2)
    end
  end

end
