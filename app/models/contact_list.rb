class ContactList < ActiveRecord::Base
  belongs_to :friend, polymorphic: true
  validates :friend_id, uniqueness: { scope: [:user_id, :friend_type] }
end
