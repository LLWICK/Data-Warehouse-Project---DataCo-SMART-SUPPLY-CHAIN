
create table order_source(
	order_id int,
	customer_id int ,
	order_date date ,
	order_state varchar(20),
	order_region varchar(20),
	order_status varchar(20),
)

create table order_item_source(
	order_item_id int,
	order_id int ,
	product_id int ,
	category_id int ,
	item_quantity int ,
	item_price float,
	item_discount float,
	discount_rate float,
	after_price float,

)

select * from order_item_source

select * from order_source

select count(*) from order_source
select count(*) from order_item_source

truncate table order_source

truncate table order_item_source