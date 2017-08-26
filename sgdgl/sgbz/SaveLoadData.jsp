<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String[] sgd =request.getParameterValues("sgd");
String[] bzmc =request.getParameterValues("bzmc");
String[] sgdjbbm =request.getParameterValues("sgdjbbm");
String[] grsl =request.getParameterValues("grsl");
String[] yygrsl =request.getParameterValues("yygrsl");
String[] kygrsl =request.getParameterValues("kygrsl");
String[] tdbz =request.getParameterValues("tdbz");
String[] xb =request.getParameterValues("xb");

String[] dh =request.getParameterValues("dh");
String[] zz =request.getParameterValues("zz");
String[] sfzh =request.getParameterValues("sfzh");
String[] sfqldht =request.getParameterValues("sfqldht");
String[] sfsbx =request.getParameterValues("sfsbx");
String[] jjlxr =request.getParameterValues("jjlxr");
String[] jjlxrdh =request.getParameterValues("jjlxrdh");
String[] jjlxrdz =request.getParameterValues("jjlxrdz");
String[] bz =request.getParameterValues("bz");

//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<bzmc.length ;i++ )
	{
		int count=0;
		sql=" select count(*)" ;
		sql+=" from sq_bzxx " ;
		sql+=" where sgd='"+sgd[i]+"' and bzmc='"+cf.GB2Uni(bzmc[i])+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>1)
		{
			conn.rollback();
			out.println("错误！班长["+cf.GB2Uni(bzmc[i])+"]有多个");
			return;
		}
		else if (count==1)//首先删除
		{
			sql=" delete from sq_bzxx " ;
			sql+=" where sgd='"+sgd[i]+"' and bzmc='"+cf.GB2Uni(bzmc[i])+"'" ;
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}

		sql ="insert into sq_bzxx (bzmc,sgd,xb,dh,zz,sfzh";
		sql+=" ,sgdjbbm,grsl,yygrsl,kygrsl,tdbz,sfqldht,sfsbx ";
		sql+=" ,jjlxr,jjlxrdh,jjlxrdz,khmyd,zxzsgds,zdzsgds,mqzsgds,kjdzxz,kjdzdz,bz)";
		sql+=" values('"+cf.GB2Uni(bzmc[i])+"','"+sgd[i]+"','"+xb[i]+"','"+cf.GB2Uni(dh[i])+"','"+cf.GB2Uni(zz[i])+"','"+cf.GB2Uni(sfzh[i])+"'";
		sql+=" ,'"+sgdjbbm[i]+"','"+grsl[i]+"','"+yygrsl[i]+"','"+kygrsl[i]+"','"+tdbz[i]+"','"+sfqldht[i]+"','"+sfsbx[i]+"'";
		sql+=" ,'"+cf.GB2Uni(jjlxr[i])+"','"+cf.GB2Uni(jjlxrdh[i])+"','"+cf.GB2Uni(jjlxrdz[i])+"',0,0,0,0,0,0,'"+cf.GB2Uni(bz[i])+"')";
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
