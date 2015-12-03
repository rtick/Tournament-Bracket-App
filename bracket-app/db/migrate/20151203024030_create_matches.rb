class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :Name

      t.timestamps null: false
    end
  end
end
