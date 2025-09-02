CREATE DATABASE IF NOT EXISTS tienda_online;
USE tienda_online;

CREATE TABLE clientes (
    customer_id INT PRIMARY KEY,
    customer_gender ENUM('Masculino', 'Femenino') NOT NULL,
    customer_age INT NOT NULL
);

CREATE TABLE productos (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_category ENUM('Ropa', 'Accesorios', 'Calzado') NOT NULL,
    product_name VARCHAR(250) NOT NULL
);
CREATE TABLE fechas (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_date DATE NOT NULL,
    anio INT,
    mes INT,
    dia INT
);

CREATE TABLE metodos_pago (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_method VARCHAR(250) NOT NULL
);

CREATE TABLE regiones (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    shipping_region VARCHAR(250) NOT NULL
);

CREATE TABLE fact_ventas (
    order_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    payment_id INT NOT NULL,
    region_id INT NOT NULL,
    product_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    order_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES fechas(date_id),
    FOREIGN KEY (customer_id) REFERENCES clientes(customer_id),
    FOREIGN KEY (product_id) REFERENCES productos(product_id),
    FOREIGN KEY (payment_id) REFERENCES metodos_pago(payment_id),
    FOREIGN KEY (region_id) REFERENCES regiones(region_id)
);
