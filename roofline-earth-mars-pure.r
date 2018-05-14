png("roofline-earth-mars-pure.png", width = 1280, height = 640)

pp_earth =  42.72 # peak performance ... [GFLOPS/s]
pb_earth =   12.2 # peak bandwidth ... [GB/s]
#ai_earth = pp_earth/pb_earth

pp_mars  = 1280.0 # peak performance ... [GFLOPS/s]
pb_mars  =   30.5 # peak bandwidth ... [GB/s]
#ai_mars  = pp_mars/pb_mars

ai = 2^seq(0, 8, 1)

x_at = ai
x_labels = x_at

y_at = 2^seq(4, 11, 1)
y_labels = y_at

plot(ai, pb_earth * ai, xlab = "Arithmetic Intensity [FLOPS/B]",
         xlim = c(x_at[1], x_at[length(x_at)]),
         ylab = "Performance [GFLOPS/s]", 
         ylim = c(y_at[1], y_at[length(y_at)]),
     axes=FALSE, log = "xy", type = "l", col = "blue", lwd = 2)

#plot(ai, pb_mars * ai, add = TRUE)

axis(1, at = x_at, labels = x_labels, tick = TRUE)
axis(2, at = y_at, labels = y_labels, tick = TRUE)


# 10 threads - all
#                   100     204800     819200        kdd
#flops_t10_a = c( 1.3292, 1517.9227, 2225.7196, 3427.6304)
#bw_t10_a    = c(73.4359,  476.2558,  734.1712, 1061.9937)
#
#for (i in 1:4) {
#  ai = flops_t10_a[i] / bw_t10_a[i]
#  points(ai, flops_t10_a[i]/1000, col="powderblue", pch = 15, cex = 1.5)
#}

# 10 threads - all
#                   100    204800     819200        kdd
#flops_t80_a = c( 0.5820, 731.8209, 1164.4394, 1519.8610)
#bw_t80_a    = c(78.4760, 981.6600, 1244,3416, 1420,3577)
#
#for (i in 1:4) {
#  ai = flops_t80_a[i] / bw_t80_a[i]
#  points(ai, flops_t80_a[i]/1000, col="blue", pch = 16, cex = 1.5)
#}


# 10 threads - marked 
#                     100      204800      819200         kdd
#flops_t10_m =  c(385.0818, 12738.9347, 12814.5174, 12995.5919)
#bw_t10_m =     c(150.0137,  2248.9188,  3500.4505,  3451.1885)
#
#for (i in 1:4) {
#  ai = flops_t10_m[i] / bw_t10_m[i]
#  points(ai, flops_t10_m[i]/1000, col="orange", pch = 17, cex = 1.5)
#}

# 80 threads - marked 
#                     100     204800     819200        kdd
#flops_t80_m = c(   7.4574, 4017.8371, 6579.4072, 5940.1009)
#bw_t80_m    = c(1292.0169, 2807.5566, 3312.4733, 3230.9055)
#
#for (i in 1:4) {
#  ai = flops_t80_m[i] / bw_t80_m[i]
#  points(ai, flops_t80_m[i]/1000, col="green", pch = 18, cex = 1.5)
#}


segments(x_at[1], pb_mars * ai[1], x_at[length(x_at)], pb_mars * ai[length(ai)],
         col = "red", lwd = 2)

segments(x_at[1], pp_earth, x_at[length(x_at)], pp_earth,
         col = "blue", lwd = 2)

segments(x_at[1], pp_mars, x_at[length(x_at)], pp_mars,
         col = "red", lwd = 2)

text(40, 620, "bandwidth bound: earth", srt = 25, cex = 1.5)
text(40, 50, "compute bound: earth", cex = 1.5)
text(12, 460, "bandwidth bound: mars", srt = 25, cex = 1.5)
text(12, 1500, "compute bound: mars", cex = 1.5)

dev.off()
