class ChangeMovieTable < ActiveRecord::Migration
  def change
    change_column :movies, :year, 'integer USING Cast(year as integer)'
  end
end

