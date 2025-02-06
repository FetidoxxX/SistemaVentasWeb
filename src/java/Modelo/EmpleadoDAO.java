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

public Empleado validar(String user, String claveIngresada) {
    Empleado em = null;
    String sql = "SELECT * FROM empleado WHERE User=?";

    try {
        con = cn.Conexion();
        ps = con.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();

        if (rs.next()) { // Usuario encontrado
            String claveBD = rs.getString("Clave");  // Clave hasheada almacenada

            // 🔹 Si la clave ingresada ya es un hash, no la vuelvas a hashear
            boolean esHash = claveIngresada.matches("^[A-Za-z0-9+/=]{44}$"); // Base64 SHA-256
            String claveHash = esHash ? claveIngresada : Seguridad.miHash(claveIngresada.trim());

            // 🛠️ Depuración
            System.out.println("🔍 Clave ingresada en texto: " + claveIngresada);
            System.out.println("🔍 Clave ingresada (hash procesado): " + claveHash);
            System.out.println("📂 Clave almacenada en BD: " + claveBD);

            if (claveBD != null && claveHash != null && claveHash.equals(claveBD)) { 
                em = new Empleado();
                em.setId(rs.getInt("IdEmpleado"));
                em.setUser(rs.getString("User"));
                em.setClave(claveBD);
                em.setNom(rs.getString("Nombres"));

                System.out.println("✅ Inicio de sesión exitoso para: " + em.getUser());
            } else {
                System.out.println("❌ Las claves no coinciden.");
            }
        } else {
            System.out.println("❌ Usuario no encontrado.");
        }
    } catch (SQLException e) {
        System.out.println("⚠️ Error al validar empleado: " + e.getMessage());
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
      }catch (SQLException e) {
          System.out.println("error al listar empleado: "+e.getMessage());
        }
      return lista;
    }

    public int agregar(Empleado em){ 
       String sql = "insert into empleado(Dni, Nombres, Telefono,Estado,User,Correo,Clave)values(?,?,?,?,?,?,?)";
      try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getDni());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getTel());
            ps.setString(4, em.getEstado());
            ps.setString(5, em.getUser());
            ps.setString(6, em.getCorreo());
            ps.setString(7, Seguridad.miHash(em.getClave()));
            ps.executeUpdate();
        } catch (SQLException e) {
        System.out.println("error al agregar empleado: "+e.getMessage());
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
                emp.setClave(rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println("error al listarid empleado: "+e.getMessage());
        }
        return emp;
    }
    
public int actualizar(Empleado em) {
    String sql = "update empleado set Dni=?, Nombres=?, Telefono=?, Estado=?, User=?, Correo=?, Clave=? where IdEmpleado=?";
    
    try {
        con = cn.Conexion();
        
        // Verificar si la clave es nula o vacía
        String nuevaClave = em.getClave();
        if (nuevaClave == null || nuevaClave.isEmpty()) {
            // Si no se envió una nueva clave, obtener la clave actual de la BD
            String sqlClave = "SELECT Clave FROM empleado WHERE IdEmpleado=?";
            PreparedStatement psClave = con.prepareStatement(sqlClave);
            psClave.setInt(1, em.getId());
            ResultSet rsClave = psClave.executeQuery();
            if (rsClave.next()) {
                nuevaClave = rsClave.getString("Clave"); // Mantener la clave anterior
            }
        } else {
            nuevaClave = Seguridad.miHash(nuevaClave); // Hashear la nueva clave solo si se envió
        }

        ps = con.prepareStatement(sql);
        ps.setString(1, em.getDni());
        ps.setString(2, em.getNom());
        ps.setString(3, em.getTel());
        ps.setString(4, em.getEstado());
        ps.setString(5, em.getUser());
        ps.setString(6, em.getCorreo());
        ps.setString(7, nuevaClave);
        ps.setInt(8, em.getId());

        ps.executeUpdate();
    } catch (SQLException e) {
        System.out.println("Error al actualizar empleado: " + e.getMessage());
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
            System.out.println("error al borrar empleado: "+e.getMessage());
        }
    }
    
}
