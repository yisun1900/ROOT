<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

double sl=0;
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

double ysl=0;
ls=request.getParameter("ysl");
try{
	if (!(ls.equals("")))  ysl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ysl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原数量]类型转换发生意外:"+e);
	return;
}

double srdj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  srdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际单价]类型转换发生意外:"+e);
	return;
}

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String cpbm=cf.GB2Uni(request.getParameter("cpbm"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String oldsxh=cf.GB2Uni(request.getParameter("sxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	String khbh="";
	ls_sql="select sfwc,khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	String khbjjbbm=null;
	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbjjbbm=rs.getString("bjjb");
	}
	rs.close();
	ps.close();

	String sfxzsl="";
	double bzsl=0;
	String tcsjflbm="";
	String getbjjbbm="";
	ls_sql="select sfxzsl,bzsl,tcsjflbm,bjjbbm";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		getbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();

	if (!getbjjbbm.equals(bjjbbm))
	{
		out.println("错误！套餐报价级别与主材不正确，套餐报价级别["+getbjjbbm+"]，而选择主材级别["+bjjbbm+"]，请关掉录入窗口，重新打开");
		return;
	}

	String getcpbm="";
	String zclx="";
	String sfkgdj=null;
	String ppmc=null;
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql="select cpbm,zclx,sfkgdj,ppmc,sfxclxs,xdb,sh";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcpbm=rs.getString(1);
		zclx=cf.fillNull(rs.getString("zclx"));
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
	}
	rs.close();
	ps.close();
	
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

	String lx=null;//1：原项目；2：增项；3：减项；4：新增项
	if (sl>0)
	{
		lx="2";
	}
	else{
		lx="3";
	}

	long sxh=0;
	ls_sql="select NVL(max(sxh),0)";
	ls_sql+=" from  bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	sxh++;

	conn.setAutoCommit(false);

	//把原来[oldsxh]的增减项删除，重新插入，替代update
	ls_sql=" delete from bj_khzcxmh ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and oldsxh="+oldsxh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (sl!=0)
	{
		ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,oldsxh,lx) ";
		ls_sql+=" select                 ?  ,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,?     ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,'5',? ,?   ,ptcpsm,bjjbbm,sxh   ,? ";
		ls_sql+=" from bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setDouble(2,srdj);
		ps.setDouble(3,sl);
		ps.setDouble(4,xdsl);
		ps.setString(5,lx);//1：原项目；2：增项；3：减项；4：新增项
		ps.executeUpdate();
		ps.close();
	}

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