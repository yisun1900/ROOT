<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] oldjgwzbm=request.getParameterValues("oldjgwzbm");
String[] xuhao=request.getParameterValues("xuhao");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	//清空序号
	ls_sql="update bj_fjxx set xuhao=-1 where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<oldjgwzbm.length ; i++)
	{
		if (jgwzbm[i].trim().equals(""))
		{
			conn.rollback();
			out.println("错误！房间名称["+cf.GB2Uni(oldjgwzbm[i])+"]被改为空值");
			return;
		}
		if (xuhao[i].trim().equals(""))
		{
			conn.rollback();
			out.println("错误！房间顺序号不能为空值");
			return;
		}

		ls_sql="update bj_fjxx set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"',xuhao="+xuhao[i]+" where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_gclmx set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_dwgclzcyl set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	//调整序号
	int pxxh=0;
	String lsjgwzbm=null;
	ls_sql="SELECT jgwzbm";
	ls_sql+=" FROM bj_fjxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xuhao";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lsjgwzbm=rs.getString(1);

		pxxh++;

		ls_sql="update bj_fjxx set xuhao="+pxxh+" where khbh='"+khbh+"' and jgwzbm='"+lsjgwzbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>