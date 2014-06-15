class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :second_name
      t.boolean :male
      t.datetime :birthday

      t.timestamps
    end
  end
end
