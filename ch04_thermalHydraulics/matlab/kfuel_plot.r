library(extrafont)
library(viridis)
loadfonts()

x = 0.1 # U10Zr

kU <- function(T){
  21.73 + 1.591e-2*T + 5.907e-6*T^2
}

kZr <- function(T){
  8.853 + 7.802e-3*T + 2.2533e-6*T^2 + 2.992e3/T
}

kcZr <- function(T,x){
  -102.0 + 200.1*x - 109.2*x^2 + 9.453e-3*T + 3.458e-5*T^2 - 0.02093*x*T
}

kUZr <- function(T,x){
  (1.0 - sqrt(1.0-x))*kZr(T) + sqrt(1.0-x)*((1.0-x)*kU(T) + x*kcZr(T,x))
}

Ttest <- seq(400.0,1200.0,length=100) # similar to linspace
ktest <- kUZr(Ttest,x)

kHT9 <- 64.33 # [W/m/K]
kNa  <- 25.81 # [W/m/K]

LW <- 7

my_color <- viridis(3)

pdf('plot_times.pdf', family='Noto Serif', width=4, height=4.5)

plot(Ttest, ktest, type='l', lwd=LW, lty=1, col=my_color[1],
     xlim=range(Ttest), 
     ylim=range(ktest,kHT9,kNa), xlab='T [K]', 
     ylab='Thermal Conductivity [W/m/K]')
lines(range(Ttest), c(kHT9,kHT9), type='l', lty=2, col=my_color[2], lwd=LW)
lines(range(Ttest), c(kNa,kNa), type='l', lty=3, col=my_color[3], lwd=LW)

legend('left', 
       c(expression(k[U10Zr]),expression(k[HT9]),expression(k[Na])),
       lwd=LW, lty=1:3, col=my_color)

dev.off()
