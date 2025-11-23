import os

class Settings:
    DUCKDB_PATH: str = os.getenv("DUCKDB_PATH", "db/casino.duckdb")

settings = Settings()
