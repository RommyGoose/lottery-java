
-- Closed draw with one winner
INSERT INTO draws(status, winning_numbers, created_at, closed_at)
SELECT 'CLOSED', '[3, 7, 12, 22, 35]', '2025-08-17T15:22:34Z', '2025-08-17T15:22:34Z'
WHERE NOT EXISTS(SELECT 1 FROM draws);

INSERT INTO tickets(draw_id, numbers, created_at)
SELECT (SELECT id FROM draws WHERE status='CLOSED' LIMIT 1), '[1, 2, 3, 4, 5]', '2025-08-17T15:22:34Z'
WHERE (SELECT COUNT(*) FROM tickets)=0;
INSERT INTO tickets(draw_id, numbers, created_at)
SELECT (SELECT id FROM draws WHERE status='CLOSED' LIMIT 1), '[3, 7, 12, 22, 35]', '2025-08-17T15:22:34Z'
WHERE (SELECT COUNT(*) FROM tickets)=1;
INSERT INTO tickets(draw_id, numbers, created_at)
SELECT (SELECT id FROM draws WHERE status='CLOSED' LIMIT 1), '[6, 11, 12, 22, 35]', '2025-08-17T15:22:34Z'
WHERE (SELECT COUNT(*) FROM tickets)=2;

-- Create one active draw
INSERT INTO draws(status, winning_numbers, created_at, closed_at)
VALUES ('ACTIVE', NULL, '2025-08-17T15:22:34Z', NULL);
INSERT INTO tickets(draw_id, numbers, created_at)
VALUES ((SELECT id FROM draws WHERE status='ACTIVE' LIMIT 1), '[1, 6, 11, 16, 21]', '2025-08-17T15:22:34Z');
INSERT INTO tickets(draw_id, numbers, created_at)
VALUES ((SELECT id FROM draws WHERE status='ACTIVE' LIMIT 1), '[2, 7, 12, 17, 22]', '2025-08-17T15:22:34Z');
