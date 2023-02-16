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
      t.string :file, null: false
      t.string :link
      t.integer :rating, null: false, default: 0

      t.references :user
      t.references :origin
      t.references :author
      t.timestamps
    end

    create_table :tags do |t|
      t.string :type # origin, author, title, charachter, general
      t.string :name

      t.timestamps
    end

    create_join_table :entities, :titles
    create_join_table :entities, :characters
    create_join_table :entities, :generals
  end
end
