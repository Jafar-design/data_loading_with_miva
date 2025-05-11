import requests
import pandas as pd
import os

def download_csv_data(url: str) -> None:
    try:
        response = requests.get(url)
        with open(csv_data, "wb") as file:
            file.write(response.content)
    except requests.RequestException as e:
        print(f"Error downloading data: {e}")
    except IOError as e:
        print(f"Error writing file: {e}")

def load_csv_to_df(csv_data):
    return pd.read_csv(csv_data)
