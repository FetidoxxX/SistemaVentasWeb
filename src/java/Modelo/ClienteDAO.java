/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USER
 */
public class ClienteDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Cliente Buscar(String dni) {
        Cliente c = new Cliente();
        String sql = "select * from cliente WHERE Dni="+dni;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setId(rs.getInt(1));
                c.setDni(rs.getString(2));
                c.setNom(rs.getString(3));
                c.setDir(rs.getString(4));
                c.setEs(rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println("error al buscar Cliente: "+e.getMessage());
        }
        return c;
    }
    
    //Operaciones CRUD
   
    public List listar() {
    String sql = "SELECT * FROM cliente";
    List<Cliente> lista = new ArrayList<>();
    try {
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          rs = ps.executeQuery();
          while (rs.next()) {
                Cliente cl = new Cliente();
                cl.setId(rs.getInt(1));
                cl.setDni(rs.getString(2));
                cl.setNom(rs.getString(3));
                cl.setDir(rs.getString(4));
                cl.setEs(rs.getString(5));
                lista.add(cl);
            }
      }catch (SQLException e) {
          System.out.println("error al listar cliente: "+e.getMessage());
        }
      return lista;
    }

    public int agregar(Cliente cl) {
        String sql = "insert into cliente(Dni, Nombres, Direccion,Estado)values(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl.getDni());
            ps.setString(2, cl.getNom());
            ps.setString(3, cl.getDir());
            ps.setString(4, cl.getEs());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error al insertar cliente: "+e.getMessage());
        }
        return r;
    }
    
     public Cliente listarId(int id) {
        Cliente cli = new Cliente();
        String sql = "select * from cliente where IdCliente=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cli.setDni(rs.getString(2));
                cli.setNom(rs.getString(3));
                cli.setDir(rs.getString(4));
                cli.setEs(rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println("error en listarid cliente: "+e.getMessage());
        }
        return cli;
    }
    
    public int actualizar(Cliente em) {
        String sql = "update cliente set Dni=?, Nombres=?, Direccion=?,Estado=? where IdCliente=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getDni());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getDir());
            ps.setString(4, em.getEs());
            ps.setInt(5, em.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error al actualizar cliente: "+e.getMessage());
        }
        return r;
    }
    
    public void delete(int id) {
        String sql = "delete from cliente where IdCliente=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error al borrar cliente: "+e.getMessage());
        }
    }
    
}
