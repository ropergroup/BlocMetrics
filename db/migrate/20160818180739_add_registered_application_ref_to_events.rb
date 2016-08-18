class AddRegisteredApplicationRefToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :registered_application, foreign_key: true
  end
end
