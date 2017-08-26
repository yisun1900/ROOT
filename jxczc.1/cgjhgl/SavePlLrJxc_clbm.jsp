<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String cgjhph=request.getParameter("cgjhph");


String[] clbm=request.getParameterValues("clbm");
String[] jhcgslstr=request.getParameterValues("jhcgsl");
String[] jhcgdjstr=request.getParameterValues("jhcgdj");
double jhcgsl=0;
double jhcgdj=0;

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
		out.print("错误！材料采购计划["+cgjhph+"]已提交，不能再修改！");
		return;
	}

	//查询最大数量
	int jhxh=0;
	ls_sql="select NVL(max(jhxh),0)";
	ls_sql+=" from  jxc_cgjhmx";
	ls_sql+=" where cgjhph='"+cgjhph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jhxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		if (jhcgslstr[i]==null || jhcgslstr[i].trim().equals(""))
		{
			ls_sql="delete from jxc_cgjhmx ";
			ls_sql+=" where cgjhph='"+cgjhph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		jhcgsl = Double.parseDouble(jhcgslstr[i].trim());
		if (jhcgsl==0)
		{
			ls_sql="delete from jxc_cgjhmx ";
			ls_sql+=" where cgjhph='"+cgjhph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		jhcgdj = Double.parseDouble(jhcgdjstr[i].trim());


		//查询是否已存在
		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_cgjhmx ";
		ls_sql+=" where clbm='"+clbm[i]+"'  and cgjhph='"+cgjhph+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			jhxh++;
			ls_sql="insert into jxc_cgjhmx (cgjhph,jhxh,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm  ,jhcgsl,jhcgdj,jhcgje,sjcgsl,sjcgdj,sjcgje)";
			ls_sql+=" select         ?,?   ,jxc_cljgb.clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm   ,?      ,?     ,?     ,0     ,0     ,0 ";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,cgjhph);
			ps.setInt(2,jhxh);
			ps.setDouble(3,jhcgsl);
			ps.setDouble(4,jhcgdj);
			ps.setDouble(5,jhcgsl*jhcgdj);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update jxc_cgjhmx set jhcgsl=?,jhcgdj=?,jhcgje=?";
			ls_sql+=" where clbm='"+clbm[i]+"'  and cgjhph='"+cgjhph+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,jhcgsl);
			ps.setDouble(2,jhcgdj);
			ps.setDouble(3,jhcgsl*jhcgdj);
			ps.executeUpdate();
			ps.close();
		}
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
	out.print("Exception: " + e);
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