class AddBoatIdToCrewMembers < ActiveRecord::Migration[7.0]
  def change
    add_reference :crew_members, :boat, null: false, foreign_key: true
  end
end
