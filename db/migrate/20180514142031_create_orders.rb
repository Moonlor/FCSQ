class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :status, 	default: 0
      t.float 	:amount,  	default: 0.0
      t.string	:subject

      t.timestamps
    end
  end
end
