<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String[] clbm=request.getParameterValues("clbm");
String[] getrkxh=request.getParameterValues("rkxh");
String[] rkjstr=request.getParameterValues("rkj");
String[] rkslstr=request.getParameterValues("rksl");
String[] scrqstr=request.getParameterValues("scrq");
String[] scph=request.getParameterValues("scph");
String[] hwbh =request.getParameterValues("hwbh");//入库货位
String[] hjbh =request.getParameterValues("hjbh");//入库货架

double rkj=0;
double rksl=0;
java.sql.Date scrq=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

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
		out.print("错误！入库单已提交，不能再修改！");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		//入库单价
		if (cf.GB2Uni(rkjstr[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>第【"+(i+1)+"】行错误！材料编码【"+clbm[i]+"】入库单价不能为空！");
			return;
		}

		try{
			rkj=Double.parseDouble(rkjstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>第【"+(i+1)+"】行错误！材料编码【"+clbm[i]+"】[入库单价]不是数字:"+e);
			return;
		}

		//入库数量
		if (rkslstr[i]==null || rkslstr[i].trim().equals(""))
		{
			conn.rollback();
			out.print("<BR>第【"+(i+1)+"】行错误！材料编码【"+clbm[i]+"】入库数量不能为空！");
			return;
		}
		try{
			rksl=Double.parseDouble(rkslstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>第【"+(i+1)+"】行错误！材料编码【"+clbm[i]+"】[入库数量]不是数字:"+e);
			return;
		}

		if (rksl==0)
		{
			conn.rollback();
			out.print("<BR>第【"+(i+1)+"】行错误！材料编码【"+clbm[i]+"】入库数量不能为0！");
			return;
		}

		//生产日期
		if (cf.GB2Uni(scrqstr[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>第【"+(i+1)+"】行错误！材料编码【"+clbm[i]+"】生产日期不能为空！");
			return;
		}

		try{
			scrq=java.sql.Date.valueOf(scrqstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>第【"+(i+1)+"】行错误！材料编码【"+clbm[i]+"】[生产日期]格式不正确，应为【YYYY-MM-DD】:"+e);
			return;
		}

		//生产批号
		if (cf.GB2Uni(scph[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>第【"+(i+1)+"】行错误！材料编码【"+clbm[i]+"】生产批号不能为空！");
			return;
		}

		//检查货架
		if (cf.GB2Uni(hjbh[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>第【"+(i+1)+"】行错误！材料编码【"+clbm[i]+"】入库货架不能为空！");
			return;
		}


		//修改入库明细
		double rkje=rkj*rksl;
		ls_sql="update jxc_rkmx set rkj=?,rksl=?,rkje=?,scrq=?,scph=?,zcpsl=?,hjbh=?,hwbh=? ";
		ls_sql+=" where rkph='"+rkph+"' and rkxh='"+getrkxh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,rkj);
		ps.setDouble(2,rksl);
		ps.setDouble(3,rkje);
		ps.setDate(4,scrq);
		ps.setString(5,cf.GB2Uni(scph[i]));
		ps.setDouble(6,rksl);
		ps.setString(7,cf.GB2Uni(hjbh[i]));
		ps.setString(8,cf.GB2Uni(hwbh[i]));
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