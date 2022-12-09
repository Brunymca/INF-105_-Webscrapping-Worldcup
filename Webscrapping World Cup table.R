
library(rvest)
library(dplyr)
library(ggplot2)

##### Scrab Worldcup #######
 url_Worldcup="https://www.skysports.com/world-cup-table"
 dataread=rvest::read_html(url_Worldcup)
 dataread

#### Calcul du nombre de tableaux retrouvés dans la page web ####
tableaux= rvest::html_table(dataread)
length(tableaux)

#### Creation d'une fonction qui va nous permettre de lire les données de la page web,aussi de compiler les tableaux dans un seul dataframe #######

 Worldcup<- function() {
  url_Worldcup="https://www.skysports.com/world-cup-table"
  data=read_html(url_Worldcup)
  tabs=html_table(data)
  tabl= do.call(rbind,list(tabs[[1]],tabs[[2]],tabs[[3]],tabs[[4]],tabs[[5]],tabs[[6]],tabs[[7]],tabs[[8]]))
  
  return(tabl)
}

Worldcup()

##### Le dataframe #####
df_worlcup=Worldcup()

### Réalisation du Graphique en bâton ###

 df_worlcup%>%arrange(desc(Pts)) %>%
   head(10)%>%
   ggplot(aes(y=Team, x=Pts))+
   geom_bar (stat ='identity', fill= "dodger blue" )+
   theme_classic()
  

