from datetime import datetime
import faker
from random import randint, choice
import sqlite3


NUMBER_GROUPS = 3
NUMBER_STUDENTS = 50
NUMBER_PROFESSORS = 5
NUMBER_SUBJECTS = 5
NUMBER_GRADES = 19


def generate_fake_data(
    number_groups, number_students, number_professors, number_subjects
) -> tuple():
    fake_groups = []
    fake_students = []
    fake_professors = []
    fake_subjects = ["Math", "English", "Physics", "History", "Biology"]

    fake_data = faker.Faker()

    for _ in range(number_groups):
        fake_groups.append(fake_data.color_name())

    for _ in range(number_students):
        fake_students.append(fake_data.name())

    for _ in range(number_professors):
        fake_professors.append(fake_data.name())

    return fake_groups, fake_students, fake_professors, fake_subjects


def prepare_data(groups, students, professors, subjects) -> tuple():
    for_groups = []
    for group in groups:
        for_groups.append((group,))

    for_studens = []
    for student in students:
        for_studens.append((student, randint(1, NUMBER_GROUPS)))

    for_proffessors = []
    for proffesor in professors:
        for_proffessors.append((proffesor,))

    for_subjects = []
    for subject in subjects:
        for_subjects.append((subject, randint(1, NUMBER_PROFESSORS)))

    for_grades = []
    for student_id in range(1, NUMBER_STUDENTS + 1):
        for _ in range(1, NUMBER_GRADES + 1):
            subject_id = randint(1, NUMBER_SUBJECTS)
            grade = randint(50, 100)
            date_received = datetime(
                randint(2022, 2023), randint(1, 12), randint(1, 28)
            ).date()
            for_grades.append((student_id, subject_id, grade, date_received))

    return for_groups, for_studens, for_proffessors, for_subjects, for_grades


def insert_data_to_db(groups, students, professors, subjects, grades) -> None:
    with sqlite3.connect("university.db") as con:
        cur = con.cursor()
        sql_to_groups = """INSERT INTO groups(group_name)
                            VALUES (?)"""
        cur.executemany(sql_to_groups, groups)

        sql_to_students = """INSERT INTO students(student_name, group_id)
                              VALUES (?, ?)"""
        cur.executemany(sql_to_students, students)

        sql_to_professors = """INSERT INTO professors(professor_name)
                                VALUES (?)"""
        cur.executemany(sql_to_professors, professors)

        sql_to_subjects = """INSERT INTO subjects(subject_name, professor_id)
                                VALUES (?, ?)"""
        cur.executemany(sql_to_subjects, subjects)

        sql_to_grades = """INSERT INTO grades(student_id, subject_id, grade, date_received)
                                VALUES (?, ?, ?, ?)"""
        cur.executemany(sql_to_grades, grades)

        con.commit()


if __name__ == "__main__":
    groups, students, professors, subjects, grades = prepare_data(
        *generate_fake_data(
            NUMBER_GROUPS, NUMBER_STUDENTS, NUMBER_PROFESSORS, NUMBER_SUBJECTS
        )
    )
    insert_data_to_db(groups, students, professors, subjects, grades)
