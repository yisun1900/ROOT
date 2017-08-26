<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%


String ztbm=null;
String ztmc=null;

ztmc=cf.GB2Uni(request.getParameter("ztmc"));

ztbm=cf.GB2Uni(request.getParameter("ztbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
	int count=0;

	ls_sql="select count(*)";
	ls_sql+=" from  dm_orderzt";
	ls_sql+=" where ztmc='"+ztmc+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();

	if (count>0)
	{
		out.println("错误！此[订单状态名称]已存在");
		return;
	}

	/*//小区编码
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(ztbm))+1,1)";
	ls_sql+=" from  dm_orderzt";
	ls_sql+=" where ztbm='"+ztbm+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	ztbm=cf.addZero(xh,3);
//	out.println(ztbm);
	*/
	ls_sql="insert into dm_orderzt ( ztbm,ztmc) ";
	ls_sql+=" values ( ?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ztbm);
	ps.setString(2,ztmc);
	
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
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