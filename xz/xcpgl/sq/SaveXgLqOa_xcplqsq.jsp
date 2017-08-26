<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String blr=null;
java.sql.Date lqsj=null;

blr=cf.GB2Uni(request.getParameter("blr"));
ls=request.getParameter("lqsj");
try{
	if (!(ls.equals("")))  lqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lqsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[领取时间]类型转换发生意外:"+e);
	return;
}
String bz=cf.GB2Uni(request.getParameter("bz"));
String[] xcpbm=request.getParameterValues("xcpbm");
String[] slqslstr=request.getParameterValues("slqsl");

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lqzt=null;
	ls_sql=" SELECT lqzt";
	ls_sql+=" FROM oa_xcplqsq ";
    ls_sql+=" where sqxh="+sqxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lqzt=rs.getString("lqzt");
	}
	rs.close();
	ps.close();

	if (!lqzt.equals("6"))//1：未完成；2：完成申请；3：一级审批；4：二级审批；5：三级审批；6：已领取
	{
		out.println("错误！审批状态不正确");
		return;
	}

	double slqsl=0;

	conn.setAutoCommit(false);

	for (int i=0;i<xcpbm.length ; i++)
	{
		if (slqslstr[i].equals(""))
		{
			conn.rollback();
			out.print("错误！请输入[实领取数量]");
			return;
		}
		else{
			try
			{
				slqsl = Double.parseDouble(slqslstr[i].trim());
			}
			catch (Exception e)
			{
				conn.rollback();
				out.print("错误！[实领取数量]数字格式不正确，请您确认："+slqslstr[i]);
				return;
			}
		}

		ls_sql="update oa_xcplqmx set slqsl="+slqsl;
		ls_sql+=" where sqxh="+sqxh+" and xcpbm='"+xcpbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update oa_xcplqsq set lqzt='6',blr=?,lqsj=?,bz=?,slqsl=(select sum(slqsl) from oa_xcplqmx where oa_xcplqmx.sqxh="+sqxh+"),slqje=(select sum(slqsl*dj) from oa_xcplqmx where oa_xcplqmx.sqxh="+sqxh+") ";
    ls_sql+=" where sqxh="+sqxh+" and lqzt='6'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,blr);
	ps.setDate(2,lqsj);
	ps.setString(3,bz);
	ps.executeUpdate();
	ps.close();

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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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