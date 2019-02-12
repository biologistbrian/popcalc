args = commandArgs(trailingOnly=TRUE)
selgen = as.numeric(args[1])
# selgen is the selfing generations last digit, for example, if we want to self at the B4, the selgen is 4
certainty = as.numeric(args[2])
f3frequency = (0.5**(as.numeric(args[3])*2))
f3desired = as.numeric(args[4])
f3adjustment = as.numeric(args[5])
frequency = (0.5**as.numeric(args[3]))
bc4target = as.numeric(args[6])
bc3target = as.numeric(args[7])
bc2target = as.numeric(args[8])
bc1target = as.numeric(args[9])
f1RPrecovery = as.numeric(args[10])
bc4sitefactor = as.numeric(args[11])
bc4sitekpe = as.numeric(args[12])
# 'site kpe' variables are the average kernel per ear (kpe) we expect at each site, on the front end, for example, if the bc4 is set to be at nampa, this value would be something like 120 kpe
bc3sitefactor = as.numeric(args[13])
# 'site factor' variables figures in things like germ issues at sites, pol issues, etc.  this may be something like 0.8 for a given site
bc3sitekpe = as.numeric(args[14])
bc2sitefactor = as.numeric(args[15])
bc2sitekpe = as.numeric(args[16])
bc1sitefactor = as.numeric(args[17])
bc1sitekpe = as.numeric(args[18])
f1sitefactor = as.numeric(args[19])
f1sitekpe = as.numeric(args[20])
nssitefactor = as.numeric(args[21])
nssitekpe = as.numeric(args[20])
vector <- character()
# pop = ceiling(((2*(desired-0.5)+(qnorm(certainty)**2)*(1-frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-frequency)**2)+4*(1-frequency)*(desired-0.5))))/(2*frequency))
# F2 pop
f2pop = ceiling(ceiling(((2*(f3desired-0.5)+(qnorm(certainty)**2)*(1-f3frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-f3frequency)**2)+4*(1-f3frequency)*(f3desired-0.5))))/(2*f3frequency))/f3adjustment)
vector <- c(vector, f2pop)
# b4 pop
if (selgen == 4) {
	thresholds <- c(.99, bc3target)
	righttail = 1-pnorm(bc4target, mean = mean(thresholds), sd = sd(thresholds))[1]
	bc4ears = ceiling(f2pop/bc4sitekpe)
	bc4desired = ceiling(bc4ears/righttail)
	bc4pop = ceiling(ceiling(((2*(bc4desired-0.5)+(qnorm(certainty)**2)*(1-frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-frequency)**2)+4*(1-frequency)*(bc4desired-0.5))))/(2*frequency))/bc4sitefactor)
} else {
	bc4pop = 0 }
vector <- c(vector, bc4pop)
# b3 pop
if (selgen == 3) {
	thresholds <- c(.99, bc2target)
	righttail = 1-pnorm(bc3target, mean = mean(thresholds), sd = sd(thresholds))[1]
	bc3ears = ceiling(f2pop/bc3sitekpe)
	bc3desired = ceiling(bc3ears/righttail)
 	bc3pop = ceiling(ceiling(((2*(bc3desired-0.5)+(qnorm(certainty)**2)*(1-frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-frequency)**2)+4*(1-frequency)*(bc3desired-0.5))))/(2*frequency))/bc3sitefactor)
} else if (selgen == 4) {
	thresholds <- c(bc4target, bc2target)
	righttail = 1-pnorm(bc3target, mean = mean(thresholds), sd = sd(thresholds))[1]
	bc3ears = ceiling(bc4pop/bc3sitekpe)
	bc3desired = ceiling(bc3ears/righttail)
	bc3pop = ceiling(ceiling(((2*(bc3desired-0.5)+(qnorm(certainty)**2)*(1-frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-frequency)**2)+4*(1-frequency)*(bc3desired-0.5))))/(2*frequency))/bc3sitefactor)
} else {
	bc3pop = 0
}
vector <- c(vector, bc3pop)
# b2 pop
if (selgen == 2) {
	thresholds <- c(.99, bc1target)
	righttail = 1-pnorm(bc2target, mean = mean(thresholds), sd = sd(thresholds))[1]
	bc2ears = ceiling(f2pop/bc2sitekpe)
	bc2desired = ceiling(bc2ears/righttail)
 	bc2pop = ceiling(ceiling(((2*(bc2desired-0.5)+(qnorm(certainty)**2)*(1-frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-frequency)**2)+4*(1-frequency)*(bc2desired-0.5))))/(2*frequency))/bc2sitefactor)
} else {
	thresholds <- c(bc3target, bc1target)
	righttail = 1-pnorm(bc2target, mean = mean(thresholds), sd = sd(thresholds))[1]
	bc2ears = ceiling(bc3pop/bc2sitekpe)
	bc2desired = ceiling(bc2ears/righttail)
	bc2pop = ceiling(ceiling(((2*(bc2desired-0.5)+(qnorm(certainty)**2)*(1-frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-frequency)**2)+4*(1-frequency)*(bc2desired-0.5))))/(2*frequency))/bc2sitefactor)
}
vector <- c(vector, bc2pop)
# b1 pop
if (selgen == 1) {
	thresholds <- c(.99, f1RPrecovery)
	righttail = 1-pnorm(bc1target, mean = mean(thresholds), sd = sd(thresholds))[1]
	bc1ears = ceiling(f2pop/bc1sitekpe)
	bc1desired = ceiling(bc1ears/righttail)
 	bc1pop = ceiling(ceiling(((2*(bc1desired-0.5)+(qnorm(certainty)**2)*(1-frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-frequency)**2)+4*(1-frequency)*(bc1desired-0.5))))/(2*frequency))/bc1sitefactor)
} else {
	thresholds <- c(bc2target, f1RPrecovery)
	righttail = 1-pnorm(bc1target, mean = mean(thresholds), sd = sd(thresholds))[1]
	bc1ears = ceiling(bc2pop/bc1sitekpe)
	bc1desired = ceiling(bc1ears/righttail)
	bc1pop = ceiling(ceiling(((2*(bc1desired-0.5)+(qnorm(certainty)**2)*(1-frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-frequency)**2)+4*(1-frequency)*(bc1desired-0.5))))/(2*frequency))/bc1sitefactor)
}
vector <- c(vector, bc1pop)
# f1 pop
f1desired = ceiling(bc1pop/f1sitekpe)
f1pop = ceiling(ceiling(((2*(f1desired-0.5)+(qnorm(certainty)**2)*(1-frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-frequency)**2)+4*(1-frequency)*(f1desired-0.5))))/(2*frequency))/f1sitefactor)
vector <- c(vector, f1pop)
# ns pop (segregating only)
nsdesired = ceiling(f1pop/nssitekpe)
nspop = ceiling(ceiling(((2*(nsdesired-0.5)+(qnorm(certainty)**2)*(1-frequency))+qnorm(certainty)*(sqrt((qnorm(certainty)**2)*((1-frequency)**2)+4*(1-frequency)*(nsdesired-0.5))))/(2*frequency))/nssitefactor)
vector <- c(vector, nspop)
print(vector)
