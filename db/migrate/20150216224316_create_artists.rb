class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :location
      t.date :formed

      t.timestamps
    end
  end
end
