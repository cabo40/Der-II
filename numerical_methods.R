milstein<-function(drift,volatility,d_volatility,t,y_0){
  y<-y_0
  for(i in 1:(length(t)-1)){
    h<-t[i+1]-t[i]
    dw<-rnorm(1,0,sqrt(h))
    y<-c(y,y[i]+drift(y[i])*h+volatility(y[i])*dw+.5*volatility(y[i])*d_volatility(y[i])*(dw^2-h))
  }
  return(y)
}
#milstein(function(y){-y},function(y){y},function(y){1},1:50,.05)

