create table recipe_ingredient
(
    id                     int       not null auto_increment,
    creation_timestamp     timestamp not null default current_timestamp,
    modification_timestamp timestamp not null default current_timestamp on update current_timestamp,
    creation_user_id       int       not null,
    modification_user_id   int       not null,
    recipe_id              int       not null,
    ingredient_id          int       not null,
    amount                 double    not null,
    unit                   enum ('KILOGRAM', 'GRAM', 'LITER', 'DECILITER', 'CENTILITER', 'MILLILITER', 'PINCH', 'PIECE', 'TABLESPOON', 'TEASPOON'),
    constraint pk_recipe_ingredient__id primary key (id),
    constraint uk_recipe_ingredient__recipe_id___ingredient_id unique (recipe_id, ingredient_id),
    constraint fk_recipe_ingredient__creation_user_id foreign key (creation_user_id) references `user` (id),
    constraint fk_recipe_ingredient__modification_user_id foreign key (modification_user_id) references `user` (id),
    constraint fk_recipe_ingredient__recipe_id foreign key (recipe_id) references recipe (id),
    constraint fk_recipe_ingredient__ingredient_id foreign key (ingredient_id) references ingredient (id)
)