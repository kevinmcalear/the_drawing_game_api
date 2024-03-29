class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.boolean :game_started
      t.integer :max_players
      t.integer :min_players

      t.timestamps
    end
  end
end
