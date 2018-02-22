class CreateViaCityNames < ActiveRecord::Migration[5.1]
  def change
    create_table :via_city_names do |t|
      t.string :city_name
      t.integer :user_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
