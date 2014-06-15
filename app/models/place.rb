class Place < ActiveRecord::Base
	validates :description, length:{maximum: 2048}
	has_many :tasks #заполнить нилом место проведения
end
