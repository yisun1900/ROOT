<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ckph=null;
String dqbm=null;
String fgsbh=null;
String ckbh=null;
String cklx=null;
String khbh=null;
String ckfs=null;
String psfs=null;
java.sql.Date jhshsj=null;
String lydh=null;
String jsr=null;
String ckr=null;
java.sql.Date cksj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
cklx=cf.GB2Uni(request.getParameter("cklx"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ckfs=cf.GB2Uni(request.getParameter("ckfs"));
psfs=cf.GB2Uni(request.getParameter("psfs"));
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhshsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划送货时间]类型转换发生意外:"+e);
	return;
}
lydh=cf.GB2Uni(request.getParameter("lydh"));
jsr=cf.GB2Uni(request.getParameter("jsr"));
ckr=cf.GB2Uni(request.getParameter("ckr"));
ls=request.getParameter("cksj");
try{
	if (!(ls.equals("")))  cksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cksj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出库时间]类型转换发生意外:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ckjxz=cf.GB2Uni(request.getParameter("ckjxz"));

String mddqbm=dqbm;

String ckcllx="1";//0：主材；1：辅材
String nian=cf.today("YY");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xsdzt="";
	ls_sql=" SELECT xsdzt ";
	ls_sql+=" FROM jxc_fcxsd ";
    ls_sql+=" where xsph='"+lydh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
	}
	rs.close();
	ps.close();

	//0：未提交；2：提交；3：已出库
	if (!xsdzt.equals("2") )
	{
		out.print("错误！销售单["+lydh+"]状态不正确，应为【2：等待出库】！");
		return;
	}

	//生成出库批号：F（Z）C+XX(地区)+XX(年) +XXXXX（流水）
	int count=0;
	ls_sql="select NVL(max(substr(ckph,7,5)),0)";
	ls_sql+=" from  jxc_ckd";
	ls_sql+=" where dqbm='"+dqbm+"' and ckcllx='"+ckcllx+"' and nian='"+nian+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ckph="FC"+dqbm+nian+cf.addZero(count+1,5);


	ls_sql="insert into jxc_ckd ( ckph,dqbm,fgsbh,ckbh,ckcllx,cklx,khbh,ckfs,psfs,jhshsj,lydh,jsr,ckr,cksj,lrr,lrsj,lrbm,nian,bz,ckzsl,ckzje,ckzcb,ckdzt,sfth,sfjz,sfyfkc,ckjxz,sfxnckd,mddqbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE,?,?,?,0,0,0,'0','N','N','1',?,'N',? ) ";//1：无负库存；2：负库存未入库；3：负库存入库
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ckph);
	ps.setString(2,dqbm);
	ps.setString(3,fgsbh);
	ps.setString(4,ckbh);
	ps.setString(5,ckcllx);
	ps.setString(6,cklx);
	ps.setString(7,khbh);
	ps.setString(8,ckfs);
	ps.setString(9,psfs);
	ps.setDate(10,jhshsj);
	ps.setString(11,lydh);
	ps.setString(12,jsr);
	ps.setString(13,ckr);
	ps.setDate(14,cksj);
	ps.setString(15,lrr);
	ps.setString(16,lrbm);
	ps.setString(17,nian);
	ps.setString(18,bz);
	ps.setString(19,ckjxz);
	ps.setString(20,mddqbm);
	ps.executeUpdate();
	ps.close();

	
	response.sendRedirect("EditJxc_ckdXsd.jsp?lx=1&ckph="+ckph);
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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