class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.string :game_system
      t.boolean :is_public, default: false
      t.integer :gm_id

      t.timestamps
    end
  end
end
