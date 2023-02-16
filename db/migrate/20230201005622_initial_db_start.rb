class InitialDbStart < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :avatar
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :entities do |t|
      t.string :type, null: false, default: 'picture'
      t.string :file, null: false

      t.string :origin
      t.string :origin_type

      t.references :user
      t.timestamps
    end

    create_table :tags do |t|
      t.string :type
      t.string :name

      t.timestamps
    end

    create_join_table :entities, :tags
  end
end
