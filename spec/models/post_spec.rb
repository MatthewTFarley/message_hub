require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'attributes' do
    it 'should have a title and a body' do
      post = Post.new(title: 'Post', body: 'This is the body')
      expect(post.valid?).to be(true)
    end

    it 'should be invalid without a title' do
      post = Post.new(body: 'This is the body')
      expect(post.valid?).to be(false)
    end

    it 'should be invalid without a body' do
      post = Post.new(title: 'Title')
      expect(post.valid?).to be(false)
    end
  end
end
