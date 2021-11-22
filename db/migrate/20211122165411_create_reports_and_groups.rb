class CreateReportsAndGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :reports_and_groups do |t|
      t.belongs_to :report
      t.belongs_to :group

      t.timestamps
    end
  end
end
