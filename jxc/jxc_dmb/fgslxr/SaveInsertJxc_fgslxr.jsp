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
sm1=cf.GB2Uni(request.getParameter("sm1"));
sm2=cf.GB2Uni(request.getParameter("sm2"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jxc_fgslxr ( dwbh,dwmc,dh,cz,jbr,jbrsj,shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,sm1,sm2 ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
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
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
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