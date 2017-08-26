<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] jsjlh=request.getParameterValues("jsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jsjlh.length ;i++ )
	{
		String khbh=null;
		double kzbj=0;
		String sgd=null;
		ls_sql="select khbh,kzbj,sgd";
		ls_sql+=" from  cw_sgdwgjsty";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			kzbj=rs.getDouble("kzbj");
			sgd=cf.fillNull(rs.getString("sgd"));
		}
		rs.close();
		ps.close();


		String gdjsjd=null;
		ls_sql="select gdjsjd";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals("Y"))//0:未结算
		{
			conn.rollback();
			out.println("<BR>！！！错误，状态不正确");
			return;
		}

		if (kzbj>0)
		{
			ls_sql="update sq_sgd set zbj=zbj-?";
			ls_sql+=" where sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,kzbj);
			ps.executeUpdate();
			ps.close();
		
			ls_sql="update cw_zbjxgjl set scbz='Y',scr='"+yhmc+"',scsj=SYSDATE,bz=bz||',删除完工结算'";
			ls_sql+=" where  sgd='"+sgd+"' and jsjlh='"+jsjlh[i]+"' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		ls_sql="update crm_khxx set gdjsjd=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,"X");
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_sgdwgjsty ";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_sgdfkjl set zt='2',jsjlh=null";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
		ls_sql+=" and scbz='N' and zt='3'";//1：未审核；2：审核；3：结算
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_sgdjljl set zt='2',jsjlh=null";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
		ls_sql+=" and scbz='N' and zt='3'";//1：未审核；2：审核；3：结算
		ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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