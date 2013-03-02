# STA242 H04 - cli for large data
# 20130227 - HCrockford

ports = c("LAX","OAK","SMF","SFO")
pflat = paste(ports,"|",sep="", collapse = "") # lthrow together for grep.
airp = substr(pflat,1,nchar(pflat)-2)
fill = "~/data/airports/open/1987.csv"
com = sprintf("cat %s | awk -F ',' '{print $17}'| grep -E '%s' | sort | uniq -c",fill,airp)
ret = system(com,intern = TRUE)
foo = sapply(ret,function(i) unlist(strsplit(i," ")))
planes = structure(as.integer(lapply(nom,function(i) i[length(i)-1])) , names = lapply(nom,function(i) i[length(i)]))

