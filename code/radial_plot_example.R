# 2017-02-012
# Adjusted to be a github exercise
# orig files are in ~/Documents/questions

# # # # # # # # # # # # #
# Load the required packages
require(lubridate)
require(plotrix)
# # # # # # # # # # # # #


# # # # # # # # # # # # #
# load the data
#  ... this assumes the working directory is already set to "test_project"
load('data/radial_plot_data.RData')
# # # # # # # # # # # # #




# # # # # # # # # # # #
# Start of base plot
# plot it already:
pdf(file = "~/test_project/figs/fig1.pdf", height = 5, width = 5)
radial.plot(
	seasdat$bmi, 
	seasdat$radians, 
	labels = unique(seasdat$mnth), 
	start = 3*pi/2, 
	clockwise = TRUE, 
	rp.type="s", 
	point.col = 'red', 
	point.symbols = 21,
	# cex = 1, 
	boxed.radial = FALSE,
	radial.lim = c(15, 35)
	)
# add mean value of BMI
radial.plot(
	mean(seasdat$bmi),
	seq(0, 2*pi,length.out = 360), 
	start = 3*pi/2, 
	clockwise = TRUE, 
	rp.type="p", 
	line.col = 'green', 
	lwd = 4,
	add = TRUE,
	boxed.radial = FALSE,
	radial.lim = c(15, 35),
	)
dev.off()
# End of base plot



# add limits for each stage of BMI:
 # <16 underweight
 # 25-30 overweight
 # >30 obese
# way to shade these zone? ?poly.col

# this shades everything up to the mean
radial.plot(
	16,
	seq(0, 2*pi,length.out = 360), 
	start = 3*pi/2, 
	clockwise = TRUE, 
	rp.type="p", 
	line.col = 'light blue', 
	lwd = 1,
	add = TRUE,
	boxed.radial = FALSE,
	radial.lim = c(15, 35),
	poly.col = 'light blue'
	)
radial.plot(
	25,
	seq(0, 2*pi,length.out = 360), 
	start = 3*pi/2, 
	clockwise = TRUE, 
	rp.type="p", 
	line.col = 'light green', 
	lwd = 1,
	add = TRUE,
	boxed.radial = FALSE,
	radial.lim = c(15, 35),
	poly.col = 'light green'
	)

radial.plot(
	seasdat$bmi, 
	seasdat$radians, 
	labels = unique(seasdat$mnth), 
	start = 3*pi/2, 
	clockwise = TRUE, 
	rp.type="s", 
	point.col = 'red', 
	point.symbols = 21,
	# cex = 1, 
	boxed.radial = FALSE,
	radial.lim = c(15, 35),
	add = TRUE
	)
# so, overplotting doesn't work for the background poly.col

# maybe the range should be given as a matrix
radial.plot(
	as.matrix(c(25, 30), byrow = TRUE),
	seq(0, 2*pi,length.out = 360), 
	start = 3*pi/2, 
	clockwise = TRUE, 
	rp.type="p", 
	lwd = 1,
	# add = TRUE,
	boxed.radial = FALSE,
	radial.lim = c(15, 35),
	poly.col = 'red'
	)
# nope
radial.plot(
	matrix(c(30, 25), byrow = TRUE),
	matrix(c(seq(0, 2*pi,length.out = 360), seq(0, 2*pi,length.out = 360)), byrow = TRUE, nrow = 2), 
	start = 3*pi/2, 
	clockwise = TRUE, 
	rp.type="p", 
	lwd = 1,
	add = TRUE,
	boxed.radial = FALSE,
	radial.lim = c(15, 35),
	poly.col = c('red', 'white')
	)

# maybe the other way around:
radial.plot(
	matrix(c(30, 25), byrow = TRUE),
	matrix(c(seq(0, 2*pi,length.out = 360), seq(0, 2*pi,length.out = 360)), byrow = TRUE, nrow = 2), 
	start = 3*pi/2, 
	clockwise = TRUE, 
	rp.type="p", 
	lwd = 1,
	# add = TRUE,
	boxed.radial = FALSE,
	radial.lim = c(15, 35),
	poly.col = c('red', 'white')
	)
radial.plot(
	seasdat$bmi, 
	seasdat$radians, 
	labels = unique(seasdat$mnth), 
	start = 3*pi/2, 
	clockwise = TRUE, 
	rp.type="s", 
	point.col = 'black', 
	point.symbols = 21,
	# cex = 1, 
	boxed.radial = FALSE,
	radial.lim = c(15, 35),
	add = TRUE
	)
