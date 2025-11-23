from app.core.database import get_connection

def query(sql: str, params: tuple = ()):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute(sql, params)

    if sql.strip().lower().startswith("select"):
        rows = cur.fetchall()
        columns = [col[0] for col in cur.description]
        return [dict(zip(columns, row)) for row in rows]

    conn.commit()
    return {"status": "ok"}
