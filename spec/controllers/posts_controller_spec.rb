require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      user = User.create(email: "example@example.com", password: "password", password_confirmation: "password")
      post :create, params: { post: { message: "Hello, world!" } }, session: { user_id: user.id } 
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      user = User.create(email: "example@example.com", password: "password", password_confirmation: "password")
      post :create, params: { post: { message: "Hello, world!" } }, session: { user_id: user.id } 
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

RSpec.describe "API V1 Post", type: 'request' do
  describe "POST /api/v1/posts" do

    it "GET /posts" do
      get '/api/v1/posts'
      expect(response).to have_http_status(200)
    end

    it "POST /posts" do
      user = User.create(email: "example@example.com", password: "password", password_confirmation: "password")
      post '/api/v1/posts', params: { post: { message: "Hello, world!"}}
      expect(response).to have_http_status(200)
    end

  end
end
