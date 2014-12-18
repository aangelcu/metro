class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :company_id

      t.timestamps
    end
  end
end
