-- V1__init.sql : 산업 교구 재고, 과학고 주문, 불변 기부 원장 초기 구축
CREATE TABLE products (
                          id BIGSERIAL PRIMARY KEY,
                          category VARCHAR(30) NOT NULL,
                          name VARCHAR(100) NOT NULL,
                          unit_price NUMERIC(15, 2) NOT NULL,
                          stock_quantity INT NOT NULL CHECK (stock_quantity >= 0)
);

CREATE TABLE orders (
                        id BIGSERIAL PRIMARY KEY,
                        institution_name VARCHAR(100) NOT NULL,
                        total_amount NUMERIC(15, 2) NOT NULL,
                        donation_rate NUMERIC(5, 4) NOT NULL,
                        status VARCHAR(20) NOT NULL,
                        created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE support_ledger (
                                id BIGSERIAL PRIMARY KEY,
                                order_id BIGINT REFERENCES orders(id),
                                tx_type VARCHAR(20) NOT NULL,
                                amount NUMERIC(15, 2) NOT NULL,
                                description VARCHAR(255) NOT NULL,
                                created_at TIMESTAMP NOT NULL DEFAULT NOW()
);