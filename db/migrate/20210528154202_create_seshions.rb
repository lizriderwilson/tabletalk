class CreateSeshions < ActiveRecord::Migration[6.1]
  def change
    create_table :seshions do |t|
      t.datetime :start_time

      t.timestamps
    end
  end
end
