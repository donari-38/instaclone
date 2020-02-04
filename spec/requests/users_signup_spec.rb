# frozen_string_literal: true
# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'user signup', type: :request do
#   example 'valid signup information' do
#     get signup_path
#     expect do
#       post signup_path, params: { user: { name: 'Example User',
#                                           email: 'user@example.com',
#                                           password: 'password',
#                                           password_confirmation: 'password' } }
#     end.to change(User, :count).by(1)
#     redirect_to @user
#     follow_redirect!
#     expect(response).to render_template('users/show')
#     expect(is_logged_in?).to eq false
#   end
# end
