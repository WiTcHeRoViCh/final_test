class CreateRecomendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recomendations do |t|
      t.integer :user_id
      t.string  :sender
      t.string  :body
      t.integer  :mark
      t.integer :place_id
      t.belongs_to :recomend, polymorphic: true, index: true

      t.timestamps
    end
  end
end
