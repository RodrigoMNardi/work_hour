class CreateCalenders < ActiveRecord::Migration
  def change
    create_table :calenders do |t|
      t.integer  :month
      t.integer :year

      t.timestamps
    end
  end
end
