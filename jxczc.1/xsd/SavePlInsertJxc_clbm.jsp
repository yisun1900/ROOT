<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String xsph=request.getParameter("xsph");


String[] clbm=request.getParameterValues("clbm");
String[] xsslstr=request.getParameterValues("xssl");
double xssl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xsdzt=null;
	ls_sql=" SELECT xsdzt ";
	ls_sql+=" FROM jxc_fcxsd ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
	}
	rs.close();
	ps.close();

	if (!xsdzt.equals("0"))//0：未提交；2：提交；3：已出库 
	{
		out.print("错误！销售批号["+xsph+"]已提交，不能再修改！");
		return;
	}

	//查询最大数量
	int xsxh=0;
	ls_sql="select NVL(max(xsxh),0)";
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

	for (int i=0;i<clbm.length ;i++ )
	{
		if (xsslstr[i]==null || xsslstr[i].trim().equals(""))
		{
			ls_sql="delete from jxc_fcxsmx ";
			ls_sql+=" where xsph='"+xsph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		xssl = Double.parseDouble(xsslstr[i].trim());
		if (xssl==0)
		{
			ls_sql="delete from jxc_fcxsmx ";
			ls_sql+=" where xsph='"+xsph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		String xsfs="";
		double zcpzsl=0;
		double dhsl=0;
		ls_sql="select xsfs,zcpzsl,dhsl";
		ls_sql+=" from  jxc_cljgb";
		ls_sql+=" where jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xsfs=cf.fillNull(rs.getString("xsfs"));
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
		}
		rs.close();
		ps.close();

		if (xsfs.equals("2"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			if (xssl > zcpzsl)
			{
				conn.rollback();
				out.println("错误！现货销售，【开单数量"+xssl+"】不能大于【正常品库存数"+zcpzsl+"】");
				return;
			}
		}

		//查询是否已存在
		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_fcxsmx ";
		ls_sql+=" where clbm='"+clbm[i]+"'  and xsph='"+xsph+"' ";
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
			xsxh++;
			ls_sql="insert into jxc_fcxsmx (xsph,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,xssl,xsj          ,xsje           ,cbj          ,cbje           ,cksl,xsxh,xsfs)";
			ls_sql+=" select         ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,?   ,jxc_cljgb.xsj,jxc_cljgb.xsj*?,jxc_cljgb.cbj,jxc_cljgb.cbj*?,0   ,?   ,?";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
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
			ls_sql="update jxc_fcxsmx set xssl=?,xsje=xsj*?,cbje=cbj*?";
			ls_sql+=" where clbm='"+clbm[i]+"'  and xsph='"+xsph+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,xssl);
			ps.setDouble(2,xssl);
			ps.setDouble(3,xssl);
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