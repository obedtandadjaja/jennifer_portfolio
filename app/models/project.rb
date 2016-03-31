class Project < ActiveRecord::Base
	belongs_to :user
	has_many :attachment

	extend FriendlyId
  	friendly_id :title, use: :slugged
end
