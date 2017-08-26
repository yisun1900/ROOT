<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String dbph=request.getParameter("dbph");


String[] clbm=request.getParameterValues("clbm");
String[] dbslstr=request.getParameterValues("dbsl");
double dbsl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dbdzt="";
	ls_sql=" SELECT dbdzt ";
	ls_sql+=" FROM jxc_db ";
	ls_sql+=" where  dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dbdzt=cf.fillNull(rs.getString("dbdzt"));
	}
	rs.close();
	ps.close();

	//0：未提交；1：提交等待审核；2：审核通过等待出库；3：已出库等待入库；7：审核未通过；9：入库完成
	if (!dbdzt.equals("0") )
	{
		out.print("错误！调拨单["+dbph+"]状态不正确，应为【0：未提交】！");
		return;
	}

	//查询最大数量
	int dbxh=0;
	ls_sql="select NVL(max(dbxh),0)";
	ls_sql+=" from  jxc_dbmx";
	ls_sql+=" where dbph='"+dbph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dbxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		if (dbslstr[i]==null || dbslstr[i].trim().equals(""))
		{
			ls_sql="delete from jxc_dbmx ";
			ls_sql+=" where dbph='"+dbph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		dbsl = Double.parseDouble(dbslstr[i].trim());
		if (dbsl==0)
		{
			ls_sql="delete from jxc_dbmx ";
			ls_sql+=" where dbph='"+dbph+"' and clbm='"+clbm[i]+"' ";
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
			if (dbsl > (zcpzsl-dhsl))
			{
				conn.rollback();
				out.println("错误！现货销售，【开单数量"+dbsl+"】不能大于【可订货数量"+(zcpzsl-dhsl)+"】，可订货数量＝正常品库存－订货");
				return;
			}
		}

		//查询是否已存在
		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_dbmx ";
		ls_sql+=" where clbm='"+clbm[i]+"'  and dbph='"+dbph+"' ";
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
			dbxh++;
			ls_sql="insert into jxc_dbmx (dbph,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,dbsl,cksl,dbxh,xsfs)";
			ls_sql+=" select       ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,?   ,0   ,?   ,?";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,dbph);
			ps.setDouble(2,dbsl);
			ps.setInt(3,dbxh);
			ps.setString(4,xsfs);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update jxc_dbmx set dbsl=?";
			ls_sql+=" where clbm='"+clbm[i]+"'  and dbph='"+dbph+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,dbsl);
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