class ChangeUserColumnOnReport < ActiveRecord::Migration[6.1]
  def change
    change_table :reports do |t|
      t.rename :user_id, :author_id
      end 
  end
end
