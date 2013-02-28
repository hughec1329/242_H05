# STA242 H04 - cli for large data
# 20130227 - HCrockford

ports = c("LAX","OAK","SMF","SFO")
pflat = paste(ports,"/|",sep="", collapse = "") # lthrow together for grep.
airp = substr(pflat,1,nchar(pflat)-2)
fill = "1987.csv"
com = sprintf("cat %s | awk -F \",\" '{print $17}'| grep %s | sort | uniq -c",fill,airp)
