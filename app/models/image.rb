class Image < ActiveRecord::Base
	belongs_to :project

	has_attached_file :image_attach, styles: { 
		large: "2000x1600",
		medium: "300x300>", 
		thumb: "100x100>" 
	}, 
	default_url: "/images/:style/missing.png",
	:storage => :s3,
   :bucket => 'carter-customs'

  	validates_attachment_content_type :image_attach, content_type: /\Aimage\/.*\Z/
end
