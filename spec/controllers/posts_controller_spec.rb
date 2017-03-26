require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it 'should get index' do
    get :index

    expect(response).to have_http_status(:success)
  end

  it 'should show a requested post' do
    post = Post.create(title: 'Post', body: 'This is the body')

    get :show, id: post.id

    expect(response).to have_http_status(:success)
  end
end
