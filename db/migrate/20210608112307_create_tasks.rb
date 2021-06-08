class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :startdate
      t.date :enddate
      t.string :allday
      t.string :edit
      t.string :ref
      t.string :del
      t.text :memo

      t.timestamps
    end
  end
end
