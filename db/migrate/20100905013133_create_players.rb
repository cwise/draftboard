class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.column :name, :string, {:null => false, :length => 256}
      t.column :team, :string, {:null => false, :length => 3}
      t.column :position, :string, {:null => false, :length => 3}

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
