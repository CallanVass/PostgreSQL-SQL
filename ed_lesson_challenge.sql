drop table students cascade;
drop table teachers cascade;
drop table subjects cascade;
drop table enrollments cascade;

create table students(
    student_id serial primary key,
    f_name text not null,
    l_name text not null,
    dob date not null
);

insert into students(f_name, l_name, dob) values ('James', 'Franko', '1998/11/09'),
    ('Sarah', 'Marshall', '2000/11/09'),
    ('Amelia', 'Smith', '2001/11/09'),
    ('Dante', 'Larget', '2003/11/09'),
    ('Joseph', 'Willem', '2004/11/09')
;


create table teachers(
    teacher_id serial primary key,
    name text not null
);

insert into teachers(name) values ('Connor'),
    ('Adam'),
    ('Jessica')
;

create table subjects(
    subject_id serial primary key,
    subject_name text not null,
    teacher_id integer,
    foreign key (teacher_id) references teachers(teacher_id) on delete set null
);

insert into subjects(subject_name) values ('English'),
    ('Math'),
    ('Programming'),
    ('PE')
;


create table enrollments(
    enrollment_id serial primary key,
    student_id integer not null,
    subject_id integer not null,
    foreign key (student_id) references students(student_id) on delete cascade,
    foreign key (subject_id) references subjects(subject_id) on delete cascade,
    enrollment_date date default current_date

);

insert into enrollments (student_id, subject_id) values (1, 2),
(2, 3),
(4, 1),
(5, 2),
(5, 4),
(1, 3),
(2, 4),
(4, 2)
;

