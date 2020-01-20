class ProfileImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
   # MiniMagickをincludeすると画像サイズ調整ができるようになる
  storage :file # 保存形式の設定。他に使うものとしてはfog形式などがある。

  process :resize_to_limit => [50, 50] # 画像サイズの調整

  # 画像ファイルの保存先の設定
  # 保存先を指定するには `store_dir` というメソッドに定義します。
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def default_url(*args)
  #   "default.jpg"
  # end
end
