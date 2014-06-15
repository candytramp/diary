class AddMaleToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :male, :boolean
  end
end
