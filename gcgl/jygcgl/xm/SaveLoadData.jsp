<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");


String[] xmdlbm =request.getParameterValues("xmdlbm");
String[] xmxlbm =request.getParameterValues("xmxlbm");
String[] xmbm =request.getParameterValues("xmbm");
String[] xmmc =request.getParameterValues("xmmc");


String[] wgjbbm =request.getParameterValues("wgjbbm");
String[] xzzwbm =request.getParameterValues("xzzwbm");
String[] zgyq =request.getParameterValues("zgyq");
String[] ygfkje =request.getParameterValues("ygfkje");
String[] ygkf =request.getParameterValues("ygkf");
String[] sgdfkje =request.getParameterValues("sgdfkje");
String[] sgdkf =request.getParameterValues("sgdkf");
String[] bz =request.getParameterValues("bz");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<xmbm.length ;i++ )
	{
		int count=0;
		sql=" select count(*)" ;
		sql+=" from gdm_gcxm " ;
		sql+=" where xmbm='"+xmbm[i]+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			sql="insert into gdm_gcxm ( xmbm,xmmc,xmdlbm,xmxlbm,bz ) ";
			sql+=" values('"+xmbm[i]+"','"+cf.GB2Uni(xmmc[i])+"','"+xmdlbm[i]+"','"+xmxlbm[i]+"','')";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}
		
			
		sql="insert into gdm_gcxmcfbz ( xmbm,wgjbbm,xzzwbm,zgyq,sgdkf,sgdfkje,ygkf,ygfkje,bz ) ";
		sql+=" values('"+xmbm[i]+"','"+wgjbbm[i]+"','"+cf.GB2Uni(xzzwbm[i])+"','"+cf.GB2Uni(zgyq[i])+"','"+sgdkf[i]+"','"+sgdfkje[i]+"','"+ygkf[i]+"','"+ygfkje[i]+"','"+cf.GB2Uni(bz[i])+"')";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

	}


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
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
