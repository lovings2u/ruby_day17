class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string            :title
      t.string            :genre
      t.string            :director
      t.string            :actor
      t.string            :image_path
      
      t.integer           :user_id
      
      t.text              :description

      t.timestamps
    end
  end
end
