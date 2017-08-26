<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pfalxbm=null;
pfalxbm=request.getParameter("pfalxbm");
String khbh=request.getParameter("khbh");
String jhsj=request.getParameter("jhsj");
String jhry=cf.GB2Uni(request.getParameter("jhry"));
String pfanr=cf.GB2Uni(request.getParameter("pfanr"));
String pfajlh_2=request.getParameter("pfajlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(pfajlh))+1,1)";
	ls_sql+=" from  crm_pfagcgl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	String pfajlh=cf.addZero(xh,8);
	

	ls_sql="insert into crm_pfagcgl(pfajlh,pfalxbm,khbh,jhsj,jhry,pfanr) ";
	ls_sql+=" values('"+pfajlh+"', '"+pfalxbm+"','"+khbh+"' ,to_date('"+jhsj+"','yyyy-MM-dd'),'"+jhry+"','"+pfanr+"') ";
    
	if(pfajlh_2!=null && !"".equals(pfajlh_2))
	{
	ls_sql="update crm_pfagcgl set pfalxbm='"+pfalxbm+"',jhsj=to_date('"+jhsj+"','yyyy-MM-dd'),jhry='"+jhry+"',pfanr='"+pfanr+"' ";
	ls_sql+=" where pfajlh='"+pfajlh_2+"' ";
	}
	ps2= conn.prepareStatement(ls_sql);

	/*ps2.setString(1,"00000001");
	ps2.setString(2,pfalxbm);
	ps2.setString(3,khbh);
	ps2.setString(4,ysmry);
	ps2.setString(5,smmb);*/
	//ps.executeUpdate();
	if(ps2.executeUpdate()!=1)
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
	out.print("´æÅÌÊ§°Ü,·¢ÉúÒâÍâ: " + e);
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