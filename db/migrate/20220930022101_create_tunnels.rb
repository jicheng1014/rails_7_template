class CreateTunnels < ActiveRecord::Migration[7.0]
  def change
    create_table :tunnels do |t|
      t.references :user, null: false, foreign_key: true
      t.string :password_digest
      t.string :level
      t.string :latest_started_at
      t.string :latest_ended_at
      t.string :aasm_state

      t.timestamps
    end
  end
end
