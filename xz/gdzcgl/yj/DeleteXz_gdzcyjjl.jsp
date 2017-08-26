<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem=cf.GB2Uni(request.getParameter("chooseitem"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String gsbh=null;
String yjrxh=null;
String yjr=null;
String yjrssbm=null;
String yjrssfgs=null;
String yjsj=null;
java.sql.Date oldyjsj=null;
String jsrxh=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="select gsbh,yjrxh,yjr,yjrssbm,yjrssfgs,yjsj,oldyjsj,jsrxh";
	ls_sql+=" from  xz_gdzcyjjl";
	ls_sql+=" where "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		gsbh=cf.fillNull(rs1.getString("gsbh"));
		yjrxh=cf.fillNull(rs1.getString("yjrxh"));
		yjr=cf.fillNull(rs1.getString("yjr"));
		yjrssbm=cf.fillNull(rs1.getString("yjrssbm"));
		yjrssfgs=cf.fillNull(rs1.getString("yjrssfgs"));
		yjsj=cf.fillNull(rs1.getDate("yjsj"));
		oldyjsj=rs1.getDate("oldyjsj");
		jsrxh=cf.fillNull(rs1.getString("jsrxh"));

		String mqjsr=null;
		String mqyjsj=null;
		ls_sql="select ygbh,yjsj";
		ls_sql+=" from  xz_gdzcb";
		ls_sql+=" where  (gsbh='"+gsbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			mqjsr=cf.fillNull(rs.getString("ygbh"));
			mqyjsj=cf.fillNull(rs.getDate("yjsj"));
		}
		rs.close();
		ps.close();

		if (!mqjsr.equals(jsrxh))
		{
			conn.rollback();
			out.println("错误！移交人已发生变化，不能再修改");
			return;
		}
		if (!mqyjsj.equals(yjsj))
		{
			conn.rollback();
			out.println("错误！移交时间已发生变化，不能再修改");
			return;
		}

		ls_sql="delete from xz_gdzcyjjl ";
		ls_sql+=" where  (gsbh='"+gsbh+"') and  (yjsj=TO_DATE('"+yjsj+"','yyyy-mm-dd'))  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="update xz_gdzcb set ygbh=?,bgr=?,dwbh=?,fgsbh=?,yjsj=?";
		ls_sql+=" where  (gsbh='"+gsbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yjrxh);
		ps.setString(2,yjr);
		ps.setString(3,yjrssbm);
		ps.setString(4,yjrssfgs);
		ps.setDate(5,oldyjsj);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();




	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>