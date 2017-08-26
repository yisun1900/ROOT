<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] shbh = request.getParameterValues("shbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	for(int i=0;i<shbh.length;i++){
		int count=0;

		long yshbh=0;
		String pxjhbh=null;
		String yztbm=null;
		String yjhzt=null;
		String yshjl=null;
		String yshyj=null;
		String yshr=null;
		java.sql.Date yshsj=null;
//取出要还原的数据
		ls_sql="select pxjhbh,yshbh,yztbm,yjhzt,yshjl,yshyj,yshr,yshsj";
		ls_sql+=" from  rs_pxsh";
		ls_sql+=" where  shbh='"+shbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			pxjhbh=rs.getString("pxjhbh");
			yshbh=rs.getLong("yshbh");
			yztbm=rs.getString("yztbm");
			yjhzt=rs.getString("yjhzt");
			yshjl=rs.getString("yshjl");
			yshyj=rs.getString("yshyj");
			yshr=rs.getString("yshr");
			yshsj=rs.getDate("yshsj");
		}
		else{
			out.println("错误！这条记录不存在");
			return;
		}
		rs.close();
		ps.close();

//还原培训计划
		conn.setAutoCommit(false);

		ls_sql="update rs_pxjh set ztbm=?,shjl=?,jhzt=?,shyj=?,shr=?,shsj=?,shbh=? ";
		ls_sql+=" where pxjhbh='"+pxjhbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yztbm);
		ps.setString(2,yshjl);
		ps.setString(3,yjhzt);
		ps.setString(4,yshyj);
		ps.setString(5,yshr);
		ps.setDate(6,yshsj);
		ps.setLong(7,yshbh);
		ps.executeUpdate();
		ps.close();


		ls_sql="delete from rs_pxsh where shbh='"+shbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		conn.commit();
	}
	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！请刷新列表显示删除后结果。");
	window.close();
	//-->
	</SCRIPT>
	<%
	
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
