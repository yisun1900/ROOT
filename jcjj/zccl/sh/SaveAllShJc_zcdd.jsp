<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String ppbm=null;
	String tzshsj=null;
	String ddlx=null;

	conn.setAutoCommit(false);


	for (int i=0;i<ddbh.length ;i++ )
	{
		String ddshbz="";
		ls_sql =" select khbh,clzt,ppbm,tzshsj,ddshbz,ddlx";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			clzt=rs.getString("clzt");
			ppbm=rs.getString("ppbm");
			tzshsj=cf.fillNull(rs.getDate("tzshsj"));
			ddshbz=cf.fillNull(rs.getString("ddshbz"));
			ddlx=cf.fillNull(rs.getString("ddlx"));
		}
		rs.close();
		ps.close();


		String ckph="";

		if (ddlx.equals("4"))
		{
			conn.rollback();
			out.println("<BR>错误，存盘失败！有库存订单，不能批量送货："+ddbh[i]);
			return;
		}
		else{
			if (ddshbz.equals("1"))////等待送货通知标志  1：不需待电；2：待电未通知；3：待电已通知
			{
				if (!clzt.equals("13") && !clzt.equals("15") && !clzt.equals("17") && !clzt.equals("20"))//13：工厂已接收;15：确定送货时间;17：已通知送货; 20：部分送货
				{
					conn.rollback();
					out.println("<BR>错误，存盘失败！订单状态不正确："+ddbh[i]);
					return;
				}
			}
			else{
				if (!clzt.equals("15") && !clzt.equals("17") && !clzt.equals("20"))//15：确定送货时间;17：已通知送货; 20：部分送货
				{
					conn.rollback();
					out.println("<BR>错误，存盘失败！订单状态不正确："+ddbh[i]);
					return;
				}
			}
		}


		if (tzshsj.equals(""))
		{
			out.println("<P>提醒！未发送货通知："+ddbh[i]);
		}

		ls_sql="update jc_zcdd set sshr=?,sshsj=TRUNC(SYSDATE),shqk='批量送货',lsclzt='"+clzt+"',clzt='19'";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yhmc);
		ps.executeUpdate();
		ps.close();

		String shdbh=null;
		int count=0;
		ls_sql="select NVL(max(substr(shdbh,10,2)),0)";
		ls_sql+=" from  jc_zcshd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		shdbh=ddbh[i]+cf.addZero(count+1,2);

		ls_sql="delete from jc_zcshd ";
		ls_sql+=" where shdbh='"+shdbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

//		out.println(ls_sql);

		ls_sql="delete from jc_zcshmx ";
		ls_sql+=" where shdbh='"+shdbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into jc_zcshd (shdbh,ddbh,khbh,shr,shsj,lrr,lrsj,dwbh,bz)";
		ls_sql+=" values(?,?,?,?,TRUNC(SYSDATE),?,SYSDATE,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,shdbh);
		ps.setString(2,ddbh[i]);
		ps.setString(3,khbh);
		ps.setString(4,yhmc);
		ps.setString(5,yhmc);
		ps.setString(6,dwbh);
		ps.setString(7,"批量送货");
		ps.executeUpdate();
		ps.close();

			
		ls_sql="insert into jc_zcshmx (shdbh,xh,ddbh,khbh,zcbm,shsl,bz)";
		ls_sql+=" select                   ?,xh,ddbh,khbh,zcbm,sl,''";
		ls_sql+=" from jc_zcddmx";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,shdbh);
		ps.executeUpdate();
		ps.close();
		

		ls_sql="update jc_zcddmx set shsl=sl";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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
