<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String wtkxda[]=request.getParameterValues("kxda");
String lrr=(String)session.getAttribute("yhmc");
String ls=null;
String wtbh=null;
String dcqs=null;
String wtmc=null;
String sfkdx=null;
String wtsfgq=null;
String wtfl=null;
String xwtsm=null;
String sfyxsm=null;

dcqs=cf.GB2Uni(request.getParameter("dcqs"));
wtmc=cf.GB2Uni(request.getParameter("wtmc"));
sfkdx=cf.GB2Uni(request.getParameter("sfkdx"));
wtsfgq=cf.GB2Uni(request.getParameter("wtsfgq"));
wtfl=cf.GB2Uni(request.getParameter("wtfl"));
xwtsm=cf.GB2Uni(request.getParameter("xwtsm"));
out.print(xwtsm);
sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(wtbh))+1,1)";
	ls_sql+=" from  hd_scdcwt";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	wtbh=cf.addZero(xh,7);

	conn.setAutoCommit(false);
	ls_sql="insert into hd_scdcwt ( wtbh,dcqs,wtmc,sfkdx,wtsfgq,wtfl,xwtsm,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,TRUNC(SYSDATE) ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wtbh);
	ps.setString(2,dcqs);
	ps.setString(3,wtmc);
	ps.setString(4,sfkdx);
	ps.setString(5,wtsfgq);
	ps.setString(6,wtfl);
	ps.setString(7,xwtsm);
	ps.setString(8,lrr);
	ps.executeUpdate();
	
	for(int i=0;i<wtkxda.length;i++)
	{
		String jgsm="";
		String ls1=request.getParameter("jgsm"+(i+1));
		if(ls!=null)
		{
			jgsm=ls1;

		}
		//out.print(jgsm);
		if((wtkxda[i]!=null)&& (!wtkxda[i].equals("")))
		{
			ls_sql=" insert into hd_dcwtkxda (wtbh,wtkxda,jgsm,sfyxsm)values(?,?,?,?) ";
			ps=conn.prepareStatement(ls_sql);
			ps.setString(1,wtbh);
			ps.setString(2,cf.GB2Uni(wtkxda[i]));
			ps.setString(3,cf.GB2Uni(ls1));
			ps.setString(4,cf.GB2Uni(sfyxsm));
			ps.executeUpdate();
		}
	}

	conn.commit();
	%>
	<script language="javascript" >
	<!--
	alert("存盘成功!");
	window.close();
	//-->
	</script>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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