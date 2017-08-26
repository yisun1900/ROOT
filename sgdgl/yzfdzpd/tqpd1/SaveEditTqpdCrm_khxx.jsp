<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String sgbz=cf.GB2Uni(request.getParameter("sgbz"));
String sgd=sgbz.substring(0,sgbz.indexOf("*"));
sgbz=sgbz.substring(sgbz.indexOf("*")+1);

String pdr=cf.GB2Uni(request.getParameter("pdr"));
String pdsm=cf.GB2Uni(request.getParameter("pdsm"));
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));
java.sql.Date pdsj=null;
ls=request.getParameter("pdsj");
try{
	if (!(ls.equals("")))  pdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[派单时间]类型转换发生意外:"+e);
	return;
}

String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
String kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
String deflbm="0";
String jlbz=cf.GB2Uni(request.getParameter("jlbz"));
String shzzb=cf.GB2Uni(request.getParameter("shzzb"));
String[] hxsgd=request.getParameterValues("hxsgd");
String[] hxsgdyxj=request.getParameterValues("hxsgdyxj");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	double qye=0;
	double guanlif=0;
	double suijin=0;
	String pdclzt=null;
	String ssfgs=null;
	ls_sql="SELECT qye,guanlif,suijin,pdclzt,fgsbh";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qye=rs.getDouble("qye");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");
		pdclzt=rs.getString("pdclzt");
		ssfgs=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	qye=qye+guanlif+suijin;

	if (!pdclzt.equals("1") && !pdclzt.equals("7"))
	{
		out.println("错误！该客户已派单");
		return;
	}

	long xuhao=0;
	ls_sql="SELECT max(xuhao)";
	ls_sql+=" FROM pd_pdjl ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xuhao=rs.getLong(1);
	}
	rs.close();
	ps.close();
	xuhao++;

	conn.setAutoCommit(false);

	//施工队派单优先级记录+++++++++++++++++++++++
	//下拉框施工队
	String sgdyxj=null;
	String sfbxsgd=null;
	double bqjdze=0;
	double bqdde=0;
	double bqzde=0;
	double bqxde=0;
	double yjdze=0;

	double yjddje=0;
	double yjzdje=0;
	double yjxdje=0;
	double sydze=0;
	double syddje=0;
	double syzdje=0;
	double syxdje=0;
	double qdl=0;


	double jrpde=qye;


	ls_sql="insert into pd_pdjl (khbh,sgd,sgbz,zjxm,pdsj,pdr,pdsm,sgdyxj,shzzb,kpjlh,deflbm,jrpde,jlbz,qye,hfjl,kppdbz,xuhao) ";
	ls_sql+=" values (?,?,?,?,SYSDATE,?,?,?,?,?,?,?,?,?,'0','2',?) ";//0：未拒单；3：拒单
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wherekhbh);
	ps.setString(2,sgd);
	ps.setString(3,sgbz);
	ps.setString(4,zjxm);
	ps.setString(5,pdr);
	ps.setString(6,pdsm);
	ps.setString(7,sgdyxj);
	ps.setString(8,shzzb);//Y：占指标；N：不占指标
	ps.setString(9,kpjlh);
	ps.setString(10,deflbm);
	ps.setDouble(11,jrpde);
	ps.setString(12,jlbz);
	ps.setDouble(13,qye);
	ps.setLong(14,xuhao);
	ps.executeUpdate();
	ps.close();

	String dlx="";


	ls_sql="update sq_sgd set sgdpdjf=NVL(sgdpdjf,0)+1,mqzsgds=NVL(mqzsgds,0)+1";
	ls_sql+=" where sgd ='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int zygrsl=0;
	if (qye<=100000)
	{
		zygrsl=2;
	}
	else if (qye>100000 & qye<=200000)
	{
		zygrsl=3;
	}
	else if (qye>200000 & qye<=300000)
	{
		zygrsl=4;
	}
	else
	{
		zygrsl=5;
	}

	ls_sql="update sq_bzxx set bzpdjf=NVL(bzpdjf,0)+1,mqzsgds=NVL(mqzsgds,0)+1,yygrsl=NVL(yygrsl,0)+"+zygrsl+",kygrsl=NVL(kygrsl,0)-"+zygrsl;
	ls_sql+=" where  bzmc ='"+sgbz+"' and sgd ='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set pdsj=?,pdr=?,sgd=?,sgbz=?,pdsm=?,pdclzt='5',jlbz=?,zjxm=?,pdbbh='1'";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,pdsj);
	ps.setString(2,pdr);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setString(5,pdsm);
	ps.setString(6,jlbz);
	ps.setString(7,zjxm);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("错误！存盘失败");
		return;
	}
	ps.close();



	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("派单成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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
