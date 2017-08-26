<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%  
String sfxmbm = request.getParameter("sfxmbm");//所属城区编码
String dqbm = request.getParameter("dqbm");//所属城区编码

if (sfxmbm==null)
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String sflx=null;
String bz=null;

try {
	conn=cf.getConnection();

	ls_sql="select DECODE(sflx,'1','百分比','2','固定金额') sflx,bz";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where sfxmbm='"+sfxmbm+"' and dqbm='"+dqbm+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sflx=rs.getString(1);
		bz=cf.fillNull(rs.getString(2));

		%>
			parent.main.insertform.sflx.value="<%=sflx%>";
			parent.main.insertform.bz.value="<%=bz%>";
		<%

	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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



//-->
</SCRIPT>
