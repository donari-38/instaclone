# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
end
