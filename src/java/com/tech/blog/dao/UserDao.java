/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

/**
 *
 * @author Rishabh Srivastava
 */
public class UserDao {

    private Connection con;

//    Create constructor for con
    public UserDao(Connection con) {
        this.con = con;
    }

//    Create method to store User to Database
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            //Insert Query
            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";

            // Prepared Statement
            PreparedStatement pstmt = this.con.prepareStatement(query);

            // Set the Value of parameter
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

//    Get User by Email and Password
    public User getUserByEmailAndPassword(String email, String password) {

        User user = null;

        try {

            String query = "select * from user where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();
//                Fetching Data from Database
                String names = set.getString("name");
//                Setting Database Value to User Object
                user.setName(names);
                int ids = set.getInt("id");
                user.setId(ids);
                String emails = set.getString("email");
                user.setEmail(emails);
                String passwords = set.getString("password");
                user.setPassword(passwords);
                String genders = set.getString("gender");
                user.setGender(genders);
                String abouts = set.getString("about");
                user.setAbout(abouts);
                Timestamp datetimes = set.getTimestamp("rdate");
                user.setDataTime(datetimes);
                String profiles = set.getString("profile");
                user.setProfile(profiles);

            } else {
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

//    Update User Details in Edit Details
    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user set name=? , email=? , password=? , gender=? , about=? , profile=? where id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7, user.getId());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserId(int userId) {

        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, userId);
            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();
//                Fetching Data from Database
                String names = set.getString("name");
//                Setting Database Value to User Object
                user.setName(names);
                int ids = set.getInt("id");
                user.setId(ids);
                String emails = set.getString("email");
                user.setEmail(emails);
                String passwords = set.getString("password");
                user.setPassword(passwords);
                String genders = set.getString("gender");
                user.setGender(genders);
                String abouts = set.getString("about");
                user.setAbout(abouts);
                Timestamp datetimes = set.getTimestamp("rdate");
                user.setDataTime(datetimes);
                String profiles = set.getString("profile");
                user.setProfile(profiles);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
