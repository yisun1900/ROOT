<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>

<%

String khbh=request.getParameter("khbh");
String gdjsjlh=request.getParameter("gdjsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String zjxxh=null;
String dqbm=null;
String xmbh=null;
String bjjbbm=null;
String ckxm=null;
String bjlx=null;
String jzbz=null;

try {
	conn=cf.getConnection();

	ls_sql="select dqbm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	ls_sql=" delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="select xmbh,bj_bjxmmx.bjjb,ckxm,bjlx,bj_bjxmmx.jzbz";
	ls_sql+=" from  bj_bjxmmx";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" order by xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmbh=rs1.getString("xmbh");
		bjjbbm=rs1.getString("bjjb");
		ckxm=rs1.getString("ckxm");
		bjlx=rs1.getString("bjlx");
		jzbz=rs1.getString("jzbz");


		//客户工料分析表（bj_khglfxb）
		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
			ls_sql+=" select ?,glbxh,dqbm,xmbh,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
			ls_sql+=" select ?,glbxh,?,?,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,'Y'";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' and bjjbbm='"+bjjbbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,dqbm);
			ps.setString(3,xmbh);
			ps.executeUpdate();
			ps.close();
		}
	}
	rs1.close();
	ps1.close();


	ls_sql=" delete from bj_khglfxbq ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	ls_sql="select zjxxh,xmbh,bjjb,ckxm,bjlx,jzbz";
	ls_sql+=" from  bj_bjxmmxq";
	ls_sql+=" where bj_bjxmmxq.khbh='"+khbh+"'";
	ls_sql+=" order by zjxxh,xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		zjxxh=rs1.getString("zjxxh");
		xmbh=rs1.getString("xmbh");
		bjjbbm=rs1.getString("bjjb");
		ckxm=rs1.getString("ckxm");
		bjlx=rs1.getString("bjlx");
		jzbz=rs1.getString("jzbz");

		//客户工料分析表（bj_khglfxbq）
		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			ls_sql="insert into bj_khglfxbq (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
			ls_sql+=" select ?,?,glbxh,dqbm,xmbh,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zjxxh);
			ps.setString(2,khbh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into bj_khglfxbq (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
			ls_sql+=" select ?,?,glbxh,?,?,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,'Y'";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' and bjjbbm='"+bjjbbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zjxxh);
			ps.setString(2,khbh);
			ps.setString(3,dqbm);
			ps.setString(4,xmbh);
			ps.executeUpdate();
			ps.close();
		}
	}
	rs1.close();
	ps1.close();



	ls_sql=" delete from bj_khglfxbh ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="select zjxxh,xmbh,bjjb,ckxm,bjlx,jzbz";
	ls_sql+=" from  bj_bjxmmxh";
	ls_sql+=" where bj_bjxmmxh.khbh='"+khbh+"'";
	ls_sql+=" order by zjxxh,xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		zjxxh=rs1.getString("zjxxh");
		xmbh=rs1.getString("xmbh");
		bjjbbm=rs1.getString("bjjb");
		ckxm=rs1.getString("ckxm");
		bjlx=rs1.getString("bjlx");
		jzbz=rs1.getString("jzbz");

		//客户工料分析表（bj_khglfxbh）
		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
			ls_sql+=" select ?,?,glbxh,dqbm,xmbh,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zjxxh);
			ps.setString(2,khbh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
			ls_sql+=" select ?,?,glbxh,?,?,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,'Y'";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' and bjjbbm='"+bjjbbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zjxxh);
			ps.setString(2,khbh);
			ps.setString(3,dqbm);
			ps.setString(4,xmbh);
			ps.executeUpdate();
			ps.close();
		}

	}
	rs1.close();
	ps1.close();

	ls_sql=" delete from cw_dejsmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_gdjsjl set jsjd='0'";
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("更新完成！请重做定额结算");
	window.close();
	//-->
	</SCRIPT>
	<%

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>
