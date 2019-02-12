class AddCertaintytoProjlines < ActiveRecord::Migration[5.2]
  def change
  	add_column :projlines, :certainty, :float
  end
end
