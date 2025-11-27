<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"
    import="com.productos.seguridad.Usuario" 
    import="com.productos.seguridad.Pagina"%>

<%
    String nlogin = request.getParameter("usuario");
    String nclave = request.getParameter("clave");

    Usuario usuario = new Usuario();
    HttpSession sesion = request.getSession();

    boolean respuesta = usuario.verificarUsuario(nlogin, nclave);

    if (respuesta) {
        sesion.setAttribute("usuario", usuario.getNombre());
        sesion.setAttribute("perfil", usuario.getPerfil());
        sesion.setAttribute("horaAcceso", new java.util.Date().toString());
        response.sendRedirect("menu.jsp");
    } else {
%>
        <jsp:forward page="login.jsp">
            <jsp:param name="error" value="Datos incorrectos. Intente nuevamente."/>
        </jsp:forward>
<%
    }
%>
