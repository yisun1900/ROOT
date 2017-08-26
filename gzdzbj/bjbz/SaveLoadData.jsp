<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");

String bjjbbm = request.getParameter("bjjbbm");
String dqbm = request.getParameter("dqbm");

String[] xh =request.getParameterValues("xh");
String[] xmdlbm =request.getParameterValues("xmdlbm");
String[] xmxlbm =request.getParameterValues("xmxlbm");
String[] xmbh =request.getParameterValues("xmbh");
String[] xmmc =request.getParameterValues("xmmc");
String[] smbm =request.getParameterValues("smbm");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] bjstr =request.getParameterValues("bj");

String[] zcmc =request.getParameterValues("zcmc");
String[] zcgg =request.getParameterValues("zcgg");

String[] zcfstr =request.getParameterValues("zcf");
String[] clfstr =request.getParameterValues("clf");
String[] rgfstr =request.getParameterValues("rgf");
String[] jjfstr =request.getParameterValues("jjf");

String[] glfblstr =request.getParameterValues("glfbl");
String[] gycl =request.getParameterValues("gycl");
String[] cbenjstr =request.getParameterValues("cbenj");
String[] sgdbjstr =request.getParameterValues("sgdbj");

String[] sfxycl =request.getParameterValues("sfxycl");
String[] sfbxx =request.getParameterValues("sfbxx");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<xmbh.length ;i++ )
	{
		int count=0;
		
		//********************************+++++++++++++++++++++
		double bj=0;

		double zcf=0;//主材费
		double clf=0;
		double rgf=0;//人工费
		double jjf=0;//机械费
		double glfbl=0;//管理费百分比

		double cbenj=0;
		double sgdbj=0;


		sql=" select count(*)" ;
		sql+=" from bj_gzbjb " ;
		sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"'" ;
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
			out.println("错误！项目编号["+xmbh[i]+"]有多个");
			return;
		}
		else if (count==1)//首先删除
		{
			sql=" delete from bj_gzbjb " ;
			sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"'" ;
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}
		else{

			bj =Double.parseDouble(bjstr[i]);

			if (!zcfstr[i].equals(""))
			{
				zcf =Double.parseDouble(zcfstr[i]);
			}
			if (!clfstr[i].equals(""))
			{
				clf =Double.parseDouble(clfstr[i]);
			}
			if (!rgfstr[i].equals(""))
			{
				rgf =Double.parseDouble(rgfstr[i]);
			}
			if (!jjfstr[i].equals(""))
			{
				jjf =Double.parseDouble(jjfstr[i]);
			}
			if (!glfblstr[i].equals(""))
			{
				glfbl =Double.parseDouble(glfblstr[i]);
			}
			if (!cbenjstr[i].equals(""))
			{
				cbenj =Double.parseDouble(cbenjstr[i]);
			}
			if (!sgdbjstr[i].equals(""))
			{
				sgdbj =Double.parseDouble(sgdbjstr[i]);
			}

			
			sql ="insert into bj_gzbjb (dqbm,xmbh,bjjbbm,xmmc,xmdlbm,xmxlbm,smbm";
			sql+=" ,jldwbm,bj,zcmc,zcgg,zcf,clf,rgf,jjf,glfbl";
			sql+=" ,gycl,cbenj,sgdbj,bjlx,sfxycl,lrr,lrsj,shbz,xh,sfbxx)";
			sql+=" values('"+dqbm+"','"+xmbh[i]+"','"+bjjbbm+"','"+cf.GB2Uni(xmmc[i])+"','"+xmdlbm[i]+"','"+xmxlbm[i]+"','"+smbm[i]+"'";
			sql+=" ,'"+jldwbm[i]+"',"+bj+",'"+cf.GB2Uni(zcmc[i])+"','"+cf.GB2Uni(zcgg[i])+"',"+zcf+","+clf+","+rgf+","+jjf+","+glfbl;
			sql+=" ,'"+cf.GB2Uni(gycl[i])+"',"+cbenj+","+sgdbj+",'1','"+sfxycl[i]+"','"+yhdlm+"',TRUNC(SYSDATE),'Y',0,'"+sfbxx[i]+"')";
		//	out.println(sql);
			ps= conn.prepareStatement(sql);
			
			ps.executeUpdate();
			ps.close();
		}

		
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
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
