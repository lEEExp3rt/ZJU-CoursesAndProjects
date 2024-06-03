/* 1 */
alter table book add author_country varchar(30);

/* 2 */
alter table book drop author_country;

/* 3 */
alter table book add index title_index (title);

/* 4 */
alter table book drop index title_index;

/* 5 */
create view book_view as 
select bno, category, title, press, year, author from `book`;