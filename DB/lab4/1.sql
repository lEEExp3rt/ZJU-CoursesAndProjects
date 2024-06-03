/* Login: root */
use library;
create user A@localhost;
grant all privileges on library.* to A@localhost with grant option;
