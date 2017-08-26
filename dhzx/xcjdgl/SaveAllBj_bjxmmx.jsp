<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] xh=request.getParameterValues("xh");

double dj=0;
double sl=0;
String[] ls=null;
String[] oldjgwzmc=null;
String dqbm=null;
String xmbh=null;
String jgwzbm=null;
String xuhao=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<xh.length ;i++ )
	{
		ls_sql="SELECT dqbm,xmbh";
		ls_sql+=" FROM bj_bjxmmx ";
		ls_sql+=" where khbh='"+khbh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			dqbm=rs.getString("dqbm");
			xmbh=rs.getString("xmbh");
		}
		else{
			rs.close();
			ps.close();

			conn.rollback();
			out.println("<BR>项目编号为["+xmbh+"]的项目不存在，可能已被删除");
			return;
		}
		rs.close();
		ps.close();


		ls_sql="SELECT jgwzbm,bj_fjxx.xuhao";
		ls_sql+=" FROM bj_fjxx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" order by bj_fjxx.xuhao ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xuhao=rs.getString("xuhao");
			jgwzbm=rs.getString("jgwzbm");

			ls=request.getParameterValues("C"+xuhao);
			oldjgwzmc=request.getParameterValues("CN"+xuhao);

			if (ls[i].trim().equals("") )
			{
				ls_sql="delete from crm_yjdmx";
				ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				continue;
			}

			if (!cf.GB2Uni(oldjgwzmc[i]).equals(jgwzbm))
			{
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>存盘失败！结构位置为["+cf.GB2Uni(oldjgwzmc[i])+"]的名称已发生变化");
				return;
			}

			try{
				sl=java.lang.Double.parseDouble(ls[i].trim());
			}
			catch (Exception e){
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>存盘失败！项目编号为["+xmbh+"]的[工程量]输入不正确:"+ls[i].trim());
				return;
			}

			int count=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_yjdmx ";
			ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				count=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (count>0)
			{
				ls_sql="update crm_yjdmx set sl="+sl;
				ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else{
				ls_sql="insert into crm_yjdmx(khbh,xmbh,jgwzbm,sl)";
				ls_sql+=" values('"+khbh+"','"+xmbh+"','"+jgwzbm+"',"+sl+") ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}


		}
		rs.close();
		ps.close();
	}

	//检查
	String getxmbh=null;
	String getjgwzbm=null;
	double getsl=0;
	ls_sql="SELECT xmbh,jgwzbm,sl";
	ls_sql+=" FROM crm_yjdmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getxmbh=rs.getString("xmbh");
		getjgwzbm=rs.getString("jgwzbm");
		getsl=rs.getDouble("sl");

		double bjsl=0;
		ls_sql="SELECT sl";
		ls_sql+=" FROM bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+getxmbh+"' and jgwzbm='"+getjgwzbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (bjsl!=getsl)
		{
			out.println("<BR>提醒！项目编号【"+getxmbh+"】在【"+getjgwzbm+"】工程量与电子报价不一致，电子报价数量："+bjsl+"，预预交底单数量："+getsl);
		}
	}
	rs.close();
	ps.close();


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
	out.print("sql: " + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>