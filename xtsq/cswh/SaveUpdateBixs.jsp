<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010112")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//自定义项目
	String dqbm=null;
	double gcjcbjxs=0;//工程基础报价系数
	double sgcbbjxs=0;//施工成本报价系数 
	double cbbfb=0;//自定义项成本百分比 
	ls_sql="select dqbm,gcjcbjxs,sgcbbjxs,cbbfb";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gcjcbjxs=rs.getDouble("gcjcbjxs");
		sgcbbjxs=rs.getDouble("sgcbbjxs");
		cbbfb=rs.getDouble("cbbfb");
	}
	rs.close();
	ps.close();

	if (gcjcbjxs==0)
	{
		out.println("错误！【工程基础报价系数】未初始化"+ls_sql);
		return;
	}
	if (sgcbbjxs==0)
	{
		out.println("错误！【施工成本报价系数】未初始化");
		return;
	}

	String bjbbh=null;
	ls_sql="select bjbbh";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where dqbm='"+dqbm+"' and sfzybb='2' ";//1：未启用；2：当前版；3：可用版；4：已停用
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
	}
	rs.close();
	ps.close();

	

	ls_sql="update bj_jzbjb set sgdbj=ROUND(bj/"+gcjcbjxs+",2),sgcbj=ROUND(ROUND(bj/"+gcjcbjxs+",2)*"+sgcbbjxs+",2)";
	ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_zdyxmb set sgdbj=ROUND(bj/"+gcjcbjxs+",2),sgcbj=ROUND(ROUND(bj/"+gcjcbjxs+",2)*"+sgcbbjxs+",2)";
	ls_sql+=" where dqbm='"+dqbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

//	out.println(ls_sql);

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
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






