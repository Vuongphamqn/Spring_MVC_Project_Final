<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "jv42_project_final";
    String userId = "root";
    String password = "root";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        connection = DriverManager.getConnection(
                connectionUrl + dbName, userId, password);
        statement = connection.createStatement();
        String sql = "SELECT c.content,r.id"
                + "FROM convenient as c"
                + "INNER JOIN room_type_convenient as rc"
                + "ON c.id = rc.convenient_id"
                + "INNER JOIN room_type as r"
                + "ON rc.room_type_id = r.id"
                + "WHERE r.id = '${rt.id}'";
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<li>
    <div class="tooltip_styled tooltip-effect-4">
        <span class="tooltip-item"><i class="icon_set_2_icon-104"></i></span>
        <div class="tooltip-content"><%=resultSet.getString("content")%></div>
    </div>
</li>
<!--<tr bgcolor="#8FBC8F">
</tr>-->
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>