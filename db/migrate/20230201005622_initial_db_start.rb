class InitialDbStart < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name,         null: false,  index: { unique: true }
      t.string :email,        null: false,  index: { unique: true }
      t.string :password_digest
      t.string :avatar

      t.timestamps
    end

    create_table :collections do |t|
      t.timestamps
    end

    create_table :entities do |t|
      t.string :file,         null: false
      t.string :file_hash,    null: false,  index: { unique: true }
      t.string :link,                       index: { unique: true }

      t.references :user
      t.references :collection

      t.timestamps
    end

    create_table :tags do |t|
      t.string :name,         null: false,  index: { unique: true }
      t.string :type

      t.references :parent
    end

    create_join_table :entities, :authors
    create_join_table :entities, :characters
    create_join_table :entities, :medias     # %i[art photo anime_video real_video]
    create_join_table :entities, :origins    # %i[unknown_origin game series movie cartoon anime hentai comic manga]
    create_join_table :entities, :others
    create_join_table :entities, :ratings    # %i[unknown_rating safe questionable nsfw]
    create_join_table :entities, :sources    # %i[unknown_origin telegram discord pixiv artstation danbooru gelbooru rule34]
    create_join_table :entities, :titles
  end
end
