require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  #let(:post) { Post.new(user_id: 1) }
  describe "GET /posts/new " do
    it "responds with 200" do
    
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      User.create(email: "test@email.com", password: "password")
      sign_in User.first
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      User.create(email: "test@email.com", password: "password")
      sign_in User.first
      post :create, params: { post: { message: "Hello, world!", user_id: User.first.id } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end

