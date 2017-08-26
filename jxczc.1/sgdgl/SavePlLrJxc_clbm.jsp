<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String sgph=request.getParameter("sgph");


String[] clbm=request.getParameterValues("clbm");
String[] sgslstr=request.getParameterValues("sgsl");
String[] sgjgstr=request.getParameterValues("sgjg");
double sgsl=0;
double sgjg=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sgdzt=null;
	ls_sql=" SELECT sgdzt ";
	ls_sql+=" FROM jxc_clsgd ";
    ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdzt=cf.fillNull(rs.getString("sgdzt"));
	}
	rs.close();
	ps.close();

	if (!sgdzt.equals("0"))//0：未提交；1：已提交；2：审核通过；5：部分出库；3：已出库；4：已入库
	{
		out.print("错误！材料单["+sgph+"]已提交，不能再修改！");
		return;
	}

	//查询最大数量
	int sgxh=0;
	ls_sql="select NVL(max(sgxh),0)";
	ls_sql+=" from  jxc_clsgmx";
	ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		if (sgslstr[i]==null || sgslstr[i].trim().equals(""))
		{
			ls_sql="delete from jxc_clsgmx ";
			ls_sql+=" where sgph='"+sgph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		sgsl = Double.parseDouble(sgslstr[i].trim());
		if (sgsl==0)
		{
			ls_sql="delete from jxc_clsgmx ";
			ls_sql+=" where sgph='"+sgph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		sgjg = Double.parseDouble(sgjgstr[i].trim());


		//查询是否已存在
		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_clsgmx ";
		ls_sql+=" where clbm='"+clbm[i]+"'  and sgph='"+sgph+"' ";
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
			sgxh++;
			ls_sql="insert into jxc_clsgmx (sgph,sgxh,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm  ,sgsl,sgjg,sgje,shsl,shjg,shje,ycksl)";
			ls_sql+=" select         ?,?   ,jxc_cljgb.clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm  ,?   ,?   ,?   ,?   ,?   ,?   ,0 ";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sgph);
			ps.setInt(2,sgxh);
			ps.setDouble(3,sgsl);
			ps.setDouble(4,sgjg);
			ps.setDouble(5,sgsl*sgjg);
			ps.setDouble(6,sgsl);
			ps.setDouble(7,sgjg);
			ps.setDouble(8,sgsl*sgjg);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update jxc_clsgmx set sgsl=?,sgjg=?,sgje=?,shsl=?,shjg=?,shje=?";
			ls_sql+=" where clbm='"+clbm[i]+"'  and sgph='"+sgph+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sgsl);
			ps.setDouble(2,sgjg);
			ps.setDouble(3,sgsl*sgjg);
			ps.setDouble(4,sgsl);
			ps.setDouble(5,sgjg);
			ps.setDouble(6,sgsl*sgjg);
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