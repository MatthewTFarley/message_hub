require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'attributes' do
    setup do
      user = User.create(
        first_name: 'Beverly',
        last_name: 'Crusher',
        email: 'bcrusher@starfleet.gov',
        password: 'wesley'
      )

      @post = Post.new(title: 'Post', body: 'This is the body', author: user)
    end

    it 'should have a title and a body' do
      expect(@post.valid?).to be(true)
    end

    it 'should be invalid without a title' do
      @post.title = nil
      expect(@post.invalid?).to be(true)
    end

    it 'should be invalid without a body' do
      @post.body = nil
      expect(@post.invalid?).to be(true)
    end

    it 'should be invalid without an author' do
      @post.author = nil
      expect(@post.invalid?).to be(true)
    end
  end
end
