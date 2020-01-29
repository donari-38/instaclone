# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User, type: :model do
  # render_views # なぜかうまく通らない

  let(:user) do
    User.new(name: 'Example User', email: 'user@example.com',
             password: 'foobar', password_confirmation: 'foobar')
  end

  # describe 'valid?' do
  #   it ''

  example 'should be valid' do
    assert user.valid?
  end

  # example 'name should be present' do
  #   user.name = '  '
  #   assert_not user.valid?
  # end

  describe 'name' do
    it 'ユーザーが有効でないか判断' do
      expect(user.valid?).to eq true
    end
  end

  # example 'name should not be too long' do
  #   user.name = 'a' * 51
  #   assert_not user.valid?
  # end

  describe 'name long' do
    it 'ユーザー名の長い' do
      user.name = 'a' * 51
      expect(user.valid?).to eq false
    end
  end

  # example 'email should not be too long' do
  #   user.email = 'a' * 244 + '@example.com'
  #   assert_not user.valid?
  # end

  describe 'email long' do
    it 'Eメールが長い' do
      user.email = 'a' * 244 + '@example.com'
      expect(user.valid?).to eq false
    end
  end

  example 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      assert user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  #   describe 'email validation should accept valid addresses' do
  #   it '有効なメールアドレス' do
  #     valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
  #                         first.last@foo.jp alice+bob@baz.cn]
  #     valid_addresses.each do |valid_address|
  #       user.email = valid_address
  #       # assert user.valid?, "#{valid_address.inspect} should be valid"
  #       expect(user.valid?, "#{valid_address.inspect} should be valid").to eq true
  #     end
  #   end
  # end

  describe 'email validation should reject invalid addresses' do
    it '無効なメールアドレス' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        # assert_not user.valid?, "#{invalid_address.inspect} should be invalid"
        expect(user.valid?).to eq false
        # expect("#{invalid_address.inspect} should be invalid").to eq false   うまくいかないから保留
      end
    end
  end

  #   test "email validation should reject invalid addresses" do
  #   invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
  #                         foo@bar_baz.com foo@bar+baz.com]
  #   invalid_addresses.each do |invalid_address|
  #     user.email = invalid_address
  #     assert_not user.valid?, "#{invalid_address.inspect} should be invalid"
  #   end
  # end

  describe 'unique' do
    it '重複したメールアドレス ' do
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      user.save
      expect(duplicate_user.valid?).to eq false
    end
  end

  # example 'password should be present (nonblank)' do
  #   user.password = user.password_confirmation = ' ' * 6
  #   assert_not user.valid?
  # end

  describe 'nonblank' do
    it 'パスワードが空ではない' do
      user.password = user.password_confirmation = ' ' * 6
      expect(user.valid?).to eq false
    end
  end

  # example 'password should have a minimum length' do
  #   user.password = user.password_confirmation = 'a' * 5
  #   assert_not user.valid?
  # end

  describe 'minimum length' do
    it '最小文字数は６文字' do
      user.password = user.password_confirmation = 'a' * 5
      expect(user.valid?).to eq false
    end
  end
end
