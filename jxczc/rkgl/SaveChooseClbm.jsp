<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] clbm=request.getParameterValues("clbm");
String rkph = request.getParameter("rkph");	


int rkxh=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();    //得到连接


	//检查入库单状态
	String rkdzt=null;
	ls_sql="select rkdzt ";
	ls_sql+=" from  jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkdzt=rs.getString("rkdzt");
	}
	else{
		out.print("错误！入库单["+rkph+"]不存在！");
		return;
	}
	rs.close();
	ps.close();

	if (!rkdzt.equals("0"))//0：未提交；1：等待审核；2：等待入库；3：已入库；4：已结算；6：等待总部审核
	{
		out.print("错误！入库单已提交，不能再录入数据！");
		return;
	}

	conn.setAutoCommit(false);

	//查询已入库产品数量
	ls_sql="select NVL(max(rkxh),0) ";
	ls_sql+=" from  jxc_rkmx";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rkxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//查询已选择的材料编码
	for (int i=0;i<clbm.length ;i++ )
	{
		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_rkmx ";
		ls_sql+=" where clbm='"+clbm[i]+"' and rkph='"+rkph+"' ";
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
			out.print("<BR>提醒！材料【"+clbm[i]+"】已选择！");
		}

		rkxh++;

		//写入入库明细
		ls_sql="insert into jxc_rkmx ( rkph,rkxh,clbm ,rksl,rkj,rkje,zcpsl,ccpsl,wldssl,thpsl,bfpsl,ccpzkl ) ";
		ls_sql+=" values ( ?,?,? ,0,0,0,0,0,0,0,0,10 ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,rkph);
		ps.setLong(2,rkxh);
		ps.setString(3,clbm[i]);
		ps.executeUpdate();
		ps.close();
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
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if(rs!=null) rs.close();
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
