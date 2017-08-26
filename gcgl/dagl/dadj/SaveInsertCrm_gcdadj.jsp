<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String bgrfgs=cf.GB2Uni(request.getParameter("bgrfgs"));

String[] damxbm=request.getParameterValues("damxbm");
String[] bgr=request.getParameterValues("bgr");
String[] bgrdw=request.getParameterValues("bgrdw");
String[] bz=request.getParameterValues("bz");
String[] slStr=request.getParameterValues("sl");
String[] bgsjStr=request.getParameterValues("bgsj");

String dadbh=cf.GB2Uni(request.getParameter("dadbh"));
	

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dalqbz=null;
	ls_sql="select dalqbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dalqbz=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (dalqbz.equals("3"))//1：未建档案；2：已建档案；3：已归档
	{
		out.println("错误！已归档不能再修改");
		return;
	}

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
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,SYSDATE,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,damxbm[i]);
		ps.setInt(3,sl);
		ps.setString(4,cf.GB2Uni(bgr[i]));
		ps.setString(5,cf.GB2Uni(bgrdw[i]));
		ps.setString(6,bgrfgs);
		ps.setDate(7,bgsj);
		ps.setString(8,yhmc);
		ps.setString(9,dwbh);
		ps.setString(10,cf.GB2Uni(bz[i]));
		ps.setString(11,"Y");//Y：归档；N：未归档
		ps.executeUpdate();
		ps.close();
	}
	
	ls_sql="update crm_khxx set dadbh=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dadbh);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update crm_khxx set dalqbz='2'";//1：未建档案；2：已建档案；3：已归档
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