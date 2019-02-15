class CreateApiTestTrashes < ActiveRecord::Migration[5.2]
  def change
    create_table :api_test_trashes do |t|
      t.integer :alpha
      t.integer :beta

      t.timestamps
    end
  end
end
