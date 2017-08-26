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

String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));

String sxh=request.getParameter("sxh");
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	String ssfgs=null;
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
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();


	String tccpdlbm="";
	String tccplbbm="";
	String getcpbm="";
	String ppmc=null;
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	String lx="";
	ls_sql="select tccpdlbm,tccplbbm,cpbm,ppmc,sfxclxs,xdb,sh,lx";
	ls_sql+=" FROM tc_csrjkhzcqd";
	ls_sql+=" where sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		getcpbm=rs.getString("cpbm");
		ppmc=cf.fillNull(rs.getString("ppmc"));
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
		lx=cf.fillNull(rs.getString("lx"));
	}
	rs.close();
	ps.close();

	double sjjmsl=0;
	double zdsl=0;
	if (lx.equals("1") || lx.equals("2"))//1：标配；2：升级；3：套餐外
	{
		ls_sql="select sjjmsl,zdpms";
		ls_sql+=" FROM tc_csrjkhgmsjmj";
		ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjjmsl=rs.getDouble("sjjmsl");
			zdsl=rs.getDouble("zdpms");
		}
		rs.close();
		ps.close();

		if (sjjmsl>0)
		{
			out.println("已减免不能再选择，减免数量:"+sjjmsl);
			return;
		}
	}


	conn.setAutoCommit(false);

	double xdsl=sl;


	ls_sql=" update tc_csrjkhzcqd set sl=?,xdsl=?,ptcpsm=?,jgwzbm=?";
	ls_sql+=" where sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sl);
	ps.setDouble(2,xdsl);
	ps.setString(3,ptcpsm);
	ps.setString(4,jgwzbm);
	ps.executeUpdate();
	ps.close();


	double sjsl=0;//实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM tc_csrjkhzcqd";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update tc_csrjkhgmsjmj set sjpms="+sjsl;
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double tcnsl=0;//套餐内实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM tc_csrjkhzcqd";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and lx in('1','2')";//1：标配；2：升级；3：套餐外
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcnsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (zdsl>0)
	{
		if (tcnsl>zdsl)
		{
			conn.rollback();
			out.println("错误！不可超量，实际数量["+tcnsl+"]不能超过最大数量["+zdsl+"]");
			return;
		}
	}
	//客户主材小计汇总：＝＝＝＝＝＝＝＝＝＝＝＝结束

	

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