#
class Statusrole < ActiveRecord::Migration[5.0]
  def change
    create_table :statusroles do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.column :status, :string, default: 'Incomplete'
      t.timestamps
    end
  end
end
