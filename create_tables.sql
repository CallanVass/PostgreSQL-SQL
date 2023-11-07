drop table items;
drop table categories;

create table  categories (
    id serial primary key,

    name varchar(50) not null unique,
    description text
);

insert into categories (name, description) values
    ('Electronics', 'Fun things!'),
    ('Car Parts', 'Expensive things!')
;

create table  items (
    id serial primary key,

    name varchar(200) not null,
    description text not null,
    
    categories_id integer not null,
    foreign key (categories_id) references categories (id)
);

