class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants,:options=>'auto_increment = 5826' do |t|
      t.string :name,:null=>false
      t.string :latin
      t.string :en
      t.string :common_names
      t.string :men
      t.string :gang
      t.string :mu
      t.string :ke
      t.string :shu
      t.string :slug, :null=> false

      t.timestamps
    end
    add_index :plants,:slug,:uniq=>true
  end
end
