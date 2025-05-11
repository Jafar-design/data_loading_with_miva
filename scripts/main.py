from extract import download_csv_data, load_csv_to_df
from load import insert_dataframe_data

csv_data = "/app/dbt/seeds/lms_engagement_data.csv"

if __name__ == "__main__":
    download_csv_data(csv_data)

    df = load_csv_to_df(csv_data)

    insert_dataframe_data(df)


