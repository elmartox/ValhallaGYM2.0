<%@page import="com.productos.negocio.DAO_Auditoria"%>
<%@page import="java.util.List"%>
<%@page import="com.productos.negocio.Auditoria"%>

<%
    DAO_Auditoria dao = new DAO_Auditoria();
    List<Auditoria> lista = dao.listar();

    request.setAttribute("listaAuditoria", lista);
    request.getRequestDispatcher("bitacora.jsp").forward(request, response);
%>
