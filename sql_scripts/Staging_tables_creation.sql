Use DATACO_STG;
CREATE TABLE stg_customers (
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),
    state VARCHAR(50),
    street VARCHAR(255),
    zipcode VARCHAR(20),
    segment VARCHAR(50)
);

CREATE TABLE stg_orders (
    order_id INT,
    customer_id INT,
    order_date DATETIME,
    order_status VARCHAR(50),
    region VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE stg_order_items (
    order_item_id INT,
    order_id INT,
    category_id INT,
	product_id INT,
    quantity INT,
    product_price FLOAT,
	discount FLOAT,
	discount_rate FLOAT,
    sales_amount FLOAT
);

CREATE TABLE stg_products (
    product_id INT,
    category_id INT,
    product_name VARCHAR(255),
    price FLOAT
);

CREATE TABLE stg_category (
    category_id INT,
    category_name VARCHAR(100)
);

CREATE TABLE stg_shipping (
    shipping_id INT,
    order_id INT,
    shipping_date DATETIME,
    shipping_mode VARCHAR(50),
    delivery_status VARCHAR(50)
);

