# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user, optional: true
  has_many :comments

  default_scope -> { order(created_at: :desc) }

  # validates :user_id, presence: true
  # validates :picture, presence: true
  # validates :content, presence: true, length: { maximum: 50 }
  # validate  :picture_size

  # private

  # def picture_size
  #   errors.add(:picture, 'should be less than 50MB') if picture.size > 50.megabytes
  # end
end
