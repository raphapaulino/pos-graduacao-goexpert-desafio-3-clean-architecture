-- name: ListOrders :many
SELECT * FROM orders;

-- name: GetOrder :one
SELECT * FROM orders
WHERE id = ?;

-- name: CreateOrder :exec
INSERT INTO orders (id, price, tax, final_price)
VALUES (?, ?, ?, ?);

-- name: UpdateOrder :exec
UPDATE orders SET price = ?, tax = ?, final_price = ?
WHERE id = ?;

-- name: DeleteOrder :exec
DELETE FROM orders WHERE id = ?;