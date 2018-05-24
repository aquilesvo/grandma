class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  # version :thumbnail do
  #   # resize_to_fit 250, 160
  #   process :resize_to_fill => [250, 160, :fill]
  # end

  version :bright_face do
    cloudinary_transformation effect: "brightness:15", radius: 20,
    width: 250, height: 250, crop: :thumb, gravity: :face
  end
end
