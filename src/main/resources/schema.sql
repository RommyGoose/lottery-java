
CREATE TABLE IF NOT EXISTS draws (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    status TEXT CHECK(status IN ('ACTIVE','CLOSED')) NOT NULL,
    winning_numbers TEXT NULL,
    created_at TEXT NOT NULL,
    closed_at TEXT NULL
);
CREATE INDEX IF NOT EXISTS idx_draws_status ON draws(status);

CREATE TABLE IF NOT EXISTS tickets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    draw_id INTEGER NOT NULL,
    numbers TEXT NOT NULL,
    created_at TEXT NOT NULL,
    FOREIGN KEY(draw_id) REFERENCES draws(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_tickets_draw_id ON tickets(draw_id);
