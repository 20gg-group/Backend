class CreateApiKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :api_keys do |t|
      t.string :access_token,      null: false
      t.boolean :active,           null: false, default: true
      t.datetime :expires_at
      t.references :user
      t.timestamps
    end
  end
end
