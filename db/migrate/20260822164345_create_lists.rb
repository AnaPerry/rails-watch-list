class CreateLists < ActiveRecord::Migration[8.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :list_url

      t.timestamps
    end
  end
end
