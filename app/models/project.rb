class Project < ActiveRecord::Base
	belongs_to :user
	has_many :attachment

	extend FriendlyId
  	friendly_id :title, use: :slugged

  	def next
	    Project.where("id > ?", id).first
	end

	def prev
	    Project.where("id < ?", id).last
	end
end
