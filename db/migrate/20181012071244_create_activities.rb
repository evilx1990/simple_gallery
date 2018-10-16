class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references  :user, foreign_key: true
      t.string      :action, null: false
      t.string      :url, null: false

      t.timestamps
    end
  end
end