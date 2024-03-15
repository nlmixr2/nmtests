withr::with_dir("data", {
  source("1001-data.R")
})

system("nmfe743-ifort 1001.ctl 1001.lst")

d1 <- fread("TAB",skip=1)
setnames(d1, "TIME","time")

d2 <- fread("data/1001.csv")

d3 <- cbind(d2, data.frame(cp=d1$CP))

names(d3) <- tolower(names(d3))

d3 <- d3[, c("id", "time", "cp", "cmt", "amt", "evid", "ii", "ss", "addl", 
             "rate", "lagt", "bioav", "rat2", "dur2", "mode")]

d3 <- as.data.frame(d3)

qs::qsave(d3, "test-nmtest.qs")
