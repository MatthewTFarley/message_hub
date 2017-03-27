require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'attributes' do
    setup do
      @attributes = {
        first_name: 'Jean Luc',
        last_name: 'Picard',
        email: 'jpicard@starfleet.gov',
        password: 'earl-grey'
      }
    end

    it 'should have a first name, last name, email, and password' do
      user = User.new(@attributes)
      expect(user.valid?).to be(true)
    end

    it 'should be invalid without a first name' do
      @attributes.delete(:first_name)
      user = User.new(@attibutes)
      expect(user.valid?).to be(false)
    end

    it 'should be invalid without a last name' do
      @attributes.delete(:last_name)
      user = User.new(@attibutes)
      expect(user.valid?).to be(false)
    end

    it 'should be invalid without an email' do
      @attributes.delete(:email)
      user = User.new(@attibutes)
      expect(user.valid?).to be(false)
    end

    it 'should be invalid without a password' do
      @attributes.delete(:password)
      user = User.new(@attibutes)
      expect(user.valid?).to be(false)
    end
  end
end
