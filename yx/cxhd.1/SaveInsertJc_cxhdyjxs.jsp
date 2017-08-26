<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));

String[] yjxsbm=request.getParameterValues("yjxsbm");
String[] yjxsstr=request.getParameterValues("yjxs");
double yjxs=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cxhdmc=null;
	String fgsbh=null;
	ls_sql=" SELECT cxhdmc,fgsbh ";
	ls_sql+=" FROM jc_cxhd ";
    ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	else{
		out.print("错误！促销活动不存在");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="delete from jc_cxhdyjxs ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<yjxsbm.length ;i++ )
	{
		
		if (yjxsstr[i]==null || yjxsstr[i].trim().equals(""))
		{
			continue;
		}

		yjxs = Double.parseDouble(yjxsstr[i].trim());
		if (yjxs==0)
		{
			continue;
		}

		if (yjxs<0 || yjxs>10)
		{
			conn.rollback();
			out.print("错误！业绩系数应为0到10之间："+yjxs);
			return;
		}

		ls_sql="insert into jc_cxhdyjxs (cxhdbm,cxhdmc,fgsbh,yjxsbm,yjxs) ";
		ls_sql+=" values(?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cxhdbm);
		ps.setString(2,cxhdmc);
		ps.setString(3,fgsbh);
		ps.setString(4,yjxsbm[i]);
		ps.setDouble(5,yjxs);
		ps.executeUpdate();
		ps.close();
		
	}

	conn.commit();



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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);

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