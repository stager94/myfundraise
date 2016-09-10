class Partner < ActiveRecord::Base
	has_attached_file :foto, styles: { thumb: "x100>", thumb_gray: { geometry: "x100>", convert_options: '-colorspace Gray' } }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

	validates_uniqueness_of :title
end
