<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML>
<HEAD>
<TITLE>期末结转</TITLE>
</HEAD>

<BODY bgColor=#ffffff>

<% 
int count=0;

String yhmc=(String)session.getAttribute("yhmc");

String nian=cf.GB2Uni(request.getParameter("nian"));
String yue=cf.GB2Uni(request.getParameter("yue"));

String kpjlh=nian+"-"+yue;

String start=cf.firstDay(nian,yue);
String end=cf.lastDay(nian,yue);

if (yue.equals("01"))
{
	int intNian=Integer.parseInt(nian);
	int intYue=11;

	start=cf.firstDay(intNian+"",intYue+"");
}
else if (yue.equals("02"))
{
	int intNian=Integer.parseInt(nian);
	int intYue=12;

	start=cf.firstDay(intNian+"",intYue+"");
}
else{
	int intNian=Integer.parseInt(nian);
	int intYue=Integer.parseInt(yue);
	intYue=intYue-2;

	start=cf.firstDay(intNian+"",intYue+"");
}

if (end.compareTo(cf.today())>0)
{
	out.println("错误！考评时间不能大于今天"+cf.today());
	return;
}


//连接数据库
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;
PreparedStatement ps1=null; 
ResultSet rs1=null;

String ls_sql=null;


try {
	conn=cf.getConnection();



	conn.setAutoCommit(false);


	ls_sql="delete from kp_yzfsgdkhpyd ";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into kp_yzfsgdkhpyd ( kpjlh,sgd,ssfgs,khmyd,kpkssj,kpjzsj) ";
	ls_sql+=" select '"+kpjlh+"',sgd,ssfgs,0,TO_DATE('"+start+"','YYYY-MM-DD'),TO_DATE('"+end+"','YYYY-MM-DD') ";
	ls_sql+=" from sq_sgd ";
	ls_sql+=" where cxbz='N' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//取签单客户
	String sgd=null;
	String ssfgs=null;
	ls_sql="select sgd,ssfgs";
	ls_sql+=" from kp_yzfsgdkhpyd";  
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ls_sql+=" order by sgd";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	while (rs.next())
	{
		sgd=rs.getString("sgd"); 
		ssfgs=rs.getString("ssfgs"); 

		int mys=0;
		int all=0;
		ls_sql="select count(distinct crm_khpjb.khbh)";
		ls_sql+=" from crm_khpjb,crm_khxx";  
		ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khpjb.pjxmbm in('050701','050703')";
		ls_sql+=" and crm_khpjb.spjrybm='05'";
		ls_sql+=" and crm_khpjb.xmflbm='07'";
		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
		ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+start+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.sjjgrq<=TO_DATE('"+end+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.gcjdbm not in('1','2')";
		ps1=conn.prepareStatement(ls_sql);  
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			mys=rs1.getInt(1); 
		} 
		rs1.close();
		ps1.close();

		ls_sql="select count(distinct crm_khpjb.khbh)";
		ls_sql+=" from crm_khpjb,crm_khxx";  
		ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khpjb.spjrybm='05'";
		ls_sql+=" and crm_khpjb.xmflbm='07'";
		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
		ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+start+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.sjjgrq<=TO_DATE('"+end+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.gcjdbm not in('1','2')";
//		out.println(ls_sql);
		ps1=conn.prepareStatement(ls_sql);  
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			all=rs1.getInt(1); 
		} 
		rs1.close();
		ps1.close();

		double khmyd=0;
		if (all!=0)
		{
			khmyd=mys*100/all;
		}
		else{
			khmyd=0;
		}

		ls_sql="update kp_yzfsgdkhpyd set khmyd="+khmyd;
		ls_sql+=" where kpjlh='"+kpjlh+"'";
		ls_sql+=" and sgd='"+sgd+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update sq_sgd set khmyd="+khmyd;
		ls_sql+=" where sgd='"+sgd+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update sq_bzxx set khmyd="+khmyd;
		ls_sql+=" where sgd='"+sgd+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

	} 
	rs.close();
	ps.close();

/*
	double zxkhmyd=0;
	String ssfgs=null;
	ls_sql="select ssfgs,khmyd";
	ls_sql+=" from kp_yzfdzpdcs";  
	ls_sql+=" order by ssfgs";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	while (rs.next())
	{
		ssfgs=rs.getString("ssfgs"); 
		zxkhmyd=rs.getDouble("khmyd"); 

		ls_sql="update sq_sgd set tdbz='Y';
		ls_sql+=" where ssfgs='"+ssfgs+"' and khmyd<"+zxkhmyd;
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	} 
	rs.close();
	ps.close();
*/


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
catch(Exception e){
	conn.rollback();
	out.print("数据库操作失败"+e);
	out.print("<BR>ls_sql="+ls_sql);
}
finally{
	conn.setAutoCommit(true);

	try{
		if (rs!= null) rs.close();  
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close();  
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn);  
	}
	catch (Exception e){ 
		out.println("关闭连接发生以外,Exception:"+e.getMessage()); 
	} 
}
%>  

</BODY>
</html>




