/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author USER
 */
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Empleado validar(String user, String clave) {
        Empleado em = new Empleado();
        String sql = "select * from empleado WHERE User=? AND Clave=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, clave);
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setId(rs.getInt("IdEmpleado"));
                em.setUser(rs.getString("User"));
                em.setClave(rs.getString("Clave"));
                em.setNom(rs.getString("Nombres"));
            }
        } catch (SQLException e) {
            System.out.println("error al validar empleado: " + e.getMessage());
        }
        return em;
    }

    //Operaciones CRUD
    public List listar() {
        String sql = "SELECT * FROM empleado";
        List lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado em = new Empleado();
                em.setId(rs.getInt(1));
                em.setDni(rs.getString(2));
                em.setNom(rs.getString(3));
                em.setTel(rs.getString(4));
                em.setEstado(rs.getString(5));
                em.setUser(rs.getString(6));
                em.setCorreo(rs.getString(7));
                em.setClave(rs.getString(8));
                lista.add(em);
            }
        } catch (SQLException e) {
            System.out.println("error al listar empleado: " + e.getMessage());
        }
        return lista;
    }

    public int agregar(Empleado em) {
        String sql = "INSERT INTO empleado(Dni, Nombres, Telefono, Estado, User, Correo, Clave) VALUES(?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getDni());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getTel());
            ps.setString(4, em.getEstado());
            ps.setString(5, em.getUser());
            ps.setString(6, em.getCorreo());
            ps.setString(7, Seguridad.miHash(em.getClave()));  // hashear la contraseña
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al agregar empleado: " + e.getMessage());
        }
        return r;
    }

    public Empleado listarId(int id) {
        Empleado emp = new Empleado();
        String sql = "select * from empleado where IdEmpleado=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setDni(rs.getString(2));
                emp.setNom(rs.getString(3));
                emp.setTel(rs.getString(4));
                emp.setEstado(rs.getString(5));
                emp.setUser(rs.getString(6));
                emp.setCorreo(rs.getString(7));
                //emp.setClave(rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println("error al listarid empleado: " + e.getMessage());
        }
        return emp;
    }

    public int actualizar(Empleado em) {
        String sql = "UPDATE empleado SET Dni=?, Nombres=?, Telefono=?, Estado=?, User=?, Correo=?  WHERE IdEmpleado=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getDni());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getTel());
            ps.setString(4, em.getEstado());
            ps.setString(5, em.getUser());
            ps.setString(6, em.getCorreo());
            //ps.setString(7, em.getClave()); // Encriptar contraseña
            ps.setInt(7, em.getId());
            r = ps.executeUpdate(); 
        } catch (SQLException e) {
            System.out.println("error al actualizar empleado: " + e.getMessage());
        }
        return r;
    }

    public void delete(int id) {
        String sql = "delete from empleado where IdEmpleado=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error al borrar empleado: " + e.getMessage());
        }
    }

}
