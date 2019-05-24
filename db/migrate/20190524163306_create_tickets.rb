class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :venue, foreign_key: true
      t.boolean :available
      t.datetime :event_date

      t.timestamps
    end
  end
end
