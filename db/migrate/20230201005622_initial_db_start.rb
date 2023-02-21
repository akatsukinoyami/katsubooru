class InitialDbStart < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :users do |t|
      t.string :name,         null: false,  index: { unique: true }
      t.string :email,        null: false,  index: { unique: true }
      t.string :password_digest
      t.string :avatar

      t.timestamps
    end

    create_table :collections do |t|
      t.uuid :uuid,           default: 'uuid_generate_v4()'
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
      t.string :name, null: false

      t.references :parent
      t.references :tag_type
      t.index %i[name parent_id], unique: true
    end

    create_table :tag_types do |t|
      t.string :name, null: false, unique: true
      t.boolean :allows_multiple, null: false, default: false
    end

    create_join_table :entities, :tags do |t|
      t.index %i[entity_id tag_id], unique: true
    end
  end
end
