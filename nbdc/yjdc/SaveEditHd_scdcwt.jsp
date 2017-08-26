<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String wtkxda[]=request.getParameterValues("kxda");
String wtkxda1[]=request.getParameterValues("kxda1");
String ls=null;
String wtbh=null;
String dcqs=null;
String wtmc=null;
String sfkdx=null;
String wtsfgq=null;
String wtfl=null;
String xwtsm=null;
String sfyxsm=null;

wtbh=cf.GB2Uni(request.getParameter("wtbh"));
dcqs=cf.GB2Uni(request.getParameter("dcqs"));
wtmc=cf.GB2Uni(request.getParameter("wtmc"));
sfkdx=cf.GB2Uni(request.getParameter("sfkdx"));
wtsfgq=cf.GB2Uni(request.getParameter("wtsfgq"));
wtfl=cf.GB2Uni(request.getParameter("wtfl"));
xwtsm=cf.GB2Uni(request.getParameter("xwtsm"));
sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm"));
String wherewtbh=null;
wherewtbh=cf.GB2Uni(request.getParameter("wherewtbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);
	ls_sql="update hd_scdcwt set wtbh=?,dcqs=?,wtmc=?,sfkdx=?,wtsfgq=?,wtfl=?,xwtsm=? ";
	ls_sql+=" where  (wtbh='"+wherewtbh+"')  ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wtbh);
	ps.setString(2,dcqs);
	ps.setString(3,wtmc);
	ps.setString(4,sfkdx);
	ps.setString(5,wtsfgq);
	ps.setString(6,wtfl);
	ps.setString(7,xwtsm);

	 ps.executeUpdate();
	for(int i=0;i<wtkxda.length;i++)
	{
		String jgsm="";
		String ls1=request.getParameter("jgsm"+(i+1));
		
		
				//out.print(cf.GB2Uni(wtkxda[i]));

		if((wtkxda[i]!=null)&& (!wtkxda[i].equals(""))&&(wtkxda1[i]!=null)&& (!wtkxda1[i].equals("")))
		{
			ls_sql=" update  hd_dcwtkxda set wtkxda=?,jgsm=?,sfyxsm=? ";
			ls_sql+=" where  (wtbh='"+wherewtbh+"' and wtkxda='"+cf.GB2Uni(wtkxda1[i])+"')";
			//out.print(ls_sql);
			ps=conn.prepareStatement(ls_sql);
			ps.setString(1,cf.GB2Uni(wtkxda[i]));
			ps.setString(2,cf.GB2Uni(ls1));
			ps.setString(3,cf.GB2Uni(sfyxsm));
			ps.executeUpdate();
		}
	}

	conn.commit();

	%>
	<script language="javascript" >
	<!--
	alert("´æÅÌ³É¹¦!");
	window.close();
	//-->
	</script>
	<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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