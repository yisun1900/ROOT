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
String sql = null;
Connection conn  = null;
Statement stmt = null;
ResultSet rs = null;

String kpdlbm = cf.GB2Uni(request.getParameter("kpdlbm"));
String kpxmbm = cf.GB2Uni(request.getParameter("kpxmbm"));
String kpjg = cf.GB2Uni(request.getParameter("kpjg"));
String row = cf.GB2Uni(request.getParameter("row"));

try {
	conn=cf.getConnection();    //得到连接
	stmt = conn.createStatement();

	if (!kpdlbm.equals(""))
	{
		%>
		parent.main.insertform.kpxmbm[0]=new parent.main.Option("","" );;   
		<%
		int i=0;
		String kpxmbm1=null;
		String kpxmmc=null;
		sql = "select distinct kpxmbm,kpxmmc from kp_gckpxm";
		sql+= "  where kpdlbm='"+kpdlbm+"'";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		while (rs.next())                            
		{
			i++;
			kpxmbm1=rs.getString("kpxmbm");
			kpxmmc=rs.getString("kpxmmc");
			%>
			parent.main.insertform.kpxmbm[<%=i%>]=new parent.main.Option("<%=kpxmmc%>","<%=kpxmbm1%>" );   
			<%
		}
		rs.close();
	}

	else if (!kpxmbm.equals("") && kpjg.equals(""))
	{
		%>
		parent.main.insertform.kpjg[0]=new parent.main.Option("","" );;   
		<%
		int i=0;
		String kpjgbm=null;
		String kpjgmc=null;
		sql = "select distinct kpjg,DECODE(kpjg,1,'轻微违章',2,'严重违章',3,'特别严重') kpjgmc from kp_gckpxm";
		sql+= "  where kpxmbm='"+kpxmbm+"'";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		while (rs.next())                            
		{
			i++;
			kpjgbm=rs.getString("kpjg");
			kpjgmc=rs.getString("kpjgmc");
			%>
			parent.main.insertform.kpjg[<%=i%>]=new parent.main.Option("<%=kpjgmc%>","<%=kpjgbm%>" ); 
			<%
		}
		rs.close();
	}
	else if (!kpxmbm.equals("") && !kpjg.equals(""))
	{
		int i=0;
		String kpcfbm=null;
		String kpcfmc=null;

		sql = "select distinct kp_kpkfbz.kpcfbm,kpcfmc from kp_kpcfbm,kp_kpkfbz";
		sql+= " where kp_kpcfbm.kpcfbm=kp_kpkfbz.kpcfbm";
		sql+= " and kpxmbm='"+kpxmbm+"' and kpjg='"+kpjg+"'";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		while (rs.next())                            
		{
			kpcfbm=rs.getString("kpcfbm");
			kpcfmc=rs.getString("kpcfmc");
			%>
			for (var i=0;i<<%=row%> ;i++ )
			{
				if (parent.main.insertform.kpcfbm[i].value=="<%=kpcfbm%>")
				{
					parent.main.insertform.kpcfbm[i].disabled=false;  
				}
			}
			<%
			i++;
		}
		rs.close();
	}
}
catch(Exception e){
	out.print("查询失败,发生意外: " + e);
	out.print("SQL=" + sql);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>

//-->
</SCRIPT>

