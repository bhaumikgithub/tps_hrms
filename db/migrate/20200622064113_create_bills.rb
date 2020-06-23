class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :number
      t.datetime :bill_date
      t.string :discription
      t.decimal :amount
      t.integer :status
      t.decimal :paid_amount
      t.string :paid_from
      t.string :paid_via
      t.text :paid_notes
      t.boolean :gst_bill
      t.datetime :gst_uploaded
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
