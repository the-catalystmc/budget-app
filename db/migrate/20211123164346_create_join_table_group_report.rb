class CreateJoinTableGroupReport < ActiveRecord::Migration[6.1]
  def change
    create_join_table :groups, :reports do |t|
      t.index %i[group_id report_id]
    end
  end
end
