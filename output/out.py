import pandas as pd

df = pd.read_csv("../data/results.csv")

print(df[(df["points"] > 4) & (df["laps"] == 40)])
