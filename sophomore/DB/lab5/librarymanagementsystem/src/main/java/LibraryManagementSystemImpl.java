import entities.Book;
import entities.Borrow;
import entities.Card;
import queries.*;
import utils.DBInitializer;
import utils.DatabaseConnector;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;

public class LibraryManagementSystemImpl implements LibraryManagementSystem {

    private final DatabaseConnector connector;

    public LibraryManagementSystemImpl(DatabaseConnector connector) {
        this.connector = connector;
    }

    @Override
    public ApiResult storeBook(Book book) {
        Connection conn = connector.getConn();
        try {
            // Check if the book is already in the database.
            {
                String sqlString = "select * from `book` where `category` = ? and `title` = ? and `press` = ? and `publish_year` = ? and `author` = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setString(1, book.getCategory());
                stmt.setString(2, book.getTitle());
                stmt.setString(3, book.getPress());
                stmt.setInt(4, book.getPublishYear());
                stmt.setString(5, book.getAuthor());
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    return new ApiResult(false, "Book already exists.\n");
                }
                rs.close();
                stmt.close();
            }
            // Insert the book into the database.
            String sqlString = "insert into `book` (`category`, `title`, `press`, `publish_year`, `author`, `price`, `stock`) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sqlString);
            stmt.setString(1, book.getCategory());
            stmt.setString(2, book.getTitle());
            stmt.setString(3, book.getPress());
            stmt.setInt(4, book.getPublishYear());
            stmt.setString(5, book.getAuthor());
            stmt.setDouble(6, book.getPrice());
            stmt.setInt(7, book.getStock());
            stmt.executeUpdate();
            // Get the book id.
            sqlString = "select `book_id` from `book` where `category` = ? and `title` = ? and `press` = ? and `publish_year` = ? and `author` = ?";
            stmt = conn.prepareStatement(sqlString);
            stmt.setString(1, book.getCategory());
            stmt.setString(2, book.getTitle());
            stmt.setString(3, book.getPress());
            stmt.setInt(4, book.getPublishYear());
            stmt.setString(5, book.getAuthor());
            ResultSet rs = stmt.executeQuery();
            rs.next();
            book.setBookId(rs.getInt("book_id"));
            rs.close();
            commit(conn);
            rs.close();
            stmt.close();
            return new ApiResult(true, "Insert book successfully with book_id = " + book.getBookId() + "\n");
        } catch (Exception e) {
            rollback(conn);
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult incBookStock(int bookId, int deltaStock) {
        Connection conn = connector.getConn();
        try {
            // Check if the book stock is larger than the deltaStock.
            {
                String sqlString = "SELECT `stock` FROM book WHERE book_id = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setInt(1, bookId);
                ResultSet rs = stmt.executeQuery();
                if (!rs.next()) {
                    return new ApiResult(false, "Book with book_id = " + bookId + " not found in the database.\n");
                }
                if (rs.getInt("stock") + deltaStock < 0) {
                    return new ApiResult(false, "Book stock less than 0.\n");
                }
                rs.close();
                stmt.close();
            }
            // Update the book stock.
            String sqlString = "update `book` set `stock` = `stock` + ? where `book_id` = ?";
            PreparedStatement stmt = conn.prepareStatement(sqlString);
            stmt.setInt(1, deltaStock);
            stmt.setInt(2, bookId);
            stmt.executeUpdate();
            commit(conn);
            stmt.close();
            return new ApiResult(true, "Change book stock successfully.\n");
        } catch (Exception e) {
            rollback(conn);
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult storeBook(List<Book> books) {
        Connection conn = connector.getConn();
        try {
            for (Book book : books) {
                // Check if the book is already in the database.
                String sqlString = "select * from `book` where `category` = ? and `title` = ? and `press` = ? and `publish_year` = ? and `author` = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setString(1, book.getCategory());
                stmt.setString(2, book.getTitle());
                stmt.setString(3, book.getPress());
                stmt.setInt(4, book.getPublishYear());
                stmt.setString(5, book.getAuthor());
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    rollback(conn);
                    return new ApiResult(false, "Book already exists.\n");
                }
                // Insert the book into the database.
                sqlString = "insert into `book` (`category`, `title`, `press`, `publish_year`, `author`, `price`, `stock`) values (?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sqlString);
                stmt.setString(1, book.getCategory());
                stmt.setString(2, book.getTitle());
                stmt.setString(3, book.getPress());
                stmt.setInt(4, book.getPublishYear());
                stmt.setString(5, book.getAuthor());
                stmt.setDouble(6, book.getPrice());
                stmt.setInt(7, book.getStock());
                stmt.executeUpdate();
                // Get the book id.
                sqlString = "select `book_id` from `book` where `category` = ? and `title` = ? and `press` = ? and `publish_year` = ? and `author` = ?";
                stmt = conn.prepareStatement(sqlString);
                stmt.setString(1, book.getCategory());
                stmt.setString(2, book.getTitle());
                stmt.setString(3, book.getPress());
                stmt.setInt(4, book.getPublishYear());
                stmt.setString(5, book.getAuthor());
                rs = stmt.executeQuery();
                rs.next();
                book.setBookId(rs.getInt("book_id"));
            }
            commit(conn);
            return new ApiResult(true, "Insert " + books.size() + " books successfully.\n");
        } catch (Exception e) {
            rollback(conn);
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult removeBook(int bookId) {
        Connection conn = connector.getConn();
        try {
            // Check if the book is in the database.
            {
                String sqlString = "select * from `book` where `book_id` = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setInt(1, bookId);
                ResultSet rs = stmt.executeQuery();
                if (!rs.next()) {
                    return new ApiResult(false, "Book with book_id = " + bookId + " not found in the database.\n");
                }
                rs.close();
                stmt.close();
            }
            // Check if the book is borrowed.
            {
                String sqlString = "select * from `borrow` where `book_id` = ? and `return_time` = 0";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setInt(1, bookId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    return new ApiResult(false, "Cannot remove book with book_id = " + bookId + ", it is borrowed.\n");
                }
                rs.close();
                stmt.close();
            }
            // Delete the book from the database.
            String sqlString = "delete from `book` where book_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sqlString);
            stmt.setInt(1, bookId);
            stmt.executeUpdate();
            commit(conn);
            stmt.close();
            return new ApiResult(true, "Successfully remove book with book_id = " + bookId + ".\n");
        } catch (Exception e) {
            rollback(conn);
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult modifyBookInfo(Book book) {
        Connection conn = connector.getConn();
        try {
            // Check if the book is in the database.
            {
                String sqlString = "select * from `book` where `book_id` = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setInt(1, book.getBookId());
                ResultSet rs = stmt.executeQuery();
                if (!rs.next()) {
                    return new ApiResult(false, "Book with book_id = " + book.getBookId() + " not found in the database.\n");
                }
                rs.close();
                stmt.close();
            }
            // Update the book information.
            String sqlString = "update `book` set `category` = ?, `title` = ?, `press` = ?, `publish_year` = ?, `author` = ?, `price` = ? where `book_id` = ?";
            PreparedStatement stmt = conn.prepareStatement(sqlString);
            stmt.setString(1, book.getCategory());
            stmt.setString(2, book.getTitle());
            stmt.setString(3, book.getPress());
            stmt.setInt(4, book.getPublishYear());
            stmt.setString(5, book.getAuthor());
            stmt.setDouble(6, book.getPrice());
            stmt.setInt(7, book.getBookId());
            stmt.executeUpdate();
            commit(conn);
            stmt.close();
            return new ApiResult(true, "Successfully modify book information with book_id = " + book.getBookId() + "\n");
        } catch (Exception e) {
            rollback(conn);
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult queryBook(BookQueryConditions conditions) {
        Connection conn = connector.getConn();
        try {
            String sqlString = "select * from `book`";
            String queryString = "";
            boolean isQueryCondition = false;
            // Get query conditions.
            if (conditions.getCategory() != null) {
                isQueryCondition = true;
                queryString = "`category` = '" + conditions.getCategory() + "'";
            }
            if (conditions.getTitle() != null) {
                if (isQueryCondition)
                    queryString += " and ";
                else 
                    isQueryCondition = true;
                queryString += "`title` like '%" + conditions.getTitle() + "%'";
            }
            if (conditions.getPress() != null) {
                if (isQueryCondition)
                    queryString += " and ";
                else 
                    isQueryCondition = true;
                queryString += "`press` like '%" + conditions.getPress() + "%'";
            }
            if (conditions.getMinPublishYear() != null) {
                if (isQueryCondition)
                    queryString += " and ";
                else 
                    isQueryCondition = true;
                queryString += "`publish_year` >= " + Integer.toString(conditions.getMinPublishYear());
            }
            if (conditions.getMaxPublishYear() != null) {
                if (isQueryCondition)
                    queryString += " and ";
                else 
                    isQueryCondition = true;
                queryString += "`publish_year` <= " + Integer.toString(conditions.getMaxPublishYear());
            }
            if (conditions.getAuthor() != null) {
                if (isQueryCondition)
                    queryString += " and ";
                else 
                    isQueryCondition = true;
                queryString += "`author` like '%" + conditions.getAuthor() + "%'";
            }
            if (conditions.getMinPrice() != null) {
                if (isQueryCondition)
                    queryString += " and ";
                else 
                    isQueryCondition = true;
                queryString += "`price` >= " + Double.toString(conditions.getMinPrice());
            }
            if (conditions.getMaxPrice() != null) {
                if (isQueryCondition)
                    queryString += " and ";
                else 
                    isQueryCondition = true;
                queryString += "`price` <= " + Double.toString(conditions.getMaxPrice());
            }
            if (isQueryCondition)
                sqlString += " where " + queryString;
            Statement stmt = conn.createStatement();
            // Make query.
            ResultSet rs = stmt.executeQuery(sqlString);
            // Record results.
            List<Book> books = new ArrayList<>();
            while (rs.next()) {
                Book thisBook = new Book(
                    rs.getString("category"),
                    rs.getString("title"),
                    rs.getString("press"),
                    rs.getInt("publish_year"),
                    rs.getString("author"),
                    rs.getDouble("price"),
                    rs.getInt("stock"));
                thisBook.setBookId(rs.getInt("book_id"));
                books.add(thisBook);
            }
            String msg = "";
            if (!books.isEmpty()) {
                // Sort.
                if (conditions.getSortOrder() == SortOrder.DESC)
                    books.sort(conditions.getSortBy().getComparator().reversed().thenComparing(Book.SortColumn.BOOK_ID.getComparator()));
                else
                    books.sort(conditions.getSortBy().getComparator().thenComparing(Book.SortColumn.BOOK_ID.getComparator()));
                for (Book book : books)
                    msg += book.toString() + "\n";
            } else {
                msg = "No books founded for the given conditions.\n";
            }
            BookQueryResults results = new BookQueryResults(books);
            return new ApiResult(true, msg, results);
        } catch (Exception e) {
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult borrowBook(Borrow borrow) {
        Connection conn = connector.getConn();
        try {
            // Check if the book is in the database.
            {
                PreparedStatement stmt = conn.prepareStatement("select `stock` from `book` where `book_id` = ?");
                stmt.setInt(1, borrow.getBookId());
                ResultSet rs = stmt.executeQuery();
                if (!rs.next())
                    return new ApiResult(false, "Book with book_id = " + borrow.getBookId() + " not found in the database.\n");
                if (rs.getInt("stock") <= 0)
                    return new ApiResult(false, "Book with book_id = " + borrow.getBookId() + " is not available.\n");
                rs.close();
                stmt.close();
            }
            // Check if the card is in the database.
            {
                PreparedStatement stmt = conn.prepareStatement("select * from `card` where `card_id` = ?");
                stmt.setInt(1, borrow.getCardId());
                ResultSet rs = stmt.executeQuery();
                if (!rs.next())
                    return new ApiResult(false, "Card with card_id = " + borrow.getCardId() + " not found in the database.\n");
                rs.close();
                stmt.close();
            }
            // Check if the book is borrowed.
            {
                PreparedStatement stmt = conn.prepareStatement("select * from `borrow` where `book_id` = ? and `card_id` = ? and `return_time` = 0");
                stmt.setInt(1, borrow.getBookId());
                stmt.setInt(2, borrow.getCardId());
                ResultSet rs = stmt.executeQuery();
                if (rs.next())
                    return new ApiResult(false, "The book with book_id = " + borrow.getBookId() + " is borrowed and not returned yet.\n");
                rs.close();
                stmt.close();
            }
            // Insert the borrow record.
            Statement stmt = conn.createStatement();
            String sqlString = "insert into `borrow` (`card_id`, `book_id`, `borrow_time`) values (" +
                Integer.toString(borrow.getCardId()) + ", " +
                Integer.toString(borrow.getBookId()) + ", " +
                Long.toString(borrow.getBorrowTime()) + ")";
            stmt.addBatch(sqlString);
            // Update the book stock.
            sqlString = "update `book` set `stock` = `stock` - 1 where `book_id` = " + borrow.getBookId();
            stmt.addBatch(sqlString);
            stmt.executeBatch();
            //commit(conn);
            return new ApiResult(true, "Successfully borrow book with book_id = " + borrow.getBookId() + " by card_id = " + borrow.getCardId() + " at date: " + borrow.getBorrowTime() + ".\n");
        } catch (Exception e) {
            rollback(conn);
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult returnBook(Borrow borrow) {
        Connection conn = connector.getConn();
        try {
            // Check if the book is in the database.
            {
                String sqlString = "select * from `book` where `book_id` = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setInt(1, borrow.getBookId());
                ResultSet rs = stmt.executeQuery();
                if (!rs.next())
                    return new ApiResult(false, "Book not found in the database.\n");
                rs.close();
                stmt.close();
            }
            // Check if the card is in the database.
            {
                String sqlString = "select * from `card` where `card_id` = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setInt(1, borrow.getCardId());
                ResultSet rs = stmt.executeQuery();
                if (!rs.next())
                    return new ApiResult(false, "Card not found in the database.\n");
                rs.close();
                stmt.close();
            }
            // Check if the book is borrowed by the card.
            {
                String sqlString = "select `return_time` from `borrow` where `card_id` = ? and `book_id` = ? and `borrow_time` = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setInt(1, borrow.getCardId());
                stmt.setInt(2, borrow.getBookId());
                stmt.setLong(3, borrow.getBorrowTime());
                ResultSet rs = stmt.executeQuery();
                if (!rs.next()) {
                    // The book is not borrowed by the card.
                    return new ApiResult(false, "The book is not borrowed by the card.\n");
                }
                // The book is already returned.
                if (rs.getLong("return_time") != 0) {
                    return new ApiResult(false, "The book is already returned.\n");
                }
                rs.close();
                stmt.close();
            }
            // Update the book stock.
            Statement stmt = conn.createStatement();
            String sqlString = "update `book` set `stock` = `stock` + 1 where `book_id` = " + borrow.getBookId();
            stmt.addBatch(sqlString);
            // Update the borrow record.
            sqlString = "update `borrow` set `return_time` = " + Long.toString(borrow.getReturnTime()) + 
                " where `card_id` = " + Integer.toString(borrow.getCardId()) +
                " and `book_id` = " + Integer.toString(borrow.getBookId()) + 
                " and `borrow_time` = " + Long.toString(borrow.getBorrowTime());
            stmt.addBatch(sqlString);
            stmt.executeBatch();
            commit(conn);
            stmt.close();
            return new ApiResult(true, "Successfully return book with book_id = " + borrow.getBookId() + " by card_id = " + borrow.getCardId() + "at date: " + borrow.getReturnTime() + ".\n");
        } catch (Exception e) {
            rollback(conn);
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult showBorrowHistory(int cardId) {
        Connection conn = connector.getConn();
        try {
            // Check if the card is in the database.
            {
                String sqlString = "select * from `card` where `card_id` = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setInt(1, cardId);
                ResultSet rs = stmt.executeQuery();
                if (!rs.next())
                    return new ApiResult(false, "Card not found in the database.\n");
                rs.close();
                stmt.close();
            }
            // Get the borrow history.
            String sqlString = "select `borrow`.`book_id`, " +
                    "`book`.`category`, `book`.`title`, `book`.`press`, `book`.`publish_year`, `book`.`author`, `book`.`price`, `book`.`stock`, " +
                    "`borrow`.`borrow_time`, `borrow`.`return_time` " +
                    "from `borrow` join `book` on `book`.`book_id` = `borrow`.`book_id` and `borrow`.`card_id` = ?";
            PreparedStatement stmt = conn.prepareStatement(sqlString);
            stmt.setInt(1, cardId);
            ResultSet rs = stmt.executeQuery();
            List<BorrowHistories.Item> items = new ArrayList<>();
            while (rs.next()) {
                Book thisBook = new Book(
                    rs.getString("category"),
                    rs.getString("title"),
                    rs.getString("press"),
                    rs.getInt("publish_year"),
                    rs.getString("author"),
                    rs.getDouble("price"),
                    rs.getInt("stock"));
                thisBook.setBookId(rs.getInt("book_id"));
                Borrow thisBorrow = new Borrow(cardId, rs.getInt("book_id"));
                thisBorrow.setBorrowTime(rs.getLong("borrow_time"));
                thisBorrow.setReturnTime(rs.getLong("return_time"));
                BorrowHistories.Item thisItem = new BorrowHistories.Item(cardId, thisBook, thisBorrow);
                items.add(thisItem);
            }
            rs.close();
            stmt.close();
            // Record results.
            String msg = "";
            if (!items.isEmpty()) {
                // Sort.
                items.sort(Comparator.comparingLong(BorrowHistories.Item::getBorrowTime).reversed().thenComparingInt(BorrowHistories.Item::getBookId));
                for (BorrowHistories.Item item : items)
                    msg += item.toString() + "\n";
            } else {
                msg = "No borrow history found for the card with card_id = " + cardId + ".\n";
            }
            BorrowHistories histories = new BorrowHistories(items);
            return new ApiResult(true, msg, histories);
        } catch (Exception e) {
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult registerCard(Card card) {
        Connection conn = connector.getConn();
        try {
            // Check if the card is already in the database.
            {
                String sqlString = "select * from `card` where `name` = ? and `department` = ? and `type` = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setString(1, card.getName());
                stmt.setString(2, card.getDepartment());
                stmt.setString(3, card.getType().getStr());
                ResultSet rs = stmt.executeQuery();
                if (rs.next())
                    return new ApiResult(false, "Card already exists.");
                rs.close();
                stmt.close();
            }
            // Insert the card into the database.
            String sqlString = "insert into `card` (`name`, `department`, `type`) values (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sqlString);
            stmt.setString(1, card.getName());
            stmt.setString(2, card.getDepartment());
            stmt.setString(3, card.getType().getStr());
            stmt.executeUpdate();
            sqlString = "select `card_id` from `card` where `name` = ? and `department` = ? and `type` = ?";
            stmt = conn.prepareStatement(sqlString);
            stmt.setString(1, card.getName());
            stmt.setString(2, card.getDepartment());
            stmt.setString(3, card.getType().getStr());
            ResultSet rs = stmt.executeQuery();
            rs.next();
            card.setCardId(rs.getInt("card_id"));
            commit(conn);
            rs.close();
            stmt.close();
            return new ApiResult(true, "Successfully register card with card_id: " + card.getCardId() + ".\n", card);
        } catch (Exception e) {
            rollback(conn);
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult removeCard(int cardId) {
        Connection conn = connector.getConn();
        try {
            // Check if the card is in the database.
            {
                String sqlString = "select * from `card` where `card_id` = ?";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setInt(1, cardId);
                ResultSet rs = stmt.executeQuery();
                if (!rs.next())
                    return new ApiResult(false, "Card not exists.");
                rs.close();
                stmt.close();
            }
            // Check if the card is borrowed by any book.
            {
                String sqlString = "select * from `borrow` where `card_id` = ? and `return_time` = 0";
                PreparedStatement stmt = conn.prepareStatement(sqlString);
                stmt.setInt(1, cardId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next())
                    return new ApiResult(false, "The card is borrowed by a book, cannot remove it.\n");
                rs.close();
                stmt.close();
            }
            // Delete the card from the database.
            String sqlString = "delete from `card` where `card_id` = ?";
            PreparedStatement stmt = conn.prepareStatement(sqlString);
            stmt.setInt(1, cardId);
            stmt.executeUpdate();
            commit(conn);
            stmt.close();
            return new ApiResult(true, "Successfully remove card with card_id: " + Integer.toString(cardId) + ".\n");
        } catch (Exception e) {
            rollback(conn);
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult showCards() {
        Connection conn = connector.getConn();
        try {
            String sqlString = "select * from `card`";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sqlString);
            String msg = "";
            List<Card> cards = new ArrayList<>();
            while (rs.next()) {
                Card card = new Card(
                    rs.getInt("card_id"),
                    rs.getString("name"),
                    rs.getString("department"),
                    Card.CardType.values(rs.getString("type")));
                msg += card.toString() + "\n";
                cards.add(card);
            }
            if (cards.isEmpty()) {
                msg = "No cards in this library.\n";
            } else {
                // Sort.
                cards.sort(Comparator.comparing(Card::getCardId));
            }
            CardList cardList = new CardList(cards);
            rs.close();
            stmt.close();
            return new ApiResult(true, msg, cardList); 
        } catch (Exception e) {
            return new ApiResult(false, e.getMessage());
        }
    }

    @Override
    public ApiResult resetDatabase() {
        Connection conn = connector.getConn();
        try {
            Statement stmt = conn.createStatement();
            DBInitializer initializer = connector.getConf().getType().getDbInitializer();
            stmt.addBatch(initializer.sqlDropBorrow());
            stmt.addBatch(initializer.sqlDropBook());
            stmt.addBatch(initializer.sqlDropCard());
            stmt.addBatch(initializer.sqlCreateCard());
            stmt.addBatch(initializer.sqlCreateBook());
            stmt.addBatch(initializer.sqlCreateBorrow());
            stmt.executeBatch();
            commit(conn);
            stmt.close();
        } catch (Exception e) {
            rollback(conn);
            return new ApiResult(false, e.getMessage());
        }
        return new ApiResult(true, null);
    }

    private void rollback(Connection conn) {
        try {
            conn.rollback();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void commit(Connection conn) {
        try {
            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}