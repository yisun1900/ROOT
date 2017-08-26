<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*'%>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上载文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
int ygbh=0;
int fjrygbh=0;
String wherefjrygbh=(String)session.getAttribute("ygbh");
String szdxh=null;
String yjbh=null;
String[] sjr=null;
String sjrList=null;
String yjzt=null;
String yjfj=null;
String yjfj1=null;
String yjfj2=null;
String yjfj3=null;
String yjnr=null;
String bccg=null;
String yjlx=null;
String fjmc=null;
String fjkzm=null;
String sfyd="N";
String fjym="";
String fjymc="";
int csph=0;
String nian=null;
long zdxh=0;
java.sql.Date fssj=null;
String lsfssj=null;
String ls=getServletContext().getRealPath("");
String path=null,loadname=null,wjmc=null;

//产生附件名称 以当前时间计算
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql=" select to_char(sysdate,'YYYYMMDDHH24miss') fjmc,ygbh,to_char(sysdate,'YY') nian ";
	ls_sql+=" from sq_yhxx where rownum<2 ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		fjmc=cf.fillNull(rs.getString("fjmc"));
	}
	rs.close();
	ps.close();
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
	String strAbsPath=new java.io.File(application.getRealPath(request.getRequestURI())).getParent();


	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();
	path=strAbsPath+"\\fj\\";
	lsfssj=up.getParameter("fssj");

	sjrList=up.getParameter("sjr");
	yjzt=up.getParameter("yjzt");

	yjfj=up.getParameter("yjfj");
	yjfj1=up.getParameter("yjfj1");
	yjfj2=up.getParameter("yjfj2");
	yjfj3=up.getParameter("yjfj3");

	yjnr=up.getParameter("editor_body");
	bccg=up.getParameter("bccg");
	yjlx=up.getParameter("yjlx");

	yjfj=up.getFileName("yjfj");
	yjfj1=up.getFileName("yjfj1");
	yjfj2=up.getFileName("yjfj2");
	yjfj3=up.getFileName("yjfj3");

	loadname=up.getFileName("yjfj");
	
	out.println("<BR>yjfj="+yjfj);
	out.println("<BR>loadname="+loadname);

	loadname=loadname.substring(loadname.lastIndexOf('\\')+1);

	out.println("<BR>loadname="+loadname);
	
	fjkzm=loadname.substring(loadname.lastIndexOf('.')+1);

	out.println("<BR>fjkzm="+fjkzm);

	fjymc=loadname.substring(0,loadname.lastIndexOf('.'));

	out.println("<BR>fjymc="+fjymc);

	fjmc=fjmc+"."+fjkzm;

	out.println("<BR>fjmc="+fjmc);

	String filename=path+fjmc;//取录入文件名

	out.println("<BR>filename="+filename);

	byte[] buffer=up.getFileBuffer("yjfj");


	if (loadname!=null && !(loadname.equals("")))
	{	
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

//写入数据库
try{
	if (!(lsfssj.equals("")))  fssj=java.sql.Date.valueOf(lsfssj.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fssj不存在");
	return;
}
sjr=sjrList.split(",");

try {
	
	try
	{
		fjrygbh=Integer.parseInt(wherefjrygbh);//如果调价序号为空则初始化成1
	}
	catch(Exception e)
	{
		out.print("发件人员工编号错误！"+wherefjrygbh);
		return;
	}

	conn=cf.getConnection();

	conn.setAutoCommit(false);

	//查询最大序列号
	ls_sql=" select NVL(max(substr(yjbh,3,6)),0)+1 zdxh,to_char(SYSDATE,'YY') nian ";
	ls_sql+=" from nbyj_jlx ";
	ls_sql+=" where to_char(substr(yjbh,0,2))=to_char(sysdate,'YY') ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		zdxh=rs.getLong("zdxh");
		nian=rs.getString("nian");
	}
	rs.close();
	ps.close();

	//循环写入
	for (int i=0;i<sjr.length;i++)
	{
		zdxh++;
		szdxh=String.valueOf(zdxh);
		yjbh=nian+cf.addZero(szdxh,6);

		try
		{
			ygbh=Integer.parseInt(sjr[i]);//如果调价序号为空则初始化成1
		}
		catch(Exception e)
		{
			conn.rollback();
			out.print("收件人员工编号错误！");
			return;
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
			yjnr=yjnr.replaceAll(str1,wherestr1);
			yjnr=yjnr.replaceAll(str2,wherestr2);
		}

		//写入记录箱
		ls_sql="insert into nbyj_jlx ( yjbh,yjzt,sjr,fjr,fssj,yjlx,sfyd,fjmc,fjym,yjnr ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,empty_clob() ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yjbh);
		ps.setString(2,yjzt);
		ps.setInt(3,ygbh);
		ps.setInt(4,fjrygbh);
		ps.setDate(5,fssj);
		ps.setString(6,yjlx);
		ps.setString(7,sfyd);
		ps.setString(8,fjmc);
		ps.setString(9,fjym);
		ps.executeUpdate();
		ps.close();

		ls_sql = "select yjnr from nbyj_jlx where yjbh='"+yjbh+"' for update";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			oracle.sql.CLOB clobjlnr = (oracle.sql.CLOB)rs.getClob(1);
			clobjlnr.putString(1,yjnr);

			ls_sql = "update nbyj_jlx set yjnr=? where yjbh='"+yjbh+"' "; //将大文本更新进去，呵呵
			ps2= conn.prepareStatement(ls_sql);
			ps2.setClob(1, clobjlnr);
			ps2.executeUpdate();
			ps2.close();
		}
		ps.close();
		rs.close();

		//写入收件箱
		ls_sql="insert into nbyj_sjx ( yjbh,yjzt,sjr,fjr,fssj,yjlx,sfyd,fjmc,fjym,yjnr ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,empty_clob() ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yjbh);
		ps.setString(2,yjzt);
		ps.setInt(3,ygbh);
		ps.setInt(4,fjrygbh);
		ps.setDate(5,fssj);
		ps.setString(6,yjlx);
		ps.setString(7,sfyd);
		ps.setString(8,fjmc);
		ps.setString(9,fjym);
		ps.executeUpdate();
		ps.close();

		ls_sql = "select yjnr from nbyj_sjx where yjbh='"+yjbh+"' for update";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			oracle.sql.CLOB clobnr = (oracle.sql.CLOB)rs.getClob(1);
			clobnr.putString(1,yjnr);

			ls_sql = "update nbyj_sjx set yjnr=? where yjbh='"+yjbh+"' "; //将大文本更新进去，呵呵
			ps2= conn.prepareStatement(ls_sql);
			ps2.setClob(1, clobnr);
			ps2.executeUpdate();
			ps2.close();
		}
		ps.close();
		rs.close();

		if (bccg.equals("Y"))
		{
			//写入发件箱
			ls_sql="insert into nbyj_fjx ( yjbh,yjzt,sjr,fjr,fssj,yjlx,sfyd,fjmc,fjym,yjnr ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,empty_clob() ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yjbh);
			ps.setString(2,yjzt);
			ps.setInt(3,ygbh);
			ps.setInt(4,fjrygbh);
			ps.setDate(5,fssj);
			ps.setString(6,yjlx);
			ps.setString(7,sfyd);
			ps.setString(8,fjmc);
			ps.setString(9,fjym);
			ps.executeUpdate();
			ps.close();

			ls_sql = "select yjnr from nbyj_fjx where yjbh='"+yjbh+"' for update";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				oracle.sql.CLOB clobfnr = (oracle.sql.CLOB)rs.getClob(1);
				clobfnr.putString(1,yjnr);

				ls_sql = "update nbyj_fjx set yjnr=? where yjbh='"+yjbh+"' "; //将大文本更新进去，呵呵
				ps2= conn.prepareStatement(ls_sql);
				ps2.setClob(1, clobfnr);
				ps2.executeUpdate();
				ps2.close();
			}
			ps.close();
			rs.close();
		}
	}

	conn.commit();

	out.print("邮件已成功发送！");

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功，<%=sjr.length%>条邮件已发送！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外33: " + e);
	out.print("<BR>SQL=" + ls_sql+"==="+fjrygbh+"==="+ygbh+"==="+yjbh+"==="+yhdlm+"===="+fjmc);
	return;
}
finally 
{
	conn.setAutoCommit(true);

	try{
		if (ps2!= null) ps2.close(); 
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 

</body>
</html>
