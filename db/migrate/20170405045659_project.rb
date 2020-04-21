#
class Project < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false, unique: true
      t.string :requirements
      t.string :domain
      t.column :final_status, :string, default: 'Incomplete'
      t.references :user, foreign_key: true
    end
  end
end
