class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :singer
      t.string :composer
      t.string :location

      t.timestamps null: false
    end
  end
end
