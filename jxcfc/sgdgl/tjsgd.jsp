<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sgph=cf.GB2Uni(request.getParameter("sgph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String sgdzt=null;
	ls_sql=" SELECT sgdzt ";
	ls_sql+=" FROM jxc_clsgd ";
    ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdzt=cf.fillNull(rs.getString("sgdzt"));
	}
	rs.close();
	ps.close();

	if (!sgdzt.equals("0"))//0：未提交；1：已提交；2：审核通过；5：部分出库；3：已出库；4：已入库
	{
		out.print("错误！申购单["+sgph+"]已提交");
		return;
	}

	//检查是否录入了数据
	int count=0;
	ls_sql=" select count(*)";
	ls_sql+=" from jxc_clsgmx ";
	ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count<=0)
	{
		out.print("错误！未录入申购明细");
		return;
	}


	//检查是否符合包装规格
	double sgsl=0;
	double bzgg=0;
	String clbm=null;
	ls_sql=" select jxc_clsgmx.clbm,jxc_clsgmx.sgsl,jxc_clbm.bzgg ";
	ls_sql+=" from jxc_clsgmx,jxc_clbm ";
	ls_sql+=" where sgph='"+sgph+"' ";
	ls_sql+=" and jxc_clbm.clbm=jxc_clsgmx.clbm ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=rs.getString("clbm");
		sgsl=rs.getDouble("sgsl");
		bzgg=rs.getDouble("bzgg");

		if (bzgg<1)
		{
			out.print("错误！材料["+clbm+"]包装规格["+bzgg+"]必须大于等于1，请联系管理员修改！</font>");
			return;
		}
		if (sgsl<bzgg)
		{
			out.print("错误！材料["+clbm+"]申购数量["+sgsl+"]不能少于包装规格["+bzgg+"]！");
			return;
		}
		else if (sgsl%bzgg!=0)
		{
			out.print("错误！材料["+clbm+"]申购数量["+sgsl+"]必须是包装规格["+bzgg+"]的整数倍！");
			return;
		}
		
	}
	rs.close();
	ps.close();


	double sgzsl=0;
	double sgzje=0;
	ls_sql=" SELECT sum(shsl),sum(shje)";
	ls_sql+=" FROM jxc_clsgmx ";
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgzsl=rs.getDouble(1);
		sgzje=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	//修改状态
	ls_sql="update jxc_clsgd set sgdzt='1',sgzsl="+sgzsl+",sgzje="+sgzje;
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("提交成功！已提交");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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