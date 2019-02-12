class Projline < ApplicationRecord

	def self.import(file)
	    headrow = CSV.read(file.path).index(CSV.foreach(file.path).find{|line| line.include?('PIDTC')})
	    heads = CSV.foreach(file.path).find{|line| line.include?('PIDTC')}
	    CSV.foreach(file.path, headers: heads).with_index(0) do |row, rowno|
	    	next if rowno < headrow+1
	    	next if row['PIDTC'].nil? == true
		   	Projline.create({
		    :pidtc => row['PIDTC'],
		    :jobName => row['Job Name (Group of Projects)'],
		    :crop => row['Crop'],
		    :traits => row['Traits From Donor'],
		    :neisValue => row['Neis Value'],
		    :targetRprecoveryThreshold => row['RP Recovery to Self (0.XX format)'],
		    :targetSelfingGen => row['Target Selfing Backcross Generation'],
		    :certainty => row['Certainty Level'],
		    :targetF3Material => row['F3 IEs for Handoff'],
		    :nsSite	=> row['New start location'],
		    :f1Site => row['F1 location'],
		    :bc1Site => row['B1 location'],
		    :bc2Site => row['B2 location'],
		    :bc3Site => row['B3 location'],
		    :bc4Site => row['B4 location'],
		    :f2Site => row['F2 location'],
	      })
	    end
  	end
end