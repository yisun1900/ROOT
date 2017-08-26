<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kpxmbm=null;
String kpdlbm=null;
String kpjg=null;
String kpcfbm=null;
kpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));
kpdlbm=cf.GB2Uni(request.getParameter("kpdlbm"));
kpjg=cf.GB2Uni(request.getParameter("kpjg"));
kpcfbm=cf.GB2Uni(request.getParameter("kpcfbm"));
double sgdfk=0;
ls=request.getParameter("sgdfk");
try{
	if (!(ls.equals("")))  sgdfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdfk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[罚款]类型转换发生意外:"+e);
	return;
}
double kf=0;
ls=request.getParameter("kf");
try{
	if (!(ls.equals("")))  kf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣分]类型转换发生意外:"+e);
	return;
}
double kcjdebl=0;
ls=request.getParameter("kcjdebl");
try{
	if (!(ls.equals("")))  kcjdebl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kcjdebl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣除接单额百分比]类型转换发生意外:"+e);
	return;
}
int wzcs=0;
ls=request.getParameter("wzcs");
try{
	if (!(ls.equals("")))  wzcs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wzcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[违章次数]类型转换发生意外:"+e);
	return;
}

String bz=null;
bz=cf.GB2Uni(request.getParameter("bz"));

String wherexjjlh=null;
String wherekpxmbm=null;
wherexjjlh=cf.GB2Uni(request.getParameter("wherexjjlh"));
wherekpxmbm=cf.GB2Uni(request.getParameter("wherekpxmbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  kp_xjgdjl";
	ls_sql+=" where xjjlh='"+wherexjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	if (count==0)
	{
		out.println("存盘失败！检查记录号不存在，已被删除");
		return;
	}

	String cfspbz=null;
	ls_sql="select cfspbz";
	ls_sql+=" from  kp_xjgdjl";
	ls_sql+=" where xjjlh='"+wherexjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cfspbz=rs.getString("cfspbz");
	}
	rs.close();
	ps.close();
	if (!cfspbz.equals("1") && !cfspbz.equals("2"))//1：不需审批；2：未审批；3：审批通过；4：审批未通过
	{
		out.println("存盘失败！该施工队检查记录已审批");
		return;
	}

	count=0;
	if (!wherekpxmbm.equals(kpxmbm))//改变检查项目
	{
		ls_sql="select count(*)";
		ls_sql+=" from  kp_xjgdmx";
		ls_sql+=" where xjjlh='"+wherexjjlh+"' and kpxmbm='"+kpxmbm+"' ";
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
			out.println("存盘失败！该检查项目已录入");
			return;
		}
	}
	
	conn.setAutoCommit(false);
	
	ls_sql="update kp_xjgdmx set kpxmbm=?,kpdlbm=?,kpjg=?,kpcfbm=?,kf=?,sgdfk=?,kcjdebl=?,bz=?,wzcs=? ";
	ls_sql+=" where  (xjjlh='"+wherexjjlh+"') and  (kpxmbm='"+wherekpxmbm+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kpxmbm);
	ps.setString(2,kpdlbm);
	ps.setString(3,kpjg);
	ps.setString(4,kpcfbm);
	ps.setDouble(5,kf);
	ps.setDouble(6,sgdfk);
	ps.setDouble(7,kcjdebl);
	ps.setString(8,bz);
	ps.setInt(9,wzcs);
	ps.executeUpdate();
	ps.close();

	double allkf=0;
	double allsgdfk=0;
	double allkcjdebl=0;
	ls_sql="select sum(kf*wzcs),sum(sgdfk*wzcs),sum(kcjdebl*wzcs)";
	ls_sql+=" from  kp_xjgdmx";
	ls_sql+=" where  xjjlh='"+wherexjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allkf=rs.getDouble(1);
		allsgdfk=rs.getDouble(2);
		allkcjdebl=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	if (allsgdfk>0 || allkcjdebl>0)
	{
		cfspbz="2";
	}
	else{
		cfspbz="1";
	}

	ls_sql="update kp_xjgdjl set fkze="+allsgdfk+",kfzs="+allkf+",kcjdebl="+allkcjdebl+",cfspbz='"+cfspbz+"'";
	ls_sql+=" where  xjjlh='"+wherexjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.window.close();
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