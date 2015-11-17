class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.float :temperature
      t.float :humidity

      t.timestamps null: false
    end
  end
end
