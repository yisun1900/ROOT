<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String djbh=null;
String hfdjbz=null;
String djyy=null;
java.sql.Date djsj=null;
String djr=null;
java.sql.Date jhjdsj=null;

khbh=cf.GB2Uni(request.getParameter("khbh"));
djbh=cf.GB2Uni(request.getParameter("djbh"));
hfdjbz=cf.GB2Uni(request.getParameter("hfdjbz"));
djyy=cf.GB2Uni(request.getParameter("djyy"));
ls=request.getParameter("djsj");
try{
	if (!(ls.equals("")))  djsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[冻结时间]类型转换发生意外:"+e);
	return;
}
djr=cf.GB2Uni(request.getParameter("djr"));
ls=request.getParameter("jhjdsj");
try{
	if (!(ls.equals("")))  jhjdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhjdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划解冻时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

java.sql.Date hfrq=null;
String hflxbm=null;

String ydjbh=null;
String yhfdjbz=null;
String ydjyy=null;
java.sql.Date ydjsj=null;
String ydjr=null;
java.sql.Date yjhjdsj=null;
java.sql.Date ysjjdsj=null;
String yjdr=null;
String gcsfxhf=null;
java.sql.Date gchfrq=null;
String gchflxbm=null;

String tsjlh=null;
String tssfxhf=null;
java.sql.Date tshfsj=null;

try {
	conn=cf.getConnection();


	ls_sql="select sfxhf,hfrq,hflxbm,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sjjdsj,jdr";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcsfxhf=rs.getString("sfxhf");
		gchfrq=rs.getDate("hfrq");
		gchflxbm=rs.getString("hflxbm");
		ydjbh=rs.getString("djbh");
		yhfdjbz=rs.getString("hfdjbz");
		ydjyy=rs.getString("djyy");
		ydjsj=rs.getDate("djsj");
		ydjr=rs.getString("djr");
		yjhjdsj=rs.getDate("jhjdsj");
		ysjjdsj=rs.getDate("sjjdsj");
		yjdr=rs.getString("jdr");


		hfrq=gchfrq;
		hflxbm=gchflxbm;
	}
	rs.close();
	ps.close();

	if (hfdjbz.equals("1") || hfdjbz.equals("3"))//1：工程回访冻结；2：投诉报修回访冻结；3：全部冻结
	{
	}
	else{
		hfrq=null;
		hflxbm=null;
	}

	
	conn.setAutoCommit(false);

	//插入回访冻结记录
	ls_sql="insert into crm_hfdjjl ( khbh,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,hfrq,hflxbm,ydjbh,yhfdjbz,ydjyy,ydjsj,ydjr,yjhjdsj,ysjjdsj,yjdr,gcsfxhf,gchfrq,gchflxbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,djbh);
	ps.setString(3,hfdjbz);
	ps.setString(4,djyy);
	ps.setDate(5,djsj);
	ps.setString(6,djr);
	ps.setDate(7,jhjdsj);
	ps.setDate(8,hfrq);
	ps.setString(9,hflxbm);

	ps.setString(10,ydjbh);
	ps.setString(11,yhfdjbz);
	ps.setString(12,ydjyy);
	ps.setDate(13,ydjsj);
	ps.setString(14,ydjr);
	ps.setDate(15,yjhjdsj);
	ps.setDate(16,ysjjdsj);
	ps.setString(17,yjdr);
	ps.setString(18,gcsfxhf);
	ps.setDate(19,gchfrq);
	ps.setString(20,gchflxbm);

	ps.executeUpdate();
	ps.close();
	
	ls_sql =" update  crm_khxx";
	ls_sql+=" set hfdjbz='0'";
	ls_sql+=" where hfdjbz!='0' and crm_khxx.djsj is null";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	//修改客户信息表
	if (hfdjbz.equals("1") || hfdjbz.equals("3"))//1：工程回访冻结；2：投诉报修回访冻结；3：全部冻结
	{
		ls_sql =" update  crm_khxx";
		ls_sql+=" set djbh=?,hfdjbz=?,djyy=?,djsj=?,djr=?,jhjdsj=?,sjjdsj=null,jdr=null,sfxhf='N',hfrq=null,hflxbm=null ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,djbh);
		ps.setString(2,hfdjbz);
		ps.setString(3,djyy);
		ps.setDate(4,djsj);
		ps.setString(5,djr);
		ps.setDate(6,jhjdsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql =" update  crm_khxx";
		ls_sql+=" set djbh=?,hfdjbz=?,djyy=?,djsj=?,djr=?,jhjdsj=?,sjjdsj=null,jdr=null";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,djbh);
		ps.setString(2,hfdjbz);
		ps.setString(3,djyy);
		ps.setDate(4,djsj);
		ps.setString(5,djr);
		ps.setDate(6,jhjdsj);
		ps.executeUpdate();
		ps.close();
	}

	if (hfdjbz.equals("2") || hfdjbz.equals("3"))//1：工程回访冻结；2：投诉报修回访冻结；3：全部冻结
	{
		ls_sql="select tsjlh,sfxhf,hfsj";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where khbh='"+khbh+"' and clzt!='3'";//3：结案
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			tsjlh=rs1.getString("tsjlh");
			tssfxhf=rs1.getString("sfxhf");
			tshfsj=rs1.getDate("hfsj");

			//插入回访冻结记录
			ls_sql="insert into crm_tshfdjjl ( djbh,tsjlh,khbh,tssfxhf,tshfsj) ";
			ls_sql+=" values ( ?,?,?,?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,djbh);
			ps.setString(2,tsjlh);
			ps.setString(3,khbh);
			ps.setString(4,tssfxhf);
			ps.setDate(5,tshfsj);

			ps.executeUpdate();
			ps.close();

			//冻结已受理的投诉报修
			ls_sql =" update  crm_tsjl";
			ls_sql+=" set djbh=?,hfdjbz=?,djyy=?,djsj=?,djr=?,jhjdsj=?,sjjdsj=null,jdr=null,sfxhf='N',hfsj=null ";
			ls_sql+=" where tsjlh='"+tsjlh+"'";//3：结案
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,djbh);
			ps.setString(2,"Y");
			ps.setString(3,djyy);
			ps.setDate(4,djsj);
			ps.setString(5,djr);
			ps.setDate(6,jhjdsj);

			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();

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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>