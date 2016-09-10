class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable

	has_many :campaigns

	has_attached_file :foto, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/   
end
