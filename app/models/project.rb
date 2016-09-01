class Project < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged

  validates_uniqueness_of :slug
end
