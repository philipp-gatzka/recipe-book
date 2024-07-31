create table recipe_step
(
    id                     int       not null auto_increment,
    creation_timestamp     timestamp not null default current_timestamp,
    modification_timestamp timestamp not null default current_timestamp on update current_timestamp,
    creation_user_id       int       not null,
    modification_user_id   int       not null,
    recipe_id              int       not null,
    position               int       not null,
    content                text      not null,
    constraint pk_recipe_step__id primary key (id),
    constraint uk_recipe_step__recipe_id___tag_id unique (recipe_id, position),
    constraint fk_recipe_step__creation_user_id foreign key (creation_user_id) references `user` (id),
    constraint fk_recipe_step__modification_user_id foreign key (modification_user_id) references `user` (id),
    constraint fk_recipe_step__recipe_id foreign key (recipe_id) references recipe (id)
)