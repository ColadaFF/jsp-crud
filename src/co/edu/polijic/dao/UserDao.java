package co.edu.polijic.dao;

import co.edu.polijic.domain.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    public int save(User u) {
        int status = 0;
        try {
            Connection con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO register(name,password,email,sex,country) VALUES(?,?,?,?,?)");
            ps.setString(1, u.getName());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getSex());
            ps.setString(5, u.getCountry());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
        return status;
    }

    public int update(User u) {
        int status = 0;
        try {
            Connection con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE register SET name=?,password=?,email=?,sex=?,country=? WHERE id=?");
            ps.setString(1, u.getName());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getSex());
            ps.setString(5, u.getCountry());
            ps.setInt(6, u.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
        return status;
    }

    public int delete(Integer userId) {
        int status = 0;
        try {
            Connection con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM register WHERE id=?");
            ps.setInt(1, userId);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }

        return status;
    }

    public List<User> getAllRecords() {
        List<User> list = new ArrayList<>();

        try {
            Connection con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM register");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setSex(rs.getString("sex"));
                u.setCountry(rs.getString("country"));
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
        return list;
    }

    public User getRecordById(int id) {
        User u = null;
        try {
            Connection con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM register WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setSex(rs.getString("sex"));
                u.setCountry(rs.getString("country"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
        return u;
    }
}
