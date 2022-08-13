package Connect;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbManager {
    Connection con=null; //Instance Variable
    public DbManager() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        //Loaded the driver
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/invigilation_db","root","");
        //Established the connection
    }
    
    public boolean insertUpdateDelete(String query) {
        try {
            PreparedStatement ps = con.prepareStatement(query);
            int n = ps.executeUpdate() ;
            if (n > 0)
                return true;
            else 
                return false;
        } 
        catch (SQLException ex) {
            return false;
        }
    }
    
    public ResultSet selectData(String query) throws SQLException {
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        return rs;
    }
    
    public void qCommit() throws SQLException{
        con.commit();
    }
    
    public void qRollback() throws SQLException{
        con.rollback();
    }
    
}
