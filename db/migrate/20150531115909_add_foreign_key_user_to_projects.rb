class AddForeignKeyUserToProjects < ActiveRecord::Migration
  def change
    add_foreign_key :projects, :user
  end
end
