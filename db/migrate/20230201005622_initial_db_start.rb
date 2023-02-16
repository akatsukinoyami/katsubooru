class InitialDbStart < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name,         null: false,  index: { unique: true }
      t.string :email,        null: false,  index: { unique: true }
      t.string :password_digest
      t.string :avatar

      t.timestamps
    end

    create_table :entities do |t|
      t.string :file,         null: false
      t.string :file_hash,    null: false,  index: { unique: true }
      t.string :link,                       index: { unique: true }

      t.integer :media_type,  null: false,  default: 0 # enum: %i[art photo anime_video real_video]
      t.integer :rating,      null: false,  default: 0 # enum: %i[unknown safe questionable nsfw]
      t.integer :origin,      null: false,  default: 0 # enum: %i[unknown telegram discord pixiv artstation danbooru gelbooru rule34]

      t.references :user
      t.references :artist

      t.timestamps
    end

    create_table :artists do |t|
      t.string :name,         null: false,  index: { unique: true }
    end

    create_table :titles do |t|
      t.string  :name,        null: false,  index: { unique: true }
      t.integer :media_type,  null: false,  default: 0 # enum: %i[unknown game series movie cartoon anime hentai comic manga]
    end

    create_table :characters do |t|
      t.string     :name,     null: false
      t.references :title
    end

    create_table :tags do |t|
      t.string :name,         null: false,  index: { unique: true }
    end

    create_join_table :entities, :titles
    create_join_table :entities, :characters
    create_join_table :entities, :tags

    add_index :characters, [:name, :title_id], unique: true
  end
end
