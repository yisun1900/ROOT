<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String xsph=cf.GB2Uni(request.getParameter("xsph"));
String dqbm=request.getParameter("dqbm");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
double xssl = 0;
double xsje = 0;
ls=request.getParameter("xssl");
try{
	if (!(ls.equals("")))  xssl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xssl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xsje");
try{
	if (!(ls.equals("")))  xsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xsje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[销售金额]类型转换发生意外:"+e);
	return;
}
String xsfs=request.getParameter("xsfs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xsdzt=null;
	String ssfgs=null;
	ls_sql=" SELECT xsdzt,ssfgs ";
	ls_sql+=" FROM jxc_fcxsd ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	if (!xsdzt.equals("0"))//0：未提交；2：提交；3：已出库 
	{
		out.print("错误！销售批号["+xsph+"]已提交，不能再修改！");
		return;
	}

	String fccbj="";//1：入库价；2：加权平均价
	ls_sql=" SELECT fccbj ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fccbj=cf.fillNull(rs.getString("fccbj"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql=" select count(*) ";
	ls_sql+=" from jxc_fcxsmx ";
	ls_sql+=" where clbm='"+clbm+"'  and xsph='"+xsph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//查询最大数量
	int xsxh=0;
	ls_sql="select NVL(max(xsxh),0)+1 ";
	ls_sql+=" from  jxc_fcxsmx";
	ls_sql+=" where xsph='"+xsph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	if (count==0)
	{
		if (fccbj.equals("2"))//1：入库价；2：加权平均价
		{
			if (fccbj.equals("2"))//1：入库价；2：加权平均价
			{
				ls_sql="insert into jxc_fcxsmx (xsph,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,xssl,xsj            ,xsje             ,cbj              ,cbje               ,cksl,xsxh,xsfs)";
				ls_sql+=" select         ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,?   ,jxc_cljgb.dgzjg,jxc_cljgb.dgzjg*?,jxc_cljgb.jqpjcbj,jxc_cljgb.jqpjcbj*?,0   ,?   ,?";
				ls_sql+=" from  jxc_cljgb,jxc_clbm";
				ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
				ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,xsph);
				ps.setDouble(2,xssl);
				ps.setDouble(3,xssl);
				ps.setDouble(4,xssl);
				ps.setInt(5,xsxh);
				ps.setString(6,xsfs);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="insert into jxc_fcxsmx (xsph,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,xssl,xsj            ,xsje             ,cbj          ,cbje           ,cksl,xsxh,xsfs)";
				ls_sql+=" select         ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,?   ,jxc_cljgb.dgzjg,jxc_cljgb.dgzjg*?,jxc_cljgb.cbj,jxc_cljgb.cbj*?,0   ,?   ,?";
				ls_sql+=" from  jxc_cljgb,jxc_clbm";
				ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
				ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,xsph);
				ps.setDouble(2,xssl);
				ps.setDouble(3,xssl);
				ps.setDouble(4,xssl);
				ps.setInt(5,xsxh);
				ps.setString(6,xsfs);
				ps.executeUpdate();
				ps.close();
			}
		}
		else{
			ls_sql="insert into jxc_fcxsmx (xsph,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,xssl,xsj            ,xsje             ,cbj          ,cbje           ,cksl,xsxh,xsfs)";
			ls_sql+=" select         ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,?   ,jxc_cljgb.dgzjg,jxc_cljgb.dgzjg*?,jxc_cljgb.cbj,jxc_cljgb.cbj*?,0   ,?   ,?";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xsph);
			ps.setDouble(2,xssl);
			ps.setDouble(3,xssl);
			ps.setDouble(4,xssl);
			ps.setInt(5,xsxh);
			ps.setString(6,xsfs);
			ps.executeUpdate();
			ps.close();
		}
	}
	else{
		ls_sql="update jxc_fcxsmx set xssl=?,xsje=xsj*?,cbje=cbj*?";
		ls_sql+=" where clbm='"+clbm+"'  and xsph='"+xsph+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,xssl);
		ps.setDouble(2,xssl);
		ps.setDouble(3,xssl);
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