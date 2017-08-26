<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String jsjlh=request.getParameter("jsjlh");
String khbh=request.getParameter("khbh");
String[] sjsxmbm =request.getParameterValues("sjsxmbm");
String[] sjsxmmc =request.getParameterValues("sjsxmmc");
String[] zjbfbstr =request.getParameterValues("zjbfb");
String[] zjjestr =request.getParameterValues("zjje");
String[] bz =request.getParameterValues("bz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql = null;

int count=0;
int tzsl=0;
try {
	conn=cf.getConnection();    //得到连接

	conn.setAutoCommit(false);

	ls_sql=" delete from cw_zjqtfymx ";
	ls_sql+=" where jsjlh='"+jsjlh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<sjsxmbm.length ;i++ )
	{
		if (!zjbfbstr[i].trim().equals(""))
		{
			double zjbfb=0;
			double zjje=0;
			zjbfb=Double.parseDouble(zjbfbstr[i].trim());
			zjje=Double.parseDouble(zjjestr[i].trim());

			if (zjbfb==0)
			{
				continue;
			}

			ls_sql=" insert into cw_zjqtfymx (jsjlh,khbh,sjsxmmc,zjbfb,zjje,bz)";
			ls_sql+=" values('"+jsjlh+"','"+khbh+"','"+cf.GB2Uni(sjsxmmc[i])+"',"+zjbfb+","+zjje+",'"+cf.GB2Uni(bz[i])+"')";
	//		out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	double zjqtfy=0;//增减其它费用
	ls_sql="select sum(zjje)";
	ls_sql+=" from  cw_zjqtfymx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjqtfy=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" update cw_zjjsmx set zjqtfy=?,sjtcje=bctcje+?";
	ls_sql+=" where jsjlh='"+jsjlh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjqtfy);
	ps.setDouble(2,zjqtfy);
	ps.executeUpdate();
	ps.close();

	double tcze=0;//提成总额
	ls_sql="select sum(sjtcje)";
	ls_sql+=" from  cw_zjjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" update cw_zjjsjl set tcze=?";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,tcze);
	ps.executeUpdate();
	ps.close();

	double sjtcje=0;
	String tclx=null;
	ls_sql="select sjtcje,tclx";
	ls_sql+=" from  cw_zjjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjtcje=rs.getDouble("sjtcje");
		tclx=rs.getString("tclx");
	}
	rs.close();
	ps.close();

	ls_sql=" update crm_khxx set zjjsje=?";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sjtcje);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("存盘成功！共扣减金额：<%=zjqtfy%>");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              

