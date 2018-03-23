class CreateHippoActivityLogEvents < ActiveRecord::Migration
  def change
    create_table :hippo_activity_log_events do |t|
      t.jsonb :object
      t.integer :object_id, index: true
      t.string :object_type, index: true

      t.jsonb :author
      t.integer :author_id, index: true
      t.string :author_type, index: true

      t.string :action
      t.datetime :timestamp
      t.integer :partner_id, index: true

      t.jsonb :user, default: {}
      t.integer :user_id, index: true
      t.jsonb :params, default: {}

      t.string :name, index: true
      t.jsonb :raw_data
    end
  end
end
