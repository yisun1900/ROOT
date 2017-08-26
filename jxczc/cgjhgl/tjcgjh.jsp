<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	String jhdzt=null;
	String ssfgs=null;
	ls_sql=" SELECT jhdzt,ssfgs ";
	ls_sql+=" FROM jxc_clcgjh ";
    ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jhdzt=cf.fillNull(rs.getString("jhdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	if (!jhdzt.equals("0"))//0：未提交；1：等待审核；2：审核完成；3：已分解成订单；5：正在办理入库；9：计划完结
	{
		out.print("错误！采购计划["+cgjhph+"]已提交！");
		return;
	}

	//查询地区编码
	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


	//检查是否录入了数据
	int count=0;
	ls_sql=" select count(*)";
	ls_sql+=" from jxc_cgjhmx ";
	ls_sql+=" where cgjhph='"+cgjhph+"' ";
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
		out.print("<BR>提交失败！您还没有录入数据，不能提交！！！");
		return;
	}

	//检查录入的数据中是否有零

	String clbm=null;
	count=0;
	ls_sql=" select clbm ";
	ls_sql+=" from jxc_cgjhmx ";
	ls_sql+=" where cgjhph='"+cgjhph+"' and jhcgsl<=0 ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		count++;
		clbm=rs.getString("clbm");
		out.print("<BR>提交失败！材料["+clbm+"]计划采购数量小于零，不能提交！");
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		return;
	}


	//检查是否符合包装规格
	double jhcgsl =0;
	double bzgg =0;
	ls_sql=" select jhcgsl,bzgg,jxc_clbm.clbm clbm ";
	ls_sql+=" from jxc_cgjhmx,jxc_clbm ";
	ls_sql+=" where cgjhph='"+cgjhph+"' ";
	ls_sql+=" and jxc_clbm.clbm=jxc_cgjhmx.clbm ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=rs.getString("clbm");
		jhcgsl=rs.getDouble("jhcgsl");
		bzgg=rs.getDouble("bzgg");

		if (bzgg<1)
		{
//			out.print("<BR>提交失败！材料["+clbm+"]包装规格["+bzgg+"]必须大于等于1，请联系管理员修改！");
//			return;
		}

		if (bzgg!=0)
		{
			if (jhcgsl<bzgg)
			{
				out.print("<BR>提交失败！材料["+clbm+"]计划采购数量["+jhcgsl+"]不能少于包装规格["+bzgg+"]！");
				return;
			}
			else if (jhcgsl%bzgg!=0)//A%B==0
			{
				out.print("<BR>提交失败！材料["+clbm+"]计划采购数量["+jhcgsl+"]必须是包装规格["+bzgg+"]的整数倍！");
				return;
			}
		}
	}
	rs.close();
	ps.close();


	//计算采购计划的总价格
	double jhsl=0;
	double jhje=0;
	ls_sql=" select sum(jhcgsl),sum(jhcgje) ";
	ls_sql+=" from jxc_cgjhmx ";
	ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		jhsl=rs.getDouble(1);
		jhje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//修改采购计划单状态
	ls_sql="update jxc_clcgjh set jhdzt='1',jhsl="+jhsl+",jhje="+jhje;
	ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("提交成功！请等待审核");
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