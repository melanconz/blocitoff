class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.datetime :date, format: t.strftime("%Y, %m, %d")
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
