<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] rkph=request.getParameterValues("rkph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;

String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<rkph.length ;i++ )
	{
		//检查入库单状态
		String rkdzt=null;
		String dqbm=null;
		String rklx=null;
		String lydh=null;
		ls_sql="select rkdzt,dqbm,rklx,lydh ";
		ls_sql+=" from  jxc_rkd ";
		ls_sql+=" where rkph='"+rkph[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			rkdzt=rs.getString("rkdzt");
			dqbm=rs.getString("dqbm");
			rklx=rs.getString("rklx");
			lydh=rs.getString("lydh");
		}
		else{
			rs.close();
			ps.close();
			conn.rollback();
			out.print("错误！入库单["+rkph[i]+"]不存在！");
			return;
		}
		rs.close();
		ps.close();

		if (!rkdzt.equals("0"))//0：未提交；1：等待审核；2：等待入库；3：已入库；4：已结算；6：等待总部审核
		{
			conn.rollback();
			out.print("错误！入库单已提交："+rkph[i]);
			return;
		}


		if (rklx.equals("S"))//S：申购入库
		{
			//检查供应商订单状态
			String ddzt=null;
			ls_sql="select ddzt ";
			ls_sql+=" from  jxc_gysdd ";
			ls_sql+=" where gysddph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ddzt=rs.getString("ddzt");
			}
			else{
				conn.rollback();
				out.print("错误！供应商订单批号["+lydh+"]不存在！");
				return;
			}
			rs.close();
			ps.close();

			if (!ddzt.equals("4") && !ddzt.equals("1"))//7：未提交；0：已提交；1：已下单；2：已接受；3：部分发货；5：已完成发货；4：已入库；6：正在办理入库； 9：已结算
			{
				conn.rollback();
				out.print("错误！供应商订单状态不正确！"+ddzt);
				return;
			}

			//供应商订单明细
			ls_sql="update jxc_gysddmx set pssl=pssl-NVL((select sum(rksl) from jxc_rkmx where rkph='"+rkph[i]+"' and jxc_rkmx.clbm=jxc_gysddmx.clbm),0)";
			ls_sql+=" where gysddph='"+lydh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//供应商订单
			ls_sql="update jxc_gysdd set ddzt='1'";//1：已下单
			ls_sql+=" where gysddph='"+lydh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (rklx.equals("C"))//C：采购入库
		{
			//检查供应商订单状态
			String ddzt=null;
			ls_sql="select ddzt ";
			ls_sql+=" from  jxc_gysdd ";
			ls_sql+=" where gysddph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ddzt=rs.getString("ddzt");
			}
			else{
				conn.rollback();
				out.print("错误！供应商订单批号["+lydh+"]不存在！");
				return;
			}
			rs.close();
			ps.close();

			if (!ddzt.equals("4"))//7：未提交；0：已提交；1：已下单；2：已接受；3：部分发货；5：已完成发货；4：已入库；6：正在办理入库； 9：已结算
			{
				conn.rollback();
				out.print("错误！供应商订单未入库！");
				return;
			}

			//供应商订单明细
			ls_sql="update jxc_gysddmx set pssl=pssl-(select sum(rksl) from jxc_rkmx where rkph='"+rkph[i]+"' and jxc_rkmx.clbm=jxc_gysddmx.clbm)";
			ls_sql+=" where gysddph='"+lydh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//供应商订单
			ls_sql="update jxc_gysdd set ddzt='1'";//1：已下单
			ls_sql+=" where gysddph='"+lydh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (rklx.equals("F"))//F：发货单入库
		{
			//检查供应商订单状态
			String ckdzt=null;
			ls_sql="select ckdzt ";
			ls_sql+=" from  jxc_ckd ";
			ls_sql+=" where ckph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ckdzt=rs.getString("ckdzt");
			}
			else{
				conn.rollback();
				out.print("错误！出库批号["+lydh+"]不存在！");
				return;
			}
			rs.close();
			ps.close();

			if (!ckdzt.equals("8"))//8：接受方已入库
			{
				conn.rollback();
				out.print("错误！出库批号未入库！");
				return;
			}

			//出库单
			ls_sql="update jxc_ckd set ckdzt='9'";//9：提交
			ls_sql+=" where ckph='"+lydh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//删除：入库
		ls_sql=" delete from jxc_rkd ";
		ls_sql+=" where rkph='"+rkph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//删除：入库明细表
		ls_sql=" delete from jxc_rkmx ";
		ls_sql+=" where rkph='"+rkph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>