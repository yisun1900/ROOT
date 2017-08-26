<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="ck" scope="page" class="jxc.ckgl.Ckgl"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ckph = request.getParameterValues("ckph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	//检查是否录入了数据
	int count=0;

	conn.setAutoCommit(false);

	for (int i=0;i<ckph.length ;i++ )
	{
		String ckdzt=null;
		String cklx=null;
		String lydh=null;
		ls_sql=" select ckdzt,cklx,lydh";
		ls_sql+=" from jxc_ckd ";
		ls_sql+=" where ckph='"+ckph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			ckdzt=cf.fillNull(rs.getString("ckdzt"));
			cklx=cf.fillNull(rs.getString("cklx"));
			lydh=cf.fillNull(rs.getString("lydh"));
		}
		else
		{
			conn.rollback();
			out.print("不存在的出库批号："+ckph[i]);
			return;
		}
		rs.close();
		ps.close();

		if (!ckdzt.equals("0"))//0:未提交； 1：等待报废审核；2：等待退货审核；3：等待调拨入库；4：已结算；5：退货审核通过6：报废审核未通过；7：退货审核未通过；8:审核通过；9：提交
		{
			conn.rollback();
			out.print("错误！出库单已提交不能删除，请先删除提交："+ckph[i]);
			return;
		}

		//删除出库明细
		ls_sql="delete from jxc_ckmx ";
		ls_sql+=" where ckph='"+ckph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//删除出库明单
		ls_sql="delete from jxc_ckd ";
		ls_sql+=" where ckph='"+ckph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("出库单删除成功！");
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