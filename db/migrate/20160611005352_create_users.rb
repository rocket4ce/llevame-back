class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :grado
      t.string :vehiculo
      t.string :region
      t.string :comuna
      t.string :direccion
      t.float :latitude
      t.float :longitude
      t.string :fono
      t.integer :grado

      t.timestamps null: false
    end
  end
end
