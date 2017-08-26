<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>项目任务管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
	String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int count=0;
String rwbm=null;
int changdu=0;
int jishu=0;
int jishucd=0;

try {
	conn=cf.getConnection();


	ls_sql="update crm_xmrwgl set changdu=length(rwmc)+1,jishu=1";
	ls_sql+="   where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//获取：级数＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="select rwbm,jishu ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+="   where khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		jishu=rs.getInt("jishu");

		int maxjishu=0;
		ls_sql="select max(crm_xmrwgl.jishu)+1 ";
		ls_sql+=" from  crm_xmrwljgx,crm_xmrwgl";
		ls_sql+=" where  crm_xmrwljgx.qzrwbm=crm_xmrwgl.rwbm and crm_xmrwljgx.rwbm='"+rwbm+"'";
		ls_sql+=" and  crm_xmrwgl.khbh='"+khbh+"'";
		ls_sql+=" and  crm_xmrwljgx.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			maxjishu=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (maxjishu==0)
		{
			maxjishu=1;
		}

		ls_sql="update crm_xmrwgl set jishu="+maxjishu;
		ls_sql+=" where  rwbm='"+rwbm+"' and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	//获取：级数＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成

	//级数间隔长度：处理前置、后置任务增加宽度，每个加2＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="select rwbm,jishu,changdu";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ls_sql+=" order by jishu";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=rs.getString("rwbm");
		jishu=rs.getInt("jishu");
		changdu=rs.getInt("changdu");


		//判断本级是否有前置任务
		ls_sql="select count(*)";
		ls_sql+=" from  crm_xmrwljgx";
		ls_sql+=" where  rwbm in(select rwbm from crm_xmrwgl where jishu="+jishu+" and khbh='"+khbh+"')";
		ls_sql+=" and  khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)//有加2
		{
			changdu+=2;
		}

		//判断本级是否有后置任务
		ls_sql="select count(*)";
		ls_sql+=" from  crm_xmrwljgx";
		ls_sql+=" where  qzrwbm in(select rwbm from crm_xmrwgl where jishu="+jishu+" and khbh='"+khbh+"')";
		ls_sql+=" and  khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)//有加2
		{
			changdu+=1;
		}

		ls_sql="update crm_xmrwgl set jgchangdu="+changdu;
		ls_sql+=" where  rwbm='"+rwbm+"'";
		ls_sql+=" and  khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	//级数间隔长度：处理前置、后置任务增加宽度，每个加2＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成

	//获取：级数长度＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="select rwbm,jishu ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		jishu=rs.getInt("jishu");

		int maxjgchangdu=0;
		ls_sql="select max(crm_xmrwgl.jgchangdu)";
		ls_sql+=" from  crm_xmrwgl";
		ls_sql+=" where  jishu="+jishu+" and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			maxjgchangdu=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ls_sql="update crm_xmrwgl set jishucd="+maxjgchangdu;
		ls_sql+=" where  rwbm='"+rwbm+"' and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	//获取：级数长度＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成




	//获取：每级累计宽度＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	int maxjishu=0;
	ls_sql="select max(crm_xmrwgl.jishu)";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		maxjishu=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//每级宽度
	int perjikd[]=new int[maxjishu];
	int row=0;
	ls_sql="select distinct jishu,jishucd";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ls_sql+=" order by jishu";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jishu=rs.getInt(1);
		jishucd=rs.getInt(2);

		perjikd[row]=jishucd;

		row++;
	}
	rs.close();
	ps.close();

	//获取：每级累计宽度＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成


	ls_sql="update crm_xmrwljgx set rwjs=(select jishu from crm_xmrwgl where crm_xmrwgl.rwbm=crm_xmrwljgx.rwbm and crm_xmrwgl.khbh='"+khbh+"')";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_xmrwljgx set qzrwjs=(select jishu from crm_xmrwgl where crm_xmrwgl.rwbm=crm_xmrwljgx.qzrwbm and crm_xmrwgl.khbh='"+khbh+"')";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<frameset rows="*" cols="450,*" frameborder="YES" border="0" framespacing="3"> 
  <frame name="menu" scrolling="YES" resize src="ViewSjCrm_xmrwgl1.jsp?khbh=<%=khbh%>">
  <frame name="menu" scrolling="YES" resize src="ViewSjCrm_xmrwgl2.jsp?khbh=<%=khbh%>">
</frameset>

<noframes>

<body bgcolor="#FFFFFF">
<noscript><iframe scr="*.htm"></iframe></noscript>
</body>
</noframes>
</html>
