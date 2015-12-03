class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :Name

      t.timestamps null: false
    end
  end
end
