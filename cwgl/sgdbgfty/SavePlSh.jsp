<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jsjlh=request.getParameterValues("jsjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String spr=(String)session.getAttribute("yhmc");

	conn.setAutoCommit(false);

	for (int i=0;i<jsjlh.length ;i++ )
	{
		String khbh=null;
		String spzt="";
		String gdjsjd="";
		ls_sql="select khbh,spzt,gdjsjd";
		ls_sql+=" from  cw_sgdbgfty";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			spzt=cf.fillNull(rs.getString("spzt"));
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		if (!spzt.equals("1"))//1：未审批；2：审批同意；3：审批不同意
		{
			conn.rollback();
			out.println("错误！已审批");
			return;
		}

		String getgdjsjd="";
		ls_sql="select gdjsjd";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			getgdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals(getgdjsjd))
		{
			conn.rollback();
			out.println("<BR>！！！错误，状态不正确");
			return;
		}

		int ztjc=0;
		ls_sql="select count(*)";
		ls_sql+=" from dm_gdjsjd";
		ls_sql+=" where gdjsjd='"+gdjsjd+"' and ztlx='3'";//1：授权；2：拨工费；3：审核
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ztjc=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (ztjc==0)
		{
			conn.rollback();
			out.println("错误！状态不正确");
			return;
		}

		
		String nextzt="";//下一个结算进度编码
		int bfcs=0;//拨付次数
		ls_sql="select nextzt,bfcs";
		ls_sql+=" from dm_gdjsjd";
		ls_sql+=" where gdjsjd='"+gdjsjd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nextzt=cf.fillNull(rs.getString("nextzt"));//下一个结算进度编码
			bfcs=rs.getInt("bfcs");//拨付次数
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set gdjsjd=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,nextzt);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_sgdbgfty set spzt='2',spr=?,spsj=TRUNC(SYSDATE),spgdjsjd=?";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,spr);
		ps.setString(2,nextzt);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("审核成功！");
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