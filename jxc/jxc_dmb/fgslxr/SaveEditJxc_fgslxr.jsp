<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String dwmc=null;
String dh=null;
String cz=null;
String jbr=null;
String jbrsj=null;
String shr=null;
String shrsj=null;
String fzr=null;
String fzrsj=null;
String dz=null;
String khyh=null;
String zh=null;
String khrxm=null;
String sm1=null;
String sm2=null;
String khyh1=null;
String zh1=null;
String khrxm1=null;
String khyh2=null;
String zh2=null;
String khrxm2=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
dwmc=cf.GB2Uni(request.getParameter("dwmc"));
dh=cf.GB2Uni(request.getParameter("dh"));
cz=cf.GB2Uni(request.getParameter("cz"));
jbr=cf.GB2Uni(request.getParameter("jbr"));
jbrsj=cf.GB2Uni(request.getParameter("jbrsj"));
shr=cf.GB2Uni(request.getParameter("shr"));
shrsj=cf.GB2Uni(request.getParameter("shrsj"));
fzr=cf.GB2Uni(request.getParameter("fzr"));
fzrsj=cf.GB2Uni(request.getParameter("fzrsj"));
dz=cf.GB2Uni(request.getParameter("dz"));
khyh=cf.GB2Uni(request.getParameter("khyh"));
zh=cf.GB2Uni(request.getParameter("zh"));
khrxm=cf.GB2Uni(request.getParameter("khrxm"));
khyh1=cf.GB2Uni(request.getParameter("khyh1"));
zh1=cf.GB2Uni(request.getParameter("zh1"));
khrxm1=cf.GB2Uni(request.getParameter("khrxm1"));
khyh2=cf.GB2Uni(request.getParameter("khyh2"));
zh2=cf.GB2Uni(request.getParameter("zh2"));
khrxm2=cf.GB2Uni(request.getParameter("khrxm2"));
sm1=cf.GB2Uni(request.getParameter("sm1"));
sm2=cf.GB2Uni(request.getParameter("sm2"));
String wheredwbh=null;
wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_fgslxr set dwbh=?,dwmc=?,dh=?,cz=?,jbr=?,jbrsj=?,shr=?,shrsj=?,fzr=?,fzrsj=?,dz=?,khyh=?,zh=?,khrxm=?,sm1=?,sm2=?,khyh1=?,zh1=?,khrxm1=?,khyh2=?,zh2=?,khrxm2=? ";
	ls_sql+=" where  (dwbh='"+wheredwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,dwmc);
	ps.setString(3,dh);
	ps.setString(4,cz);
	ps.setString(5,jbr);
	ps.setString(6,jbrsj);
	ps.setString(7,shr);
	ps.setString(8,shrsj);
	ps.setString(9,fzr);
	ps.setString(10,fzrsj);
	ps.setString(11,dz);
	ps.setString(12,khyh);
	ps.setString(13,zh);
	ps.setString(14,khrxm);
	ps.setString(15,sm1);
	ps.setString(16,sm2);
	ps.setString(17,khyh1);
	ps.setString(18,zh1);
	ps.setString(19,khrxm1);
	ps.setString(20,khyh2);
	ps.setString(21,zh2);
	ps.setString(22,khrxm2);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>´æÅÌÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("´æÅÌ³É¹¦£¡");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>³ö´í:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>