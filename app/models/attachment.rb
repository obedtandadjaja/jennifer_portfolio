class Attachment < ActiveRecord::Base

	belongs_to :project
	belongs_to :user

	validates :url, presence: true
	
end
