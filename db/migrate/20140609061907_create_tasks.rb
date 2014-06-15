class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :user, index: true
      t.belongs_to :place, index: true
      t.integer :priority
      t.datetime :date

      t.timestamps
    end
  end
end
