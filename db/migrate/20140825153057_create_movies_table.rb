class CreateMoviesTable < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :year
      t.string :synopsis
    end
  end
end
