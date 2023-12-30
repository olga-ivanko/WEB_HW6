import sqlite3


def execute_query(sql: str) -> list:
    with open(sql, "r") as f:
        sql = f.read()

    with sqlite3.connect("university.db") as con:
        cur = con.cursor()
        cur.execute(sql)
        return cur.fetchall()


if __name__ == "__main__":
    print(
        "--- QUERY 01 ---\n 5 students with the highest average score in all subjects:"
    )
    print(execute_query("query_01.sql"), "\n")

    print("--- QUERY 02 ---\n the student with the highest average score in Math:")
    print(execute_query("query_02.sql"), "\n")

    print("--- QUERY 03 ---\n average score in Math in groups:")
    print(execute_query("query_03.sql"), "\n")

    print("--- QUERY 04 ---\n average score:")
    print(execute_query("query_04.sql"), "\n")

    print("--- QUERY 05 ---\n subject of professor with ID 2:")
    print(execute_query("query_05.sql"), "\n")

    print("--- QUERY 06 ---\n students from the group with ID 3:")
    print(execute_query("query_06.sql"), "\n")

    print("--- QUERY 07 ---\n grades in Physics of students of the group with ID 1:")
    print(execute_query("query_07.sql"), "\n")

    print("--- QUERY 09 ---\n subgects of student with ID 8:")
    print(execute_query("query_09.sql"), "\n")
