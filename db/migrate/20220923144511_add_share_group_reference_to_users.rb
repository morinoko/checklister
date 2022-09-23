class AddShareGroupReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :share_group, null: false, foreign_key: true
  end
end
