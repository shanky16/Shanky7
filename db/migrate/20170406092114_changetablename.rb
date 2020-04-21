#
class Changetablename < ActiveRecord::Migration[5.0]
  def change
    rename_table :statusroles, :assigns
  end
end
