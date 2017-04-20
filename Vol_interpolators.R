###########################################
### M\'etodos de interpolaci\'on de vol ###
###########################################


# Vanna-Volga method -------------------------------------------------------

VannaVolgaVegaInterpolation1<-function(k,spot,t,d_factor,f_factor,v_atm,v_rr,v_vwb){
  fwd<-spot*f_factor/d_factor
  k_atm<-fwd*exp(v_atm^2*t/2)
  v_25c<-v_atm+v_vwb+v_rr/2
  v_25p<-v_atm+v_vwb-v_rr/2
  k_25c<-fwd*exp(-qnorm(.25/f_factor)*v_25c*sqrt(t)+v_25c^2*t/2)
  k_25p<-fwd*exp(qnorm(.25/f_factor)*v_25p*sqrt(t)+v_25p^2*t/2)
  x_1<-log(k_atm/k)*log(k_25c/k)/log(k_atm/k_25p)/log(k_25c/k_25p)
  x_2<-log(k/k_25p)*log(k_25c/k)/log(k_atm/k_25p)/log(k_25c/k_atm)
  x_3<-log(k/k_25p)*log(k/k_atm)/log(k_25c/k_25p)/log(k_25c/k_atm)
  return(v_25p*x_1+v_atm*x_2+v_25c*x_3)
}
spot<-1.205
tenor<-94/365
domestic_discount_factor<-.9902752
foreign_discount_factor<-.9945049
at_the_money<-.0905
risk_reversal<--.0050
vega_weighted_butterfly<-.0013
VannaVolgaVegaInterpolation1(spot*foreign_discount_factor/domestic_discount_factor*exp(at_the_money^2*tenor/2),spot,tenor,domestic_discount_factor,
                   foreign_discount_factor,at_the_money,
                   risk_reversal,vega_weighted_butterfly)
k<-seq(.2,2.5,length.out = 50)
vol<-sapply(k,VannaVolgaVegaInterpolation1,spot=spot,t=tenor,d_factor=domestic_discount_factor,
      f_factor=foreign_discount_factor,v_atm=at_the_money,
      v_rr=risk_reversal,v_vwb=vega_weighted_butterfly)
plot(k,vol)
