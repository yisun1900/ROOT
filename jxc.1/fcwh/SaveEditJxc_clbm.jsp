<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String clmc=null;
String cglb=null;

String ppmc=null;

String xh=null;
String gg=null;

String jldwbm=null;
String wkcxs=null;

double djzl=0;
long bzq=0;
long bztxq=0;
String sfbhpj="N";


String cd=null;
String zp=null;
String nbbmsfwy=null;
long cgzq=0;
double clcd=0;
double clkd=0;
double clgd=0;
long bzgg=0;
String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
String lrbm=null;;
String bz=null;
String nbbm=null;
nbbm=cf.GB2Uni(request.getParameter("nbbm"));
clmc=cf.GB2Uni(request.getParameter("clmc"));

ppmc=cf.GB2Uni(request.getParameter("ppmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));

ls=request.getParameter("bzgg");
try{
	if (!(ls.equals("")))  bzgg=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzgg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[包装规格]类型转换发生意外:"+e);
	return;
}
if (bzgg<1)
{
	out.println("<BR>包装规格必须大于等于1");
	return;
}
ls=request.getParameter("djzl");
try{
	if (!(ls.equals("")))  djzl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djzl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单件重量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clcd");
try{
	if (!(ls.equals("")))  clcd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clcd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[长]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clkd");
try{
	if (!(ls.equals("")))  clkd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clkd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[宽]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clgd");
try{
	if (!(ls.equals("")))  clgd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clgd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[高]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bzq");
try{
	if (!(ls.equals("")))  bzq=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>bzq");
	return;
}
catch (Exception e){
	out.println("<BR>[保质期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bztxq");
try{
	if (!(ls.equals("")))  bztxq=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bztxq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[保质提醒期]类型转换发生意外:"+e);
	return;
}
cglb=cf.GB2Uni(request.getParameter("cglb"));
cd=cf.GB2Uni(request.getParameter("cd"));
ls=request.getParameter("cgzq");
try{
	if (!(ls.equals("")))  cgzq=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cgzq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[采购周期]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String cldlbm=cf.GB2Uni(request.getParameter("cldlbm"));
String clxlbm=cf.GB2Uni(request.getParameter("clxlbm"));
String bzjldwbm=cf.GB2Uni(request.getParameter("bzjldwbm"));

String clbm=request.getParameter("clbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String scsmc=null;
	ls_sql=" select scsmc " ;
	ls_sql+=" from jxc_ppxx " ;
	ls_sql+=" where ppmc='"+ppmc+"' and pplb='2'" ;//1：主材；2：辅材
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		scsmc=cf.fillNull(rs.getString("scsmc"));
	}
	else
	{
		rs.close();
		ps.close();
		out.println("<BR>！！！错误，不存在的[子品牌]："+ppmc+"！");
		return;
	}
	rs.close();
	ps.close();


	//检查系统初始化内容
	ls_sql=" select nbbmsfwy " ;
	ls_sql+=" from jxc_xtcsh " ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		nbbmsfwy=cf.fillNull(rs.getString("nbbmsfwy"));
	}
	else
	{
		rs.close();
		ps.close();
		out.println("<BR>！！！错误，您还没有对系统进行初始化，请先初始化系统！");
		return;
	}
	rs.close();
	ps.close();

	//查询内部编码
	if (nbbmsfwy.equals("Y"))//Y：唯一；N：不唯一；M：不启用
	{
		if (nbbm.equals(""))
		{
			out.println("<BR>！！错误，[内部编码]不能为空");
			return;
		}

		ls_sql=" select nbbm " ;
		ls_sql+=" from jxc_clbm " ;
		ls_sql+=" where  nbbm='"+nbbm+"' and clbm!='"+clbm+"' " ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			out.println("<BR>！！！错误，[内部编码]已经存在");
			rs.close();
			ps.close();
			return;
		}
		rs.close();
		ps.close();
	}
	else if (nbbmsfwy.equals("N"))//Y：唯一；N：不唯一；M：不启用
	{
		if (nbbm.equals(""))
		{
			out.println("<BR>！！错误，[内部编码]不能为空");
			return;
		}
	}

	String oldnbbm="";
	ls_sql=" select nbbm " ;
	ls_sql+=" from jxc_clbm " ;
	ls_sql+=" where  clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		oldnbbm=cf.fillNull(rs.getString("nbbm"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	String cllb="1";//0：主材；1：辅材

	ls_sql="update jxc_clbm set nbbm=?,clmc=?,cllb=?,cldlbm=?,clxlbm=?,scsmc=?,ppmc=?,xh=?,gg=?,jldwbm=?   ,bzjldwbm=?,bzgg=?,cglb=?,cgzq=?,djzl=?,bzq=?,bztxq=?,clcd=?,clkd=?,clgd=?  ,lrr=?,lrsj=SYSDATE,lrbm=?,bz=? ";
	ls_sql+=" where  clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,nbbm);
	ps.setString(2,clmc);
	ps.setString(3,cllb);
	ps.setString(4,cldlbm);
	ps.setString(5,clxlbm);
	ps.setString(6,scsmc);
	ps.setString(7,ppmc);
	ps.setString(8,xh);
	ps.setString(9,gg);
	ps.setString(10,jldwbm);

	ps.setString(11,bzjldwbm);
	ps.setLong(12,bzgg);
	ps.setString(13,cglb);
	ps.setLong(14,cgzq);
	ps.setDouble(15,djzl);
	ps.setLong(16,bzq);
	ps.setLong(17,bztxq);
	ps.setDouble(18,clcd);
	ps.setDouble(19,clkd);
	ps.setDouble(20,clgd);

	ps.setString(21,lrr);
	ps.setString(22,lrbm);
	ps.setString(23,bz);
	ps.executeUpdate();
	ps.close();

	//更新工料分析＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="update bj_jzglfxb set glfxclbm=?,glfxclmc=?,jldwbm=? ";
	ls_sql+=" where glfxclbm='"+oldnbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,nbbm);
	ps.setString(2,clmc);
	ps.setString(3,jldwbm);
	ps.executeUpdate();
	ps.close();
	
	//修改jxc_ckthd
	ls_sql=" update jxc_ckthd set gg='"+gg+"',xh='"+xh+"' where clbm='"+clbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//修改jxc_clbm
	ls_sql=" update jxc_clbm set gg='"+gg+"',xh='"+xh+"' where clbm='"+clbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//修改jxc_kcb
	ls_sql=" update jxc_kcb set gg='"+gg+"',xh='"+xh+"' where clbm='"+clbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//修改jxc_kcpdmx
	ls_sql=" update jxc_kcpdmx set gg='"+gg+"',xh='"+xh+"' where clbm='"+clbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//修改jxc_gysddmx
	ls_sql=" update jxc_gysddmx set gg='"+gg+"',xh='"+xh+"' where clbm='"+clbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//修改jxc_gysfhjlmx
	ls_sql=" update jxc_gysfhjlmx set gg='"+gg+"',xh='"+xh+"' where clbm='"+clbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//修改jxc_djjmx
	ls_sql=" update jxc_djjmx set clgg='"+gg+"' where cldlmc='"+clbm+"' ";
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
	out.print("<BR>出错:" + e);
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