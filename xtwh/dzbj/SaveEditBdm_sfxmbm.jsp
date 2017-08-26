<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sfxmbm=null;
String sfxmmc=null;
String sflx=null;
String sfbxx=null;
String sfjrqye=null;
String dqbm=null;
String bz=null;
sfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
sfxmmc=cf.GB2Uni(request.getParameter("sfxmmc"));
String dysfxmmc=cf.GB2Uni(request.getParameter("dysfxmmc"));
sflx=cf.GB2Uni(request.getParameter("sflx"));
sfbxx=cf.GB2Uni(request.getParameter("sfbxx"));
sfjrqye=cf.GB2Uni(request.getParameter("sfjrqye"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

double gdje=0;
ls=request.getParameter("gdje");
try{
	if (!(ls.equals("")))  gdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[固定金额]类型转换发生意外:"+e);
	return;
}
String jrsjbz=cf.GB2Uni(request.getParameter("jrsjbz"));
String jrglfbz=cf.GB2Uni(request.getParameter("jrglfbz"));
String sfkdz=cf.GB2Uni(request.getParameter("sfkdz"));
double zdzk=0;
ls=request.getParameter("zdzk");
try{
	if (!(ls.equals("")))  zdzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zdzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最低折扣]类型转换发生意外:"+e);
	return;
}

if (sfkdz.equals("N"))//N：不可打折；Y：可打折
{
	zdzk=10;
}

String sfxmlx=cf.GB2Uni(request.getParameter("sfxmlx"));
String sfcysgdjs=cf.GB2Uni(request.getParameter("sfcysgdjs"));
String jldw=cf.GB2Uni(request.getParameter("jldw"));
String sfxsq=cf.GB2Uni(request.getParameter("sfxsq"));
String sfssjf=cf.GB2Uni(request.getParameter("sfssjf"));

double cbjbfb=0;
ls=request.getParameter("cbjbfb");
try{
	if (!(ls.equals("")))  cbjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbjbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本价百分比]类型转换发生意外:"+e);
	return;
}
double sgcbjbfb=0;
ls=request.getParameter("sgcbjbfb");
try{
	if (!(ls.equals("")))  sgcbjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgcbjbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工成本价百分比]类型转换发生意外:"+e);
	return;
}
double gcjcbjbfb=0;
ls=request.getParameter("gcjcbjbfb");
try{
	if (!(ls.equals("")))  gcjcbjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gcjcbjbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程基础报价百分比]类型转换发生意外:"+e);
	return;
}
String sffqsk=cf.GB2Uni(request.getParameter("sffqsk"));
String cbjjsfs=cf.GB2Uni(request.getParameter("cbjjsfs"));
String sfjrhtjz=cf.GB2Uni(request.getParameter("sfjrhtjz"));
String sfjzsf=request.getParameter("sfjzsf");

String wheresfxmbm=cf.GB2Uni(request.getParameter("wheresfxmbm"));
String wheresdqbm=cf.GB2Uni(request.getParameter("wheresdqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (sfxmmc.indexOf("%")!=-1)
	{
		out.println("错误！项目名称不能含小写[%]，需转成汉字[％]");
		return;
	}


	String oldsfxmbm=null;
	String oldsfxmmc=null;
	ls_sql="select sfxmbm,sfxmmc";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where  sfxmbm='"+wheresfxmbm+"' and dqbm='"+wheresdqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldsfxmbm=rs.getString("sfxmbm");
		oldsfxmmc=rs.getString("sfxmmc");
	}
	rs.close();
	ps.close();

	int sl=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where sfxmbm='"+wheresfxmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  bj_sfxmmxq";
	ls_sql+=" where sfxmbm='"+wheresfxmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl+=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  bj_sfxmmxh";
	ls_sql+=" where sfxmbm='"+wheresfxmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl+=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (sl>0)
	{
		if (!oldsfxmbm.trim().equals(sfxmbm.trim()))
		{
			out.println("错误！项目已使用，不能改编码:"+oldsfxmbm+":"+sfxmbm);
			return;
		}

		if (!oldsfxmmc.equals(sfxmmc))
		{
			out.println("提醒！项目已使用，名称与编码一一对应，名称是否真的需要修改，请确认，否则会造成报价混乱");
		}
	}

	conn.setAutoCommit(false);

	ls_sql="update bdm_sfxmbm set sfxmbm=?,sfxmmc=?,dysfxmmc=?,sflx=?,sfbxx=?,sfjrqye=?,dqbm=?,bz=?,gdje=?,jrsjbz=?    ,jrglfbz=?,sfkdz=?,zdzk=?,sfxmlx=?,sfcysgdjs=?,jldw=?,sfxsq=?,sfssjf=?,cbjbfb=?,sgcbjbfb=?   ,gcjcbjbfb=?,sffqsk=?,cbjjsfs=?,sfjrhtjz=?,sfjzsf=? ";
	ls_sql+=" where  sfxmbm='"+wheresfxmbm+"' and dqbm='"+wheresdqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfxmbm);
	ps.setString(2,sfxmmc);
	ps.setString(3,dysfxmmc);
	ps.setString(4,sflx);
	ps.setString(5,sfbxx);
	ps.setString(6,sfjrqye);
	ps.setString(7,dqbm);
	ps.setString(8,bz);
	ps.setDouble(9,gdje);
	ps.setString(10,jrsjbz);

	ps.setString(11,jrglfbz);
	ps.setString(12,sfkdz);
	ps.setDouble(13,zdzk);
	ps.setString(14,sfxmlx);
	ps.setString(15,sfcysgdjs);
	ps.setString(16,jldw);
	ps.setString(17,sfxsq);
	ps.setString(18,sfssjf);
	ps.setDouble(19,cbjbfb);
	ps.setDouble(20,sgcbjbfb);

	ps.setDouble(21,gcjcbjbfb);
	ps.setString(22,sffqsk);
	ps.setString(23,cbjjsfs);
	ps.setString(24,sfjrhtjz);
	ps.setString(25,sfjzsf);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfbl set sfxmbm=?,dqbm=? ";
	ls_sql+=" where  sfxmbm='"+wheresfxmbm+"' and dqbm='"+wheresdqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfxmbm);
	ps.setString(2,dqbm);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	int count=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where dqbm='"+dqbm+"' and sfxmlx='6'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("<P>提醒！【工程税金】项目超过一项");
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where dqbm='"+dqbm+"' and sfxmlx='8'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("<P>提醒！【公司购主材税金】项目超过一项");
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where dqbm='"+dqbm+"' and sfxmlx='B'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("<P>提醒！【自购主材税金】项目超过一项");
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where dqbm='"+dqbm+"' and sfxmlx='5'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("<P>提醒！【工程管理费】项目超过一项");
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where dqbm='"+dqbm+"' and sfxmlx='7'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("<P>提醒！【公司购主材管理费】项目超过一项");
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where dqbm='"+dqbm+"' and sfxmlx='A'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("<P>提醒！【自购主材管理费】项目超过一项");
	}

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
	out.print("Exception: " + e);
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