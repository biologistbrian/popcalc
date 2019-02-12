class CreateKernelperears < ActiveRecord::Migration[5.2]
  def change
    create_table :kernelperears do |t|
    	t.string :site
    	t.integer :avgkernelperear
      t.timestamps
    end
  end
end
