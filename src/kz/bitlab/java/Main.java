package kz.bitlab.java;

import kz.bitlab.java.database.DBConnector;
import kz.bitlab.java.models.Item;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Item> items = DBConnector.getAllItems();

        for(Item item : items) {
            System.out.println(item.getId() + " " + item.getName() + " " + item.getDescription() + " " + item.getPrice());
        }

//        System.out.println(DBConnector.login("nurzhqn@gmail.com", "Mal"));

        System.out.println(DBConnector.register("nurzh434qn@gmail.com", "parkcur228", "Nurzhan Izimbetov"));
    }
}
