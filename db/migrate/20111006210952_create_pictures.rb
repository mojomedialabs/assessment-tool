class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :title
      t.text :alt_text
      t.text :caption
      t.string :image
      t.string :md5
      t.timestamps
    end
  end
end
