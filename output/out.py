import pandas as pd

df = pd.read_csv("../data/constructor_results.csv")

print(df[df["raceId"] <= 100].tail(5))
