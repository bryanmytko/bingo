class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :entries
      t.string :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
