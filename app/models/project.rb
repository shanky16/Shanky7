#
class Project < ApplicationRecord
  has_many :assigns
  has_many :users, :through => 'assigns'
  # has_attached_file :avatar, :styles =>
  # {
  #   :thumb => '200x200#',
  #   :small  => '400x400>',
  #   :medium => '800x800'
  # }, :default_url => 'public/default_image.png'

  # validates_attachment :avatar, content_type:
  # { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }
  # validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  # validates :requirements, presence: true
  # validates :domain, presence: true
end
