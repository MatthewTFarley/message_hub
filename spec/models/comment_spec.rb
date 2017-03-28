require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'attributes' do
    setup do
      user = User.create(
        first_name: 'Worf',
        last_name: 'Son of Mogh',
        email: 'worf@starfleet.gov',
        password: 'honor'
      )

      post = Post.create(title: 'Post', body: 'This is the body', author: user)

      @comment = Comment.new(body: 'This is the body', post: post, author: user)
    end

    it 'should have a body, post, and a user' do
      expect(@comment.valid?).to be(true)
    end

    it 'should be invalid without a body' do
      @comment.body = nil
      expect(@comment.invalid?).to be(true)
    end

    it 'should be invalid without a post' do
      @comment.post = nil
      expect(@comment.invalid?).to be(true)
    end

    it 'should be invalid without an author' do
      @comment.author = nil
      expect(@comment.invalid?).to be(true)
    end
  end
end
