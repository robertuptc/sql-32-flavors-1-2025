DROP TABLE IF EXISTS flavors, cones, sales, employees;

CREATE TABLE flavors(
    flavor_id SERIAL PRIMARY KEY,
    flavor_name VARCHAR(100),
    dairy_free BOOLEAN,
    quantity INT
);

CREATE TABLE cones(
    cone_id SERIAL PRIMARY KEY,
    cone_type VARCHAR(100),
    gluten_free BOOLEAN,
    quantity INT
);

CREATE TABLE sales(
    id SERIAL PRIMARY KEY,
    flavor VARCHAR(100)
);

CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    employee_name VARCHAR(20),
    start_time TIMESTAMP,
    end_time TIMESTAMP
);