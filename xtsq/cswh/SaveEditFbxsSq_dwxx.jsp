<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010131")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String[] sgdjbbm=request.getParameterValues("sgdjbbm");
String[] fbxsStr=request.getParameterValues("fbxs");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="delete from cw_sgdfbxs";
	ls_sql+=" where fgsbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<sgdjbbm.length ;i++ )
	{
		if (fbxsStr[i].trim().equals(""))
		{
			continue;
		}

		double fbxs=0;
		try{
			fbxs=Double.parseDouble(fbxsStr[i].trim());
		}
		catch (Exception e){
			out.println("<BR>[发包系数:"+fbxsStr[i]+"]不是数字:"+e);
			return;
		}

		if (fbxs==0)
		{
			continue;
		}

		ls_sql ="insert into cw_sgdfbxs (fgsbh,sgdjbbm,fbxs)";
		ls_sql+=" values('"+dwbh+"','"+sgdjbbm[i]+"','"+fbxs+"')";
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
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






