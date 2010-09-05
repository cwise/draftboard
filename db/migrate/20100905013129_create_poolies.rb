class CreatePoolies < ActiveRecord::Migration
  def self.up
    create_table :poolies do |t|
      t.column :name, :string, {:null => false, :unique => true, :length => 256}
      t.column :team_name, :string, {:null => false, :unique => true, :length => 256}
      t.column :draft_order, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :poolies
  end
end
