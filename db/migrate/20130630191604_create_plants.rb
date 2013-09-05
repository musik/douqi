class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :latin
      t.string :en
      t.string :common_names
      t.string :men
      t.string :gang
      t.string :mu
      t.string :ke
      t.string :shu
      t.string :slug

      t.timestamps
    end
  end
end
