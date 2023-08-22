class RemoveBoatsIdFromCrewMembers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :crew_members, :boats, null: false, foreign_key: true
  end
end
