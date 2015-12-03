class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :Name

      t.timestamps null: false
    end
  end
end
