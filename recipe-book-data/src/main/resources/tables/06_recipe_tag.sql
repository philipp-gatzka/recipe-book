create table recipe_tag
(
    id                     int       not null auto_increment,
    creation_timestamp     timestamp not null default current_timestamp,
    modification_timestamp timestamp not null default current_timestamp on update current_timestamp,
    creation_user_id       int       not null,
    modification_user_id   int       not null,
    recipe_id              int       not null,
    tag_id                 int       not null,
    constraint pk_recipe_tag__id primary key (id),
    constraint uk_recipe_tag__recipe_id___tag_id unique (recipe_id, tag_id),
    constraint fk_recipe_tag__creation_user_id foreign key (creation_user_id) references `user` (id),
    constraint fk_recipe_tag__modification_user_id foreign key (modification_user_id) references `user` (id),
    constraint fk_recipe_tag__recipe_id foreign key (recipe_id) references recipe (id),
    constraint fk_recipe_tag__tag_id foreign key (tag_id) references tag (id)
)