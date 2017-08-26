<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String nbbm=null;
String tccpdlbm=null;
String tccplbbm=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String xdjldw=null;
double xdb=0;
double sh=0;
String sfxclxs=null;
double yjsj=0;
double ykhxsdj=0;
double ysgddj=0;
double jsj=0;
double khxsdj=0;
double sgddj=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String lx=null;
String sfyx=null;
java.sql.Date yxkssj=null;
java.sql.Date yxjzsj=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
nbbm=cf.GB2Uni(request.getParameter("nbbm"));
tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
cpmc=cf.GB2Uni(request.getParameter("cpmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
xdjldw=cf.GB2Uni(request.getParameter("xdjldw"));
ls=request.getParameter("xdb");
try{
	if (!(ls.equals("")))  xdb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xdb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下单比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sh");
try{
	if (!(ls.equals("")))  sh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[损耗]类型转换发生意外:"+e);
	return;
}
sfxclxs=cf.GB2Uni(request.getParameter("sfxclxs"));
ls=request.getParameter("yjsj");
try{
	if (!(ls.equals("")))  yjsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ykhxsdj");
try{
	if (!(ls.equals("")))  ykhxsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ykhxsdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原客户销售单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ysgddj");
try{
	if (!(ls.equals("")))  ysgddj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ysgddj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原施工队单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsj");
try{
	if (!(ls.equals("")))  jsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khxsdj");
try{
	if (!(ls.equals("")))  khxsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khxsdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户销售单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgddj");
try{
	if (!(ls.equals("")))  sgddj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sgddj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队单价]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
lx=cf.GB2Uni(request.getParameter("lx"));
sfyx=cf.GB2Uni(request.getParameter("sfyx"));
ls=request.getParameter("yxkssj");
try{
	if (!(ls.equals("")))  yxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxkssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yxjzsj");
try{
	if (!(ls.equals("")))  yxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxjzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效结束时间]类型转换发生意外:"+e);
	return;
}
String bzmc=cf.GB2Uni(request.getParameter("bzmc"));

String[] getbjjbbm=request.getParameterValues("getbjjbbm");
String[] ysjsfjStr=request.getParameterValues("ysjsfj");
String[] sjsfjStr=request.getParameterValues("sjsfj");
String[] sfdz=request.getParameterValues("sfdz");
String[] dzkssjStr=request.getParameterValues("dzkssj");
String[] dzjzsjStr=request.getParameterValues("dzjzsj");
String[] dzsjsfjStr=request.getParameterValues("dzsjsfj");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//生成材料编码
	String cpbm=null;
	int count=0;
	ls_sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
	ls_sql+=" from  tc_csrjzck";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	count++;

	cpbm="TC"+cf.addZero(count,11);
	
	conn.setAutoCommit(false);

	ls_sql="insert into tc_csrjzck ( cpbm,dqbm,bjjbbm,nbbm,tccpdlbm,tccplbbm,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,yjsj,ykhxsdj,ysgddj,jsj,khxsdj,sgddj,lrr,lrsj,bz,lx,sfyx,yxkssj,yxjzsj,bzmc ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cpbm);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,nbbm);
	ps.setString(5,tccpdlbm);
	ps.setString(6,tccplbbm);
	ps.setString(7,cpmc);
	ps.setString(8,xh);
	ps.setString(9,gg);
	ps.setString(10,ppmc);
	ps.setString(11,gysmc);
	ps.setString(12,jldw);
	ps.setString(13,xdjldw);
	ps.setDouble(14,xdb);
	ps.setDouble(15,sh);
	ps.setString(16,sfxclxs);
	ps.setDouble(17,yjsj);
	ps.setDouble(18,ykhxsdj);
	ps.setDouble(19,ysgddj);
	ps.setDouble(20,jsj);
	ps.setDouble(21,khxsdj);
	ps.setDouble(22,sgddj);
	ps.setString(23,lrr);
	ps.setDate(24,lrsj);
	ps.setString(25,bz);
	ps.setString(26,lx);
	ps.setString(27,sfyx);
	ps.setDate(28,yxkssj);
	ps.setDate(29,yxjzsj);
	ps.setString(30,bzmc);
	ps.executeUpdate();
	ps.close();


	for (int i=0;i<getbjjbbm.length ;i++ )
	{
		ls_sql="delete from tc_csrjzcsjcjb ";
		ls_sql+=" where cpbm='"+cpbm+"' and bjjbbm='"+getbjjbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		double ysjsfj=0;
		if (!ysjsfjStr[i].trim().equals(""))
		{
			try{
				ysjsfj=Double.parseDouble(ysjsfjStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[原升级收费价]不是数字:"+ysjsfjStr[i]);
				return;
			}
		}

		double sjsfj=0;
		if (!sjsfjStr[i].trim().equals(""))
		{
			try{
				sjsfj=Double.parseDouble(sjsfjStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[升级收费价]不是数字:"+sjsfjStr[i]);
				return;
			}
		}

		double dzsjsfj=0;
		if (!dzsjsfjStr[i].trim().equals(""))
		{
			try{
				dzsjsfj=Double.parseDouble(dzsjsfjStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[打折升级收费价]不是数字:"+sjsfjStr[i]);
				return;
			}
		}

		java.sql.Date dzkssj=null;
		try{
			if (!(dzkssjStr[i].equals(""))) dzkssj=java.sql.Date.valueOf(dzkssjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[打折开始时间]不是日期格式:"+dzkssjStr[i]);
			return;
		}

		java.sql.Date dzjzsj=null;
		try{
			if (!(dzjzsjStr[i].equals(""))) dzjzsj=java.sql.Date.valueOf(dzjzsjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[打折结束时间]不是日期格式:"+dzjzsjStr[i]);
			return;
		}

		if (sfdz[i].equals("1"))//1：无折扣；2：打折
		{
			dzkssj=null;
			dzjzsj=null;
			dzsjsfj=0;
		}
		else{
			if (dzkssj==null)
			{
				conn.rollback();
				out.println("<BR>错误！未录入[打折开始时间]");
				return;
			}
			if (dzjzsj==null)
			{
				conn.rollback();
				out.println("<BR>错误！未录入[打折结束时间]");
				return;
			}
		}

		if (sjsfj>0)
		{
			ls_sql="insert into tc_csrjzcsjcjb ( cpbm,bjjbbm,ysjsfj,sjsfj,sfdz,dzkssj,dzjzsj,dzsjsfj) ";
			ls_sql+=" values (?,?,?,?,?,?,?,? )";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,cpbm);
			ps.setString(2,getbjjbbm[i]);
			ps.setDouble(3,ysjsfj);
			ps.setDouble(4,sjsfj);
			ps.setString(5,sfdz[i]);
			ps.setDate(6,dzkssj);
			ps.setDate(7,dzjzsj);
			ps.setDouble(8,dzsjsfj);
			ps.executeUpdate();
			ps.close();
		}
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>