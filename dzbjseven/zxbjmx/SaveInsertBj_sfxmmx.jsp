<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String sfxmbm=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
sfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
double zqsfje=0;
ls=request.getParameter("zqsfje");
try{
	if (!(ls.equals("")))  zqsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqsfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收费金额]类型转换发生意外:"+e);
	return;
}
double dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String jldw=cf.GB2Uni(request.getParameter("jldw"));
double sfbfb=0;
ls=request.getParameter("sfbfb");
try{
	if (!(ls.equals("")))  sfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sfbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收费百分比]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	String ssfgs="";
	ls_sql="SELECT zxzt,ssfgs";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		ssfgs=rs.getString("ssfgs");
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


	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where  dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	if (dqbm==null || dqbm.equals(""))
	{
		out.println("错误！无地区编码");
		return;
	}

	String sflx=null;
	String sfbxx=null;
	String sfjrqye=null;
	String jrsjbz=null;
	String jrglfbz=null;
	String sfxmmc=null;
	String sfkdz=null;
	double zdzk=0;
	String sfxmlx=null;
	String sfcysgdjs=null;
	String sfssjf=null;
	double cbjbfb=0;
	double sgcbjbfb=0;
	double gcjcbjbfb=0;
	String sffqsk=null;
	String cbjjsfs=null;
	String sfjrhtjz=null;
	ls_sql="select sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfxmmc,sfkdz,zdzk,sfxmlx,sfcysgdjs,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where  dqbm='"+dqbm+"' and sfxmbm='"+sfxmbm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sflx=rs.getString("sflx");
		sfbxx=rs.getString("sfbxx");
		sfjrqye=rs.getString("sfjrqye");
		jrsjbz=rs.getString("jrsjbz");
		jrglfbz=rs.getString("jrglfbz");
		sfxmmc=rs.getString("sfxmmc");
		sfkdz=rs.getString("sfkdz");
		zdzk=rs.getDouble("zdzk");
		sfxmlx=rs.getString("sfxmlx");
		sfcysgdjs=rs.getString("sfcysgdjs");
		sfssjf=cf.fillNull(rs.getString("sfssjf"));
		cbjbfb=rs.getDouble("cbjbfb");
		sgcbjbfb=rs.getDouble("sgcbjbfb");
		gcjcbjbfb=rs.getDouble("gcjcbjbfb");
		sffqsk=cf.fillNull(rs.getString("sffqsk"));
		cbjjsfs=cf.fillNull(rs.getString("cbjjsfs"));
		sfjrhtjz=cf.fillNull(rs.getString("sfjrhtjz"));
	}
	rs.close();
	ps.close();



	conn.setAutoCommit(false);

	ls_sql="insert into bj_sfxmmx ( khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfbfb,zqsfje   ,dxzkl,sfje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,dj,jldw,sl,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,sfxmbm);
	ps.setString(3,sfxmmc);
	ps.setString(4,sflx);
	ps.setString(5,sfbxx);
	ps.setString(6,sfjrqye);
	ps.setString(7,jrsjbz);
	ps.setString(8,jrglfbz);
	ps.setDouble(9,sfbfb);
	ps.setDouble(10,zqsfje);

	ps.setDouble(11,10);
	ps.setDouble(12,zqsfje);
	ps.setString(13,bz);
	ps.setString(14,sfkdz);
	ps.setDouble(15,zdzk);
	ps.setString(16,sfxmlx);
	ps.setString(17,sfcysgdjs);
	ps.setDouble(18,dj);
	ps.setString(19,jldw);
	ps.setDouble(20,sl);
	ps.setString(21,sfssjf);
	ps.setDouble(22,cbjbfb);
	ps.setDouble(23,sgcbjbfb);
	ps.setDouble(24,gcjcbjbfb);
	ps.setString(25,sffqsk);
	ps.setString(26,cbjjsfs);
	ps.setString(27,sfjrhtjz);
	ps.executeUpdate();
	ps.close();


	//检查税金、管理费是否选择重复＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	int count=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"' and sfxmlx='6'";
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
//		conn.rollback();
//		out.println("<P>错误！【工程税金】项目超过一项");
//		return;
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"' and sfxmlx='8'";
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
		conn.rollback();
		out.println("<P>错误！【公司购主材税金】项目超过一项");
		return;
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"' and sfxmlx='B'";
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
		conn.rollback();
		out.println("<P>错误！【自购主材税金】项目超过一项");
		return;
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"' and sfxmlx='5'";
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
//		conn.rollback();
//		out.println("<P>错误！【工程管理费】项目超过一项");
//		return;
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"' and sfxmlx='7'";
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
		conn.rollback();
		out.println("<P>错误！【公司购主材管理费】项目超过一项");
		return;
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"' and sfxmlx='A'";
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
		conn.rollback();
		out.println("<P>错误！【自购主材管理费】项目超过一项");
		return;
	}
	//检查税金、管理费是否选择重复＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	
	

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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>