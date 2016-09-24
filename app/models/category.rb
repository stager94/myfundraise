class Category < ActiveRecord::Base

	extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders]

  has_many :campaigns

	has_attached_file :foto, styles: { small: "100x100#", thumb: "256x256#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

	has_attached_file :cover
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

	validates_presence_of :title, :full_title, :slug
	validates_uniqueness_of :slug, :title

	scope :regular, -> { where popular: false }
	scope :popular, -> { where popular: true }
end
