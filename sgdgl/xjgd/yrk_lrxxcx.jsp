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
		String ydcdmc=null;
		sql = "select distinct kpjg,ydcdmc";
		sql+= " from kp_gckpxm,kp_sgdyzcdbm";
		sql+= " where kp_gckpxm.kpjg=kp_sgdyzcdbm.yzcdbm and kpxmbm='"+kpxmbm+"'";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		while (rs.next())                            
		{
			i++;
			kpjgbm=rs.getString("kpjg");
			ydcdmc=rs.getString("ydcdmc");
			%>
			parent.main.insertform.kpjg[<%=i%>]=new parent.main.Option("<%=ydcdmc%>","<%=kpjgbm%>" ); 
			<%
		}
		rs.close();
	}
	else if (!kpxmbm.equals("") && !kpjg.equals(""))
	{
		int i=0;
		String kpcfbm=null;
		String kpcfmc=null;
		double kf=0;
		double sgdfk=0;
		double kcjdebl=0;

		sql = "select distinct kp_gckpxm.kpcfbm,kpcfmc,kf,sgdfk,kcjdebl ";
		sql+= " from kp_gckpxm,kp_kpcfbm";
		sql+= " where kp_gckpxm.kpcfbm=kp_kpcfbm.kpcfbm(+)";
		sql+= " and kpxmbm='"+kpxmbm+"' and kpjg='"+kpjg+"'";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		while (rs.next())                            
		{
			kpcfbm=cf.fillNull(rs.getString("kpcfbm"));
			kpcfmc=cf.fillNull(rs.getString("kpcfmc"));
			kf=rs.getDouble("kf");
			sgdfk=rs.getDouble("sgdfk");
			kcjdebl=rs.getDouble("kcjdebl");

			%>
			parent.main.insertform.wzcs.value=''; 
			parent.main.insertform.kf.value='<%=kf%>'; 
			parent.main.insertform.sgdfk.value='<%=sgdfk%>'; 
			parent.main.insertform.kcjdebl.value='<%=kcjdebl%>'; 
			parent.main.insertform.kpcfbm[<%=i%>]=new parent.main.Option("<%=kpcfmc%>","<%=kpcfbm%>"); 
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

