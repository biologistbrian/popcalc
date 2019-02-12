class CreateSitefactors < ActiveRecord::Migration[5.2]
  def change
    create_table :sitefactors do |t|
    	t.string :site
    	t.float :factor
      t.timestamps
    end
  end
end
