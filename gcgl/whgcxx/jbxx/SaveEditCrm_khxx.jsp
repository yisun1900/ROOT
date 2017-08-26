<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;

String khxm=cf.GB2Uni(request.getParameter("khxm"));
String xb=cf.GB2Uni(request.getParameter("xb"));
String lxfs=cf.GB2Uni(request.getParameter("lxfs"));
String email=cf.GB2Uni(request.getParameter("email"));
String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String louhao=cf.GB2Uni(request.getParameter("louhao"));
String fwdz=cf.GB2Uni(request.getParameter("fwdz"));

String nlqjbm=cf.GB2Uni(request.getParameter("nlqjbm"));
String zybm=cf.GB2Uni(request.getParameter("zybm"));
String ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String khlxfs=cf.GB2Uni(request.getParameter("khlxfs"));



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xgjlh=null;
	int count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  crm_khxxxgjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	xgjlh=khbh+cf.addZero(count+1,2);

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set khxm=?,xb=?,lxfs=?,email=?,cqbm=?,xqbm=?,louhao=?,fwdz=?,nlqjbm=?,zybm=?,ysrbm=?,sfzhm=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,lxfs);
	ps.setString(4,email);
	ps.setString(5,cqbm);
	ps.setString(6,xqbm);
	ps.setString(7,louhao);
	ps.setString(8,fwdz);
	ps.setString(9,nlqjbm);
	ps.setString(10,zybm);
	ps.setString(11,ysrbm);
	ps.setString(12,sfzhm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set khxm=?,xb=?,lxfs=?,email=?,cqbm=?,xqbm=?,louhao=?,fwdz=?,nlqjbm=?,zybm=?,ysrbm=?,sfzhm=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,lxfs);
	ps.setString(4,email);
	ps.setString(5,cqbm);
	ps.setString(6,xqbm);
	ps.setString(7,louhao);
	ps.setString(8,fwdz);
	ps.setString(9,nlqjbm);
	ps.setString(10,zybm);
	ps.setString(11,ysrbm);
	ps.setString(12,sfzhm);
	ps.executeUpdate();
	ps.close();

	//增加：客户联系方式＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="delete from crm_khlxfs ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	java.util.StringTokenizer rowArray=new java.util.StringTokenizer(khlxfs,"*");
	int row=rowArray.countTokens();
	for (int i=0;i<row;i++ )
	{
		String rowStr=rowArray.nextToken();
		java.util.StringTokenizer colArray=new java.util.StringTokenizer(rowStr,"^");
		int col=colArray.countTokens();

		String lxr="";
		String lx="";
		String dhqh="";
		String qhdh="";
		String dhhm="";
		String fenji="";

		if (col>0)
		{
			lxr=colArray.nextToken();
		}
		if (col>1)
		{
			lx=colArray.nextToken();
		}
		if (col>2)
		{
			dhqh=colArray.nextToken();
		}
		if (col>3)
		{
			qhdh=colArray.nextToken();
		}
		if (col>4)
		{
			dhhm=colArray.nextToken();
		}
		if (col>5)
		{
			fenji=colArray.nextToken();
		}

		ls_sql="insert into crm_khlxfs ( khbh,qhdh,lxr,dhhm,fj,dhqh,lx,bz ) ";
		ls_sql+=" values ( '"+khbh+"','"+qhdh+"','"+lxr+"','"+dhhm+"','"+fenji+"','"+dhqh+"','"+lx+"','' ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	//增加：客户联系方式＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	ls_sql ="insert into crm_khxxxgjl (xgjlh,khbh,xgqnr,xghnr,czlx,lrr,lrsj,lrbm) ";
	ls_sql+=" values(?,?,?,?,?,?,SYSDATE,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,"");
	ps.setString(4,khxm+";"+lxfs+fwdz);
	ps.setString(5,"修改客户基本信息");
	ps.setString(6,yhmc);
	ps.setString(7,lrbm);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>