class CreateContactLists < ActiveRecord::Migration
  def change
    create_table :contact_lists do |t|
      t.belongs_to :user, index: true
      t.references :friend, polymorphic: true, index: true

      t.timestamps
    end
  end
end
