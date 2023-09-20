class AddPrivateToEventTable < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :is_private, :boolean
  end
end
