import pandas as pd
from sqlalchemy import create_engine, inspect
from urllib.parse import quote_plus

# ---------- Configuration ----------
SERVER = r"THEOLAJIDE"   # your SQL Server instance
DATABASE = "AdventureWorks2019"         # database name
DRIVER = "ODBC Driver 17 for SQL Server"

# Tables to export
tables = [
    "Sales.SalesOrderHeader",
    "Sales.SalesOrderDetail",
    "Production.Product",
    "Sales.Customer",
    "Sales.SalesTerritory",
    "Person.Person",
    "HumanResources.Employee"
]

OUTPUT_DIR = r"C:\Users\AbdullAteef\Downloads\Adventureworks_Data"

# Create SQLAlchemy engine 
conn_str = quote_plus(
    f"DRIVER={{{DRIVER}}};SERVER={SERVER};DATABASE={DATABASE};Trusted_Connection=yes"
)
engine = create_engine(f"mssql+pyodbc:///?odbc_connect={conn_str}", fast_executemany=True)

# Export tables 
inspector = inspect(engine)

for table in tables:
    try:
        print(f"Loading {table}...")
        # Read table into pandas, skipping unsupported types
        query = f"SELECT * FROM {table}"
        df = pd.read_sql_query(query, engine)
        output_file = f"{OUTPUT_DIR}/{table.replace('.', '_')}.csv"
        df.to_csv(output_file, index=False)
        print(f"Saved {output_file} ({len(df)} rows)")
    except Exception as e:
        print(f"Skipped {table} due to error:\n  {e}")

print("All tables processed.")
