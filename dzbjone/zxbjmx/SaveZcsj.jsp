<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

String khbjjbbm=cf.GB2Uni(request.getParameter("khbjjbbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String sjsfycx=cf.GB2Uni(request.getParameter("sjsfycx"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
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

	int count=0;

	String bjbbh=null;
	String ssfgs=null;
	String hxbm=null;
	ls_sql="select bjbbh,ssfgs,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	//套餐升级数量限制
	int sjslmax=0;
	ls_sql="select sl";
	ls_sql+=" from  bj_tcsjslxz";
	ls_sql+=" where fgsbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjslmax=rs.getInt("sl");
	}
	rs.close();
	ps.close();


	String getsjsfycx=null;
	String cxkssj=null;
	String cxjssj=null;
	double sjcj=0;
	double cxsjcj=0;

	ls_sql="SELECT sjsfycx,sjcj,cxsjcj,cxkssj,cxjssj";
	ls_sql+=" FROM bj_tcsjcjb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsjsfycx=cf.fillNull(rs.getString("sjsfycx"));
		sjcj=rs.getDouble("sjcj");
		cxsjcj=rs.getDouble("cxsjcj");
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
	}
	rs.close();
	ps.close();

	if (getsjsfycx==null)
	{
		out.println("错误！没有升级差价，请联系管理员:"+ls_sql);
		return;
	}

	if (getsjsfycx.equals("2") || getsjsfycx.equals("3"))//判断是否过期
	{
		if (cxkssj.compareTo(cf.today())>0)//未开始
		{
			getsjsfycx="1";
		}

		if (cxjssj.compareTo(cf.today())<0)//已结束
		{
			getsjsfycx="1";
		}
	}

 	if (getsjsfycx.equals("3"))//1：无促销；2：无数量限制促销；3：有数量限制促销
	{
		if (sjsfycx.equals(bjjbbm))//表示客户选择了优惠
		{
			sjsfycx="3";//1：无促销；2：无数量限制促销；3：有数量限制促销
		}
		else
		{
			sjsfycx="1";
		}
	}
	else{
		sjsfycx=getsjsfycx;
	}

 
	if (sjsfycx.equals("2") || sjsfycx.equals("3"))//有促销，取促销升级差价
	{
		sjcj=cxsjcj;
	}

	conn.setAutoCommit(false);

	//删除已选主材
	ls_sql=" delete from  bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
    ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//客户品牌升级差价表（bj_khppsjcjb）
	ls_sql=" delete from bj_khppsjcjb "; 
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
    ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update  bj_khzcxmxj set bjjbbm='"+bjjbbm+"',sjsfycx='"+sjsfycx+"'";
	ls_sql+=" ,sjsl=0,sjjshsl=0,sjsfsl=0,sjcj="+sjcj+",sjsfje=0";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" update  bj_khzcxmxj set sjcj=0,sjsfycx='1'";//1：无促销；2：无数量限制促销；3：有数量限制促销
	ls_sql+=" where khbh='"+khbh+"' and sfyxsj='N'";//升级是否收费  Y：是；N：否
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	
	int cxsl=0;
	ls_sql="select count(distinct tcsjflbm)";
	ls_sql+=" from  bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and sjsfycx='3'";//1：无促销；2：无数量限制促销；3：有数量限制促销
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (cxsl>sjslmax)
	{
		conn.rollback();
		out.println("错误！最多同时有["+sjslmax+"项]升级可享受折扣，目前客户已有["+cxsl+"]项升级打折，已超出限制");
		return;
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
	out.print("Exception: " + e);
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
		if (ps2!= null) ps2.close(); 
		if (rs2!= null) rs2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>