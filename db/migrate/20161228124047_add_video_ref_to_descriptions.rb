class AddVideoRefToDescriptions < ActiveRecord::Migration
  def change
    add_reference :descriptions, :video, index: true, foreign_key: true
  end
end
