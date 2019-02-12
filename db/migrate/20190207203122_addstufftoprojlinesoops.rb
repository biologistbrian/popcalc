class Addstufftoprojlinesoops < ActiveRecord::Migration[5.2]
  def change
add_column :projlines, :pidtc, :string
add_column :projlines, :jobName, :string
add_column :projlines, :crop, :string
add_column :projlines, :traits, :string
add_column :projlines, :neisValue, :float
add_column :projlines, :targetRprecoveryThreshold, :float
add_column :projlines, :targetSelfingGen, :string
add_column :projlines, :targetF3Material, :integer
add_column :projlines, :nsSite, :string
add_column :projlines, :f1Site, :string
add_column :projlines, :bc1Site, :string
add_column :projlines, :bc2Site, :string
add_column :projlines, :bc3Site, :string
add_column :projlines, :bc4Site, :string
add_column :projlines, :f2Site, :string
add_column :projlines, :traitNumber, :integer
add_column :projlines, :f1RPrecovery, :float
add_column :projlines, :bc1Threshold, :float
add_column :projlines, :bc2Threshold, :float
add_column :projlines, :bc3Threshold, :float
add_column :projlines, :bc4Threshold, :float
add_column :projlines, :nspop, :integer
add_column :projlines, :f1pop, :integer
add_column :projlines, :b1pop, :integer
add_column :projlines, :b2pop, :integer
add_column :projlines, :b3pop, :integer
add_column :projlines, :b4pop, :integer
add_column :projlines, :b5pop, :integer

  end
end
