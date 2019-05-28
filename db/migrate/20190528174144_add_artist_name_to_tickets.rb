class AddArtistNameToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :artist_name, :string
  end
end
