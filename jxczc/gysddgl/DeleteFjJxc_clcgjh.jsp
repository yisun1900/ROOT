<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String[] cgjhph = request.getParameterValues("cgjhph");
String cgjhphItem =cf.GB2Uni(cf.arrayToInSQL(cgjhph,"cgjhph"));



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<cgjhph.length ;i++ )
	{
		String jhdzt=null;
		String shjg=null;
		ls_sql="select jhdzt,shjg ";
		ls_sql+=" from  jxc_clcgjh ";
		ls_sql+=" where cgjhph='"+cgjhph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jhdzt=rs.getString("jhdzt");
			shjg=rs.getString("shjg");
		}
		rs.close();
		ps.close();

		if (!jhdzt.equals("3"))//0：未提交；1：等待审核；2：审核完成；3：已分解成订单；5：正在办理入库；9：计划完结
		{
			conn.rollback();
			out.print("错误！采购计划["+cgjhph[i]+"]状态不正确！");
			return;
		}

		String clbm=null;
		double jhcgsl=0;
		String gysmc=null;
		ls_sql="select clbm,jhcgsl,gysmc ";
		ls_sql+=" from  jxc_cgjhmx ";
		ls_sql+=" where cgjhph='"+cgjhph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=rs.getString("clbm");
			jhcgsl=rs.getDouble("jhcgsl");
			gysmc=rs.getString("gysmc");

			//采购计划订单对照表
			String gysddph=null;
			ls_sql="select jxc_cgjhddb.gysddph ";
			ls_sql+=" from  jxc_cgjhddb,jxc_gysdd ";
			ls_sql+=" where jxc_cgjhddb.gysddph=jxc_gysdd.gysddph and jxc_cgjhddb.cgjhph='"+cgjhph[i]+"' and jxc_gysdd.gysmc='"+gysmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				gysddph=rs1.getString("gysddph");
			}
			rs1.close();
			ps1.close();

			double dhsl=0;
			ls_sql="select dhsl ";
			ls_sql+=" from  jxc_gysddmx ";
			ls_sql+=" where gysddph='"+gysddph+"' and clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if (rs1.next())
			{
				dhsl=rs1.getDouble("dhsl");
			}
			rs1.close();
			ps1.close();

			if (dhsl<jhcgsl)
			{
				conn.rollback();
				out.println("错误！[订货数量:"+dhsl+"]不正确，必须大于[计划采购数量:"+jhcgsl+"]");
				return;
			}
			else if (dhsl==jhcgsl)
			{
				ls_sql="delete from jxc_gysddmx ";
				ls_sql+=" where gysddph='"+gysddph+"' and clbm='"+clbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else
			{
				ls_sql="update jxc_gysddmx set dhsl=dhsl-"+jhcgsl;
				ls_sql+=" where gysddph='"+gysddph+"' and clbm='"+clbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}

			//删除：供应商订单
			ls_sql="delete from jxc_gysdd ";
			ls_sql+=" where gysddph='"+gysddph+"' and 0=(select count(*) from jxc_gysddmx where gysddph='"+gysddph+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
		rs.close();
		ps.close();

		//更新采购计划单状态
		ls_sql="update jxc_clcgjh set jhdzt='2' ";
		ls_sql+=" where cgjhph='"+cgjhph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//删除：采购计划订单对照表
		ls_sql="delete from jxc_cgjhddb ";
		ls_sql+=" where cgjhph='"+cgjhph[i]+"'";
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


	
%>