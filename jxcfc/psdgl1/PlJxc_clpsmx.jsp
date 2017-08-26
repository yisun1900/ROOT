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
String ls_sql=null;

String bgcolor="";

int row=0;

String psph=cf.GB2Uni(request.getParameter("psph"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));


try {
	conn=cf.getConnection();
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">批量录入材料配送单(配送单号:<%=psph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
<tr bgcolor="#FFFFFF"> 
	<td colspan="11" > 
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" >
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value=' 重 输 ' name="reset" >
	</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">内部编码</td>
	<td  width="15%">材料名称</td>
	<td  width="9%">型号</td>
	<td  width="11%">规格</td>
	<td  width="15%">子品牌</td>
	<td  width="6%">计量单位</td>
	<td  width="8%">配送单价</td>
	<td  width="8%">销售方式</td>
	<td  width="6%">可订货数</td>
	<td  width="6%">最小起订量</td>
	<td  width="8%">配送数量</td>
</tr>
<%
	String clbm=null;
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

	double pssl=0;
	String psslstr=null;
	double psje=0;

	ls_sql="SELECT jxc_clbm.clbm,jxc_clbm.nbbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.ppmc,jxc_clbm.jldwbm ";
	ls_sql+=" ,jxc_cljgb.dgzjg,jxc_cljgb.dfgsjg,jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,jxc_cljgb.zxqdl,jxc_cljgb.xsfs,DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货','3','期货销售','4','允许负库存') xsfsmc";
	ls_sql+=" ,jxc_clpsmx.pssl,jxc_clpsmx.psje ";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb,jxc_clpsmx  ";
    ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
    ls_sql+=" and jxc_cljgb.clbm=jxc_clpsmx.clbm(+) and jxc_clpsmx.psph='"+psph+"'";
    ls_sql+=" and jxc_clbm.cllb='1'";//0：主材；1：辅材
	ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_cljgb.sfcy='Y' ";//N：否；Y：是
    ls_sql+=" order by jxc_clpsmx.psxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;

		clbm=cf.fillNull(rs.getString("clbm"));
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

		pssl=rs.getDouble("pssl");
		psje=rs.getDouble("psje");


		if (pssl==0)
		{
			psslstr="";
		}
		else{
			psslstr=""+pssl;
		}

		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
		<td><%=nbbm%>
			<input type="hidden" name="clbm" value="<%=clbm%>">
		</td>
		<td><%=clmc%></td>
		<td><%=xh%></td>
		<td><%=gg%></td>
		<td><%=ppmc%></td>
		<td><%=jldwbm%></td>
		<td><%=dgzjg%></td>
		<td><%=xsfsmc%>
			<input type="hidden" name="xsfs" value="<%=xsfs%>">
		</td>
		<td><%=(zcpzsl-dhsl)%>
			<input type="hidden" name="kdhsl" value="<%=(zcpzsl-dhsl)%>">
		</td>
		<td><%=zxqdl%>
			<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
		</td>
		<td>
			<input type="text" name="pssl" value="<%=psslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		</td>
		<%
	}
	rs.close();
	ps.close();

	ls_sql="SELECT jxc_clbm.clbm,jxc_clbm.nbbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.ppmc,jxc_clbm.jldwbm ";
	ls_sql+=" ,jxc_cljgb.dgzjg,jxc_cljgb.dfgsjg,jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,jxc_cljgb.zxqdl,jxc_cljgb.xsfs,DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货','3','期货销售','4','允许负库存') xsfsmc";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
    ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
    ls_sql+=" and jxc_clbm.cllb='1'";//0：主材；1：辅材
	ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_cljgb.sfcy='Y' ";//N：否；Y：是
    ls_sql+=" and jxc_cljgb.clbm not in(select clbm from jxc_clpsmx where psph='"+psph+"')";
    ls_sql+=" order by jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.clmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;

		clbm=cf.fillNull(rs.getString("clbm"));
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



		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
		<td><%=nbbm%>
			<input type="hidden" name="clbm" value="<%=clbm%>">
		</td>
		<td><%=clmc%></td>
		<td><%=xh%></td>
		<td><%=gg%></td>
		<td><%=ppmc%></td>
		<td><%=jldwbm%></td>
		<td><%=dgzjg%></td>
		<td><%=xsfsmc%>
			<input type="hidden" name="xsfs" value="<%=xsfs%>">
		</td>
		<td><%=(zcpzsl-dhsl)%>
			<input type="hidden" name="kdhsl" value="<%=(zcpzsl-dhsl)%>">
		</td>
		<td><%=zxqdl%>
			<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
		</td>
		<td>
			<input type="text" name="pssl" value="" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		</td>
		<%	
	}
	rs.close();
	ps.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#FFFFFF"> 
	<td colspan="11" > 
		<input type="hidden" name="psph" value="<%=psph%>">
		<input type="hidden" name="khbh" value="<%=khbh%>">
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
		if(!(isFloat(FormName.pssl, "配送数量"))) {
			return false;
		}

		if (parseFloat(FormName.pssl.value)<=0)
		{
			alert("【配送数量】必须大于零！！！");
			FormName.pssl.select();
			return false;
		}
		if (parseFloat(FormName.pssl.value) < parseFloat(FormName.zxqdl.value))
		{
			alert("【配送数量】必须大于【最小起订量"+FormName.zxqdl.value+"】！！！");
			FormName.pssl.select();
			return false;
		}

		if (FormName.xsfs.value=="2")//1：代销品；2：现货销售；3：期货销售
		{
			if (parseFloat(FormName.pssl.value) > parseFloat(FormName.kdhsl.value))
			{
				alert("错误！现货销售，【配送数量】不能大于【可订货数量"+FormName.kdhsl.value+"】，可订货数量＝正常品库存－订货");
				FormName.pssl.select();
				return false;
			}
		}
	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (i=0;i<<%=row%> ;i++ )
		{
			if(!(isFloat(FormName.pssl[i], "配送数量"))) {
				return false;
			}

			if (parseFloat(FormName.pssl[i].value)<=0)
			{
				alert("【配送数量】必须大于零！！！");
				FormName.pssl[i].select();
				return false;
			}
			if (parseFloat(FormName.pssl[i].value) < parseFloat(FormName.zxqdl[i].value))
			{
				alert("【配送数量】必须大于【最小起订量"+FormName.zxqdl[i].value+"】！！！");
				FormName.pssl[i].select();
				return false;
			}

			if (FormName.xsfs[i].value=="2")//1：代销品；2：现货销售；3：期货销售
			{
				if (parseFloat(FormName.pssl[i].value) > parseFloat(FormName.kdhsl[i].value))
				{
					alert("错误！现货销售，【配送数量】不能大于【可订货数量"+FormName.kdhsl[i].value+"】，可订货数量＝正常品库存－订货");
					FormName.pssl[i].select();
					return false;
				}
			}
		}
	}

	FormName.action="SavePlJxc_clpsmx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

