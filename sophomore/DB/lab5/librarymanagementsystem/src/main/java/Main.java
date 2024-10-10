import entities.*;
//import queries.BookQueryConditions;
import utils.ConnectConfig;
import utils.DatabaseConnector;

import java.util.logging.Logger;

public class Main {

    private static final Logger log = Logger.getLogger(Main.class.getName());

    public static void main(String[] args) {
        try {
            // parse connection config from "resources/application.yaml"
            ConnectConfig conf = new ConnectConfig();
            log.info("Success to parse connect config. " + conf.toString());
            // connect to database
            DatabaseConnector connector = new DatabaseConnector(conf);
            boolean connStatus = connector.connect();
            if (!connStatus) {
                log.severe("Failed to connect database.");
                System.exit(1);
            }
            /* do somethings */
            LibraryManagementSystem lm = new LibraryManagementSystemImpl(connector);

            /* 1: Initialize database */
            System.out.println(lm.resetDatabase().ok ? "Success to reset database." : lm.resetDatabase().message);

            System.out.println(lm.storeBook(new Book("Lecture", "World and Peace", "Peking University", 2021, "LeeExpert", 29.9, 5)).message);
            System.out.println(lm.storeBook(new Book("Programming", "Java 101", "ZhejiangUniversity", 2024, "David Lee", 50.23, 30)).message);
            System.out.println(lm.storeBook(new Book("Programming", "Python3.10", "ZhejiangUniversity", 2024, "LeeExpert", 9.9, 20)).message);
            System.out.println(lm.storeBook(new Book("Programming", "Python3.11", "Peking University", 2022, "NeaLee", 19.9, 10)).message);
            /*
            BookQueryConditions queryConditions = new BookQueryConditions();
            queryConditions.setCategory("Programming");
            System.out.println(lm.queryBook(queryConditions).message);
            queryConditions.setTitle("Python");
            System.out.println(lm.queryBook(queryConditions).message);
            queryConditions.setPress("jiang");
            System.out.println(lm.queryBook(queryConditions).message);
            queryConditions.setMinPublishYear(2022);
            System.out.println(lm.queryBook(queryConditions).message);
            queryConditions.setMaxPublishYear(2023);
            System.out.println(lm.queryBook(queryConditions).message);
            queryConditions.setAuthor("Lee");
            System.out.println(lm.queryBook(queryConditions).message);
            queryConditions.setMinPrice(0.0);
            System.out.println(lm.queryBook(queryConditions).message);
            queryConditions.setMaxPrice(10.0);
            System.out.println(lm.queryBook(queryConditions).message);
            */

            System.out.println(lm.registerCard(new Card(0, "John Doe", "Computer Science", Card.CardType.Student)).message);
            System.out.println(lm.registerCard(new Card(0, "Kevin Lee", "Computer Science", Card.CardType.Student)).message);
            System.out.println(lm.showCards().message);
            Borrow borrow = new Borrow(1, 1);
            borrow.resetBorrowTime();
            borrow.resetReturnTime();
            System.out.println(lm.borrowBook(borrow).message);
            System.out.println(lm.returnBook(borrow).message);

            System.out.println(lm.removeBook(1).message);
            System.out.println(lm.removeBook(2).message);
            System.out.println(lm.removeCard(1).message);
            System.out.println(lm.removeCard(2).message);
            
            // release database connection handler
            if (connector.release()) {
                log.info("Success to release connection.");
            } else {
                log.warning("Failed to release connection.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}