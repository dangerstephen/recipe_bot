class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :color

      t.timestamps
    end
  end
end
