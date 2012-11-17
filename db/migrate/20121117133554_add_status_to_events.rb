class AddStatusToEvents < ActiveRecord::Migration
  def change
    add_column :events, :stratus, :string
    add_column :events, :capacity, :integer
  end
end
