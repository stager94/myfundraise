class Partner < ActiveRecord::Base
	has_attached_file :foto, styles: { thumb: "200x200#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
end
