png("roofline-mars.png", width = 640, height = 640)

pp = 640  # peak performance ... [GFLOPS/s]
pb = 30.5 # peak bandwidth ... [GB/s]
ai = function(b) (pp/pb) * b

x = seq(-1,5,1)
x_at = 2^x
x_labels = x_at

y = seq(-1,10,1)
y_at = 2^y
y_labels = y_at

plot(ai, xlab = "Arithmetic Intensity [GFLOPS/B]",
         xlim = c(x_at[1], x_at[length(x_at)]),
         ylab = "Performance [FLOPS/s]", 
         ylim = c(y_at[1], y_at[length(y_at)]),
     axes=FALSE, log = "xy", type = "l")

axis(1, at = x_at, labels = x_labels, tick = TRUE)
axis(2, at = y_at, labels = y_labels, tick = TRUE)

# 100 - 204800 - 819200 - kdd
a_mflops_t10 = c(1.3351, 1496.7568, 2192.4793, 3451.9511)
a_bw_t10 =    c(70.9230,  476.6643,  737.9183, 1078.4417)

for (i in 1:4) {
  ai = a_mflops_t10[i] / a_bw_t10[i]
  points(ai, a_mflops_t10[i]/1000, type = "p", col="red")
}


# 100 - 204800 - 819200 - kdd
a_mflops_t80 = c(0.6238, 738.1421, 1206.7615, 1705.8327)
a_bw_t80 =    c(92.5221, 739.4261, 1142.4497, 1297.8327)

for (i in 1:4) {
  ai = a_mflops_t80[i] / a_bw_t80[i]
  points(ai, a_mflops_t80[i]/1000, type = "p", col="blue")
}


# 100 - 204800 - 819200 - kdd
m_mflops_t10 = c(305.0021, 12571.3622, 13104.9845, 13671.4622)
m_bw_t10     = c(114.5279, 2242.6928,  3561.8832,  3568.4435)

for (i in 1:4) {
  ai = m_mflops_t10[i] / a_bw_t10[i]
  points(ai, m_mflops_t10[i]/1000, type = "p", col="green")
}


# 100 - 204800 - 819200 - kdd
m_mflops_t80 =    c(8.2856, 4466.8025, 6653.0316, 6104.6404)
m_bw_t80 =     c(1174.1465, 2021.0718, 2665.2724, 2612.6359)

for (i in 1:4) {
  ai = m_mflops_t80[i] / a_bw_t80[i]
  points(ai, m_mflops_t80[i]/1000, type = "p", col="yellow")
}

abline(h = pp, type = "l")

dev.off()
