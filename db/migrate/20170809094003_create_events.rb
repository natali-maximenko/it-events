class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :cover
      t.datetime :started_at
      t.string :link

      t.timestamps
    end
  end
end
