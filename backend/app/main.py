from fastapi import FastAPI
from app.api.v1 import players, sessions, bets, rounds, payouts, games, tables

app = FastAPI(title="Casino Simulator API")

app.include_router(players.router, prefix="/api/v1/players", tags=["players"])
app.include_router(sessions.router, prefix="/api/v1/sessions", tags=["sessions"])
app.include_router(bets.router, prefix="/api/v1/bets", tags=["bets"])
app.include_router(rounds.router, prefix="/api/v1/rounds", tags=["rounds"])
app.include_router(payouts.router, prefix="/api/v1/payouts", tags=["payouts"])
app.include_router(games.router, prefix="/api/v1/games", tags=["games"])
app.include_router(tables.router, prefix="/api/v1/tables", tags=["tables"])

@app.get("/")
def root():
    return {"message": "Casino Simulator API is running"}
