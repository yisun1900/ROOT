<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String dqbm = request.getParameter("dqbm");

String[] tcsjflbm =request.getParameterValues("tcsjflbm");
String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] bjjbbm1 =request.getParameterValues("bjjbbm1");
String[] jldw =request.getParameterValues("jldw");
String[] sjcj =request.getParameterValues("sjcj");

String[] sjsfycx =request.getParameterValues("sjsfycx");
String[] cxkssjstr =request.getParameterValues("cxkssj");
String[] cxjssjstr =request.getParameterValues("cxjssj");
String[] cxsjcjstr =request.getParameterValues("cxsjcj");

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


	for (int i=0;i<bjjbbm.length ;i++ )
	{
		java.sql.Date cxkssj=null;
		java.sql.Date cxjssj=null;
		double cxsjcj=0;

		//促销价
		cxsjcj=0;
		if (cxsjcjstr[i]!=null && !cxsjcjstr[i].equals(""))
		{
			cxsjcj=Double.parseDouble(cxsjcjstr[i]);
		}
		//促销开始时间
		cxkssj=null;
		if (cxkssjstr[i]!=null && !cxkssjstr[i].equals(""))
		{
			cxkssj=java.sql.Date.valueOf(cxkssjstr[i]);
		}
		//促销结束时间
		cxjssj=null;
		if (cxjssjstr[i]!=null && !cxjssjstr[i].equals(""))
		{
			cxjssj=java.sql.Date.valueOf(cxjssjstr[i]);
		}

		sql="insert into bj_tcsjcjb (bjbbh,dqbm,tcsjflbm,bjjbbm,bjjbbm1,jldw,sjcj,sjsfycx,cxkssj,cxjssj,cxsjcj) ";
		sql+=" values('"+bjbbh+"','"+dqbm+"','"+tcsjflbm[i]+"','"+bjjbbm[i]+"','"+bjjbbm1[i]+"','"+cf.GB2Uni(jldw[i])+"','"+sjcj[i]+"','"+sjsfycx[i]+"',TO_DATE('"+cxkssjstr[i]+"','YYYY-MM-DD')"+",TO_DATE('"+cxjssjstr[i]+"','YYYY-MM-DD'),'"+cxsjcjstr[i]+"')";
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
