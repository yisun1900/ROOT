<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String sgd=null;
String bzmc=null;
String xm=null;
String xb=null;
String jg=null;
java.sql.Date csrq=null;
String gz=null;
java.sql.Date rzsj=null;
String dj=null;
String lx=null;
String sfzh=null;
String zz=null;
String dh=null;
String pxsm=null;
sgd=cf.GB2Uni(request.getParameter("sgd"));
bzmc=cf.GB2Uni(request.getParameter("bzmc"));
xm=cf.GB2Uni(request.getParameter("xm"));
xb=cf.GB2Uni(request.getParameter("xb"));
jg=cf.GB2Uni(request.getParameter("jg"));
ls=request.getParameter("csrq");
try{
	if (!(ls.equals("")))  csrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量csrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出生日期]类型转换发生意外:"+e);
	return;
}
gz=cf.GB2Uni(request.getParameter("gz"));
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入职时间]类型转换发生意外:"+e);
	return;
}
dj=cf.GB2Uni(request.getParameter("dj"));
lx=cf.GB2Uni(request.getParameter("lx"));
sfzh=cf.GB2Uni(request.getParameter("sfzh"));
zz=cf.GB2Uni(request.getParameter("zz"));
dh=cf.GB2Uni(request.getParameter("dh"));
pxsm=cf.GB2Uni(request.getParameter("pxsm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String jjlxr=cf.GB2Uni(request.getParameter("jjlxr"));
String jjlxrdh=cf.GB2Uni(request.getParameter("jjlxrdh"));
String jjlxrdz=cf.GB2Uni(request.getParameter("jjlxrdz"));
String sgzbh=cf.GB2Uni(request.getParameter("sgzbh"));
String sfkstg=cf.GB2Uni(request.getParameter("sfkstg"));

String yhk=cf.GB2Uni(request.getParameter("yhk"));
String sfqdlwpqht=cf.GB2Uni(request.getParameter("sfqdlwpqht"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into sq_grxxb ( sgd,bzmc,xm,xb,jg,csrq,gz,rzsj,dj,lx,sfzh,zz,dh,pxsm,jjlxr,jjlxrdh,jjlxrdz,sgzbh,ssfgs,yhk,sfqdlwpqht,sfkstg ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgd);
	ps.setString(2,bzmc);
	ps.setString(3,xm);
	ps.setString(4,xb);
	ps.setString(5,jg);
	ps.setDate(6,csrq);
	ps.setString(7,gz);
	ps.setDate(8,rzsj);
	ps.setString(9,dj);
	ps.setString(10,lx);
	ps.setString(11,sfzh);
	ps.setString(12,zz);
	ps.setString(13,dh);
	ps.setString(14,pxsm);
	ps.setString(15,jjlxr);
	ps.setString(16,jjlxrdh);
	ps.setString(17,jjlxrdz);
	ps.setString(18,sgzbh);
	ps.setString(19,ssfgs);
	ps.setString(20,yhk);
	ps.setString(21,sfqdlwpqht);
	ps.setString(22,sfkstg);
	ps.executeUpdate();
	ps.close();

	if (!bzmc.equals(""))
	{
		ls_sql="update sq_bzxx set grsl=(select count(*) from sq_grxxb where sq_grxxb.sgd=sq_bzxx.sgd and sq_grxxb.bzmc=sq_bzxx.bzmc) ";
		ls_sql+=" where  (sgd='"+sgd+"') and  (bzmc='"+bzmc+"')   ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update sq_bzxx set kygrsl=grsl-yygrsl ";
		ls_sql+=" where  (sgd='"+sgd+"') and  (bzmc='"+bzmc+"')   ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	//发送短信
	if (!dh.equals(""))
	{
		ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
		String retStr=dxxt.grdx(conn,dh,xm,yhmc);//调用发送短信函数
		if (retStr.equals(""))
		{
			out.println("短信发送成功");
		}
		else{
			out.println(retStr);//将发送结果显示到页面上
		}
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>