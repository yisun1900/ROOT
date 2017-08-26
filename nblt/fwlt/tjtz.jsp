<%@ page import='ybl.upload.*'%>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ page contentType="text/html;charset=GBK" %>

<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>上载文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
String strAbsPath=new java.io.File(application.getRealPath(request.getRequestURI())).getParent();

String yhdlm=(String)session.getAttribute("yhdlm");
int ygbh=0;
String sfnmt=null;
String szdxh=null;
String tzbh=null;
String sjrList=null;
String ftzt=null;
String fjmc=null;
String ftnr=null;
String bccg=null;
String bkbh=null;
String sfyxhf=null;
String sfzd=null;
String sfyd="N";
String fjym="";
String fjymc="";
int csph=0;
String nian=null;
long zdxh=0;
String ls=getServletContext().getRealPath("");
String path=null,loadname=null,wjmc=null;
//产生附件名称 以当前时间计算

Connection conn  = null;
PreparedStatement ps=null;
PreparedStatement ps2=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql=" select to_char(sysdate,'YYYYMMDDHH24miss') fjmc,ygbh,to_char(sysdate,'YY') nian ";
	ls_sql+=" from sq_yhxx where yhdlm='"+yhdlm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		fjmc=cf.fillNull(rs.getString("fjmc"));
		ygbh=rs.getInt("ygbh");
		nian=cf.fillNull(rs.getString("nian"));
	}
	ps.close();
	rs.close();
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外2: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	path=strAbsPath+"\\fj\\";
	ftzt=up.getParameter("ftzt");
	sfyxhf=up.getParameter("sfyxhf");
	sfzd=up.getParameter("sfzd");
	ftnr=up.getParameter("editor_body");
	bkbh=up.getParameter("bkbh");
	loadname=up.getFileName("ftfj");	
	byte[] buffer=up.getFileBuffer("ftfj");
	loadname=loadname.substring(loadname.lastIndexOf('\\')+1);



	if (loadname!=null && !(loadname.equals("")))
	{
		String fjkzm=null;
		fjkzm=loadname.substring(loadname.lastIndexOf('.')+1);
		fjymc=loadname.substring(0,loadname.lastIndexOf('.'));
		fjmc=fjmc+"."+fjkzm;

		String filename=path+fjmc;//取录入文件名

		java.io.FileOutputStream f=new java.io.FileOutputStream(filename);
		fjym=loadname;
		f.write(buffer);
		f.close();
	}
	else
	{
		fjmc="N";
	}
}
catch (Exception e) {
	out.print("上载文件失败，Exception:" + e);
}


try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	//查询最大序列号
	ls_sql=" select NVL(max(substr(tzbh,5,6)),0)+1 zdxh ";
	ls_sql+=" from nblt_ftgl ";
	ls_sql+=" where to_char(substr(tzbh,0,2))=to_char(sysdate,'YY') and to_char(substr(tzbh,3,2))='"+bkbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		zdxh=rs.getLong("zdxh");
	}
	rs.close();
	ps.close();

	zdxh++;
	szdxh=String.valueOf(zdxh);
	tzbh=nian+bkbh+cf.addZero(szdxh,6);

	//查询是否匿名帖
	ls_sql=" select sfnmt ";
	ls_sql+=" from nblt_bkgl ";
	ls_sql+=" where bkbh='"+bkbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sfnmt=rs.getString("sfnmt");
	}
	rs.close();
	ps.close();

	if (sfnmt.equals("Y"))
	{
		ygbh=1;
	}

	//编辑发帖内容 如果有图片则修改
	//取得当前url
	String[] allurl=new String[3];
	String  dqurl   =  request.getHeader("referer");
	String mms=":8090";
	String str1="";
	String str2="";
	String wherestr1="href=\"";
	String wherestr2="src=\"";
	//截取地址
	int firasdk=dqurl.indexOf(mms)+5;
	dqurl=dqurl.substring(0,firasdk);
	allurl[0]=dqurl;
	allurl[1]="http://127.0.0.1:8090";
	allurl[2]="http://localhost:8090";

//去掉url
	for (int kks=0;kks<allurl.length;kks++)
	{
		str1=wherestr1+allurl[kks];
		str2=wherestr2+allurl[kks];
		ftnr=ftnr.replaceAll(str1,wherestr1);
		ftnr=ftnr.replaceAll(str2,wherestr2);
	}	

	//写入记录箱
	ls_sql="insert into nblt_ftgl ( tzbh,bkbh,ftzt,ftr,ftsj,zhxgsj,djcs,hfcs,fjmc,fjym,ftnr,ytnr,zhhfr,zhhfsj,sfyxhf,sfzd,sfjht ) ";
	ls_sql+=" values ( ?,?,?,?,SYSDATE,SYSDATE,0,0,?,?,empty_clob(),empty_clob(),?,SYSDATE,?,?,'N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzbh);
	ps.setString(2,bkbh);
	ps.setString(3,ftzt);
	ps.setInt(4,ygbh);
	ps.setString(5,fjmc);
	ps.setString(6,fjym);
	ps.setInt(7,ygbh);
	ps.setString(8,sfyxhf);
	ps.setString(9,sfzd);
	ps.executeUpdate();
	ps.close();

	ls_sql = "select ftnr,ytnr from nblt_ftgl where tzbh='"+tzbh+"' for update";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		oracle.sql.CLOB clobft = (oracle.sql.CLOB)rs.getClob(1);
		clobft.putString(1,ftnr);
		oracle.sql.CLOB clobyt = (oracle.sql.CLOB)rs.getClob(2);
		clobyt.putString(1,ftnr);

		ls_sql = "update nblt_ftgl set ftnr=?,ytnr=? where tzbh='"+tzbh+"' "; //将大文本更新进去，呵呵
		ps2= conn.prepareStatement(ls_sql);
		ps2.setClob(1, clobft);
		ps2.setClob(2, clobyt);
		ps2.executeUpdate();
		ps2.close();
	}
	ps.close();
	rs.close();

	
	//更新板块的帖子数量
	ls_sql="update nblt_bkgl set tzs=tzs+1 ";
	ls_sql+=" where (bkbh='"+bkbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	out.print("发帖成功！");

	%>
	<SCRIPT language=javascript >
	<!--
	alert("发帖成功！");
	window.location.href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>&ys=1";
	//-->
	</SCRIPT>
	<br><a href="zktz.jsp?bkbh=<%=bkbh%>">如果您的的浏览器没有自动跳转，请点击这里！</a>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外33: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</body>
</html>
