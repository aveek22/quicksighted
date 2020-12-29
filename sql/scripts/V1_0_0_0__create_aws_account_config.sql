create table public.qs_aws_account_config(
    account_key             serial,
    account_id              varchar(100) not null,
    account_name            varchar(100),
    account_description     text,
    account_status          smallint        default     1,
    created_dttm            timestamp       default     now(),
    updated_dttm            timestamp,
    primary key (account_key)
);


create table public.qs_aws_account_credentials(
    credential_key          serial,
    account_key             int,
    access_key              varchar(200),
    secret_access           varchar(500),
    aws_role                varchar(200),
    credential_status       smallint        default     1,
    created_dttm            timestamp       default     now(),
    updated_dttm            timestamp,
    primary key (credential_key),
    constraint fk_aws_account_credentials_aws_account_config
        foreign key (account_key)
        references public.qs_aws_account_config(account_key)
);