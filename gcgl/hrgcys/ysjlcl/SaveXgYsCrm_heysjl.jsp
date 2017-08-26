<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date zgyssj=null;
String zgyssm=null;
String zgysr=null;
ls=request.getParameter("zgyssj");
try{
	if (!(ls.equals("")))  zgyssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zgyssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[整改验收时间]类型转换发生意外:"+e);
	return;
}
zgysr=cf.GB2Uni(request.getParameter("zgysr"));
zgyssm=cf.GB2Uni(request.getParameter("zgyssm"));
String zgysjg=request.getParameter("zgysjg");

String ysjlh=request.getParameter("ysjlh");
String zgcljlh=request.getParameter("zgcljlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclbz=null;
	ls_sql="select clbz";
	ls_sql+=" from crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();

	if (!getclbz.equals("5") && !getclbz.equals("6"))//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
	{
		out.println("错误！状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_yszgcljl set cljg=?,clr=?,clsj=SYSDATE,clsm=?";
	ls_sql+=" where zgcljlh='"+zgcljlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgysjg);
	ps.setString(2,zgysr);
	ps.setString(3,zgyssm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_heysjl set zgyssj=?,zgysr=?,zgysjg=?,zgyssm=?,clbz=?";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,zgyssj);
	ps.setString(2,zgysr);
	ps.setString(3,zgysjg);
	ps.setString(4,zgyssm);
	ps.setString(5,zgysjg);
	ps.executeUpdate();
	ps.close();

	rwjh.Rwjh rwjh=new rwjh.Rwjh();
	//更新验收状态
	rwjh.updateYsxmZt(conn,ysjlh);

	
	if (getclbz.equals("5") )//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
	{
		if (zgysjg.equals("6"))//5：合格；6：不合格
		{
			//发送短信
			ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
			String retStr=dxxt.yszgYs(conn,ysjlh,zgysr);//调用发送短信函数
			if (retStr.equals(""))
			{
				out.println("短信发送成功");
			}
			else{
				out.println(retStr);//将发送结果显示到页面上
			}
		}
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