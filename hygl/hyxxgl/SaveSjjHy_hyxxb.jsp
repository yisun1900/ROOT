<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hykh=request.getParameter("hykh");
String hyjb=request.getParameter("hyjb");
String fwlx=request.getParameter("fwlx");

String wherehybh=cf.GB2Uni(request.getParameter("wherehybh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

String kdlb=null;
String sfyfk=null;
String dwbh=null;
String skdw=null;
int count=0;
try {
	conn=cf.getConnection();

	
	//取旧的水质分析卡号
	String oldhykh=null;
	ls_sql = "select hykh,dwbh from hy_hyxxb where hybh='"+wherehybh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		oldhykh=rs.getString(1).trim();
		dwbh=rs.getString(2);
	}
	rs.close();
	ps.close();


	ls_sql = "select kdlb,sfyfk,dwbh from hy_khxxb where hykh='"+hykh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		kdlb=rs.getString("kdlb");
		sfyfk=rs.getString("sfyfk");
		skdw=rs.getString("dwbh");
	}
	else{
		out.println("错误！不存在的水质分析卡号");
		return;
	}
	rs.close();
	ps.close();


	if (sfyfk.equals("N"))
	{
		out.println("错误！此卡尚未分发");
		return;
	}
	if (!skdw.equals(dwbh))
	{
		out.println("错误！收卡单位不正确");
		return;
	}
	if (!kdlb.equals(hyjb))
	{
		out.println("错误！会员级别不正确");
		return;
	}

	if (!oldhykh.equals(hykh))//改变水质分析卡号
	{
		ls_sql = "select count(*) from hy_hyxxb where hykh='"+hykh+"' and sfzf='N'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("错误！水质分析卡已被使用");
			return;
		}
	}

	conn.setAutoCommit(false);

	if (!oldhykh.equals(hykh))//改变水质分析卡号
	{
		//修改新的
		ls_sql="update hy_khxxb set sfysy='Y',hybh=?,syrq=TRUNC(SYSDATE) where hykh='"+hykh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wherehybh);
		ps.executeUpdate();
		ps.close();

		//旧的还原
		ls_sql="update hy_khxxb set sfysy='N',hybh=null,syrq=null where hykh='"+oldhykh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
	}

	ls_sql="update hy_hyxxb set hykh=?,hyjb=?,fwlx=?";
	ls_sql+=" where  (hybh='"+wherehybh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hykh);
	ps.setString(2,hyjb);
	ps.setString(3,fwlx);
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