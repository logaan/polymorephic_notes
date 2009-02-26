class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :name
      t.integer :notable_id
      t.string :notable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
