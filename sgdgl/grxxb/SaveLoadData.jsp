<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();
String ssfgs=request.getParameter("ssfgs");

String[] sgd =request.getParameterValues("sgd");
String[] bzmc =request.getParameterValues("bzmc");
String[] xm =request.getParameterValues("xm");
String[] xb =request.getParameterValues("xb");

String[] jg =request.getParameterValues("jg");
String[] csrq =request.getParameterValues("csrq");
String[] gz =request.getParameterValues("gz");
String[] rzsj =request.getParameterValues("rzsj");

String[] dj =request.getParameterValues("dj");
String[] lx =request.getParameterValues("lx");
String[] dh =request.getParameterValues("dh");
String[] zz =request.getParameterValues("zz");
String[] sfzh =request.getParameterValues("sfzh");

String[] jjlxr =request.getParameterValues("jjlxr");
String[] jjlxrdh =request.getParameterValues("jjlxrdh");
String[] jjlxrdz =request.getParameterValues("jjlxrdz");
String[] pxsm =request.getParameterValues("pxsm");
String[] sgzbh =request.getParameterValues("sgzbh");

String[] yhk =request.getParameterValues("yhk");
String[] sfqdlwpqht =request.getParameterValues("sfqdlwpqht");
String[] sfkstg =request.getParameterValues("sfkstg");

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

	for (int i=0;i<xm.length ;i++ )
	{
		int count=0;
		sql=" select count(*)" ;
		sql+=" from sq_grxxb " ;
		sql+=" where bzmc ='"+cf.GB2Uni(bzmc[i]) +"' and sgd='"+sgd[i]+"' and xm='"+cf.GB2Uni(xm[i])+"'" ;
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
			out.println("错误！姓名["+cf.GB2Uni(xm[i])+"]有多个");
			return;
		}
		else if (count==1)//首先删除
		{
			sql=" delete from sq_grxxb " ;
			sql+=" where bzmc ='"+cf.GB2Uni(bzmc[i]) +"' and sgd='"+sgd[i]+"' and xm='"+cf.GB2Uni(xm[i])+"'" ;
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}

		sql ="insert into sq_grxxb (ssfgs,sgd,bzmc,xm,xb,jg,csrq ";
		sql+="  ,gz,rzsj,dj,lx,sfzh ";
		sql+="  ,zz,dh,jjlxr,jjlxrdh,jjlxrdz,pxsm,sgzbh,yhk,sfqdlwpqht,sfkstg )";
		sql+=" values('"+ssfgs+"','"+sgd[i]+"','"+cf.GB2Uni(bzmc[i])+"','"+cf.GB2Uni(xm[i])+"','"+cf.GB2Uni(xb[i])+"','"+cf.GB2Uni(jg[i])+"',TO_DATE('"+csrq[i]+"','YYYY-MM-DD')";
		sql+=" ,'"+cf.GB2Uni(gz[i])+"',TO_DATE('"+rzsj[i]+"','YYYY-MM-DD'),'"+cf.GB2Uni(dj[i])+"','"+cf.GB2Uni(lx[i])+"','"+cf.GB2Uni(sfzh[i])+"'";
		sql+=" ,'"+cf.GB2Uni(zz[i])+"','"+cf.GB2Uni(dh[i])+"','"+cf.GB2Uni(jjlxr[i])+"','"+cf.GB2Uni(jjlxrdh[i])+"','"+cf.GB2Uni(jjlxrdz[i])+"','"+cf.GB2Uni(pxsm[i])+"','"+cf.GB2Uni(sgzbh[i])+"','"+cf.GB2Uni(yhk[i])+"','"+cf.GB2Uni(sfqdlwpqht[i])+"','"+cf.GB2Uni(sfkstg[i])+"')";
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
