<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] jdjlh=request.getParameterValues("jdjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jdjlh.length ;i++ )
	{
		String khbh=null;
		String sfycp=null;
		String sfxtp=null;
		String clzt=null;
		String jdqrjg=null;
		String tpsftg=null;
		ls_sql=" SELECT khbh,sfycp,sfxtp,clzt,jdqrjg,tpsftg";
		ls_sql+=" FROM crm_xcjdjl ";
		ls_sql+=" where jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			sfycp=cf.fillNull(rs.getString("sfycp"));
			sfxtp=cf.fillNull(rs.getString("sfxtp"));
			clzt=cf.fillNull(rs.getString("clzt"));
			jdqrjg=cf.fillNull(rs.getString("jdqrjg"));
			tpsftg=cf.fillNull(rs.getString("tpsftg"));
		}
		rs.close();
		ps.close();

		if (clzt.equals("1"))//1：申请；2：确认；3：部分确认；4：特批完成；5：发布；6：已交底；
		{
			if (!sfycp.equals("2") || !sfxtp.equals("N"))//1：有产品、2：无产品
			{
				conn.rollback();
				out.println("错误！未确认:"+jdjlh[i]);
				return;
			}
		}
		else if (clzt.equals("2"))
		{
			if (!sfycp.equals("1") || !jdqrjg.equals("Y"))//1：有产品、2：无产品
			{
				conn.rollback();
				out.println("错误！确认未通过:"+jdjlh[i]);
				return;
			}
		}
		else if (clzt.equals("4"))
		{
			if (!sfycp.equals("2") || !sfxtp.equals("Y") || !tpsftg.equals("Y"))//1：有产品、2：无产品
			{
				conn.rollback();
				out.println("错误！特批后未确认或特批未通过:"+jdjlh[i]);
				return;
			}
		}
		else{
			conn.rollback();
			out.println("错误！已发布或未确认完成:"+jdjlh[i]);
			return;
		}


		ls_sql="update crm_xcjdjl set zzqrjdrq=jhjdrq,zzqrjdsj=jhjdsj,fbr='"+yhmc+"',fbsj=TRUNC(SYSDATE),clzt='5' ";
		ls_sql+=" where  jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String setxcjdbz="8";//0：未申请；1：普通申请；2：特批申请；3：确认通过；4：确认失败；5：部分确认；6：特批同意；7：特批不同意；8：发布；9：交底成功；A：交底失败；B：失败已出方案

		
		ls_sql="update crm_khxx set xcjdbz='"+setxcjdbz+"' ";
		ls_sql+=" where khbh='"+khbh+"'";
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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