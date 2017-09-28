class Picture < ActiveRecord::Base
  belongs_to :user
  validates :text, presence: true

    mount_uploader :image, PictureUploader

end
