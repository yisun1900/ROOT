<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date zzqrjdrq=null;
double zzqrjdsj=0;
String fbr=null;
java.sql.Date fbsj=null;
ls=request.getParameter("zzqrjdrq");
try{
	if (!(ls.equals("")))  zzqrjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zzqrjdrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最终确认交底日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zzqrjdsj");
try{
	if (!(ls.equals("")))  zzqrjdsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zzqrjdsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最终确认交底时间]类型转换发生意外:"+e);
	return;
}
fbr=cf.GB2Uni(request.getParameter("fbr"));
ls=request.getParameter("fbsj");
try{
	if (!(ls.equals("")))  fbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fbsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交底发布时间]类型转换发生意外:"+e);
	return;
}

String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String sfycp=null;
	String sfxtp=null;
	String clzt=null;
	String jdqrjg=null;
	String tpsftg=null;
	ls_sql=" SELECT khbh,sfycp,sfxtp,clzt,jdqrjg,tpsftg";
	ls_sql+=" FROM crm_xcjdjl ";
    ls_sql+=" where jdjlh='"+jdjlh+"'";
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

	if (sfycp.equals("1"))//1：有产品、2：无产品
	{
		if (!clzt.equals("2"))//1：申请；2：确认；3：部分确认；4：特批完成；5：发布；6：已交底
		{
			out.print("错误！处理状态不正确");
			return;
		}
		else{
			if (!jdqrjg.equals("Y"))//交底确认结果  Y：通过；N：未通过
			{
				out.print("错误！未确认");
				return;
			}
		}
	}
	else{
		if (sfxtp.equals("Y") )//是否需特批:Y：是；N：否
		{
			if (!clzt.equals("4") )
			{
				out.print("错误！已发布");
				return;
			}
		}
		else{
			if (!clzt.equals("1") )
			{
				out.print("错误！已发布");
				return;
			}
		}
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_xcjdjl set zzqrjdrq=?,zzqrjdsj=?,fbr=?,fbsj=?,clzt='5' ";
	ls_sql+=" where  jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,zzqrjdrq);
	ps.setDouble(2,zzqrjdsj);
	ps.setString(3,fbr);
	ps.setDate(4,fbsj);
	ps.executeUpdate();
	ps.close();

	String setxcjdbz="8";//0：未申请；1：普通申请；2：特批申请；3：确认通过；4：确认失败；5：部分确认；6：特批同意；7：特批不同意；8：发布；9：交底成功；A：交底失败；B：失败已出方案

	
	ls_sql="update crm_khxx set xcjdbz='"+setxcjdbz+"' ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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