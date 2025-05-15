from faker import Faker
import mysql.connector

# Step 1: Set up Faker
faker = Faker()
faker.seed_instance(0)

# Step 2: Connect to MariaDB
import mysql.connector

conn = mysql.connector.connect(
    host="127.0.0.1",         # or "localhost"
    port=3306,                # match the mapped port in docker-compose
    user="fakeruser",
    password="fakerpass",
    database="fakerdb"
)

cursor = conn.cursor()

# Step 3: (Optional) Create the table
cursor.execute("""
CREATE TABLE IF NOT EXISTS fake_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address TEXT,
    email VARCHAR(255),
    phone_number VARCHAR(20),
    date_of_birth DATE,
    job VARCHAR(255),
    company VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100)
)
""")

# Step 4: Insert fake data
def format_phone_number(phone_number):
    import re
    digits = re.sub(r'\D', '', phone_number)[-10:]
    return f"({digits[:3]}) {digits[3:6]}-{digits[6:]}" if len(digits) == 10 else phone_number

def insert_fake_users(n):
    for _ in range(n):
        name = faker.name()
        address = faker.address()
        email = faker.email()
        phone_number = format_phone_number(faker.phone_number())
        date_of_birth = faker.date_of_birth()
        job = faker.job()
        company = faker.company()
        city = faker.city()
        country = faker.country()

        cursor.execute("""
        INSERT INTO fake_users (name, address, email, phone_number, date_of_birth, job, company, city, country)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (name, address, email, phone_number, date_of_birth, job, company, city, country))

    conn.commit()

# Step 5: Call the function
insert_fake_users(10)

# Step 6: Close connection
cursor.close()
conn.close()
