class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
      t.time :in_hour
      t.time :out_hour
      t.integer :weekend

      t.timestamps
    end
  end
end
