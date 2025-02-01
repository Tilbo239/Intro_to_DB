from mysql.connector import errorcode

import mysql.connector

def create_database(cursor):
    try:
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as err:
        print(f"Failed creating database: {err}")


def main():
    try:
        connector = mysql.connector.connect(
            user='root', 
            password='ITServ32$', 
            host='127.0.0.1'
        )

        #Create a cursor object using the cursor() method
        cursor = connector.cursor()

        #We will create a database called 'alx_book_store'
        create_database(cursor)
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    else:
        cursor.close()
        connector.close()

if __name__ == "__main__":
    main()