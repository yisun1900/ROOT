<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String xuhao=cf.GB2Uni(request.getParameter("xuhao"));

String[] dqbm=request.getParameterValues("dqbm");
String[] xmbh=request.getParameterValues("xmbh");
String[] slstr=request.getParameterValues("sl");
String[] zcmc=request.getParameterValues("zcmc");
String[] zcgg=request.getParameterValues("zcgg");
String[] zcylstr=request.getParameterValues("zcyl");
String[] zcfstr=request.getParameterValues("zcf");
String[] zcjldwbm=request.getParameterValues("zcjldwbm");
String[] sfxycl=request.getParameterValues("sfxycl");

double sl=0;
double zcyl=0;
double zcf=0;
String oldjgwzmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT jgwzbm";
	ls_sql+=" FROM bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"' and xuhao="+xuhao;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		oldjgwzmc=rs1.getString(1);
	}
	rs1.close();
	ps1.close();

	if (!oldjgwzmc.equals(jgwzbm))
	{
		out.println("<BR>存盘失败！结构位置为["+jgwzbm+"]的名称已发生变化");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="delete from bj_gclmx";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_dwgclzcyl";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xmbh.length ;i++ )
	{
		//未录工程量
		if (slstr[i].trim().equals(""))
		{
			continue;
		}

		try{
			sl=java.lang.Double.parseDouble(slstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[工程量]输入不正确:"+slstr[i].trim());
			return;
		}

		ls_sql="insert into bj_gclmx(khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
		ls_sql+=" values('"+khbh+"','"+dqbm[i]+"','"+xmbh[i]+"','"+jgwzbm+"',"+sl+","+sl+",0,'N') ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
		


		if (sfxycl[i].equals("1"))//1：需要；2：不需要
		{
			zcyl=0;
			if (!zcylstr[i].trim().equals(""))
			{
				try{
					zcyl=java.lang.Double.parseDouble(zcylstr[i].trim());
				}
				catch (Exception e){
					conn.rollback();
					out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[主材用量]输入不正确:"+zcylstr[i].trim());
					return;
				}
			}

			zcf=0;
			if (!zcfstr[i].trim().equals(""))
			{
				try{
					zcf=java.lang.Double.parseDouble(zcfstr[i].trim());
				}
				catch (Exception e){
					conn.rollback();
					out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[主材费]输入不正确:"+zcfstr[i].trim());
					return;
				}
			}

			if (zcmc[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[主材名称]不能为空");
				return;
			}

			if (zcjldwbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[主材计量单位]不能为空");
				return;
			}

			//单位工程量主材用量
			ls_sql="insert into bj_dwgclzcyl(khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
			ls_sql+=" values('"+khbh+"','"+dqbm[i]+"','"+xmbh[i]+"','"+jgwzbm+"','"+cf.GB2Uni(zcmc[i])+"','"+cf.GB2Uni(zcgg[i])+"','"+cf.GB2Uni(zcjldwbm[i])+"',"+zcyl+","+zcf+")";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}

	}

	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,khbh,"hd");
	//获取电子报价金额
	double dzbjze=dzbj.getBjje(conn,khbh,"hd");

	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
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