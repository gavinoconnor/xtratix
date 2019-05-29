class ChangeAvailableToBeBooleanInTickets < ActiveRecord::Migration[5.2]
  def up
    change_column :tickets, :available, :boolean, default: true
  end

  def down
    change_column :tickets, :available, :boolean, default: nil
  end


end
