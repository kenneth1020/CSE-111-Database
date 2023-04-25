import sqlite3
from sqlite3 import Error

from click import echo


def openConnection(_dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Open database: ", _dbFile)

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

    return conn

def closeConnection(_conn, _dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def createTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create table")
    # create table 
    #w_warehousekey decimal(9,0) not null,
    #w_name char(100) not null,
    #w_capacity decimal(6,0) not null,
    #w_suppkey decimal(9,0) not null,
    #w_nationkey decimal(2,0) not null
    _conn.execute("BEGIN")
    try:
        sql = """CREATE TABLE WAREHOUSE (
                w_warehousekey decimal(9,0) not null,
                w_name char(100) not null,
                w_capacity decimal(6,0) not null,
                w_suppkey decimal(9,0) not null,
                w_nationkey decimal(2,0) not null
                );"""
        _conn.execute(sql)
    except Error as e:
        _conn.execute("ROLLBACK")
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def dropTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Drop tables")

    _conn.execute("BEGIN")
    try:
        sql = """DROP TABLE WAREHOUSE;"""
        _conn.execute(sql)
    except Error as e:
        _conn.execute("ROLLBACK")
        print(e)

    print("++++++++++++++++++++++++++++++++++")

def insert_Warehouse(_conn, _w_warehouse, _w_name, _w_capacity, _w_suppkey, _w_nationkey):
    print("++++++++++++++++++++++++++++++++++")
    print("Insert Warehouse")

    _conn.execute("BEGIN")
    try:
        sql = """INSERT INTO WAREHOUSE (?, ?, ?, ?, ?)"""
        args = [_w_warehouse, _w_name, _w_capacity, _w_suppkey, _w_nationkey]
        _conn.execute(sql, args)

        _conn.commit()
        print("success")
    except Error as e:
        _conn.execute("ROLLBACK")
        print(e)

    print("++++++++++++++++++++++++++++++++++")

def populateTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Populate table")

    cur=_conn.cursor()
    cur.execute(f"""SELECT supplier.s_suppkey 
                    FROM supplier""")
    suppkeys=cur.fetchall()
    counter=1
    for suppkey in suppkeys:
        cur.execute(f"""
        SELECT nation.n_nationkey,
        nation.n_name,
        supplier.s_suppkey,
        supplier.s_name,
        count(*) as cnt,
        sum(part.p_size) as capacity
        FROM supplier
        INNER JOIN lineitem ON lineitem.l_suppkey=supplier.s_suppkey
        INNER JOIN part ON lineitem.l_partkey = part.p_partkey
        INNER JOIN orders on lineitem.l_orderkey = orders.o_orderkey
        INNER JOIN customer ON customer.c_custkey=orders.o_custkey
        INNER JOIN nation ON nation.n_nationkey=customer.c_nationkey
        WHERE supplier.s_suppkey={suppkey[0]}
        GROUP BY nation.n_nationkey
        ORDER BY cnt DESC, nation.n_name 
        """)
        results=cur.fetchall()
        nationkey1, cname1, suppkey1, sname1,__, _ =results[0]
        nationkey2, cname2, suppkey2, sname2,__, _ = results[1]

        wname1 = f"{sname1}___{cname1}"
        wname2 = f"{sname2}___{cname2}"
        max_capacity = max([result[-1]for result in results])
        shared_capacity=max_capacity*2
        cur.execute(f"""INSERT INTO warehouse VALUES ({counter},"{wname1}",{shared_capacity},{suppkey1},{nationkey1});""")
        cur.execute(f"""INSERT INTO warehouse VALUES ({counter+1},"{wname2}",{shared_capacity},{suppkey2},{nationkey2});""")
        _conn.commit()
        counter+=2
    
    print("++++++++++++++++++++++++++++++++++")



def Q1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q1")

    out = open("output/1.out", "w")
    cur = _conn.cursor()
    cur.execute("""SELECT * FROM warehouse
                    ORDER BY w_warehousekey;""")

    str = '{:>5} {:>5} {:>5} {:>5} {:>5}'.format("wId", "wName", "wCap", "sId", "nId")

    out.write(str + '\n')
    rows = cur.fetchall()
    
    for row in rows:
            str = '{:>5} {:>5} {:>5} {:>5} {:>5}'.format(row[0], row[1], row[2], row[3], row[4])
            out.write(str.format(*row) + '\n')
            print(str.format(*row))

    out.close()

    print("++++++++++++++++++++++++++++++++++")


def Q2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q2")

    out = open("output/2.out", "w")
    query = """SELECT n_name, count(w_warehousekey) as numW, sum(w_capacity) as totCap
                FROM warehouse
                INNER JOIN nation ON w_nationkey = n_nationkey

                GROUP BY n_name
                ORDER BY numW DESC, totCap DESC, n_name ASC;"""

    cur = _conn.cursor()
    cur.execute(query)

    str = '{:>1} {:>5} {:>5}'.format("nation", "numW", "totCap")
    out.write(str + '\n')
    r = cur.fetchall()

    for row in r:
        str = '{:>1} {:>5} {:>5}'.format(row[0], row[1], row[2])
        out.write(str.format(*row) + '\n')
        print(str.format(*row))

    out.close()

    print("++++++++++++++++++++++++++++++++++")


def Q3(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q3")

    with open('input/3.in') as out:
        temp = out.read()
        temp = temp.strip("\n")

    temp = "%" + temp + "%" 
    args = [temp] 
    out = open("output/3.out", "w")
    query = ("""SELECT s_name, n_name, w_name as wname
                FROM supplier
                INNER JOIN warehouse ON s_suppkey = w_suppkey
                INNER JOIN nation ON s_nationkey = n_nationkey

                WHERE (
                    w_name like (?)
                )
                ORDER BY s_name, wname ASC;""")

    cur = _conn.cursor()
    cur.execute(query, args) 

    str = '{:>1} {:>5} {:>5}'.format("supplier", "nation", "warehouse")
    out.write(str + '\n')
    r = cur.fetchall()

    for row in r:
        str = '{:>1} {:>5} {:>5}'.format(row[0], row[1], row[2])
        out.write(str.format(*row) + '\n')
        print(str.format(*row))
    out.close()

    print("++++++++++++++++++++++++++++++++++")


def Q4(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q4")

    with open('input/4.in') as out:
        temp1 = out.readline()
        temp1 = temp1.strip("\n")
        temp2 = out.readline()
        temp2 = temp2.strip("\n")
    
    temp1 = '%' + temp1 + '%'
    temp2 = int(temp2)
    args = [temp1, temp2]
    out = open("output/4.out", "w")
    query = ("""SELECT w_name, w_capacity as wcap
                    FROM warehouse
                    INNER JOIN nation ON w_nationkey = n_nationkey
                    INNER JOIN region ON n_regionkey = r_regionkey

                    WHERE (
                        r_name like ? AND
                        w_capacity > ?
                    )
                    ORDER BY wcap DESC;""")

    cur = _conn.cursor()
    cur.execute(query, args) 

    str = '{:>1} {:>5}'.format("warehouse", "capacity")
    out.write(str + '\n')
    rows = cur.fetchall()

    for row in rows:
        str = '{:>1} {:>5}'.format(row[0], row[1])
        out.write(str.format(*row) + '\n')
        print(str.format(*row))
    out.close()

    print("++++++++++++++++++++++++++++++++++")


def Q5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q5")

    with open('input/5.in') as out:
        temp = out.readline()
        temp = temp.strip("\n")

    temp = '%' + temp + '%'
    args = [temp]
    out = open("output/5.out", "w")

    sql = ("""SELECT r_name, sum(w_capacity) as totCap
                FROM warehouse
                INNER JOIN nation ON w_nationkey = n_nationkey
                INNER JOIN region ON n_regionkey = r_regionkey
                INNER JOIN supplier ON w_suppkey = s_suppkey

                WHERE s_nationkey = '24'

                GROUP BY r_regionkey, r_name
                ORDER BY r_name ASC;""")

    cur = _conn.cursor()
    cur.execute(sql) 

    str = '{:>1} {:>5}'.format("region", "capacity")
    out.write(str + '\n')

    rows = cur.fetchall()
    for row in rows:
        str = '{:>1} {:>5}'.format(row[0], row[1])
        out.write(str.format(*row) + '\n')
        print(str.format(*row))
    out.close()

    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"tpch.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        #dropTable(conn)
        #createTable(conn)
        #populateTable(conn)

        #Q1(conn)
        #Q2(conn)
        #Q3(conn)
        #Q4(conn)
        Q5(conn)

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
