drop table categories;
drop table items;

create table  categories (
    id serial primary key,

    name varchar(50) not null,
    description text
);

create table  items (
    id serial primary key,

    name varchar(200) not null,
    description text not null,
    
    categories_id integer not null,
    foreign key (categories_id) references categories (id)
);