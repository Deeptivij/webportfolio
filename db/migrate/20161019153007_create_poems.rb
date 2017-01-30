class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :link
      t.string :title
      t.string :author
      t.string :duration
      t.string :uid

      t.timestamps null: false
    end
  end
end
