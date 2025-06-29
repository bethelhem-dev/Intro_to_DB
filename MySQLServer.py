import mysql.connector
from mysql.connector import errorcode

def create_database():
    try:
        # Connect to MySQL server without specifying a database
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='your_password_here'  # <-- replace with your MySQL root password
        )
        cursor = conn.cursor()

        # Create database if not exists
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        print(f"Error while connecting to MySQL: {err}")

    finally:
        # Close cursor and connection if they exist
        if 'cursor' in locals():
            cursor.close()
        if 'conn' in locals() and conn.is_connected():
            conn.close()

if __name__ == "__main__":
    create_database()
