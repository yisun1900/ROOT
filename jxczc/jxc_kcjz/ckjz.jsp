<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yue=request.getParameter("yue");
String nian=request.getParameter("nian");
String rq1=null;
String ckbh=request.getParameter("ckbh");
String jzph=null;
String zljb=null;
String clbm=null;
double jqpjcbj=0;
if (nian!=null && yue!=null)
{
	rq1=cf.GB2Uni(nian+"-"+yue);
}

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	//查询结转日期是否符合
	ls_sql="select cdbh ";
	ls_sql+=" from  sq_cd";
	ls_sql+=" where  last_day(to_date('"+rq1+"','YYYY-MM'))<=sysdate  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())//可以结转
	{}
	else
	{
		out.print("仓库结转失败！结转日期不正确，您只能在每个月最后一天，或者下个月结转！");
		conn.rollback();
		return;
	}
	rs.close();
	ps.close();

	//查询上个月是否有结转
	ls_sql="select jzph ";
	ls_sql+=" from  jxc_kcjz";
	ls_sql+=" where to_char(jzrq,'YYYY-MM')='"+rq1+"' and ckbh='"+ckbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())//可以结转
	{
		out.print("仓库结转失败！【"+nian+"年"+yue+"月】已经结转！");
		conn.rollback();
		return;
	}
	rs.close();
	ps.close();

	//产生新的结转批号
	ls_sql="select lpad(NVL(max(jzph),0)+1,8,0) jzph ";
	ls_sql+=" from  jxc_kcjz";
	ls_sql+=" where 1=1 ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())//可以结转
	{
		jzph=rs.getString("jzph");
	}
	rs.close();
	ps.close();

	//将库存统计写入结转记录
	ls_sql=" insert into jxc_kcjz(jzph,ckbh,zcpzsl,zcpzjg,ccpzsl,ccpzje,bfpzsl,bfpzje,jzrq) ";
	ls_sql+=" values ( ?,?,0,0,0,0,0,0,last_day(add_months(sysdate,-1)) ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jzph);
	ps.setString(2,ckbh);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！1111<br>"+ls_sql);
		conn.rollback();return;
	}
	else
	{
		out.print("批号：【"+jzph+"】更新库存结转成功！<br>");
	}
	ps.close();

	//更新正常品数据
	ls_sql="update jxc_kcjz set zcpzsl=(select NVL(sum(kcsl),0) from jxc_kcb where ckbh='"+ckbh+"' and zljb='1'),zcpzjg=(select NVL(sum(kcje),0) from jxc_kcb where ckbh='"+ckbh+"' and zljb='1') ";
	ls_sql+=" where  (jzph='"+jzph+"')";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！<br>");
		conn.rollback();
		return;
	}
	ps.close();

	//更新残次品数据
	ls_sql="update jxc_kcjz set ccpzsl=(select NVL(sum(kcsl),0) from jxc_kcb where ckbh='"+ckbh+"' and zljb='2'),ccpzje=(select NVL(sum(kcje),0) from jxc_kcb where ckbh='"+ckbh+"' and zljb='2') ";
	ls_sql+=" where  (jzph='"+jzph+"')";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！<br>");
		conn.rollback();
		return;
	}
	ps.close();

	//更新报废品数据
	ls_sql="update jxc_kcjz set bfpzsl=(select NVL(sum(kcsl),0) from jxc_kcb where ckbh='"+ckbh+"' and zljb='3'),bfpzje=(select NVL(sum(kcje),0) from jxc_kcb where ckbh='"+ckbh+"' and zljb='3') ";
	ls_sql+=" where  (jzph='"+jzph+"')";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！<br>");
		conn.rollback();
		return;
	}
	ps.close();

	//将各种材料循环写入库存结转明细
	ls_sql="select clbm,zljb ";
	ls_sql+=" from  jxc_kcb ";
	ls_sql+=" where ckbh='"+ckbh+"' ";
	ls_sql+=" group by clbm,zljb ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())//可以结转
	{
		clbm=rs.getString("clbm");
		zljb=rs.getString("zljb");
//		jqpjcbj=rs.getDouble("jqpjcbj");
		//计算加权平均成本价
		ls_sql="select clbm,zljb,sum(jqpjcbj*kcsl)/sum(kcsl) jqpjcbj ";
		ls_sql+=" from  jxc_kcb ";
		ls_sql+=" where ckbh='"+ckbh+"' and clbm='"+clbm+"' and zljb='"+zljb+"' ";
		ls_sql+=" group by clbm,zljb ";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery(ls_sql);
		if (rs2.next())//可以结转
		{
			jqpjcbj=rs2.getDouble("jqpjcbj");
		}
		rs2.close();
		ps2.close();

		//将库存统计写入结转记录
		ls_sql=" insert into jxc_kcjzmx(jzph,clbm,zljb,zsl,zjg,jqpjcbj) ";
		ls_sql+=" select '"+jzph+"',clbm,zljb,NVL(sum(kcsl),0),NVL(sum(kcje),0),'"+jqpjcbj+"' ";
		ls_sql+=" from jxc_kcb ";
		ls_sql+=" where ckbh='"+ckbh+"' and clbm='"+clbm+"' and zljb='"+zljb+"' ";
		ls_sql+=" group by clbm,zljb,'"+jqpjcbj+"' ";
		ps2= conn.prepareStatement(ls_sql);
		ps2.executeUpdate();
		ps2.close();
	}
	rs.close();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("仓库结转成功！结转批号：<%=jzph%>");
	//-->
	</SCRIPT>
	&nbsp;<br>
	<center><a href="kcjzmxcx.jsp?jzph=<%=jzph%>">打印结转明细</a></center>
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>