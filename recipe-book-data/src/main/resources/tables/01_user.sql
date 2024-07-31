create table `user`
(
    id                      int          not null auto_increment,
    creation_timestamp      timestamp    not null default current_timestamp,
    modification_timestamp  timestamp    not null default current_timestamp on update current_timestamp,
    firstname               varchar(50)  not null,
    lastname                varchar(50)  not null,
    email                   varchar(100) not null,
    email_verification_code varchar(36),
    password                varchar(255) not null,
    constraint pk_user__id primary key (id),
    constraint uk_user__email unique (email)
)