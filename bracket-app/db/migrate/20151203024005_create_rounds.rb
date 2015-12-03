class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :Name

      t.timestamps null: false
    end
  end
end
