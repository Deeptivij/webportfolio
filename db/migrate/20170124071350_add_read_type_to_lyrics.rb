class AddReadTypeToLyrics < ActiveRecord::Migration
  def change
    add_column :lyrics, :read_type, :string
  end
end
