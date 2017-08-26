<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String shr=null;
java.sql.Date shrq=null;
String shyj=null;
String sgdzt=null;


shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shrq");
try{
	if (!(ls.equals("")))  shrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[shrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核日期]类型转换发生意外:"+e);
	return;
}
shyj=cf.GB2Uni(request.getParameter("shyj"));
sgdzt=cf.GB2Uni(request.getParameter("sgdzt"));

String[] clbm =request.getParameterValues("clbm");
String[] shslStr =request.getParameterValues("shsl");
String[] shjgStr =request.getParameterValues("shjg");
String[] bzggStr =request.getParameterValues("bzgg");
double shsl=0;
double bzgg=0;
double shjg=0;

String sgph=cf.GB2Uni(request.getParameter("sgph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	String getsgdzt=null;
	ls_sql=" SELECT sgdzt ";
	ls_sql+=" FROM jxc_clsgd ";
    ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsgdzt=cf.fillNull(rs.getString("sgdzt"));
	}
	rs.close();
	ps.close();

	if (!getsgdzt.equals("1"))//0：未提交；1：已提交；2：审核通过；5：部分出库；3：已出库；4：已入库
	{
		conn.rollback();
		out.print("错误！申购单["+sgph+"]已审核");
		return;
	}
	

	for (int i=0;i<clbm.length ;i++ )
	{
		shsl=Double.parseDouble(shslStr[i].trim());
		shjg=Double.parseDouble(shjgStr[i].trim());
		bzgg=Double.parseDouble(bzggStr[i].trim());

		if (shsl<0)
		{
			conn.rollback();
			out.print("错误！材料["+clbm[i]+"]审核数量["+shsl+"]不能小于0！");
			return;
		}
		if (shjg<0)
		{
			conn.rollback();
			out.print("错误！材料["+clbm[i]+"]审核单价["+shjg+"]不能小于0！");
			return;
		}

		if (bzgg<1)
		{
			conn.rollback();
			out.print("错误！材料["+clbm[i]+"]包装规格["+bzgg+"]必须大于等于1，请联系管理员修改！</font>");
			return;
		}
		if (shsl<bzgg && shsl!=0)
		{
			conn.rollback();
			out.print("错误！材料["+clbm[i]+"]申购数量["+shsl+"]不能少于包装规格["+bzgg+"]！");
			return;
		}
		else if (shsl%bzgg!=0)
		{
			conn.rollback();
			out.print("错误！材料["+clbm[i]+"]申购数量["+shsl+"]必须是包装规格["+bzgg+"]的整数倍！");
			return;
		}

		ls_sql="update jxc_clsgmx set shsl=?,shjg=?,shje=? ";
		ls_sql+=" where sgph='"+sgph+"' and clbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,shsl);
		ps.setDouble(2,shjg);
		ps.setDouble(3,shsl*shjg);
		ps.executeUpdate();
		ps.close();
	}

	//删除审核数量为零的材料
	ls_sql="delete from  jxc_clsgmx ";
	ls_sql+=" where sgph='"+sgph+"' and shsl=0 ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jxc_clsgd set sgdzt=?,shr=?,shrq=?,shyj=?";
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgdzt);
	ps.setString(2,shr);
	ps.setDate(3,shrq);
	ps.setString(4,shyj);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("审核成功！");
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