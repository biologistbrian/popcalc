class Addf2pop < ActiveRecord::Migration[5.2]
  def change
  	add_column :projlines, :f2pop, :integer
  end
end
