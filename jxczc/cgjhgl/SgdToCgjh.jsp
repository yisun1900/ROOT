<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String[] sgph = request.getParameterValues("sgph");
String cgjhph = request.getParameter("cgjhph");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

try {
	conn=cf.getConnection();    //得到连接

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
		out.print("错误！材料采购计划["+cgjhph+"]已提交，不能再修改！");
		return;
	}

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

	conn.setAutoCommit(false);


	//查询最大序列号
	int jhxh=0;
	ls_sql="select max(jhxh) ";
	ls_sql+=" from  jxc_cgjhmx ";
	ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jhxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//查询已选择的材料编码
	String clbm=null;
	double shsl=0;
	ls_sql="select clbm,sum(shsl) shsl";
	ls_sql+=" from  jxc_clsgmx,jxc_clsgd ";
	ls_sql+=" where jxc_clsgmx.sgph=jxc_clsgd.sgph and jxc_clsgd.sfzcgd='N' and "+cf.arrayToInSQL(sgph,"jxc_clsgmx.sgph");
	ls_sql+=" group by clbm ";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery(ls_sql);
	while (rs2.next())
	{
		
		clbm=cf.fillNull(rs2.getString("clbm"));
		shsl=rs2.getDouble("shsl");

		//取：计划采购单价	 
		double jhcgdj=0;
		ls_sql=" select cbj ";
		ls_sql+=" from jxc_cljgb ";
		ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			jhcgdj=rs.getDouble("cbj");
		}
		else
		{
			rs.close();
			ps.close();

			conn.rollback();
			out.print("错误！材料『"+clbm+"』没有成本价"+ls_sql);
			return;
		}
		rs.close();
		ps.close();


		//检查材料编码是否重复录入	 
		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_cgjhmx ";
		ls_sql+=" where clbm='"+clbm+"' and cgjhph='"+cgjhph+"' ";
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
			conn.rollback();
			out.print("错误！材料『"+clbm+"』已被选择，若想继续操作，请先删除此种材料");
			return;
		}
		else
		{
			jhxh++;

			ls_sql="insert into jxc_cgjhmx ( cgjhph,jhxh,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm ,jhcgsl,jhcgdj,jhcgje ,sjcgsl,sjcgdj,sjcgje ) ";
			ls_sql+=" select       ?     ,?   ,jxc_cljgb.clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm ,?     ,?     ,?      ,0,0,0 ";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps3= conn.prepareStatement(ls_sql);
			ps3.setString(1,cgjhph);
			ps3.setLong(2,jhxh);
			ps3.setDouble(3,shsl);
			ps3.setDouble(4,jhcgdj);
			ps3.setDouble(5,shsl*jhcgdj);
			ps3.executeUpdate();
			ps3.close();
		}
		rs.close();
		ps.close();

		
	}
	rs2.close();
	ps2.close();

	//填写申购转采购对照表
	ls_sql="insert into jxc_sgzcgdzb ( cgjhph,sgph ) ";
	ls_sql+=" select  ?,sgph";
	ls_sql+=" from  jxc_clsgd ";
	ls_sql+=" where  jxc_clsgd.sfzcgd='N' and "+cf.arrayToInSQL(sgph,"jxc_clsgd.sgph");
	ps3= conn.prepareStatement(ls_sql);
	ps3.setString(1,cgjhph);
	ps3.executeUpdate();
	ps3.close();

	//更新申购单状态
	ls_sql="update jxc_clsgd set sfzcgd='Y' ";
	ls_sql+=" where "+cf.arrayToInSQL(sgph,"sgph");
	ps3= conn.prepareStatement(ls_sql);
	ps3.executeUpdate();
	ps3.close();

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
