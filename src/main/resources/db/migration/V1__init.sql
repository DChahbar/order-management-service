CREATE TABLE users (
                       id UUID PRIMARY KEY,
                       email VARCHAR(255) UNIQUE NOT NULL,
                       password_hash VARCHAR(255) NOT NULL,
                       role VARCHAR(50) NOT NULL,
                       created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE products (
                          id UUID PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          price_cents INT NOT NULL,
                          created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE orders (
                        id UUID PRIMARY KEY,
                        user_id UUID NOT NULL REFERENCES users(id),
                        status VARCHAR(50) NOT NULL,
                        created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE order_items (
                             order_id UUID NOT NULL REFERENCES orders(id),
                             product_id UUID NOT NULL REFERENCES products(id),
                             quantity INT NOT NULL,
                             PRIMARY KEY (order_id, product_id)
);
