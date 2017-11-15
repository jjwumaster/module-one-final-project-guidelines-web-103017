class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.integer :city_bike_id # assign random name?
    end
  end
end
