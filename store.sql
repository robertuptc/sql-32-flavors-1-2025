DROP TABLE IF EXISTS stores CASCADE;
CREATE TABLE stores(
    store_id SERIAL PRIMARY KEY,
    location VARCHAR(250)
);
\COPY stores FROM './data/stores.csv' DELIMITER ',' CSV HEADER;



DROP TABLE IF EXISTS flavors CASCADE;
CREATE TABLE flavors(
    flavor_id SERIAL PRIMARY KEY,
    flavor_name VARCHAR(100),
    dairy_free BOOLEAN,
    quantity INT
);
\COPY flavors FROM './data/flavors.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS cones CASCADE;
CREATE TABLE cones(
    cone_id SERIAL PRIMARY KEY,
    cone_type VARCHAR(100),
    gluten_free BOOLEAN,
    quantity INT
);
\COPY cones FROM './data/cones.csv' DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(20)
);
\COPY employees FROM './data/employees.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(200),
    total_spent INT,
    loyalty_points BIGINT
);
\COPY customers FROM './data/customers.csv' DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS sales CASCADE;
CREATE TABLE sales(
    sales_id SERIAL PRIMARY KEY,
    flavor_id INT,
    cone_id INT,
    store_id INT,
    customer_id INT,
    sales_price DECIMAL(5,2),
    FOREIGN KEY (flavor_id) REFERENCES flavors(flavor_id),
    FOREIGN KEY (cone_id) REFERENCES cones(cone_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
\COPY sales FROM './data/sales.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS employee_stores;
CREATE TABLE employee_stores(
    employee_stores_id SERIAL PRIMARY KEY,
    store_id INT,
    employee_id INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
\COPY employee_stores FROM './data/employee_stores.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS store_managers;
CREATE TABLE store_managers(
    store_manager_id SERIAL PRIMARY KEY,
    store_id INT,
    employee_id INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
\COPY store_managers FROM './data/store_managers.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS timesheet;
CREATE TABLE timesheet(
    timesheet_id SERIAL PRIMARY KEY,
    employee_id INT,
    store_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
\COPY timesheet FROM './data/timesheet.csv' DELIMITER ',' CSV HEADER;

DROP TABLE if EXISTS prizes;
CREATE TABLE prizes(
    prize_id SERIAL PRIMARY KEY,
    prize_name VARCHAR(200),
    loyalty_points_required INT
);
\COPY prizes FROM './data/prizes.csv' DELIMITER ',' CSV HEADER;