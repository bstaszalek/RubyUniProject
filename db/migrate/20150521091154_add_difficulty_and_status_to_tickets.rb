class AddDifficultyAndStatusToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :difficulty, :string
    add_column :tickets, :status, :string
  end
end
