class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
      t.time :in_hour
      t.time :out_hour
      t.time :lunch


      t.timestamps
      t.belongs_to :day
    end
  end
end
