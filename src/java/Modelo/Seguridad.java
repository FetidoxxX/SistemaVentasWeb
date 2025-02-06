/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class Seguridad {
    
    public static String miHash(String clave){
        String claveHash = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(clave.getBytes(StandardCharsets.UTF_8));
            claveHash = Base64.getEncoder().encodeToString(digest);
            
        } catch (NoSuchAlgorithmException ex) {
            System.out.println("Error en miHash: "+ ex.getMessage());
        }
        return claveHash;
    }  
}
