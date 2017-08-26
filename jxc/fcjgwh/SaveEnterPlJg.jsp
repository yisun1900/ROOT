<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String[] clbm =request.getParameterValues("clbm");
String[] dqbm =request.getParameterValues("dqbm");

double cbj=0;
double dgzjg=0;
double dfgsjg=0;
double xsj=0;

ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dfgsjg");
try{
	if (!(ls.equals("")))  dfgsjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dfgsjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[对分公司价格]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dgzjg");
try{
	if (!(ls.equals("")))  dgzjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dgzjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[对工长价格]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xsj");
try{
	if (!(ls.equals("")))  xsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[销售价]类型转换发生意外:"+e);
	return;
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
double cpbqj=0;

try {
	conn=cf.getConnection();    //得到连接

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		String nbbm=null;
		ls_sql="select nbbm";
		ls_sql+=" from  jxc_clbm";
		ls_sql+=" where clbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nbbm=rs.getString("nbbm");
		}
		rs.close();
		ps.close();

		for (int j=0;j<dqbm.length ;j++ )
		{
			ls_sql = " update jxc_cljgb set cbj="+cbj+",dfgsjg="+dfgsjg+",dgzjg="+dgzjg+",xsj="+xsj+",lrr='"+yhmc+"',lrbm='"+lrbm+"',lrsj=SYSDATE ";
			ls_sql+= " where dqbm='"+dqbm[j]+"' and clbm='"+clbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();


			//更新工料分析成本＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="update bj_jzglfxb set dj=? ";
			ls_sql+=" where glfxclbm='"+nbbm+"' and dqbm='"+dqbm[j]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,cbj);
			ps.executeUpdate();
			ps.close();

			String bjbbh=null;
			String getdqbm=null;
			String bjjbbm=null;
			String xmbh=null;
			ls_sql="select distinct bjbbh,dqbm,bjjbbm,xmbh";
			ls_sql+=" from  bj_jzglfxb";
			ls_sql+=" where glfxclbm='"+nbbm+"' and dqbm='"+dqbm[j]+"'";
			ls_sql+=" order by bjbbh,dqbm,bjjbbm,xmbh";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				bjbbh=rs1.getString("bjbbh");
				getdqbm=rs1.getString("dqbm");
				bjjbbm=rs1.getString("bjjbbm");
				xmbh=rs1.getString("xmbh");


				double clcb=0;//材料成本
				double rgcb=0;//人工成本
				double jxcb=0;//机械成本
				double cbenj=0;//成本价
				ls_sql="select ROUND(sum(dj*xhl),2)";
				ls_sql+=" from  bj_jzglfxb";
				ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+getdqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='1'";//1:材料
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					clcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="select ROUND(sum(dj*xhl),2)";
				ls_sql+=" from  bj_jzglfxb";
				ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+getdqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='2'";//2:人工
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					rgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="select ROUND(sum(dj*xhl),2)";
				ls_sql+=" from  bj_jzglfxb";
				ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+getdqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='3'";//3:机械
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					jxcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				cbenj=cf.round(clcb+rgcb+jxcb,2);

				ls_sql="update bj_jzbjb set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
				ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+getdqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,clcb);
				ps.setDouble(2,rgcb);
				ps.setDouble(3,jxcb);
				ps.setDouble(4,cbenj);
				ps.executeUpdate();
				ps.close();

				ls_sql="update bj_jzbjb1 set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
				ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+getdqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,clcb);
				ps.setDouble(2,rgcb);
				ps.setDouble(3,jxcb);
				ps.setDouble(4,cbenj);
				ps.executeUpdate();
				ps.close();
			}
			rs1.close();
			ps1.close();

			//更新工料分析成本＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		}
	}
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
