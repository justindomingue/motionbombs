class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
