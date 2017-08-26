<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String xh = request.getParameter("xh");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1 = null;
String ygbh = null;
String ssfgs = null;
double sqgz = 0;
double ksk = 0;
double shgz = 0;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	sql=" select ssfgs,ygbh,glgz+gwgz+jbgz+jtbt+cb+dhbt-yjsxe+jj+qtbt-qtkk+tc sqgz" ;
	sql+=" from rs_yggzb,rs_yggzjl" ;
	sql+=" where  rs_yggzb.xh=rs_yggzjl.xh and (rs_yggzb.xh='"+xh+"') ";
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	while(rs.next())
	{         
		ssfgs = rs.getString("ssfgs");			    
		ygbh = rs.getString("ygbh");			    
		sqgz = rs.getDouble("sqgz");		


		double ksbfb = 0;
		double lssqgz = sqgz;
		double gzxx = 0;
		double gzsx = 0;
		ksk=0;
		sql=" select ksbfb,gzxx,gzsx" ;
		sql+=" from rs_ksbl" ;
		sql+=" where  dwbh='"+ssfgs+"'";
		sql+=" order by gzxx desc" ;
		ps1= conn.prepareStatement(sql);
		rs1=ps1.executeQuery();
		while(rs1.next())
		{         
			ksbfb = rs1.getDouble("ksbfb");			    
			gzxx = rs1.getDouble("gzxx");			    
			gzsx = rs1.getDouble("gzsx");		
			
			if (lssqgz>gzxx && lssqgz<=gzsx)
			{
				ksk+=(lssqgz-gzxx)*ksbfb/100.0;
				lssqgz=gzxx;
			}
		}
		rs1.close();
		ps1.close();


		shgz=sqgz-ksk;

		sql="update rs_yggzb set sqgz="+sqgz+",ksk="+ksk+",shgz="+shgz;
		sql+=" where  (xh='"+xh+"' and ygbh='"+ygbh+"') ";
		ps1= conn.prepareStatement(sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();




	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
