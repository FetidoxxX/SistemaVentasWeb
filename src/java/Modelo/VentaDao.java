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

/**
 *
 * @author USER
 */
public class VentaDao {
     Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    public String GenerarSerie() {
        String numeroserie = "";
        String sql = "select max(NumeroSerie) from ventas";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                numeroserie = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("Error en GenerarSerie: "+e.getMessage());
        }
        return numeroserie;
    }
    public String IdVentas() {
        String idventas = "";
        String sql = "select max(IdVentas) from ventas";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idventas = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("Error en IdVentas: "+e.getMessage());
        }
        return idventas;
    }
    public int guardarVenta(Venta ve) {
        String sql = "insert into ventas(IdCliente, IdEmpleado, NumeroSerie,FechaVentas,Monto, Estado)values(?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, ve.getIdcliente());
            ps.setInt(2, ve.getIdempelado());
            ps.setString(3, ve.getNumserie());
            ps.setString(4, ve.getFecha());
            ps.setDouble(5, ve.getMonto());
            ps.setString(6, ve.getEstado());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en guardarVenta: "+e.getMessage());
        }
        return r;
    }
    public int guardarDetalleventas(Venta venta) {
        String sql = "insert into detalle_ventas(IdVentas, IdProducto,Cantidad, PrecioVenta)values(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, venta.getId());
            ps.setInt(2, venta.getIdproducto());
            ps.setInt(3, venta.getCantidad());
            ps.setDouble(4, venta.getPrecio());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en guardarDetalleventas: "+e.getMessage());
        }
        return r;
    }
}
