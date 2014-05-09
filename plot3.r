# Data Cleaning
# from 66638 to 69517 , Total Rows: 69517-66638+1 
data<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrow=2880)
title<-read.table("household_power_consumption.txt",header=FALSE,sep=";",nrow=1)
name<-as.vector(t(title))
names(data)<-name
head(data)

class(data[,1])
class(data[,2])

time<-paste(data[,1],data[,2],sep=" ")
class(time)

Date<-as.Date(data[,1],"%d/%m/%Y")
class(Date)

Time<-strptime(time,"%d/%m/%Y %H:%M:%S")
class(Time)

data.clean<-data.frame(Date,Time,data[,3:9])
head(data.clean)

# Plot3
png(filename = "plot3.png",width = 480, height = 480)
plot(data.clean[,2],data.clean[,7],type='l',xlab='',ylab='Energy sub metering')
lines(data.clean[,2],data.clean[,8],col='red')
lines(data.clean[,2],data.clean[,9],col='blue')
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'))
