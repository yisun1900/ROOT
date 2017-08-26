<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String bgrfgs=cf.GB2Uni(request.getParameter("bgrfgs"));
String lrr=cf.GB2Uni(request.getParameter("lrr"));

String ls=null;
java.sql.Date lrsj=null;
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

String[] damxbm=request.getParameterValues("damxbm");
String[] bgr=request.getParameterValues("bgr");
String[] bgrdw=request.getParameterValues("bgrdw");
String[] bz=request.getParameterValues("bz");
String[] slStr=request.getParameterValues("sl");
String[] bgsjStr=request.getParameterValues("bgsj");


		

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	//批量保存档案
	for(int i=0;i<damxbm.length;i++)
	{
		int sl=0;
		if (slStr[i]==null || slStr[i].equals(""))  
		{
		}
		else{
			sl=Integer.parseInt(slStr[i].trim());    
		}

		java.sql.Date bgsj=null;
		if (bgsjStr[i].equals("")) 
		{
			conn.rollback();
			out.println("错误！保管时间不能为空");
			return;
		}
		else{
			bgsj=java.sql.Date.valueOf(bgsjStr[i].trim());
		}

		if (sl==0)
		{
			continue;
		}

		ls_sql="insert into crm_gcdagl ( khbh,damxbm,sl,bgr,bgrdw,bgrfgs,bgsj,lrr,lrsj,lrrdw,bz,gdbz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,damxbm[i]);
		ps.setInt(3,sl);
		ps.setString(4,cf.GB2Uni(bgr[i]));
		ps.setString(5,cf.GB2Uni(bgrdw[i]));
		ps.setString(6,bgrfgs);
		ps.setDate(7,bgsj);
		ps.setString(8,lrr);
		ps.setDate(9,lrsj);
		ps.setString(10,dwbh);
		ps.setString(11,cf.GB2Uni(bz[i]));
		ps.setString(12,"N");//Y：归档；N：未归档
		ps.executeUpdate();
		ps.close();
	}
	
	
	ls_sql="update crm_khxx set dalqbz='2'";
	ls_sql+=" where khbh='"+khbh+"' and dalqbz!='3'";
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
	out.print("存盘失败,发生意外: " + e);
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