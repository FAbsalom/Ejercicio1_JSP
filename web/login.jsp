<%-- 
    Document   : Login
    Created on : Jan 8, 2015, 1:39:27 PM
    Author     : absalom
--%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="DTO.Alumno" %>
<%@page import="DAO.AlumnoDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
        String user=request.getParameter("txtUsuario");
        String pass=request.getParameter("txtClave");
        Alumno dto=null;
        AlumnoDAO dao=new AlumnoDAO();
        try{
        dto=dao.login(user, pass);
        } catch (SQLException ex) {
            //Logger.getLogger(CarreraDAO.class.getName()).log(Level.SEVERE, null, ex);
             System.out.println(ex);
        } catch (ClassNotFoundException ex) {
            //Logger.getLogger(CarreraDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
        if(dto!=null){
            session=request.getSession();
            session.setAttribute("alumno", dto);
            response.sendRedirect("principal.jsp");
        }else{
            response.sendRedirect("index.jsp?err="+"Usuario y clave no encontrados intente de nuevo");
        }
        %>
    </body>
</html>