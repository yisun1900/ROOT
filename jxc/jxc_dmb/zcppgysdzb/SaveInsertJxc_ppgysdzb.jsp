<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ppbm=0;
String ppmc=null;
long gysbm=0;
String gysmc=null;
String ssfgs=null;
ls=request.getParameter("ppbm");
try{
	if (!(ls.equals("")))  ppbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ppbm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[子品牌编码]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gysbm");
try{
	if (!(ls.equals("")))  gysbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gysbm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[供应商编码]类型转换发生意外:"+e);
	return;
}
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));



String yhdlm=null;
String yhkl=null;
String yhmc=null;
String kdlxtbz=null;
long lxdlsbcs=0;
java.sql.Date mmxgsj=null;
long mmsyzq=0;
long yxdlsbcs=0;
String sfsd=null;

yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
yhkl=cf.GB2Uni(request.getParameter("yhkl"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
kdlxtbz=cf.GB2Uni(request.getParameter("kdlxtbz"));
ls=request.getParameter("mmsyzq");
try{
	if (!(ls.equals("")))  mmsyzq=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mmsyzq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[密码使用周期]类型转换发生意外:"+e);
	return;
}
if (mmsyzq==0)
{
	mmsyzq=360;
}
ls=request.getParameter("yxdlsbcs");
try{
	if (!(ls.equals("")))  yxdlsbcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yxdlsbcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[允许登陆失败次数]类型转换发生意外:"+e);
	return;
}
if (yxdlsbcs==0)
{
	yxdlsbcs=6;
}
sfsd=cf.GB2Uni(request.getParameter("sfsd"));


String sfyyh=null;
java.sql.Date yhkssj=null;
java.sql.Date yhjzsj=null;
sfyyh=request.getParameter("sfyyh");
ls=request.getParameter("yhkssj");
try{
	if (!(ls.equals("")))  yhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yhjzsj");
try{
	if (!(ls.equals("")))  yhjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠截至时间]类型转换发生意外:"+e);
	return;
}
String yhnr=cf.GB2Uni(request.getParameter("yhnr"));
double tcycf=0;
ls=request.getParameter("tcycf");
try{
	if (!(ls.equals("")))  tcycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tcycf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐远程费]类型转换发生意外:"+e);
	return;
}
String sfxcl=cf.GB2Uni(request.getParameter("sfxcl"));
String sfkgtcsl=cf.GB2Uni(request.getParameter("sfkgtcsl"));



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_ppgysdzb";
	ls_sql+=" where  yhdlm='"+yhdlm+"' and gysbm!='"+gysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！用户登陆名已存在");
		return;
	}
	else{
		ls_sql="select count(*)";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
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
			out.println("错误！[用户登录名]已被内部员工占用");
			return;
		}
	}

	String cllx=null;
	ls_sql="select gysmc,cllx ";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where gysbm='"+gysbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysmc=rs.getString("gysmc");
		cllx=rs.getString("cllx");
	}
	rs.close();
	ps.close();

	ls_sql="select ppmc ";
	ls_sql+=" from  jxc_ppxx";
	ls_sql+=" where ppbm='"+ppbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppmc=rs.getString("ppmc");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="delete from jxc_ppgysdzb ";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ls_sql+=" and  ppbm='"+ppbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jxc_ppgysdzb ( ppbm,ppmc,gysbm,gysmc,ssfgs ,yhdlm,yhkl,yhmc,kdlxtbz,lxdlsbcs,mmxgsj,mmsyzq,yxdlsbcs,sfsd,zcbljs  ,sfyyh,yhkssj,yhjzsj,yhnr,tcycf,sfxcl,sfkgtcs,cllx) ";
	ls_sql+=" values ( ?,?,?,?,?   ,?,?,?,?,?,SYSDATE,?,?,?,'N'   ,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,ppbm);
	ps.setString(2,ppmc);
	ps.setLong(3,gysbm);
	ps.setString(4,gysmc);
	ps.setString(5,ssfgs);

	ps.setString(6,yhdlm);
	ps.setString(7,yhkl);
	ps.setString(8,yhmc);
	ps.setString(9,kdlxtbz);
	ps.setLong(10,lxdlsbcs);
	ps.setLong(11,mmsyzq);
	ps.setLong(12,yxdlsbcs);
	ps.setString(13,sfsd);

	ps.setString(14,sfyyh);
	ps.setDate(15,yhkssj);
	ps.setDate(16,yhjzsj);
	ps.setString(17,yhnr);
	ps.setDouble(18,tcycf);
	ps.setString(19,sfxcl);
	ps.setString(20,sfkgtcsl);
	ps.setString(21,cllx);

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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>