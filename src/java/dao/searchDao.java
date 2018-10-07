/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.searchBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DBConnection;

/**
 *
 * @author suren
 */
public class searchDao {
    public ArrayList<searchBean> getSearch(String keyword){
        Connection con = DBConnection.createConnection();
        ArrayList<searchBean> result = new ArrayList<>();
        try {
            String sql = "select * from search where name like '" + "%" + keyword + "%" +"'";
            Statement statemenet = con.createStatement();
            ResultSet resultSet = statemenet.executeQuery(sql);
            while(resultSet.next()){
                searchBean search = new searchBean(resultSet.getString("name"), resultSet.getString("phoneNo"), resultSet.getString("email"));
                result.add(search);
            }
        } catch (SQLException ex) {
            Logger.getLogger(searchDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
