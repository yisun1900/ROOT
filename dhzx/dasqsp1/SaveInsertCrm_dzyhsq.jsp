<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String sqr=null;
java.sql.Date sqsj=null;
double sqzkl=0;
double sqzjxzkl=0;
String sfsqqtyh=null;
String sqqtyhnr=null;
String sqyysm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
sqr=cf.GB2Uni(request.getParameter("sqr"));
ls=request.getParameter("sqsj");
try{
	if (!(ls.equals("")))  sqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqzkl");
try{
	if (!(ls.equals("")))  sqzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直接费合同折扣]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqzjxzkl");
try{
	if (!(ls.equals("")))  sqzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqzjxzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直接费增减项折扣]类型转换发生意外:"+e);
	return;
}
sfsqqtyh=cf.GB2Uni(request.getParameter("sfsqqtyh"));
sqqtyhnr=cf.GB2Uni(request.getParameter("sqqtyhnr"));
sqyysm=cf.GB2Uni(request.getParameter("sqyysm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));

String[] sfxmbm =request.getParameterValues("sfxmbm");
String[] zdzkstr =request.getParameterValues("zdzk");
String[] sqdxzklstr =request.getParameterValues("sqdxzkl");
String zklx=cf.GB2Uni(request.getParameter("zklx"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	int js=0;//检查是否录入单项折扣

	if (sqzkl!=10)
	{
		js++;
	}

	if (sfxmbm!=null)
	{
		for (int i=0;i<sfxmbm.length ;i++ )
		{
			double zdzk=0;
			double sqdxzkl=0;

			if (sqdxzklstr[i].trim().equals(""))
			{
				continue;
			}

			try{
				zdzk=Double.parseDouble(zdzkstr[i]);
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[允许最低折扣]类型转换发生意外");
				return;
			}

			try{
				sqdxzkl=Double.parseDouble(sqdxzklstr[i]);
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[申请折扣]类型转换发生意外");
				return;
			}

			if (sqdxzkl<zdzk)
			{
				conn.rollback();
				out.println("错误！『申请折扣』不能小于『允许最低折扣』");
				return;
			}

			if (sqdxzkl<0 || sqdxzkl>10)
			{
				conn.rollback();
				out.println("错误！『申请折扣』只能在0和10之间");
				return;
			}
			else{
				if (sqdxzkl!=10)
				{
					js++;
				}
			}

			ls_sql="insert into crm_dxdzyh ( khbh,sfxmbm,sqdxzkl,spdxzkl)";
			ls_sql+=" values ( ?,?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,sfxmbm[i]);
			ps.setDouble(3,sqdxzkl);
			ps.setDouble(4,sqdxzkl);
			ps.executeUpdate();
			ps.close();
		}

	}


	if (js<1)
	{
		conn.rollback();
		out.println("<BR>错误！未录入任何单项折扣");
		return;
	}

	
	ls_sql="insert into crm_dzyhsq ( khbh,sqr,sqsj,sqzkl,sqzjxzkl,sfsqqtyh,sqqtyhnr,sqyysm,lrr,lrsj,lrbm,spbz,zklx ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,'1',? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,sqr);
	ps.setDate(3,sqsj);
	ps.setDouble(4,sqzkl);
	ps.setDouble(5,sqzjxzkl);
	ps.setString(6,sfsqqtyh);
	ps.setString(7,sqqtyhnr);
	ps.setString(8,sqyysm);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,lrbm);
	ps.setString(12,zklx);
	ps.executeUpdate();
	ps.close();

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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>