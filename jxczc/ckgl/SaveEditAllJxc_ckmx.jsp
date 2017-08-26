<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph = request.getParameter("ckph");

String[] clbm =request.getParameterValues("clbm");
String[] ckxh =request.getParameterValues("ckxh");
String[] ckslstr =request.getParameterValues("cksl");
String[] xsfs =request.getParameterValues("xsfs");
String[] kcslstr =request.getParameterValues("kcsl");
String[] xckslstr =request.getParameterValues("xcksl");
String[] ckdjstr =request.getParameterValues("ckdj");


double cksl=0;
double kcsl=0;
double xcksl=0;//需出库数量
double ckdj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//查询出库单
	String ckdzt = null;
	ls_sql = " select ckdzt ";
	ls_sql+= " from jxc_ckd ";
	ls_sql +=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
	}
	else
	{
		out.print("错误！不存在的出库单");
		return;
	}
	rs.close();
	ps.close();
	if (!ckdzt.equals("0"))
	{
		out.print("错误！出库单已提交");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<ckxh.length ;i++ )
	{
		//出库数量
		try{
			cksl=Double.parseDouble(ckslstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>错误！【"+clbm[i]+"】[出库数量]不是数字类型："+ckslstr[i]);
			return;
		}



		if (cksl<=0)
		{
			out.println("<BR>错误！【"+clbm[i]+"】出库数量必须大于0");
			conn.rollback();
			return;
		}

		kcsl=Double.parseDouble(kcslstr[i].trim());
		xcksl=Double.parseDouble(xckslstr[i].trim());
		ckdj=Double.parseDouble(ckdjstr[i].trim());

		//检查：出库数量不能大于需要出库数量＋＋＋＋＋＋＋＋＋＋＋开始
		//出库数量＝需出库数量＝开单数量－已出库数量
		if (cksl>xcksl)
		{
			conn.rollback();
			out.print("<BR>错误！材料【"+clbm[i]+"】【出库数量："+cksl+"】不能大于【需出库数量："+xcksl+"】");
			return;
		}
		//检查：出库数量不能大于需要出库数量＝＝＝＝＝＝＝＝＝＝＝结束

		//检查：出库数量不能大于库存数量＋＋＋＋＋＋＋＋＋＋＋开始
		//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		if (xsfs[i].equals("2") || xsfs[i].equals("3"))
		{
			if (cksl>kcsl)
			{
				conn.rollback();
				out.print("<BR>错误！材料【"+clbm[i]+"】【出库数量："+cksl+"】不能大于【库存数量："+kcsl+"】");
				return;
			}
		}
		//检查：出库数量不能大于库存数量＝＝＝＝＝＝＝＝＝＝＝结束

		ls_sql="update jxc_ckmx set cksl=?,ckdj=?,ckje=?*?,cbje=cbdj*?";
		ls_sql+=" where jxc_ckmx.ckxh='"+ckxh[i]+"' and jxc_ckmx.ckph='"+ckph+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cksl);
		ps.setDouble(2,ckdj);
		ps.setDouble(3,cksl);
		ps.setDouble(4,ckdj);
		ps.setDouble(5,cksl);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>