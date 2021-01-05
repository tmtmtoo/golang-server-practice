create table articles (
    id uuid NOT NULL,
    title varchar(255) NOT NULL,
    body text,
    created_at timestamp NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY (id)
);
