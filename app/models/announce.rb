class Announce < ApplicationRecord
  mount_uploader :image, ImageUploader
  validate :image_size


  private
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "doit etre pas plus grande que 5MB")
      end
    end

end


