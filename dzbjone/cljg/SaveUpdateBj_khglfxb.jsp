<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>

<%

String dqbm=request.getParameter("dqbm");
String cjfw=request.getParameter("cjfw");
String getkhbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String khbh=null;
String bjbbh=null;
String xmbh=null;
String bjjbbm=null;
String ckxm=null;
String bjlx=null;
String jzbz=null;

try {
	conn=cf.getConnection();

	if (cjfw.equals("0"))
	{
		ls_sql="select khbh";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where zxzt in('0','1','2','5')";
		ls_sql+=" and ssfgs in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')";
	}
	else if (cjfw.equals("1"))
	{
		ls_sql="select khbh";
		ls_sql+="  FROM crm_khxx";
		ls_sql+=" where crm_khxx.gcjdbm in('1') and fgsbh in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')";
	}
	else if (cjfw.equals("2"))
	{
		ls_sql="select khbh";
		ls_sql+="  FROM crm_khxx";
		ls_sql+=" where crm_khxx.gcjdbm in('1','2') and fgsbh in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')";
	}
	else if (cjfw.equals("3"))
	{
		ls_sql="select khbh";
		ls_sql+="  FROM crm_khxx";
		ls_sql+=" where (crm_khxx.gdjsjd='0' or crm_khxx.gdjsjd is null) and fgsbh in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')";
	}
	else if (cjfw.equals("4"))
	{
		ls_sql="select khbh";
		ls_sql+="  FROM crm_zxkhxx";
		ls_sql+=" where khbh='"+getkhbh+"'";
	}
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		khbh=rs2.getString("khbh");

		ls_sql=" delete from bj_khglfxb ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="select bjbbh";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bjbbh=rs1.getString("bjbbh");
		}
		rs1.close();
		ps1.close();

		ls_sql="select xmbh,bj_bjxmmx.bjjb";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bjlx='1'";//1:标准项目;2:自定义项目
		ls_sql+=" order by xmbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			xmbh=rs1.getString("xmbh");
			bjjbbm=rs1.getString("bjjb");


			//客户工料分析表（bj_khglfxb）
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb1 ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
		
		}
		rs1.close();
		ps1.close();
	}
	rs2.close();
	ps2.close();

	out.println("更新完成");

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>
