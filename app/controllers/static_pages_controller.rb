class StaticPagesController < ApplicationController
	def landing
		@projlines = Projline.where(b1pop: nil)
		@projlines1 = Projline.where.not(f2pop: nil).order('id ASC')
	end
	def runscript
		@projlines = Projline.where(b1pop: nil).each do |proj|
			initrecovery = (1.000-proj.neisValue)*0.500+proj.neisValue
			if proj.targetSelfingGen.eql?("B4")
				bc4target = proj.targetRprecoveryThreshold
			elsif proj.targetSelfingGen.eql?("B3")
				bc3target = proj.targetRprecoveryThreshold
			elsif proj.targetSelfingGen.eql?("B2")
				bc2target = proj.targetRprecoveryThreshold
			elsif proj.targetSelfingGen.eql?("B1")
				bc1target = proj.targetRprecoveryThreshold
			end
			
			if proj.targetSelfingGen.eql?("B1")
				bc1target = proj.targetRprecoveryThreshold
			elsif proj.targetSelfingGen.eql?("B2")
				bc1target = (eval("bc" + proj.targetSelfingGen.split(//).last + "target") - initrecovery) * 0.4 + initrecovery
				bc3target = proj.targetRprecoveryThreshold
				bc4target = proj.targetRprecoveryThreshold
			elsif proj.targetSelfingGen.eql?("B3")
				bc1target = (proj.targetRprecoveryThreshold - initrecovery) * 0.40 + initrecovery
				bc2target = (proj.targetRprecoveryThreshold - initrecovery) * 0.30 + bc1target
				bc4target = proj.targetRprecoveryThreshold
			elsif proj.targetSelfingGen.eql?("B4")
				bc1target = (proj.targetRprecoveryThreshold - initrecovery) * 0.40 + initrecovery
				bc2target = (proj.targetRprecoveryThreshold - initrecovery) * 0.30 + bc1target
				bc3target = (proj.targetRprecoveryThreshold - initrecovery) * 0.20 + bc2target
			end
			bc4target = proj.targetRprecoveryThreshold
			selgen = proj.targetSelfingGen.split(//).last.to_i
			traitcount = proj.traits.count(";")+1
			certainty = proj.certainty
			frequency = 0.5**traitcount
			neisValue = proj.neisValue
			f3frequency = 0.5**(traitcount*2)
			f3desired = proj.targetF3Material
			f3adjustment = Sitefactor.find_by(site:proj.f2Site).factor
			bc4sitefactor = Sitefactor.find_by(site:proj.bc4Site).factor
			bc3sitefactor = Sitefactor.find_by(site:proj.bc3Site).factor
			bc2sitefactor = Sitefactor.find_by(site:proj.bc2Site).factor
			bc1sitefactor = Sitefactor.find_by(site:proj.bc1Site).factor
			f1sitefactor = Sitefactor.find_by(site:proj.f1Site).factor
			nssitefactor = Sitefactor.find_by(site:proj.nsSite).factor
			bc4sitekpe = Kernelperear.find_by(site:proj.bc4Site).avgkernelperear
			bc3sitekpe = Kernelperear.find_by(site:proj.bc3Site).avgkernelperear
			bc2sitekpe = Kernelperear.find_by(site:proj.bc2Site).avgkernelperear
			bc1sitekpe = Kernelperear.find_by(site:proj.bc1Site).avgkernelperear
			f1sitekpe = Kernelperear.find_by(site:proj.f1Site).avgkernelperear
			nssitekpe = Kernelperear.find_by(site:proj.nsSite).avgkernelperear
			filepath = Rails.root.join("lib", "rscripts", "rscript.R")
			output = `Rscript --vanilla #{filepath} #{selgen} #{certainty} #{traitcount} #{f3desired} #{f3adjustment} #{bc4target} #{bc3target} #{bc2target} #{bc1target} #{initrecovery} #{bc4sitefactor} #{bc4sitekpe} #{bc3sitefactor} #{bc3sitekpe} #{bc2sitefactor} #{bc2sitekpe} #{bc1sitefactor} #{bc1sitekpe} #{f1sitefactor} #{f1sitekpe} #{nssitefactor} #{nssitekpe}`
			array = []
			puts output
			a = output.gsub(/\s+/, "").split(/"/)
			a.each do |y|
				array << y
			end
			proj.update(f2pop: array[1], b4pop: array[3], b3pop: array[5], b2pop: array[7], b1pop: array[9], f1pop: array[11], nspop: array[13])
			puts(initrecovery)
			puts(bc1target)
			puts(bc2target)
			puts(bc3target)
			puts(bc4target)
		end
		redirect_to results_path, notice: "Calculator ran successfully, see results below"
	end	
	def results
		@projlines1 = Projline.where.not(f2pop: nil).order('id ASC')
	end
	def download_template
		send_file "#{Rails.root}/lib/assets/popcalc_template.csv", type: "application/csv", x_sendfile: true

	end


end
