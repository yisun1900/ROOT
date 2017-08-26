<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
//String strAbsPath=application.getRealPath(request.getRequestURI());
//out.print(strAbsPath);
//String strAbsPath=new java.io.File(application.getRealPath(request.getRequestURI())).getParent();
//out.print(strAbsPath);
 String strAbsPath=new java.io.File(application.getRealPath(request.getRequestURI())).getParent();
 strAbsPath=strAbsPath.substring(0,strAbsPath.length()-7);
 out.print(strAbsPath);
strAbsPath=strAbsPath.replaceAll("\\\\","\\\\\\\\");
 out.print(strAbsPath);
%>
<%

//取得当前jsp文件路径
// String strAbsPath=new java.io.File(application.getRealPath(request.getRequestURI())).getParent();

// out.print(strAbsPath);

 %>

<%

//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"nblt/fwlt/tp/";
//String jdbasePath="/nblt/fwlt/tp/";
//out.print(basePath);

 %>

