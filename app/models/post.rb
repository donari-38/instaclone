# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :user_id, presence:true
  validates :picture, presence:true
  validate :picture_size
  
  private
  
  def picture_size
    errors.add(:picture, 'should be less than 10MB')
  end
end
