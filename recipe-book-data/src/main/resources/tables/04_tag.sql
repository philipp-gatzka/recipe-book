create table tag
(
    id                     int         not null auto_increment,
    creation_timestamp     timestamp   not null default current_timestamp,
    modification_timestamp timestamp   not null default current_timestamp on update current_timestamp,
    creation_user_id       int         not null,
    modification_user_id   int         not null,
    name                   varchar(50) not null,
    recipe_book_id         int         not null,
    constraint pk_tag__id primary key (id),
    constraint uk_tag__name___recipe_book_id unique (name, recipe_book_id),
    constraint fk_tag__creation_user_id foreign key (creation_user_id) references `user` (id),
    constraint fk_tag__modification_user_id foreign key (modification_user_id) references `user` (id),
    constraint fk_tag__recipe_book_id foreign key (recipe_book_id) references recipe_book (id)
)