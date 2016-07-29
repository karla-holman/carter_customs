class Project < ActiveRecord::Base
	has_many :images

	validates :name, presence: true, uniqueness: true

	scope :current, ->{ where(completed_date > Date.today) }

	has_attached_file :main_image, styles: { 
		large: "2000x1600",
		medium: "300x300>", 
		thumb: "100x100>" 
	}, 
	default_url: "/images/:style/missing.png",
	:storage => :s3,
   :bucket => 'carter-customs'

  	validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\Z/

	def complete?
		complete_date.present?
	end

	def format_date
		complete_date.strftime('%m.%d.%Y')
	end
end
