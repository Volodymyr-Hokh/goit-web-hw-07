from datetime import datetime, timedelta
from random import randint
import re

import faker

from connect_db import session
from models import Group, Teacher, Subject, Student, Grade

NUMBER_OF_TEACHERS = 4
NUMBER_OF_STUDENTS = 50

fake = faker.Faker('uk-UA')


def seed_groups():
    groups = [('ФБСст-41',), ('МЗЕД-11',), ('ПТБД-42',)]
    for group in groups:
        session.add(Group(group_name=group))


def seed_teachers():
    teachers = [(re.sub(r'^пані? ', '', fake.name()),)
                for _ in range(NUMBER_OF_TEACHERS)]
    for teacher in teachers:
        session.add(Teacher(teacher_full_name=teacher))


def seed_subjects():
    subjects = [
        ('Вища математика', randint(1, NUMBER_OF_TEACHERS)),
        ('Англійська мова', randint(1, NUMBER_OF_TEACHERS)),
        ('Історія України', randint(1, NUMBER_OF_TEACHERS)),
        ('Економіка', randint(1, NUMBER_OF_TEACHERS)),
        ('Українська мова', randint(1, NUMBER_OF_TEACHERS)),
        ('Програмування', randint(1, NUMBER_OF_TEACHERS)),
        ('Маркетинг', randint(1, NUMBER_OF_TEACHERS)),
    ]
    for subject in subjects:
        session.add(Subject(subject_name=subject[0],
                    teacher_id=subject[1]))


def seed_students():
    students = [
        (re.sub(r'^пані? ', '', fake.name()), randint(1, 3))
        for _ in range(NUMBER_OF_STUDENTS)
    ]

    for student in students:
        session.add(Student(student_full_name=student[0],
                    group_id=student[1]))


def seed_grades():
    grades = [
        (randint(1, NUMBER_OF_STUDENTS), randint(1, 5), randint(1, 100),
         (datetime(2023, 1, 1) + timedelta(days=randint(0, 364))).strftime('%Y-%m-%d'))
        for _ in range(1000)
    ]

    for grade in grades:
        session.add(
            Grade(student_id=grade[0], subject_id=grade[1], grade=grade[2], date=grade[3]))


def main():
    seed_groups()
    seed_teachers()
    seed_subjects()
    seed_students()
    seed_grades()

    session.commit()


if __name__ == '__main__':
    main()
