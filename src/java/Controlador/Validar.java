/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

/**
 *
 * @author USER
 */
import Modelo.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Validar extends HttpServlet {

    EmpleadoDAO edao = new EmpleadoDAO();
    Empleado em = new Empleado();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion=request.getParameter("accion");
        if(accion.equalsIgnoreCase("Ingresar")){
            String user=request.getParameter("txtuser");
            String clave= Seguridad.miHash(request.getParameter("txtclave"));
                    
            em=edao.validar(user, clave);
            if(em.getUser()!=null){
                //request.setAttribute("usuario", em);
                HttpSession misesion=request.getSession();
                misesion.setAttribute("usuario", em);
                request.getRequestDispatcher("Controlador?menu=Principal").forward(request, response);
            }else{
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
                    System.out.println("Clave ingresada (hash): " + clave);
System.out.println("Clave almacenada en BD: " + em.getClave());
        }
        else{
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }


    }

       public void Salir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
           HttpSession misesion=request.getSession();
           misesion.invalidate();
           request.getRequestDispatcher("index.jsp").forward(request, response);
       }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
