class Project < ActiveRecord::Base
	has_many :images

	validates :name, presence: true, uniqueness: true

	scope :current, ->{ where(completed_date > Date.today) }
end
