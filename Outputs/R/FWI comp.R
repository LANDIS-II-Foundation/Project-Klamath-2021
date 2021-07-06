
#### miroc

Event_Tot = c("Year", "Day", "FWI", "Scenario")

  
Event = paste0(BAU_input,"..1/scrapple-events-log.csv") %>% read.csv()
    
EventFWI = cbind(Event$SimulationYear, Event$InitialDayOfYear, Event$MeanFWI) %>% as.data.frame()
EventFWI$Scenario = scenario
    
Event_Tot = rbind(Event_Tot, EventFWI)



Event_Tot = as.data.frame(Event_Tot)
colnames(Event_Tot)=Event_Tot[1,] %>% unlist %>% as.character
Event_Tot=Event_Tot[-1,]

j=c(1:3)

Event_Tot[ , j] = apply(Event_Tot[ , j], 2,
                        function(x) as.numeric(as.character(x)))

Event_Ag = aggregate(data=Event_Tot, FWI~Year, mean)

ggplot(Event_Ag, aes(x=Year, y=FWI)) +
  geom_line() +
  xlab("year")+
  ylab("Mean fire weather index")+
  ggtitle("Mean Fire Weather Index for all the events") +
  theme(plot.title = element_text(hjust = 0.5))

### cansm

Event_Tot2 = c("Year", "Day", "FWI", "Scenario")

Event2 = paste0(BAU_input,"..Clim2/scrapple-events-log.csv") %>% read.csv()
  
EventFWI2 = cbind(Event2$SimulationYear, Event2$InitialDayOfYear, Event2$MeanFWI) %>% as.data.frame()
EventFWI2$Scenario = scenario
  
Event_Tot2 = rbind(Event_Tot2, EventFWI2)


Event_Tot2 = as.data.frame(Event_Tot2)
colnames(Event_Tot2)=Event_Tot2[1,] %>% unlist %>% as.character
Event_Tot2=Event_Tot2[-1,]

j=c(1:3)

Event_Tot2[ , j] = apply(Event_Tot2[ , j], 2,
                        function(x) as.numeric(as.character(x)))

Event_Ag2 = aggregate(data=Event_Tot2, FWI~Year, mean)

ggplot(Event_Ag2, aes(x=Year, y=FWI)) +
  geom_line() +
  xlab("year")+
  ylab("Mean fire weather index")+
  ggtitle("Mean Fire Weather Index for all the events") +
  theme(plot.title = element_text(hjust = 0.5))




