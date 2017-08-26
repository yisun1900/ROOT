<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import="java.util.*" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="sthh" scope="page" class="mybean.sqlbean.SaveToHy_Hyxxb"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>提交审核意见</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">

<%
  String thjlh =request.getParameter("thjlh");    //本单位编号
  String cpbm =request.getParameter("cpbm");  //本用户登录名

Connection conn=null;
PreparedStatement ps=null;
String sql=new String();

try{
    conn=cf.getConnection();
	conn.setAutoCommit(false);

   //更新退货记录表：审核标志为0（审核不通过），审核人为yhdlm，审核日期为shrq
	sql="update dm_thjl set shbz='3'";
	sql+="  where  cpbm='"+cpbm+"' and thjlh='"+thjlh+"' and shbz='1'";
	ps=conn.prepareStatement(sql);
	ps.executeUpdate();
	ps.close();
	
	sql="update cp_cpxx set wlzt='00'";
	sql+="  where  cpbm='"+cpbm+"' and wlzt='13' ";
	ps=conn.prepareStatement(sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();
	out.println("存盘成功！");
}
catch (Exception e){
	conn.rollback();
	out.print("数据库操作失败：" + e);
}
finally{
	conn.setAutoCommit(true);  
   try{
     if (ps!=null) ps.close();
     if (conn != null) cf.close(conn);
   }catch (Exception e){
      out.println("数据库操作失败："+e.getMessage());
   }
}
%>
</body>
</html>
