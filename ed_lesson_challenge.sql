create table students(
    student_id serial primary key,
    f_name text not null,
    l_name text not null,
    dob date not null
);

create table teachers(
    teacher_id serial primary key,
    name text not null
);

create table subjects(
    subject_id serial primary key,
    subject_name text not null,
    teacher_id integer,
    foreign key (teacher_id) references teachers(teacher_id) on delete set null
);

create table enrollments(
    enrollment_id serial primary key,
    student_id integer not null,
    subject_id integer not null,
    foreign key (student_id) references students(student_id),
    foreign key (subject_id) references subjects(subject_id),
    enrollment_date date default current_date

);

-- For challenge table subjects was dropped, produced error (which I must comment for challenge):
-- "ERROR:  cannot drop table subjects because other objects depend on it
-- DETAIL:  constraint enrollments_subject_id_fkey on table enrollments depends on table subjects"
