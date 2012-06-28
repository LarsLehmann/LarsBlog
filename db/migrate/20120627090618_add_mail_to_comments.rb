class AddMailToComments < ActiveRecord::Migration
  def change
    add_column :comments, :mail, :string

  end
end
