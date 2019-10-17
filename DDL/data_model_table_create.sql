CREATE TABLE public.family_member (
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    name text NOT NULL,
    surname text NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.shopping_list (
    product_id integer NOT NULL,
    amount integer NOT NULL DEFAULT 1,
    PRIMARY KEY (product_id)
);


CREATE TABLE public.purchase (
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    product_id integer NOT NULL,
    price MONEY NOT NULL,
    date timestamp without time zone NOT NULL DEFAULT NOW(),
    family_member integer NOT NULL,
    amount integer NOT NULL DEFAULT 1,
    settled boolean NOT NULL DEFAULT false,
    PRIMARY KEY (id)
);

CREATE INDEX ON public.purchase
    (product_id);
CREATE INDEX ON public.purchase
    (family_member);


CREATE TABLE public.product (
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    name text NOT NULL,
    PRIMARY KEY (id)
);


ALTER TABLE public.shopping_list ADD CONSTRAINT FK_shopping_list__product_id FOREIGN KEY (product_id) REFERENCES public.product(id);
ALTER TABLE public.purchase ADD CONSTRAINT FK_purchase__product_id FOREIGN KEY (product_id) REFERENCES public.product(id);
ALTER TABLE public.purchase ADD CONSTRAINT FK_purchase__family_member FOREIGN KEY (family_member) REFERENCES public.family_member(id);