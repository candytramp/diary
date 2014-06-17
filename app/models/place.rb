class Place < ActiveRecord::Base
	validates :description, length:{maximum: 2048}
  validates :name, presence: true
	has_many :tasks,  dependent: :nullify
  belongs_to :user
end
