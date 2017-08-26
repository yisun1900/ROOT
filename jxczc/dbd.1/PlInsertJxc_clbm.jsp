<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String bgcolor="";

int row=0;

String dbph=cf.GB2Uni(request.getParameter("dbph"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));

try {
	conn=cf.getConnection();


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">批量录入调拨单(调拨单号:<%=dbph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#FFFFFF"> 
	<td colspan="14" > 
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" >
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value=' 重 输 ' name="reset" >
	</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">小类</td>
	<td  width="8%">内部编码</td>
	<td  width="13%">材料名称</td>
	<td  width="10%">规格</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">工队价</td>
	<td  width="8%">可订货数</td>
	<td  width="7%">最小起订量</td>
	<td  width="8%">数量</td>
	<td  width="13%">子品牌</td>
	<td  width="9%">销售方式</td>
</tr>
<%
	String clbm=null;
	String clxlbm=null;
	String nbbm=null;
	String clmc=null;
	String xh=null;
	String gg=null;
	String ppmc=null;
	String jldwbm=null;

	double dgzjg=0;
	double dfgsjg=0;
	double zxqdl=0;
	double zcpzsl=0;
	double dhsl=0;
	String xsfs=null;
	String xsfsmc=null;


	ls_sql="SELECT distinct jxc_clbm.clxlbm ";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
    ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
    ls_sql+=" and jxc_clbm.cllb='2'";//0：代销品主材；1：辅材；2：库存品主材
    ls_sql+=" and jxc_cljgb.xsfs!='1'";//1：代销品；2：现货销售；3：期货销售；4：允许负库存
	ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_cljgb.sfcy='Y' ";//N：否；Y：是
    ls_sql+=" order by jxc_clbm.clxlbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		clxlbm=cf.fillNull(rs2.getString("clxlbm"));


		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
		ls_sql+=" and jxc_clbm.cllb='2'";//0：代销品主材；1：辅材；2：库存品主材
		ls_sql+=" and jxc_cljgb.xsfs!='1'";//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_cljgb.sfcy='Y' ";//N：否；Y：是
		ls_sql+=" and jxc_clbm.clxlbm='"+clxlbm+"'";
		ls_sql+=" order by jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.clmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		ls_sql="SELECT jxc_clbm.clbm,jxc_clbm.clxlbm,jxc_clbm.nbbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.ppmc,jxc_clbm.jldwbm ";
		ls_sql+=" ,jxc_cljgb.dgzjg,jxc_cljgb.dfgsjg,jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,jxc_cljgb.zxqdl,jxc_cljgb.xsfs,DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货','3','期货调拨','4','允许负库存') xsfsmc";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
		ls_sql+=" and jxc_clbm.cllb='2'";//0：代销品主材；1：辅材；2：库存品主材
		ls_sql+=" and jxc_cljgb.xsfs!='1'";//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_cljgb.sfcy='Y' ";//N：否；Y：是
		ls_sql+=" and jxc_clbm.clxlbm='"+clxlbm+"'";
		ls_sql+=" order by jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.clmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			row++;

			clbm=cf.fillNull(rs.getString("clbm"));
			clxlbm=cf.fillNull(rs.getString("clxlbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			clmc=cf.fillHtml(rs.getString("clmc"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			ppmc=cf.fillHtml(rs.getString("ppmc"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));

			dgzjg=rs.getDouble("dgzjg");
			dfgsjg=rs.getDouble("dfgsjg");
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
			zxqdl=rs.getDouble("zxqdl");
			xsfs=cf.fillNull(rs.getString("xsfs"));
			xsfsmc=cf.fillNull(rs.getString("xsfsmc"));

			double dbsl=0;
			String dbslstr=null;
			ls_sql="SELECT jxc_dbmx.dbsl";
			ls_sql+=" FROM jxc_dbmx  ";
			ls_sql+=" where jxc_dbmx.dbph='"+dbph+"' and jxc_dbmx.clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				dbsl=rs1.getDouble("dbsl");
			}
			rs1.close();
			ps1.close();


			if (dbsl==0)
			{
				dbslstr="";
			}
			else{
				dbslstr=""+dbsl;
			}

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			if (!dbslstr.equals(""))
			{
				bgcolor="#FFFF99";
			}

			%>
			<tr bgcolor="<%=bgcolor%>" align="center">
			<td rowspan="<%=count%>"><%=clxlbm%></td>
			<td><%=nbbm%>
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=dgzjg%></td>
			<td><%=(zcpzsl-dhsl)%>
				<input type="hidden" name="kdhsl" value="<%=(zcpzsl-dhsl)%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td>
				<input type="text" name="dbsl" value="<%=dbslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
			<td><%=xsfsmc%>
				<input type="hidden" name="xsfs" value="<%=xsfs%>">
			</td>
			<%	
		}


		while (rs.next())
		{
			row++;

			clbm=cf.fillNull(rs.getString("clbm"));
			clxlbm=cf.fillNull(rs.getString("clxlbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			clmc=cf.fillHtml(rs.getString("clmc"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			ppmc=cf.fillHtml(rs.getString("ppmc"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));

			dgzjg=rs.getDouble("dgzjg");
			dfgsjg=rs.getDouble("dfgsjg");
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
			zxqdl=rs.getDouble("zxqdl");
			xsfs=cf.fillNull(rs.getString("xsfs"));
			xsfsmc=cf.fillNull(rs.getString("xsfsmc"));

			double dbsl=0;
			String dbslstr=null;
			ls_sql="SELECT jxc_dbmx.dbsl";
			ls_sql+=" FROM jxc_dbmx  ";
			ls_sql+=" where jxc_dbmx.dbph='"+dbph+"' and jxc_dbmx.clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				dbsl=rs1.getDouble("dbsl");
			}
			rs1.close();
			ps1.close();

			if (dbsl==0)
			{
				dbslstr="";
			}
			else{
				dbslstr=""+dbsl;
			}

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			if (!dbslstr.equals(""))
			{
				bgcolor="#FFFF99";
			}

			%>
			<tr bgcolor="<%=bgcolor%>" align="center">
			<td><%=nbbm%>
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=dgzjg%></td>
			<td><%=(zcpzsl-dhsl)%>
				<input type="hidden" name="kdhsl" value="<%=(zcpzsl-dhsl)%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td>
				<input type="text" name="dbsl" value="<%=dbslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
			<td><%=xsfsmc%>
				<input type="hidden" name="xsfs" value="<%=xsfs%>">
			</td>
			<%	
		}
		rs.close();
		ps.close();
	
	
	}
	rs2.close();
	ps2.close();




}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#FFFFFF"> 
	<td colspan="14" > 
		<input type="hidden" name="dbph" value="<%=dbph%>">
		<input type="hidden" name="dqbm" value="<%=dqbm%>">
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value=' 重 输 ' name="reset" >
	</td>
</tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	if (<%=row%><=1)
	{
		if(!(isFloat(FormName.dbsl, "数量"))) {
			return false;
		}

		if (parseFloat(FormName.dbsl.value)<=0)
		{
			alert("【数量】必须大于零！！！");
			FormName.dbsl.select();
			return false;
		}
		if (parseFloat(FormName.dbsl.value) < parseFloat(FormName.zxqdl.value))
		{
			alert("【数量】必须大于【最小起订量"+FormName.zxqdl.value+"】！！！");
			FormName.dbsl.select();
			return false;
		}

		if (FormName.xsfs.value=="2")//1：代销品；2：现货调拨；3：期货调拨
		{
			if (parseFloat(FormName.dbsl.value) > parseFloat(FormName.kdhsl.value))
			{
				alert("错误！现货调拨，【数量】不能大于【可订货数量"+FormName.kdhsl.value+"】，可订货数量＝正常品库存－订货");
				FormName.dbsl.select();
				return false;
			}
		}
	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (i=0;i<<%=row%> ;i++ )
		{
			if(!(isFloat(FormName.dbsl[i], "数量"))) {
				return false;
			}

			if (parseFloat(FormName.dbsl[i].value)<=0)
			{
				alert("【数量】必须大于零！！！");
				FormName.dbsl[i].select();
				return false;
			}
			if (parseFloat(FormName.dbsl[i].value) < parseFloat(FormName.zxqdl[i].value))
			{
				alert("【数量】必须大于【最小起订量"+FormName.zxqdl[i].value+"】！！！");
				FormName.dbsl[i].select();
				return false;
			}

			if (FormName.xsfs[i].value=="2")//1：代销品；2：现货调拨；3：期货调拨
			{
				if (parseFloat(FormName.dbsl[i].value) > parseFloat(FormName.kdhsl[i].value))
				{
					alert("错误！现货调拨，【数量】不能大于【可订货数量"+FormName.kdhsl[i].value+"】，可订货数量＝正常品库存－订货");
					FormName.dbsl[i].select();
					return false;
				}
			}
		}
	}

	FormName.action="SavePlInsertJxc_clbm.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

