class AddDbStructure < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :id_number
      t.string :email

      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :in_stock
      t.boolean :available, default: false

      t.timestamps
    end

    create_table :orders do |t|
      t.string :number
      t.date :date
      t.decimal :total
      t.text :notes

      t.references :seller
      t.references :customer

      t.timestamps
    end

    create_table :order_items do |t|
      t.integer :amount
      t.decimal :item_total

      t.references :order
      t.references :product

      t.timestamps
    end
  end
end
