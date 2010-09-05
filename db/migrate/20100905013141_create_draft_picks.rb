class CreateDraftPicks < ActiveRecord::Migration
  def self.up
    create_table :draft_picks do |t|
      t.column :round, :integer
      t.column :pick, :integer
      t.column :poolie_id, :integer
      t.column :player_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :draft_picks
  end
end
