use library;
CREATE TABLE borrow (
    cno CHAR(7),
    bno CHAR(8),
    borrow_date DATETIME,
    return_date DATETIME,
    FOREIGN KEY (cno)
        REFERENCES card (cno)
        ON UPDATE CASCADE,
    FOREIGN KEY (bno)
        REFERENCES book (bno)
        ON DELETE CASCADE
);