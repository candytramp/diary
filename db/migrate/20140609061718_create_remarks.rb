class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.belongs_to :user, index: true
      t.string :topic
      t.text :description

      t.timestamps
    end
  end
end
