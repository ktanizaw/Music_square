class IconUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

    storage :file

    process :resize_to_limit => [300, 300]
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end
