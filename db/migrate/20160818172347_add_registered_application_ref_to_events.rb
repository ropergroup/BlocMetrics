class AddRegisteredApplicationRefToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :registeredapplication, foreign_key: true
  end
end
