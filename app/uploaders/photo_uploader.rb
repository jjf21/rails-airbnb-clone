class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumbnail do
    resize_to_fit 400, 350
  end
  
end