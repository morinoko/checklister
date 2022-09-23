class AddShareGroupReferenceToTodos < ActiveRecord::Migration[7.0]
  def change
    add_reference :todos, :share_group, null: false, foreign_key: true
  end
end
