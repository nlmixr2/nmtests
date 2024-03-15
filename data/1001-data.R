library(data.table)
d <- fread("1001-mrgsolve.csv", na.strings=".")

d02 <- d[ID==2, ]
d09 <- d[ID==9, ]
d10 <- d[ID==10,]
d11 <- d[ID==11,]
d15 <- d[ID==15,]
d25 <- d[ID==25,]



d102 <- d02
d102$ID <- 102
d102$LAGT <- ifelse(d102$evid==1, 12.13, 0)

# infusion is off at lag ii
d109 <- d09
d109$ID <- 109
d109$LAGT <- 22


# infusion is off at lag ii
d110 <- d10
d110$ID <- 110
d110$LAGT <- 5

# infusion is on at lag ii
d210 <- d10
d210$ID <- 210
d210$LAGT <- 10

#infusion is transitioning from on to off at ii
d310 <- d10
d310$ID <- 310
d310$LAGT <- 7.4

# infusion is off at lag ii; lag > ii
d410 <- d10
d410$ID <- 410
d410$LAGT <- 17

# infusion is on at lag ii
d510 <- d10
d510$ID <- 510
d510$LAGT <- 10+24

#infusion is transitioning from on to off at ii
d610 <- d10
d610$ID <- 610
d610$LAGT <- 7.4+24

# infusion is off at lag time
d111 <- d11
d111$ID <- 111
d111$LAGT <- 5

# infsuion transitions at lag time
d211 <- d11
d211$ID <- 211
d211$LAGT <- 10

# infsuion is on at lag ii
d311 <- d11
d311$ID <- 311
d311$LAGT <- 11

# infusion is off at lag ii and over ii
d409 <- d09
d409$ID <- 409
d409$LAGT <- 46
d409$addl <- ifelse(d409$addl==0, 0, 1)

# infusion is off at lag ii and over ii
d509 <- d09
d509$ID <- 509
d509$LAGT <- 27.16
d509$addl <- ifelse(d509$addl==0, 0, 2)

# The infusion duration off-time will occur right at the dose time (due to lag)
d609 <- d09
d609$ID <- 609
d609$LAGT <- 19.88

# The infusion duration off-time will occur right at the dose time (due to lag)  over ii
d709 <- d09
d709$ID <- 709
d709$LAGT <- 19.88+24
d709$addl <- ifelse(d709$addl==0, 0, 2)

# infusion is off at lag ii and over ii
d809 <- d09
d809$ID <- 809
d809$LAGT <- 46+24
d809$addl <- ifelse(d809$addl==0, 0, 1)

# infusion is off at lag ii and over ii
d909 <- d09
d909$ID <- 909
d909$LAGT <- 27.16+24
d909$addl <- ifelse(d909$addl==0, 0, 2)

# The infusion duration off-time will occur right at the dose time (due to lag)  over ii
d1009 <- d09
d1009$ID <- 1009
d1009$LAGT <- 19.88+48
d1009$addl <- ifelse(d1009$addl==0, 0, 2)


# infusion is off at lag time
d411 <- d11
d411$ID <- 411
d411$LAGT <- 17

# infusion transitions

d415      <- d15
d415$ID   <- 415
d415$LAGT <- 28
d415$addl <- ifelse(d415$addl==0, 0, 2)

d125 <- d25
d125$ID <- 125
d125$addl <- 0
tmp <- data.frame(C=NA, ID=125, time=c(24, 36), evid=1, amt=c(100, 50), 
                  cmt=1, ss=c(1,2), ii=24, addl=2, rate=0, LAGT=0, 
                  MODE=0, DUR2=0, RAT2=0, BIOAV=1, DV=NA)
d125 <- rbind(tmp, d125)
setDT(d125)

d225 <- d25
d225$ID <- 225
d225$rate <- ifelse(d225$amt == 0, 0,
                    ifelse(d225$amt == 100, 25, 12.5))
d225$cmt <- 2

d325 <- d25
d325$ID <- 325
d325$addl <- 0
d325$rate <- ifelse(d325$amt == 0, 0,
                    ifelse(d325$amt == 100, 25, 12.5))
d325$cmt <- 2
tmp <- data.frame(C=NA, ID=325, time=c(24, 36), evid=1, amt=c(100, 50), 
                  cmt=2, ss=c(1,2), ii=24, addl=2, rate=c(25.0, 12.5), LAGT=0, 
                  MODE=0, DUR2=0, RAT2=0, BIOAV=1, DV=NA)
d325 <- rbind(tmp, d325)
setDT(d325)

# 325 + lag=20 so infusion stop occurs at time of dose
d425 <- d325
d425$ID <- 425
d425$LAGT <- 20

# 325 + lag=2 
d525 <- d325
d525$ID <- 525
d525$LAGT <- 2

# 125+ lag=3
d625 <- d125
d625$ID <- 625
d625$LAGT <- 3
d625$cmt <- ifelse(d625$evid==1, 2, d625$cmt)

# 725 + lag=23 so infusion is on at the time of dose
d725 <- d325
d725$ID <- 725
d725$LAGT <- 23

# 825 + lag=34 lag is longer than ii
d825 <- d325
d825$ID <- 825
d825$LAGT <- 34

d <- rbind(d,
           d102,
           d109,
           d110,
           d210,
           d310,
           d410,
           d510,
           d610,
           d111,
           d211,
           d311,
           d409,
           d411,
           d125,
           d225,
           d325,
           d425,
           d525,
           d625,
           d725,
           d825,
           d415,
           d509, 
           d609,
           d709,
           d809,
           d909,
           d1009)

d <- d[order(ID, time),]

fwrite(d, "1001.csv", na=".", quote=FALSE)

