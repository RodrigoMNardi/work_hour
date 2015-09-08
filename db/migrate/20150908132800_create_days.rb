class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :name

      t.timestamps
      t.belongs_to :calender
    end
  end
end
