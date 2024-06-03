use `3220103373`;
select title, author, press, year, stock from book where stock <= 5;

select card.name, book.title, borrow.borrow_date from card, borrow, book where card.name = '张三' and borrow.cno = (select cno from card where name = '张三') and book.bno = borrow.bno;

select * from book where price = (select max(price) from book);

select sum(stock), max(price), min(price) from book;

select press, stock from book where stock > 1;

select cno from card where cno not in (select cno from borrow);

select * from book_view;

update book_view set year = 2010 where title = '实用英文写作';