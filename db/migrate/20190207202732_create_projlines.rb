class CreateProjlines < ActiveRecord::Migration[5.2]
  def change
    create_table :projlines do |t|

      t.timestamps
    end
  end
end
