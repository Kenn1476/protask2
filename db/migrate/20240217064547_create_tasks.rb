class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :reference_number
      t.string :invoice_number
      t.string :customer_email
      t.string :text
      t.timestamps
    end
  end
end
