<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] sqxh=request.getParameterValues("sqxh");
String scztbm=request.getParameter("ztbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<sqxh.length ;i++ )
	{
		String spxh=null;
		String clzt=null;
		String ztbm=null;
		String shr=null;
		ls_sql="select spxh,clzt,ztbm,shr";
		ls_sql+=" from  rs_qjsqd";
		ls_sql+=" where sqxh='"+sqxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			spxh=cf.fillNull(rs.getString("spxh"));
			clzt=cf.fillNull(rs.getString("clzt"));
			ztbm=cf.fillNull(rs.getString("ztbm"));
			shr=cf.fillNull(rs.getString("shr"));
		}
		rs.close();
		ps.close();

		if (spxh.equals(""))
		{
			continue;
		}

		String shclzt=null;
		String shztbm=null;
		String shshr=null;

		String yspxh=null;
		String yclzt=null;
		String yztbm=null;
		String yshjl=null;
		String yshyj=null;
		String yshr=null;
		java.sql.Date yshsj=null;

		ls_sql="select clzt,ztbm,shr, yspxh,yclzt,yztbm,yshjl,yshyj,yshr,yshsj";
		ls_sql+=" from  rs_qjsqspb";
		ls_sql+=" where spxh="+spxh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			shclzt=cf.fillNull(rs.getString("clzt"));
			shztbm=cf.fillNull(rs.getString("ztbm"));
			shshr=cf.fillNull(rs.getString("shr"));

			yspxh=cf.fillNull(rs.getString("yspxh"));
			yclzt=cf.fillNull(rs.getString("yclzt"));
			yztbm=cf.fillNull(rs.getString("yztbm"));
			yshjl=cf.fillNull(rs.getString("yshjl"));
			yshyj=cf.fillNull(rs.getString("yshyj"));
			yshr=cf.fillNull(rs.getString("yshr"));
			yshsj=rs.getDate("yshsj");
		}
		rs.close();
		ps.close();

		if (!shshr.equals(shr))
		{
			conn.rollback();
			out.println("删除错误！『审核人』已改变");
			return;
		}

		if (!shclzt.equals(clzt))
		{
			conn.rollback();
			out.println("删除错误！『处理状态』已改变");
			return;
		}

		if (!shztbm.equals(ztbm))
		{
			conn.rollback();
			out.println("删除错误！『审批状态』已改变");
			return;
		}

		if (!scztbm.equals(yztbm))
		{
			conn.rollback();
			out.println("删除错误！『审批状态』不正确");
			return;
		}

		ls_sql="delete from rs_qjsqspb ";
		ls_sql+=" where spxh="+spxh;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="update rs_qjsqd set spxh=?,shr=?,shsj=?,shjl=?,shyj=?,clzt=?,ztbm=? ";
		ls_sql+=" where sqxh='"+sqxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yspxh);
		ps.setString(2,yshr);
		ps.setDate(3,yshsj);
		ps.setString(4,yshjl);
		ps.setString(5,yshyj);
		ps.setString(6,yclzt);
		ps.setString(7,yztbm);
		ps.executeUpdate();
		ps.close();
	}


	
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>