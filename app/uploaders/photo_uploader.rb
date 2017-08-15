class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumbnail do
    cloudinary_transformation width: 400, height: 350, crop: :thumb, gravity: :face
  end
  
end