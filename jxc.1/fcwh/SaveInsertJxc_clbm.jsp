<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="xym" scope="page" class="jxc.xym.Xym"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=(String)session.getAttribute("ssfgs");

String ls=null;
String clbm=null;
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String scsmc=null;
	ls_sql=" select scsmc " ;
	ls_sql+=" from jxc_ppxx " ;
	ls_sql+=" where ppmc='"+ppmc+"' and pplb in('2','3')" ;//1：主材；2：辅材
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
	String nbbmsfwy=null;
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
		ls_sql+=" where  nbbm='"+nbbm+"' " ;
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

	//生成材料编码
	long count=0;
	ls_sql="select NVL(max(SUBSTR(clbm,3,11)),0)";
	ls_sql+=" from  jxc_clbm";
	ls_sql+=" where cllb='1'";//0：主材；1：辅材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getLong(1);
	}
	rs.close();
	ps.close();
	count++;

	clbm="FC"+cf.addZero(count,11);
	zp=clbm+".jpg";

	String cllb="1";//0：主材；1：辅材

	conn.setAutoCommit(false);

	ls_sql="insert into jxc_clbm ( clbm,nbbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,xh,gg   ,jldwbm,bzjldwbm,bzgg,cglb,cgzq,djzl,bzq,bztxq,clcd,clkd   ,clgd,zp,lrr,lrsj,lrbm,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,SYSDATE,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clbm);
	ps.setString(2,nbbm);
	ps.setString(3,clmc);
	ps.setString(4,cllb);
	ps.setString(5,cldlbm);
	ps.setString(6,clxlbm);
	ps.setString(7,scsmc);
	ps.setString(8,ppmc);
	ps.setString(9,xh);
	ps.setString(10,gg);

	ps.setString(11,jldwbm);
	ps.setString(12,bzjldwbm);
	ps.setLong(13,bzgg);
	ps.setString(14,cglb);
	ps.setLong(15,cgzq);
	ps.setDouble(16,djzl);
	ps.setLong(17,bzq);
	ps.setLong(18,bztxq);
	ps.setDouble(19,clcd);
	ps.setDouble(20,clkd);

	ps.setDouble(21,clgd);
	ps.setString(22,zp);
	ps.setString(23,lrr);
	ps.setString(24,lrbm);
	ps.setString(25,bz);
	ps.executeUpdate();
	ps.close();

/*
	//初始化材料价格明细（cl_jgmx）
	String dqbm=null;
	ls_sql="select dqbm ";
	ls_sql+=" from dm_dqbm ";
	ls_sql+=" order by dqbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dqbm=rs.getString(1);

		ls_sql=" insert into jxc_cljgb (clbm,dqbm,gysmc,sftjcp,sfyh,cbj,jsbl,jqpjcbj,lsj,xsj  ";
		ls_sql+=" ,dfgsjg,dgzjg,zxqdl,sfcy,cxhdbl,myqjf,sfycx,cxkssj,cxjzsj,cxj ";
		ls_sql+=" ,cxcbj,cxjsbl,lscxhdbl,cxmyqjf,xsfs,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
		ls_sql+=" ,lrr,lrsj,lrbm,ssfgs) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?   ,?,SYSDATE,?,? ) ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,clbm);
		ps1.setString(2,dqbm);
		ps1.setString(3,"0");
		ps1.setString(4,"N");
		ps1.setString(5,"Y");
		ps1.setDouble(6,0);
		ps1.setDouble(7,0);
		ps1.setDouble(8,0);
		ps1.setDouble(9,0);
		ps1.setDouble(10,0);

		ps1.setDouble(11,0);
		ps1.setDouble(12,0);
		ps1.setDouble(13,0);
		ps1.setString(14,"N");
		ps1.setDouble(15,0);
		ps1.setDouble(16,0);
		ps1.setString(17,"N");
		ps1.setString(18,"");
		ps1.setString(19,"");
		ps1.setDouble(20,0);

		ps1.setDouble(21,0);
		ps1.setDouble(22,0);
		ps1.setDouble(23,0);
		ps1.setDouble(24,0);
		ps1.setString(25,"1");
		ps1.setDouble(26,0);
		ps1.setDouble(27,0);
		ps1.setDouble(28,0);
		ps1.setDouble(29,0);
		ps1.setDouble(30,0);

		ps1.setString(31,lrr);
		ps1.setString(32,lrbm);
		ps1.setString(33,ssfgs);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

*/
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！生成材料编号[<%=clbm%>]");
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>