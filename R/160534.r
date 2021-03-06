
#1
num_samples <- 50000
data <- rexp(num_samples, 0.2)
x <- data.frame(X = seq(1, num_samples , 1), Y = sort(data))
plot(x)
print("MEAN OF ORIGINAL DATA")
print("5")
print("STANDARD DEVIATION OF ORIGINAL DATA")
print("5")

vec<-list()

#2
for(i in 1:500){
y<- data[((i-1)*100+1):(i*100)]
vec<-c(list(y),vec)
}

#3
for(j in 1:5){
pdata<-rep(0,100)
ele<-vec[[j]]
for(k in 1:100){

   val=round(ele[k], 0);
  if(val <= 100){
     pdata[val] = pdata[val] + 1/100; 
    }
}


xcols<-c(0:99)
plot(xcols, pdata, "l", xlab="X", ylab="f(X)")

cdata <- rep(0, 100)

cdata[1] <- pdata[1]

for(i in 2:100){
    cdata[i] = cdata[i-1] + pdata[i]
}

plot(xcols, cdata, "o", col="blue", xlab="X", ylab="F(X)")

}

means<-c()
standard_d<-c()

for(i in 1:500)
{
	y<-mean(vec[[i]])
	z<-sd(vec[[i]])
	means<-c(y,means)
	standard_d<-c(z,standard_d)	
}
print("MEAN OF FIRST FIVE DATA ARE:")
means[1]
means[2]
means[3]
means[4]
means[5]
print("STANDARD DEVIATION OF FIRST FIVE DATA ARE:")
standard_d[1]
standard_d[2]
standard_d[3]
standard_d[4]
standard_d[5]


#4

tab <- table(round(means,1))
plot(tab, "h", xlab="Value", ylab="Frequency")
pdata<-rep(0,10)
for(i in 1:500)
{
	val<-round(means[i])
	if(val<=10)
		pdata[val]<-pdata[val]+1/500
}
xcols<-c(1:10);
plot(xcols, pdata, "l", xlab="means", ylab="probabiity")

cdata<-rep(0,10)
cdata[1]<-pdata[1]
for(i in 2:10)
{
	cdata[i]<-cdata[i-1]+pdata[i]
}
plot(xcols, cdata, "o", col="blue", xlab="X", ylab="CDF of means")


#5
print("MEAN OF SAMPLE MEANS:")
mean(means)
print("STANDARD DEVIATION OF SAMPLE MEANS:")
sd(means)



