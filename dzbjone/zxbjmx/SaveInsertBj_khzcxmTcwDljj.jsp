<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String khbh=null;
String jgwzbm=null;
String cpbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
double sl=0;
String ptcpsm=null;
String bjjbbm=null;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
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

	double dj=0;
	double jsj=0;
	double jsbl=0;
	String sfycx="";
	String cxkssj="";
	String cxjssj="";
	double cxj=0;
	double cxjsj=0;
	double cxjsbl=0;
	String sfxclxs="";
	double xdb=0;
	double sh=0;

	ls_sql=" select dj,jsj,jsbl,sfycx,cxkssj,cxjssj,cxj,cxjsj,cxjsbl,sfxclxs,xdb,sh";
	ls_sql+=" from bj_tcwzck";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dj=rs.getDouble("dj");
		jsj=rs.getDouble("jsj");
		jsbl=rs.getDouble("jsbl");
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		cxj=rs.getDouble("cxj");
		cxjsj=rs.getDouble("cxjsj");
		cxjsbl=rs.getDouble("cxjsbl");
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
	}
	rs.close();
	ps.close();

	if (sfycx.equals("Y"))//Y：有促销；N：无促销
	{
		if (cxkssj.compareTo(cf.today())<=0 && cxjssj.compareTo(cf.today())>=0)
		{
			dj=cxj;
			jsj=cxjsj;
			jsbl=cxjsbl;
		}
		else{
			sfycx="N";
		}
	}

	double xdsl=0;
	if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
	{
		if (sl<0)
		{
			xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
		}
		else{
			xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
		}
	}
	else if (sfxclxs.equals("2"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
	{
		if (sl<0)
		{
			xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
		}
		else{
			xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
		}
	}
	else if (sfxclxs.equals("3"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
	{
		xdsl=cf.round(sl*xdb*(100+sh)/100,0);
	}
	else if (sfxclxs.equals("4"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
	{
		xdsl=cf.round(sl*xdb*(100+sh)/100,2);
	}

	long sxh=0;
	ls_sql="select NVL(max(sxh),0)";
	ls_sql+=" from  bj_khzcxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxh=rs.getLong(1);
	}
	rs.close();
	ps.close();


	ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj    ,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
	ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?        ,?     ,? ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
	ls_sql+=" from bj_tcwzck";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,sxh);
	ps.setString(2,khbh);
	ps.setString(3,jgwzbm);
	ps.setDouble(4,dj);
	ps.setDouble(5,dj);
	ps.setDouble(6,dj);
	ps.setDouble(7,jsj);
	ps.setDouble(8,jsbl);
	ps.setString(9,"4");//主材类型  1：套餐内；2：套餐外；3：升级大店；4：大店外
	ps.setDouble(10,sl);
	ps.setDouble(11,xdsl);
	ps.setString(12,ptcpsm);
	ps.setString(13,bjjbbm);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
		window.location="InsertBj_khzcxmTcwDljj.jsp?khbh=<%=khbh%>";
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("！！！存盘失败，请重新选择");
		window.close();
	//-->
	</SCRIPT>
	<%

	return;
}
finally 
{
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