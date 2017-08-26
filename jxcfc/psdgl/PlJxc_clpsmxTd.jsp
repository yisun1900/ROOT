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

String psph=cf.GB2Uni(request.getParameter("psph"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));

String fgsbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
double qye=0;

try {
	conn=cf.getConnection();


	ls_sql=" select sgdmc,hth,khxm,fwdz,fgsbh,NVL(guanlif,0)+NVL(suijin,0)+qye qye";
    ls_sql+=" from crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		fgsbh=rs.getString("fgsbh");
		qye=rs.getDouble("qye");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();



    double sgcbj=0;
    double zxsgcbj=0;
	ls_sql=" select sgcbj,zxsgcbj";
    ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
	}
	rs.close();
	ps.close();
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">批量录入退料单(材料单号:<%=psph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right"><font color="#0000CC">客户编号</font> </td>
      <td width="16%"><%=khbh%> </td>
      <td width="16%"><font color="#0000CC">施工队：</font><%=sgdmc%></td>
      <td width="18%" align="right"><font color="#0000CC">合同号</font> </td>
      <td width="32%"><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">客户姓名</font> </td>
      <td colspan="2"><%=khxm%> </td>
      <td align="right"><font color="#0000CC">房屋地址</font></td>
      <td><%=fwdz%></td>
    </tr>
</table>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#FFFFFF"> 
	<td colspan="14" > 
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" >
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value=' 重 输 ' name="reset" >
	</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">小类</td>
	<td  width="7%">内部编码</td>
	<td  width="11%">材料名称</td>
	<td  width="8%">规格</td>
	<td  width="6%">计量单位</td>
	<td  width="6%">材料单价</td>
	<td  width="6%">开单数量</td>
	<td  width="6%">出库数量</td>
	<td  width="7%">退货数量</td>
	<td  width="12%">子品牌</td>
	<td  width="6%">销售方式</td>
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
	double dhsl=0;
	double cksl=0;
	String xsfs=null;
	String xsfsmc=null;


	ls_sql="SELECT distinct jxc_clpsmx.clxlbm ";
	ls_sql+=" FROM jxc_clpsd,jxc_clpsmx ";
    ls_sql+=" where jxc_clpsd.psph=jxc_clpsmx.psph";
    ls_sql+=" and jxc_clpsd.fclb!='4'";//1：开工；2：补料；3：中期；4：退单
	ls_sql+=" and jxc_clpsd.khbh='"+khbh+"'";
    ls_sql+=" order by jxc_clpsmx.clxlbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		clxlbm=cf.fillNull(rs2.getString("clxlbm"));


		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jxc_clpsd,jxc_clpsmx ";
		ls_sql+=" where jxc_clpsd.psph=jxc_clpsmx.psph";
		ls_sql+=" and jxc_clpsd.fclb!='4'";//1：开工；2：补料；3：中期；4：退单
		ls_sql+=" and jxc_clpsd.khbh='"+khbh+"'";
		ls_sql+=" and jxc_clpsmx.clxlbm='"+clxlbm+"'";
		ls_sql+=" order by jxc_clpsmx.cldlbm,jxc_clpsmx.clxlbm,jxc_clpsmx.clmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		ls_sql="SELECT jxc_clpsmx.clbm,jxc_clpsmx.clxlbm,jxc_clpsmx.nbbm,jxc_clpsmx.clmc,jxc_clpsmx.xh,jxc_clpsmx.gg,jxc_clpsmx.ppmc,jxc_clpsmx.jldwbm ";
		ls_sql+=" ,jxc_clpsmx.xsfs,DECODE(jxc_clpsmx.xsfs,'1','代销品','2','现货','3','期货销售','4','允许负库存') xsfsmc";
		ls_sql+=" ,jxc_clpsmx.dj,sum(jxc_clpsmx.pssl) pssl,sum(jxc_clpsmx.cksl) cksl";
		ls_sql+=" FROM jxc_clpsd,jxc_clpsmx ";
		ls_sql+=" where jxc_clpsd.psph=jxc_clpsmx.psph";
		ls_sql+=" and jxc_clpsd.fclb!='4'";//1：开工；2：补料；3：中期；4：退单
		ls_sql+=" and jxc_clpsd.khbh='"+khbh+"'";
		ls_sql+=" and jxc_clpsmx.clxlbm='"+clxlbm+"'";
		ls_sql+=" group by jxc_clpsmx.clbm,jxc_clpsmx.clxlbm,jxc_clpsmx.nbbm,jxc_clpsmx.clmc,jxc_clpsmx.xh,jxc_clpsmx.gg,jxc_clpsmx.ppmc,jxc_clpsmx.jldwbm,jxc_clpsmx.xsfs,jxc_clpsmx.dj";
		ls_sql+=" order by jxc_clpsmx.clxlbm,jxc_clpsmx.clmc";
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

			dgzjg=rs.getDouble("dj");
			dhsl=rs.getDouble("pssl");
			cksl=rs.getDouble("cksl");
			xsfs=cf.fillNull(rs.getString("xsfs"));
			xsfsmc=cf.fillNull(rs.getString("xsfsmc"));

			double pssl=0;
			String psslstr=null;
			double psje=0;
			ls_sql="SELECT jxc_clpsmx.pssl,jxc_clpsmx.psje ";
			ls_sql+=" FROM jxc_clpsmx  ";
			ls_sql+=" where jxc_clpsmx.psph='"+psph+"' and jxc_clpsmx.clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				pssl=rs1.getDouble("pssl");
				psje=rs1.getDouble("psje");
			}
			rs1.close();
			ps1.close();



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

			if (!psslstr.equals(""))
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
			<td><%=dgzjg%>
				<input type="hidden" name="dj" value="<%=dgzjg%>">
			</td>
			<td><%=dhsl%>
				<input type="hidden" name="dhsl" value="<%=dhsl%>">
			</td>
			<td><%=cksl%></td>
			<td>
				<input type="text" name="pssl" value="<%=psslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
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

			dgzjg=rs.getDouble("dj");
			dhsl=rs.getDouble("pssl");
			cksl=rs.getDouble("cksl");
			xsfs=cf.fillNull(rs.getString("xsfs"));
			xsfsmc=cf.fillNull(rs.getString("xsfsmc"));

			double pssl=0;
			String psslstr=null;
			double psje=0;
			ls_sql="SELECT jxc_clpsmx.pssl,jxc_clpsmx.psje ";
			ls_sql+=" FROM jxc_clpsmx  ";
			ls_sql+=" where jxc_clpsmx.psph='"+psph+"' and jxc_clpsmx.clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				pssl=rs1.getDouble("pssl");
				psje=rs1.getDouble("psje");
			}
			rs1.close();
			ps1.close();

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

			if (!psslstr.equals(""))
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
			<td><%=dgzjg%>
				<input type="hidden" name="dj" value="<%=dgzjg%>">
			</td>
			<td><%=dhsl%>
				<input type="hidden" name="dhsl" value="<%=dhsl%>">
			</td>
			<td><%=cksl%></td>
			<td>
				<input type="text" name="pssl" value="<%=psslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
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
		if(!(isFloat(FormName.pssl, "退货数量"))) {
			return false;
		}

		if (parseFloat(FormName.pssl.value)>=0)
		{
			alert("【退货数量】必须小于零！！！");
			FormName.pssl.select();
			return false;
		}

		if (-1*parseFloat(FormName.pssl.value) > parseFloat(FormName.dhsl.value))
		{
			alert("错误！【退货数量】不能大于【开单数量"+FormName.dhsl.value+"】");
			FormName.pssl.select();
			return false;
		}

	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (i=0;i<<%=row%> ;i++ )
		{
			if(!(isFloat(FormName.pssl[i], "退货数量"))) {
				return false;
			}

			if (parseFloat(FormName.pssl[i].value)>=0)
			{
				alert("【退货数量】必须小于零！！！");
				FormName.pssl[i].select();
				return false;
			}

			if (-1*parseFloat(FormName.pssl[i].value) > parseFloat(FormName.dhsl[i].value))
			{
				alert("错误！【退货数量】不能大于【开单数量"+FormName.dhsl[i].value+"】");
				FormName.pssl[i].select();
				return false;
			}

		}
	}

	FormName.action="SavePlJxc_clpsmxTd.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

