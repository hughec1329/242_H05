# STA242 H04 - cli for large data
# 20130227 - HCrockford


###############################
## With shell tools
###############################

ports = c("LAX","OAK","SMF","SFO")
pflat = paste(ports,"|",sep="", collapse = "") # lthrow together for grep.
fill = "~/data/airports/open/1987.csv"
com = sprintf("cat %s | awk -F ',' '{print $17}'| grep -E '%s' | sort | uniq -c",fill,pflat)
ret = system(com,intern = TRUE)
foo = sapply(ret,function(i) unlist(strsplit(i," ")))
planes = structure(as.integer(lapply(nom,function(i) i[length(i)-1])) , names = lapply(nom,function(i) i[length(i)]))


### mean and SD of arrival delay times.

ports = c('"LAX"','"OAK"','"SMF"','"SFO"')	# damn quotes.

fill = "~/data/airports/open/1987.csv"
com = sprintf("cat %s | awk -F ',' '{if ($17 == %s) s+=$15} END {print s}'",fill,ports)
com = sprintf("cat %s | awk -F ',' '{if ($17 == "LAX") s+=$15} END {print s}'",fill,ports)	# damn quotes!
	      
ret = system(com,intern = TRUE)
foo = sapply(ret,function(i) unlist(strsplit(i," ")))
planes = structure(as.numeric(lapply(nom,function(i) i[length(i)-1])) , names = lapply(nom,function(i) i[length(i)]))


com = paste("./plan.sh", "mean", fill)
ret = system(com,intern = TRUE)
foo = sapply(ret,function(i) unlist(strsplit(i," ")))
means = structure(as.numeric(foo[2,]),names = foo[1,])
means


#### SD

com = paste("./plan.sh", "sd", fill)
ret = system(com,intern = TRUE)
foo = sapply(ret,function(i) unlist(strsplit(i," ")))
sds = structure(as.numeric(foo[2,]),names = foo[1,])
sds


##############################
### within R - Cant do?
##############################

fill = "~/data/airports/open/1987.csv"
con = file(fill)
nlin = as.integer(strsplit(system(paste("wc -l",fill), intern=TRUE)," ")[[1]][1])
block = 1000
arrdelay = numeric(1000000)
nplanes =0
passes = round(nlin/block)
# for(i in 1:passes){		# very slow with only 1000 planes!!
	plan = readLines(con,block)
	lapply(strsplit(plan,","), function(i) {
	       if(i[17] == "LAX"){
		       nplanes = nplanes+1
		       arrdelay[nplanes] = i[15]
	       }
	       men = sum(arrdelay)/nplanes
	       sdd = sum((arrdelay - men)^2)
	       }
	)
	       # return(sdd)
# }

##############################
### with DB's
##############################



