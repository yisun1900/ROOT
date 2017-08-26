<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String[] xmbh=request.getParameterValues("xmbh");

String bjbbh=null;
String bjjb=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
long xh=0;
int count=0;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	String ssfgs=null;
	ls_sql="SELECT zxzt,bjbbh,bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		bjbbh=rs.getString("bjbbh");
		bjjb=rs.getString("bjjb");
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	double gcjcbjxs=0;//工程基础报价系数
	double sgcbbjxs=0;//施工成本报价系数 
	double cbbfb=0;//自定义项成本百分比 
	ls_sql="SELECT dqbm,gcjcbjxs,sgcbbjxs,cbbfb";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
		gcjcbjxs=rs.getDouble("gcjcbjxs");
		sgcbbjxs=rs.getDouble("sgcbbjxs");
		cbbfb=rs.getDouble("cbbfb");
	}
	rs.close();
	ps.close();

	if (gcjcbjxs==0)
	{
		out.println("错误！【工程基础报价系数】未初始化");
		return;
	}
	if (sgcbbjxs==0)
	{
		out.println("错误！【施工成本报价系数】未初始化");
		return;
	}


	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}


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
		count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			ls_sql="insert into bj_gclmx(khbh,dqbm,xmbh,jgwzbm,sl)";
			ls_sql+=" values('"+khbh+"','"+dqbm+"','"+xmbh[i]+"','"+jgwzbm+"',0) ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

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
		if (count>0)//项目已存在
		{
			continue;
		}

		double getgcjcbjxs=0;
		double getsgcbbjxs=0;
		/*ls_sql="select round(bj/sgdbj,2),round(sgcbj/sgdbj,2)";
		ls_sql+=" from  bj_zdyxmb";
		ls_sql+=" where lrr='"+yhdlm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			getgcjcbjxs=rs.getDouble(1);
			getsgcbbjxs=rs.getDouble(2);
		}
		rs.close();
		ps.close();
		if (getgcjcbjxs!=gcjcbjxs)
		{
			conn.rollback();
			out.println("错误！自定义项【"+xmbh[i]+"】工程基础报价系数为："+getgcjcbjxs+"与系统设置："+gcjcbjxs+"不一致");
			return;
		}
		if (getsgcbbjxs!=sgcbbjxs)
		{
			conn.rollback();
			out.println("错误！自定义项【"+xmbh[i]+"】施工成本报价系数为："+getsgcbbjxs+"与系统设置："+sgcbbjxs+"不一致");
			return;
		}*/

		ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj   ,jxdj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,zqdj,zk,dj,cbenj,sgdbj,sgcbj,sfyxdz,zdzk   ,gycl,flmcgg,bz,dqbm,bjjb,bjlx,xmlx    ,jzbz,xmpx,sfzgzc,sfbxx,zdyxmyxq,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
		ls_sql+=" select                   ?,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj   ,jxbj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,bj  ,10,bj,cbenj,sgdbj,sgcbj,'Y',0        ,gycl,flmcgg,bz,dqbm,?,'2','1'         ,'1',?,'N','4',zdyxmyxq,'"+yhdlm+"',SYSDATE,sfxycl,sfxyyjd,'N'";//1：需要；2：不需要
		ls_sql+=" from bj_zdyxmb ";
		ls_sql+=" where lrr='"+yhdlm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xh);
		ps.setString(2,khbh);
		ps.setString(3,bjjb);
		ps.setInt(4,xmpx);
		ps.executeUpdate();
		ps.close();


		xh++;
		xmpx++;

		ls_sql="delete from bj_khglfxb ";
		ls_sql+=" where khbh='"+khbh+"'  and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
		ls_sql+="                   select ?,glbxh,?,?        ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,NVL(wlllbz,'N'),lx ";
		ls_sql+=" from bj_zdyglfxb ";
		ls_sql+=" where xmlrr='"+yhdlm+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,dqbm);
		ps.setString(3,bjjb);
		ps.executeUpdate();
		ps.close();
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
//	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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