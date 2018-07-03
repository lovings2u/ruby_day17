class Movie < ApplicationRecord
    mount_uploader :image_path, ImageUploader
    belongs_to :user
end
