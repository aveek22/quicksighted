create procedure public.usp_insert_qs_aws_account_config(
    p_account_id            varchar(100),
    p_account_name          varchar(100),
    p_account_description   text
)
language sql
as $$

    insert into qs_aws_account_config (account_id,account_name,account_description)
    values (p_account_id, p_account_name,p_account_description);

$$;



create procedure public.usp_insert_qs_aws_account_credentials(
    p_account_id            varchar(100),
    p_access_key            varchar(200),
    p_secret_access         varchar(500),
    p_aws_role              varchar(200)
)
language sql
as $$

    with cte_aws_config as (
        select
            account_key,
            p_access_key,
            p_secret_access,
            p_aws_role
        from public.qs_aws_account_config
        where 1=1
        and account_id = p_account_id
    )

    insert into qs_aws_account_credentials (account_key,access_key,secret_access,aws_role)
    select * from cte_aws_config;

$$;