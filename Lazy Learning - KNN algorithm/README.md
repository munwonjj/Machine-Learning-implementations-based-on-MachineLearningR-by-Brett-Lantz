# Lazy Learning - Classification Using Nearest Neighbors

I utilized the concept of **Lazy Learning** and applied to the League of Legends dataset to investigate the winning rate of each side of the team (blue vs. red). The dataset is from the following Kaggle website which consists of Diamond Ranked dataset (DIAMOND I to MASTER) for the first 10 minutes of the game from approximately 10k ranked games (SOLO QUEUE).

Link to the Kaggle website: https://www.kaggle.com/bobbyscience/league-of-legends-diamond-ranked-games-10-min

There are total of **19** features per team. Some major features include kills, deaths, gold, experience and level.

The following was the **target column** <br />
**Blue Team Won**: 0 <br />
**Red Team Won**: 1

First of all, the GameID column was removed from the dataset since it it only a unique identifier that does not provide useful information regarding analyzing the data. After dividing the train and test dataset to 80% and 20% of respectively, knn model was implemented with k = 45. To evaluate how well the predicted classes in the test prediction vector matches with the known values in the test labels, CrossTable function was used from the gmodels package.

![Rplot](https://user-images.githubusercontent.com/52622346/86850993-ce1efd00-c077-11ea-9627-b11e6db9145b.png)

The result of the above 3025 observations show that of the 1127 / 3025 observations, the kNN algorithm correctly identified the Blue Team Rate with an accuracy of around **37.3%**. On the other hand, 395 / 3025 were **False Positive** meaning that the algorithm predicted **LOSS** when in fact, the Blue Team won the game. The accuracy rate of False Positive was around **13.1%**
