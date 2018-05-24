library(xlsx)
df <- read.xlsx("page3.xlsx", sheetIndex = 1, encoding = "UTF-8")
df_1 <- read.csv("tabula-exportimpoRT.csv", encoding = "UTF-8")
df_2 <- read.csv("tabula-exportimpoRT (1).csv", encoding = "UTF-8")
df_3 <- read.csv("tabula-exportimpoRT (3).csv", encoding = "UTF-8")




##########
##########
##########
##########
########## Работаю с датафреймом df_3
df_3$X.4 <- NULL
df_3 <- df_3[-2,]
df_3 <- df_3[-10,]
df_3 <- df_3[-7,]
df_3 <- df_3[-1,]
headers <- c('Страны', 'Экспорт 2014', 'Экспорт 2015', 'Экспорт 2016', 'Импорт 2014', 
             'Импорт 2015', 'Импорт 2016')
names(df_3) <- headers

# Избавляемся от запятых и ставим точки
mysub <- function(x) {sub(",",".",x)} 
df_3$`Экспорт 2014` <- sapply(df_3$`Экспорт 2014`, mysub)
df_3$`Экспорт 2015` <- sapply(df_3$`Экспорт 2015`, mysub)
df_3$`Экспорт 2016` <- sapply(df_3$`Экспорт 2016`, mysub)


df_3$`Импорт 2014` <- sapply(df_3$`Импорт 2014`, mysub)
df_3$`Импорт 2015` <- sapply(df_3$`Импорт 2015`, mysub)
df_3$`Импорт 2016` <- sapply(df_3$`Импорт 2016`, mysub)

# Избалвяемся от чёрточек и ставим NA
mysubNA <- function(x) {sub("-", "NA", x)}
df_3$`Экспорт 2014` <- sapply(df_3$`Экспорт 2014`, mysubNA)
df_3$`Экспорт 2015` <- sapply(df_3$`Экспорт 2015`, mysubNA)
df_3$`Экспорт 2016` <- sapply(df_3$`Экспорт 2016`, mysubNA)


df_3$`Импорт 2014` <- sapply(df_3$`Импорт 2014`, mysubNA)
df_3$`Импорт 2015` <- sapply(df_3$`Импорт 2015`, mysubNA)
df_3$`Импорт 2016` <- sapply(df_3$`Импорт 2016`, mysubNA)



##########
##########
##########
##########
########## Работаю с датафреймом df_2
df_2 <- df_2[-c(1, 19, 39, 56),]
names(df_2) <- headers

# Избавляемся от запятых и ставим точки
df_2$`Экспорт 2014` <- sapply(df_2$`Экспорт 2014`, mysub)
df_2$`Экспорт 2015` <- sapply(df_2$`Экспорт 2015`, mysub)
df_2$`Экспорт 2016` <- sapply(df_2$`Экспорт 2016`, mysub)


df_2$`Импорт 2014` <- sapply(df_2$`Импорт 2014`, mysub)
df_2$`Импорт 2015` <- sapply(df_2$`Импорт 2015`, mysub)
df_2$`Импорт 2016` <- sapply(df_2$`Импорт 2016`, mysub)

# Избалвяемся от чёрточек и ставим NA
df_2$`Экспорт 2014` <- sapply(df_2$`Экспорт 2014`, mysubNA)
df_2$`Экспорт 2015` <- sapply(df_2$`Экспорт 2015`, mysubNA)
df_2$`Экспорт 2016` <- sapply(df_2$`Экспорт 2016`, mysubNA)


df_2$`Импорт 2014` <- sapply(df_2$`Импорт 2014`, mysubNA)
df_2$`Импорт 2015` <- sapply(df_2$`Импорт 2015`, mysubNA)
df_2$`Импорт 2016` <- sapply(df_2$`Импорт 2016`, mysubNA)



##########
##########
##########
##########
########## Работаю с датафреймом df_1
df_1 <- df_1[-c(1, 2, 3, 4, 20, 21, 23, 27, 33, 48),]
names(df_1) <- headers

# Избавляемся от запятых и ставим точки
df_1$`Экспорт 2014` <- sapply(df_1$`Экспорт 2014`, mysub)
df_1$`Экспорт 2015` <- sapply(df_1$`Экспорт 2015`, mysub)
df_1$`Экспорт 2016` <- sapply(df_1$`Экспорт 2016`, mysub)


df_1$`Импорт 2014` <- sapply(df_1$`Импорт 2014`, mysub)
df_1$`Импорт 2015` <- sapply(df_1$`Импорт 2015`, mysub)
df_1$`Импорт 2016` <- sapply(df_1$`Импорт 2016`, mysub)

# Избалвяемся от чёрточек и ставим NA
df_1$`Экспорт 2014` <- sapply(df_1$`Экспорт 2014`, mysubNA)
df_1$`Экспорт 2015` <- sapply(df_1$`Экспорт 2015`, mysubNA)
df_1$`Экспорт 2016` <- sapply(df_1$`Экспорт 2016`, mysubNA)


df_1$`Импорт 2014` <- sapply(df_1$`Импорт 2014`, mysubNA)
df_1$`Импорт 2015` <- sapply(df_1$`Импорт 2015`, mysubNA)
df_1$`Импорт 2016` <- sapply(df_1$`Импорт 2016`, mysubNA)


########Подправляю немного шапку датафрейма df

names(df) <- headers
data_data <- rbind(df_1, df_2, df, df_3)
write.csv(data_data, file = "expoRT_and_impoRT.csv")


fg <- read.csv("expoRT_and_impoRT.csv")
fg$X <- NULL
fg <- fg[-151, ]
write.csv(fg, file = "for_society.csv")

fg_1 <- read.csv("for_society.csv")
fg_1$X <- NULL



######## Только здесь можно начать мало-мальски анализ
# Экспорт: Больше всего
which.max(fg_1$Экспорт.2014) # Нидерланды 
which.max(fg_1$Экспорт.2015) # Нидерланды
which.max(fg_1$Экспорт.2016) # Нидерланды

# Импорт: Больше всего
which.max(fg_1$Импорт.2014) #  Германия
fg_1[121,6] <- NA
which.max(fg_1$Импорт.2015) # Германия
which.max(fg_1$Импорт.2016) # Германия

# Экспорт: меньше всего
which.min(fg_1$Экспорт.2014) # Камерун
which.min(fg_1$Экспорт.2015) # Танзания
which.min(fg_1$Экспорт.2016) # Европейский союз

# Импорт: меньше всего
which.min(fg_1$Импорт.2014) # Бурунди
which.min(fg_1$Импорт.2015) # Камерун
which.min(fg_1$Импорт.2016) # Малые тихоокеанские отдален, острова 

write.csv(fg_1, file = "for_society_material.csv")
fg_1 <- read.csv("for_society_material.csv")
fg_1$X <- NULL

apply(fg_1, 2, function(x) length(which(!is.na(x))))

head(fg_1[order(fg_1$Экспорт.2015, decreasing = TRUE), ])
head(fg_1[order(fg_1$Экспорт.2016, decreasing = TRUE), ])
head(fg_1[order(fg_1$Экспорт.2014, decreasing = TRUE), ])


head(fg_1[order(fg_1$Импорт.2015, decreasing = TRUE), ])
head(fg_1[order(fg_1$Импорт.2016, decreasing = TRUE), ])
head(fg_1[order(fg_1$Импорт.2014, decreasing = TRUE), ])


g <- subset(head(fg_1[order(fg_1$Экспорт.2014, decreasing = TRUE), ]))
g <- g[, -c(5,6,7)]
names(g)
new_new_header <- c("страны", "2014", "2015", "2016")
names(g) <- new_new_header

g$`2017` <- c(2105300.0, 1999000.0, NA, 993100.0, NA, NA)
library(ggplot2)
library(ggthemes)
library(highcharter)
library(plotly)

final_g <- as.data.frame(t(g))
new_header <- c('Netherlands', 'Poland', 'Italy', 'Germany', 'Finland', 'Belarus')
names(final_g) <- new_header
final_g <- final_g[-1,]
final_g$year <- c(2014:2017)
final_g[1,1]
final_g <- as.data.frame(apply(final_g, 2, as.numeric))

b <- ggplot(final_g, aes(x = year))+
  geom_line(aes(y = Netherlands, colour = "Нидерланды"), size = 2) + 
  geom_line(aes(y = Poland, colour = "Польша"), size = 2)+
  geom_line(aes(y = Germany, colour = "Германия"), size = 2)+
  geom_point(aes(y = Netherlands, colour = "Нидерланды"), size = 3)+
  geom_point(aes(y = Poland, colour = "Польша"), size = 3)+
  geom_point(aes(y = Germany, colour = "Германия"), size = 3)+
  scale_x_continuous(breaks = c(2014, 2015, 2016, 2017), name = "Год\n
       Источник: Федеральная служба государственной статистики")+
  scale_y_continuous(breaks = c(574043.8, 968796.8, 1758495.2, 3505650), name = "Показатели по странам,в тыс.$")+
  ggtitle("Изменение татарстанского экспорта, 2014-2017 гг.")+
  scale_color_manual(name="Экспорт из РТ", values = c("black", "orange", "red"))+
  theme_economist_white()+
  theme(legend.position = "bottom")
ggplotly(b)


# Импорт 
n <- subset(head(fg_1[order(fg_1$Импорт.2014, decreasing = TRUE), ]))
n <- n[, -c(2,3,4)]
names(n)
new_new_header <- c("страны", "2014", "2015", "2016")
names(n) <- new_new_header

n$`2017` <- c(926700.0, NA, 305200.0, 212200.0, NA, 620200.0)


final_n <- as.data.frame(t(n))
names(final_n)
final_n$`165` <- NULL
final_n$`130` <- NULL
new_header_1 <- c('Germany', 'China', 'Belarus', 'USA')
names(final_n) <- new_header_1
final_n <- final_n[-1,]
final_n$year <- c(2014:2017)
final_n[1,1]
final_n <- as.data.frame(apply(final_n, 2, as.numeric))


m <- ggplot(final_n, aes(x = year))+
  geom_line(aes(y = Germany, colour = "Германия"), size = 2) + 
  geom_line(aes(y = China, colour = "Китай"), size = 2)+
  geom_line(aes(y = Belarus, colour = "Беларусь"), size = 2)+
  geom_line(aes(y = USA, colour = "США"), size = 2)+
  geom_point(aes(y = Germany, colour = "Германия"), size = 3)+
  geom_point(aes(y = China, colour = "Китай"), size = 3)+
  geom_point(aes(y = Belarus, colour = "Беларусь"), size = 3)+
  geom_point(aes(y = USA, colour = "США"), size = 3)+
  scale_x_continuous(breaks = c(2014, 2015, 2016, 2017), name = "Год\n
                     Источник: Федеральная служба государственной статистики")+
  scale_y_continuous(breaks = c(175518.0, 348561.4, 472912.5, 549147.4, 926700.0), name = "Показатели по странам,в тыс.$")+
  ggtitle("Изменения в импорте Татарстана, 2014-2017 гг.")+
  scale_color_manual(name="Импорт в РТ", values = c("green", "black","red", "blue"))+
  theme_economist_white()+
  theme(legend.position = "bottom")
ggplotly(m)
