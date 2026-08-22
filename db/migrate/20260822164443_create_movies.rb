class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.string :poster_url
      t.float :rating
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
