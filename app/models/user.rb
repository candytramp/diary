class User < ActiveRecord::Base
   SEX=%w(мужской женский)
	validates :first_name , presence: true
	has_many :contact_lists, :as=> :friend
	has_many :partners, class_name: "ContactList", dependent: :destroy
	has_many :task_users, :as=> :group
	has_many :tasks, dependent: :destroy
	has_many :remarks, dependent: :destroy
   has_secure_password
   validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
   validates :password, length: {minimum: 6, allow_blank: true}
   
   
   scope :full,->{includes(:contact_lists, :task_users, :tasks, :remarks)}
 def full_name
   self.first_name.to_s + " " +self.second_name + " "  +self.last_name 
 end
end
