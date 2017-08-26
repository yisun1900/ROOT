<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String bjjb=request.getParameter("bjjb");
String jzbz=request.getParameter("jzbz");
String dqbm=request.getParameter("dqbm");
String[] xmbh=request.getParameterValues("xmbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
long xh=0;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  bj_bjxmmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	int xmpx=0;//项目排序
	ls_sql="select NVL(max(xmpx)+1,1)";
	ls_sql+=" from  bj_bjxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmpx=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);
	for (int i=0;i<xmbh.length ;i++ )
	{
		ls_sql="select count(*)";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("错误！项目编号【"+xmbh[i]+"】已存在");
			return;
		}

		String ckxm=null;
		String bjlx=null;
		String xmmc=null;
		String xmdlbm=null;
		String xmxlbm=null;

		ls_sql="select ckxm,bjlx,xmmc,xmdlbm,xmxlbm";
		ls_sql+=" from  bj_gzbjb";
		ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ckxm=rs.getString("ckxm");
			bjlx=rs.getString("bjlx");
			xmmc=rs.getString("xmmc");
			xmdlbm=rs.getString("xmdlbm");
			xmxlbm=rs.getString("xmxlbm");
		}
		rs.close();
		ps.close();

		ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,gycl,dqbm,bjjb,bjlx,xmlx,cbenj,sgdbj,jzbz,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,ckxm,xmpx,sfxycl ) ";

		if (bjjb.equals("A"))//A:普通;B:精品;C:乐华梅兰
		{
			ls_sql+=" select ?,?,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,abj,agycl,dqbm,?,bjlx,'1',cbenj,sgdbj,'2',azcmc,azcgg,azcf,aclf,argf,ajjf,aglfbl,ckxm,?,sfxycl";
		}
		else if (bjjb.equals("B"))
		{
			ls_sql+=" select ?,?,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,bbj,bgycl,dqbm,?,bjlx,'1',cbenj,sgdbj,'2',bzcmc,bzcgg,bzcf,bclf,brgf,bjjf,bglfbl,ckxm,?,sfxycl";
		}
		else if (bjjb.equals("C"))
		{
			ls_sql+=" select ?,?,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cbj,cgycl,dqbm,?,bjlx,'1',cbenj,sgdbj,'2',czcmc,czcgg,czcf,cclf,crgf,cjjf,cglfbl,ckxm,?,sfxycl";
		}
		
		ls_sql+=" from bj_gzbjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xh);
		ps.setString(2,khbh);
		ps.setString(3,bjjb);
		ps.setInt(4,xmpx);
		ps.executeUpdate();
		ps.close();

		//客户工料分析表（bj_khglfxb）
		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj) ";
			ls_sql+=" select ?,glbxh,dqbm,xmbh,?,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj";
			ls_sql+=" from bj_gzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,bjjb);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj) ";
			ls_sql+=" select ?,glbxh,?,?,?,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj";
			ls_sql+=" from bj_gzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,dqbm);
			ps.setString(3,xmbh[i]);
			ps.setString(4,bjjb);
			ps.executeUpdate();
			ps.close();
		}

		xh++;
		xmpx++;
	}

	//修改：是否做电子报价
	ls_sql="update crm_zxkhxx set sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>