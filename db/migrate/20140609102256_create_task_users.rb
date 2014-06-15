class CreateTaskUsers < ActiveRecord::Migration
  def change
    create_table :task_users do |t|
      t.belongs_to :task, index: true
      t.references :group, polymorphic: true, index: true

      t.timestamps
    end
  end
end
