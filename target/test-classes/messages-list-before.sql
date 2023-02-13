delete from message;

insert into message(id, text, tag, user_id) values
(2, 'first', 'my-tag', 1),
(3, 'second', 'more', 1),
(4, 'third', 'my-tag', 1),
(5, 'fourth', 'another', 2);

alter sequence hibernate_sequence restart with 10;