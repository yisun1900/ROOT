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

String cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

String dwmc=null;

try {
	conn=cf.getConnection();


	ls_sql=" select dwmc";
    ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillHtml(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">选择常用材料(采购计划批号:<%=cgjhph%>)</font></B>
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
	<td  width="18%">材料名称</td>
	<td  width="12%">规格</td>
	<td  width="7%">计量单位</td>
	<td  width="7%">材料单价</td>
	<td  width="7%">包装规格</td>
	<td  width="7%">最小起订量</td>
	<td  width="8%">数量</td>
	<td  width="26%">子品牌</td>
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

	double cbj=0;
	double dgzjg=0;
	double dfgsjg=0;
	double zxqdl=0;
	double bzgg=0;
	double zcpzsl=0;
	double dhsl=0;
	String xsfs=null;
	String xsfsmc=null;


	ls_sql="SELECT distinct jxc_clbm.clxlbm ";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
    ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
    ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
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
		ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
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


		ls_sql="SELECT jxc_clbm.clbm,jxc_clbm.bzgg,jxc_clbm.clxlbm,jxc_clbm.nbbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.ppmc,jxc_clbm.jldwbm ";
		ls_sql+=" ,jxc_cljgb.cbj,jxc_cljgb.dgzjg,jxc_cljgb.dfgsjg,jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,jxc_cljgb.zxqdl,jxc_cljgb.xsfs,DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货','3','期货销售','4','允许负库存') xsfsmc";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
		ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
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

			cbj=rs.getDouble("cbj");
			dgzjg=rs.getDouble("dgzjg");
			dfgsjg=rs.getDouble("dfgsjg");
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
			zxqdl=rs.getDouble("zxqdl");
			bzgg=rs.getDouble("bzgg");
			xsfs=cf.fillNull(rs.getString("xsfs"));
			xsfsmc=cf.fillNull(rs.getString("xsfsmc"));


			double jhcgsl=0;
			String jhcgslstr=null;
			double jhcgdj=0;
			double jhcgje=0;

			jhcgdj=cbj;

			ls_sql="SELECT jxc_cgjhmx.jhcgsl,jhcgdj,jxc_cgjhmx.jhcgje ";
			ls_sql+=" FROM jxc_cgjhmx  ";
			ls_sql+=" where jxc_cgjhmx.cgjhph='"+cgjhph+"' and jxc_cgjhmx.clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jhcgsl=rs1.getDouble("jhcgsl");
				jhcgdj=rs1.getDouble("jhcgdj");
				jhcgje=rs1.getDouble("jhcgje");
			}
			rs1.close();
			ps1.close();



			if (jhcgsl==0)
			{
				jhcgslstr="";
			}
			else{
				jhcgslstr=""+jhcgsl;
			}

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			if (!jhcgslstr.equals(""))
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
			<td><%=jhcgdj%>
				<input type="hidden" name="jhcgdj" value="<%=jhcgdj%>">
			</td>
			<td><%=bzgg%>
				<input type="hidden" name="bzgg" value="<%=bzgg%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td>
				<input type="text" name="jhcgsl" value="<%=jhcgslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
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

			cbj=rs.getDouble("cbj");
			dgzjg=rs.getDouble("dgzjg");
			dfgsjg=rs.getDouble("dfgsjg");
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
			zxqdl=rs.getDouble("zxqdl");
			bzgg=rs.getDouble("bzgg");
			xsfs=cf.fillNull(rs.getString("xsfs"));
			xsfsmc=cf.fillNull(rs.getString("xsfsmc"));


			double jhcgsl=0;
			String jhcgslstr=null;
			double jhcgdj=0;
			double jhcgje=0;

			jhcgdj=cbj;

			ls_sql="SELECT jxc_cgjhmx.jhcgsl,jhcgdj,jxc_cgjhmx.jhcgje ";
			ls_sql+=" FROM jxc_cgjhmx  ";
			ls_sql+=" where jxc_cgjhmx.cgjhph='"+cgjhph+"' and jxc_cgjhmx.clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jhcgsl=rs1.getDouble("jhcgsl");
				jhcgdj=rs1.getDouble("jhcgdj");
				jhcgje=rs1.getDouble("jhcgje");
			}
			rs1.close();
			ps1.close();

			if (jhcgsl==0)
			{
				jhcgslstr="";
			}
			else{
				jhcgslstr=""+jhcgsl;
			}

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			if (!jhcgslstr.equals(""))
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
			<td><%=jhcgdj%>
				<input type="hidden" name="jhcgdj" value="<%=jhcgdj%>">
			</td>
			<td><%=bzgg%>
				<input type="hidden" name="bzgg" value="<%=bzgg%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td>
				<input type="text" name="jhcgsl" value="<%=jhcgslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
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
	<td colspan="11" > 
		<input type="hidden" name="cgjhph" value="<%=cgjhph%>">
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
		if(!(isFloat(FormName.jhcgsl, "数量"))) {
			return false;
		}

		if (parseFloat(FormName.jhcgsl.value)<=0)
		{
			alert("【数量】必须大于零！！！");
			FormName.jhcgsl.select();
			return false;
		}
		if (parseFloat(FormName.jhcgsl.value) < parseFloat(FormName.zxqdl.value))
		{
			alert("【数量】必须大于【最小起订量"+FormName.zxqdl.value+"】！！！");
			FormName.jhcgsl.select();
			return false;
		}

		if (FormName.jhcgsl.value!="" && parseFloat(FormName.jhcgsl.value)!=0)
		{
			if (parseFloat(FormName.jhcgsl.value) % parseFloat(FormName.bzgg.value) !=0)
			{
				alert("【数量】必须是【包装规格"+FormName.bzgg.value+"】的整数倍！！！");
				FormName.jhcgsl.select();
				return false;
			}
		}

	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (i=0;i<<%=row%> ;i++ )
		{
			if(!(isFloat(FormName.jhcgsl[i], "数量"))) {
				return false;
			}

			if (parseFloat(FormName.jhcgsl[i].value)<=0)
			{
				alert("【数量】必须大于零！！！");
				FormName.jhcgsl[i].select();
				return false;
			}
			if (parseFloat(FormName.jhcgsl[i].value) < parseFloat(FormName.zxqdl[i].value))
			{
				alert("【数量】必须大于【最小起订量"+FormName.zxqdl[i].value+"】！！！");
				FormName.jhcgsl[i].select();
				return false;
			}
			if (FormName.jhcgsl[i].value!="" && parseFloat(FormName.jhcgsl[i].value)!=0)
			{
				if (parseFloat(FormName.jhcgsl[i].value) % parseFloat(FormName.bzgg[i].value) !=0)
				{
					alert("【数量】必须是【包装规格"+FormName.bzgg[i].value+"】的整数倍！！！");
					FormName.jhcgsl[i].select();
					return false;
				}
			}
		}
	}

	FormName.action="SavePlLrJxc_clbm.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

