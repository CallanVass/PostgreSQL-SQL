drop table items;
drop table categories;

create table  categories (
    id serial primary key,

    name varchar(50) not null unique,
    description text
);

insert into categories (name, description) values
    ('Electronics', 'Fun things!'),
    ('Car Parts', 'Expensive things!'),
    ('Sports', 'Get out and play'),
    ('Video games', 'Stay in and play')
;

create table  items (
    id serial primary key,

    name varchar(200) not null,
    description text not null,
    
    categories_id integer not null,
    foreign key (categories_id) references categories (id) on delete cascade
);

insert into items (name, description, categories_id) values
    ('Skyrim', 'Awesome open world RPG', 4),
    ('WOW', 'Awesome MMORPG', 4),
    ('Ipone', 'Apples flagship smartphone', 1),
    ('Greg Norman golf clubs', 'Look like a pro, even if you are not', 3)
;
