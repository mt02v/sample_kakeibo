class CreateFixedcostValues < ActiveRecord::Migration[6.1]
  def change
    create_table :fixedcost_values do |t|
      t.integer :fixedcost_id, null: false
      t.date :year_month
      t.integer :value
      t.stirng :description
      t.timestamps
    end
  end
end
