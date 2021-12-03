/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(
                        new Product(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6)
                        ) // end product
                );// end add product
            } // end while
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(
                        new Category(
                                rs.getInt(1),
                                rs.getString(2)
                        )
                );
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getLast() {  // lấy sản phẩm mới nhất add vô LastProduct 
        // là sản phẩm cuối cùng trong db
        String query = "select top 1 * from product\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select *\n"
                + "from product\n"
                + "where cateID =?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(
                        new Product(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6),
                                rs.getInt(7)
                             
                                
                        ) // end product
                );// end add product
            } // end while
        } catch (Exception e) {
        }
        return list;
    }

    // lay san pham cua product
    public Product getProductByID(String id) {

        String query = "select *\n"
                + "from product\n"
                + "where id =?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {

                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                        
                );// end product

            } // end while
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> searchProductByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select *\n"
                + "from product\n"
                + "where name like ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(
                        new Product(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6)
                        ) // end product
                );// end add product
            } // end while
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        String s = "1";
        List<Product> list = (List<Product>) dao.getProductByID(s);
        List<Category> listC = dao.getAllCategory();

        for (Category o : listC) {
            System.out.println(o);
        }

        System.out.println("\n");
        for (Product p : list) {
            System.out.println(p);
        }
        System.out.println("\n");
        Product p = new Product();
        p = dao.getLast();
        System.out.println(p.toString());

    }

    public Account checkLogin(String user, String password) {

        String sql = "select *\n"
                + "from Account\n"
                + "where [user] = ? \n"
                + "and pass =?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {

                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)
                );
            } // end while
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkLoginExist(String user) {

        String sql = "select *\n"
                + "from Account\n"
                + "where [user] = ? \n";

        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);

            rs = ps.executeQuery();
            while (rs.next()) {

                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)
                );
            } // end while
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String user, String pass) {
        String sql = "insert into Account\n"
                + "values (? , ?, 0 , 0)";

        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public List<Product> getProductBySellID(int sid) {
        List<Product> list = new ArrayList<>();
        String query = "select *\n"
                + "from product\n"
                + "where sell_ID =?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, sid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(
                        new Product(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6),
                                rs.getInt(7)
                        ) // end product
                );// end add product
            } // end while
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteProduct(String pid) {
        String sql = "delete from product\n"
                + "where id =?";

        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, pid);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void inserProduct(String name, String image, String price,
             String title, String description, String category, int sID) {
        String sql = "INSERT [dbo].[product] "
                + "([name], [image], [price], [title], [description], [cateID], [sell_ID]) "
                + "VALUES (?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setInt(7, sID);

            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

    public void editProduct(String name, String image, String price,
             String title, String description, String category, String pid) {
        String sql = "update product\n"
                + "set [name]=?,\n"
                + "[image]=?,\n"
                + "price=?,\n"
                + "title=?,\n"
                + "[description]=?,\n"
                + "cateID=?\n"
                + "where id=?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, pid);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    
    
    
    public Product getProductByidA(String txt) {

        String query = "select *\n"
                + "from product\n"
                + "where id =?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, txt);
            rs = ps.executeQuery();
            while (rs.next()) {

                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        1
                        
                );// end product

            } // end while
        } catch (Exception e) {
        }
        return null;
    }
}
