class CreateRegisteredApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :registered_applications do |t|
      t.string :appname
      t.string :url

      t.timestamps
    end
  end
end
