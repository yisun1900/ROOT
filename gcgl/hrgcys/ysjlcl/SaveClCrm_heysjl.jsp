<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date jjsj=null;
String jjsm=null;
String jjr=null;
ls=request.getParameter("jjsj");
try{
	if (!(ls.equals("")))  jjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jjsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处理时间]类型转换发生意外:"+e);
	return;
}
jjr=cf.GB2Uni(request.getParameter("jjr"));
jjsm=cf.GB2Uni(request.getParameter("jjsm"));
String cljg=request.getParameter("cljg");

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

	if (!getclbz.equals("2") && !getclbz.equals("3"))//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
	{
		out.println("错误！状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into crm_yszgcljl (zgcljlh,ysjlh,lx,cljg,clr,clsj,clsm)  ";
	ls_sql+=" values (?,?,?,?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,ysjlh);
	ps.setString(3,"整改处理");
	ps.setString(4,cljg);
	ps.setString(5,jjr);
	ps.setString(6,jjsm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_heysjl set zgcljlh=?,jjsj=?,jjr=?,cljg=?,jjsm=?,clbz=?";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setDate(2,jjsj);
	ps.setString(3,jjr);
	ps.setString(4,cljg);
	ps.setString(5,jjsm);
	ps.setString(6,cljg);
	ps.executeUpdate();
	ps.close();

	rwjh.Rwjh rwjh=new rwjh.Rwjh();

	//更新验收状态,update crm_khsgjhb set ysjg=?
	rwjh.updateYsxmZt(conn,ysjlh);
	
	conn.commit();

	if (cljg.equals("4"))//3：在处理；4：已解决
	{
		//发送短信
		ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
		String retStr=dxxt.yszgClwc(conn,ysjlh,jjr);//调用发送短信函数
		if (retStr.equals(""))
		{
			out.println("短信发送成功");
		}
		else{
			out.println(retStr);//将发送结果显示到页面上
		}
	}

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