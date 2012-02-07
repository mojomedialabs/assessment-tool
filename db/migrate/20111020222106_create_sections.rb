class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.belongs_to :assessment, :null => false
      t.text :title, :null => false
      t.text :description
      t.integer :display_order, :null => false, :default => 0
      t.timestamps
    end
  end
end
