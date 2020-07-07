# import the CSV file


wbcd <- read.csv("diamond.csv", stringsAsFactors = FALSE)

# examine the structure of the wbcd data frame
str(wbcd)

wbcd <- wbcd[-1]
table(wbcd$blueWins)
wbcd$blueWins <- factor(wbcd$blueWins, levels = c("0", "1"),
                         labels = c("Win", "Lose"))
round(prop.table(table(wbcd$blueWins)) * 100, digits = 1)

#create normalization function
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# test normalization function - result should be identical
normalize(c(1, 2, 3, 4, 5))
normalize(c(10, 20, 30, 40, 50))

str(wbcd)
wbcd_n <- as.data.frame(lapply(wbcd[3:38], normalize))
summary(wbcd_n$blueWardsPlaced)
wbcd_train <- wbcd_n[1:2025, ]
wbcd_test <- wbcd_n[2026:5050, ]

wbcd_train_labels <- wbcd[1:2025, 1]
wbcd_test_labels <- wbcd[2026:5050, 1]
library(class)
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_labels, k = 45)
library(gmodels)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
           prop.chisq = FALSE)
