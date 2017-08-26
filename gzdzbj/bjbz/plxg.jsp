<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>

<%
String wheresql=" (1=1) ";
String dqbm=null;
String[] xmdlbm=null;
String[] xmxlbm=null;
String smbm=null;
String bjlx=null;
String jgqz=null;
String tjbfb=null;
String bjjb=null;
jgqz=request.getParameter("jgqz");
tjbfb=request.getParameter("tjbfb");
bjjb=request.getParameter("bjjb");


bjlx=request.getParameter("bjlx");
if (!(bjlx.equals("")))	wheresql+=" and  (bj_gzbjb.bjlx='"+bjlx+"')";




dqbm=request.getParameter("dqbm");
if (!(dqbm.equals("")))	wheresql+=" and  (bj_gzbjb.dqbm='"+dqbm+"')";

xmdlbm=request.getParameterValues("xmdlbm");
if (xmdlbm!=null)
{
	wheresql+=cf.arrayToSQL(xmdlbm,"bj_gzbjb.xmdlbm");
}
xmxlbm=request.getParameterValues("xmxlbm");
if (xmxlbm!=null)
{
	wheresql+=cf.arrayToSQL(xmxlbm,"bj_gzbjb.xmxlbm");
}
smbm=request.getParameter("smbm");
if (smbm!=null)
{
	smbm=cf.GB2Uni(smbm);
	if (!(smbm.equals("")))	wheresql+=" and  (bj_gzbjb.smbm='"+smbm+"')";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (bjjb.equals("A"))
	{
		if (jgqz.equals("Y"))//结果取整
		{
			ls_sql="update bj_gzbjb set bj=ROUND(bj*"+tjbfb+"/100.0,0),lrr='"+yhmc+"',lrsj=TRUNC(SYSDATE)";
			ls_sql+=" where  "+wheresql;
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (jgqz.equals("N"))
		{
			ls_sql="update bj_gzbjb set bj=bj*"+tjbfb+"/100.0,lrr='"+yhmc+"',lrsj=TRUNC(SYSDATE)";
			ls_sql+=" where  "+wheresql;
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
	else if (bjjb.equals("B"))
	{
		if (jgqz.equals("Y"))//结果取整
		{
			ls_sql="update bj_gzbjb set bbj=ROUND(bbj*"+tjbfb+"/100.0,0),lrr='"+yhmc+"',lrsj=TRUNC(SYSDATE)";
			ls_sql+=" where  "+wheresql;
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (jgqz.equals("N"))
		{
			ls_sql="update bj_gzbjb set bbj=bbj*"+tjbfb+"/100.0,lrr='"+yhmc+"',lrsj=SYSDATE";
			ls_sql+=" where  "+wheresql;
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
	else if (bjjb.equals("C"))
	{
		if (jgqz.equals("Y"))//结果取整
		{
			ls_sql="update bj_gzbjb set cbj=ROUND(cbj*"+tjbfb+"/100.0,0),lrr='"+yhmc+"',lrsj=SYSDATE";
			ls_sql+=" where  "+wheresql;
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (jgqz.equals("N"))
		{
			ls_sql="update bj_gzbjb set cbj=cbj*"+tjbfb+"/100.0,lrr='"+yhmc+"',lrsj=SYSDATE";
			ls_sql+=" where  "+wheresql;
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
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