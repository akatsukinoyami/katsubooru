class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :type, null: false, default: 'picture'
      t.string :file, null: false

      t.string :origin
      t.string :origin_type

      t.timestamps
    end
  end
end
