import psycopg2
import pandas as pd

DB_PARAMS = {
    "dbname": "analytics", 
    "user": "postgres",
    "password": "postgres",
    "host": "postgres",
    "port": "5432",
}

TABLE_NAME = "lms_video_data"

CREATE_TABLE_SQL = f"""
DROP TABLE IF EXISTS {TABLE_NAME} CASCADE;
CREATE TABLE IF NOT EXISTS {TABLE_NAME} (
    student_id TEXT PRIMARY KEY,
    course_id INTEGER,
    course_code TEXT,
    video_title TEXT,
    role TEXT,
    completion_rate_percent INTEGER
);
"""

INSERT_SQL = f"""
INSERT INTO {TABLE_NAME} (student_id, course_id, course_code, video_title, role, completion_rate_percent)
VALUES (%s, %s, %s, %s, %s, %s) ON CONFLICT DO NOTHING;
"""

def insert_dataframe_data(df: pd.DataFrame):
    conn = psycopg2.connect(**DB_PARAMS)
    cur = conn.cursor()
    
    try:
        # Ensure table exists
        cur.execute(CREATE_TABLE_SQL)  
        conn.commit()
        
        records = [tuple(x) for x in df.to_numpy()]
        
        cur.executemany(INSERT_SQL, records)
        
        conn.commit()
        print("DataFrame Data inserted successfully!")
    
    except Exception as e:
        print(f"Error inserting data: {e}")
    
    finally:
        cur.close()
        conn.close()
