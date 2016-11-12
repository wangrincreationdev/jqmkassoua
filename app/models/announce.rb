class Announce < ApplicationRecord
  mount_uploader :image, ImageUploader
  validate :image_size
  validates :nom, :description, :prix, presence: true
  validates :prix, numericality: { greater_than: 0 }
  validates :image, presence: true

  belongs_to :user

  private
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "doit etre pas plus grande que 5MB")
      end
    end

end


