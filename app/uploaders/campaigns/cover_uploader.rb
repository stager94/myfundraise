# encoding: utf-8

class Campaigns::CoverUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  def store_dir
    "system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "/images/campaigns/" + [version_name, "default.png"].compact.join('_')
  end

  process :store_dimensions

  version :original do
  end

  version :large do
    process :crop
    resize_to_fill 1600, 900
    process :watermark
  end

  version :medium do
    process :crop
    resize_to_fill 800, 450
  end

  def crop
    if model.crop_x.present?
      # resize_to_fill 1600, 900
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop! x, y, w, h
      end
    end
  end

  def watermark
    manipulate! do |img|
      logo = Magick::Image.read("#{Rails.root}/public/logo.png").first
      img = img.composite(logo, Magick::SouthEastGravity, 10, 10, Magick::OverCompositeOp)
    end
  end

  def store_dimensions
    if file && model
      img = ::Magick::Image::read(file.file).first
      model.width = img.columns
      model.height = img.rows
    end
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
