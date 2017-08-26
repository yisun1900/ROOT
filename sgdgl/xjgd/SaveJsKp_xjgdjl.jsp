<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String jsr=null;
java.sql.Date jssj=null;
String jssm=cf.GB2Uni(request.getParameter("jsyj"));

jsr=cf.GB2Uni(request.getParameter("jsr"));
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[接收时间]类型转换发生意外:"+e);
	return;
}

String zgcljlh=request.getParameter("zgcljlh");
String zgjlh=request.getParameter("zgjlh");
String xjjlh=request.getParameter("xjjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getwtclbz=null;
	ls_sql="select wtclbz";
	ls_sql+=" from kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getwtclbz=cf.fillNull(rs.getString("wtclbz"));
	}
	rs.close();
	ps.close();

	if (getwtclbz.equals("Y"))//B：无整改；N：整改未接收；C：在处理；Y：已解决
	{
		out.println("错误！整改已解决");
		return;
	}

	String getclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from kp_zggdmx";
	ls_sql+=" where zgjlh='"+zgjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!getclzt.equals("1") && !getclzt.equals("6"))//1:未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
	{
		out.println("错误！整改已接收");
		return;
	}

	
	conn.setAutoCommit(false);

	ls_sql="insert into kp_zgclgdmx (zgcljlh,zgjlh,xjjlh,lx,cljg,clr,clsj,clsm)  ";
	ls_sql+=" values (?,?,?,?,?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,zgjlh);
	ps.setString(3,xjjlh);
	ps.setString(4,"接收");
	ps.setString(5,"");
	ps.setString(6,jsr);
	ps.setString(7,jssm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update kp_zggdmx set clzt='2',zgcljlh=?,jsr=?,jssj=SYSDATE,jssm=?  ";//1:未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
	ls_sql+=" where zgjlh='"+zgjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,jsr);
	ps.setString(3,jssm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update kp_xjgdjl set wtclbz='C'";//B：无整改；N：整改未接收；C：在处理；Y：已解决
	ls_sql+=" where xjjlh='"+xjjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
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