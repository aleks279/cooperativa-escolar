class AddNewsSectionsRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.boolean :published, default: false

      t.references :user

      t.timestamps
    end

    create_table :sections do |t|
      t.string :header
      t.string :image_url
      t.text :body

      t.references :article

      t.timestamps
    end

    create_table :registries do |t|
      t.string :registry_type
      t.text :notes
      t.time :time

      t.references :user

      t.timestamps
    end
  end
end
