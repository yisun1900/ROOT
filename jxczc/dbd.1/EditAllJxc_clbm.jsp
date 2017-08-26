<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<%
String dbph=request.getParameter("dbph");
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));


String xsfsmc=null;
String xsfs=null;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String ppmc=null;
double dbsl=0;
String cldlmc=null;
String jldwbm=null;

String bgcolor="";

int row=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">修改材料单明细(材料单号:<%=dbph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="10%">小类</td>
	<td  width="8%">内部编码</td>
	<td  width="13%">材料名称</td>
	<td  width="10%">规格</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">可订货数</td>
	<td  width="7%">最小起订量</td>
	<td  width="8%">数量</td>
	<td  width="13%">子品牌</td>
	<td  width="9%">销售方式</td>
</tr>
<%
	String clxlbm=null;
	ls_sql="SELECT distinct clxlbm ";
	ls_sql+=" FROM jxc_dbmx  ";
    ls_sql+=" where dbph='"+dbph+"'";
    ls_sql+=" order by clxlbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		clxlbm=cf.fillNull(rs2.getString("clxlbm"));

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jxc_dbmx ";
		ls_sql+=" where jxc_dbmx.dbph='"+dbph+"' and jxc_dbmx.clxlbm='"+clxlbm+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


	
		ls_sql="SELECT DECODE(jxc_dbmx.xsfs,'1','代销品','2','现货','3','期货调拨','4','允许负库存') xsfsmc,jxc_dbmx.xsfs,jxc_dbmx.dbph,jxc_dbmx.clbm,jxc_dbmx.nbbm,jxc_dbmx.clmc,jxc_dbmx.xh,jxc_dbmx.gg,jxc_dbmx.ppmc,jxc_dbmx.jldwbm,jxc_dbmx.dbsl";
		ls_sql+=" FROM jxc_dbmx,jxc_clbm ";
		ls_sql+=" where jxc_dbmx.clbm=jxc_clbm.clbm and jxc_dbmx.dbph='"+dbph+"' and jxc_clbm.clxlbm='"+clxlbm+"' ";
		ls_sql+=" order by jxc_dbmx.dbxh ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			row++;

			xsfsmc=cf.fillNull(rs.getString("xsfsmc"));
			xsfs=cf.fillNull(rs.getString("xsfs"));
			clbm=cf.fillNull(rs.getString("clbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			clmc=cf.fillHtml(rs.getString("clmc"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			ppmc=cf.fillHtml(rs.getString("ppmc"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			dbsl=rs.getDouble("dbsl");


			double zxqdl=0;
			double zcpzsl=0;
			double ccpzsl=0;
			double bfpzsl=0;
			double dhsl=0;
			double ycgsl=0;
			double kdhsl=0;//可订货数

			ls_sql="select zxqdl,zcpzsl,ccpzsl,bfpzsl,dhsl,zcpzsl-dhsl kdhsl,ycgsl ";
			ls_sql+=" from  jxc_cljgb";
			ls_sql+=" where jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxqdl=rs1.getDouble("zxqdl");
				zcpzsl=rs1.getDouble("zcpzsl");
				ccpzsl=rs1.getDouble("ccpzsl");
				bfpzsl=rs1.getDouble("bfpzsl");
				dhsl=rs1.getDouble("dhsl");
				kdhsl=rs1.getDouble("kdhsl");
				ycgsl=rs1.getDouble("ycgsl");
			}
			rs1.close();
			ps1.close();

			
			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}
	%>
			<tr bgcolor="<%=bgcolor%>" align="center">
			<td align="center">
				<input name="chitem" type="checkbox" value="<%=clbm%>">
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td rowspan="<%=count%>"><%=clxlbm%></td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=kdhsl%>
				<input type="hidden" name="kdhsl" value="<%=kdhsl%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td> 
				<input type="text" name="dbsl" size="8" maxlength="10" value=<%=dbsl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
			<td><%=xsfsmc%>
				<input type="hidden" name="xsfs" value="<%=xsfs%>">
			</td>
			</tr>
	<%
		}

	
		while (rs.next())
		{
			row++;

			xsfsmc=cf.fillNull(rs.getString("xsfsmc"));
			xsfs=cf.fillNull(rs.getString("xsfs"));
			clbm=cf.fillNull(rs.getString("clbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			clmc=cf.fillHtml(rs.getString("clmc"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			ppmc=cf.fillHtml(rs.getString("ppmc"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			dbsl=rs.getDouble("dbsl");


			double zxqdl=0;
			double zcpzsl=0;
			double ccpzsl=0;
			double bfpzsl=0;
			double dhsl=0;
			double ycgsl=0;
			double kdhsl=0;//可订货数

			ls_sql="select zxqdl,zcpzsl,ccpzsl,bfpzsl,dhsl,zcpzsl-dhsl kdhsl,ycgsl ";
			ls_sql+=" from  jxc_cljgb";
			ls_sql+=" where jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxqdl=rs1.getDouble("zxqdl");
				zcpzsl=rs1.getDouble("zcpzsl");
				ccpzsl=rs1.getDouble("ccpzsl");
				bfpzsl=rs1.getDouble("bfpzsl");
				dhsl=rs1.getDouble("dhsl");
				kdhsl=rs1.getDouble("kdhsl");
				ycgsl=rs1.getDouble("ycgsl");
			}
			rs1.close();
			ps1.close();

			
			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}
	%>
			<tr bgcolor="<%=bgcolor%>" align="center">
			<td align="center">
				<input name="chitem" type="checkbox" value="<%=clbm%>">
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=kdhsl%>
				<input type="hidden" name="kdhsl" value="<%=kdhsl%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td> 
				<input type="text" name="dbsl" size="8" maxlength="10" value=<%=dbsl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
			<td><%=xsfsmc%>
				<input type="hidden" name="xsfs" value="<%=xsfs%>">
			</td>
			</tr>
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
      <td colspan="13" > 
		<input type="hidden" name="dqbm" value="<%=dqbm%>">
		<input type="hidden" name="dbph" value="<%=dbph%>">
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value='重输' name="reset" >      
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type=button value='全选删除项' onclick="selectAll(listform)">
		&nbsp;&nbsp;
		<input type=button value='删除' onClick="f_delete(listform)">
		&nbsp;&nbsp;
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
		if(	javaTrim(FormName.dbsl)=="") {
			alert("请输入[数量]！");
			FormName.dbsl.select();
			return false;
		}
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
			if(	javaTrim(FormName.dbsl[i])=="") {
				alert("请输入[数量]！");
				FormName.dbsl[i].select();
				return false;
			}
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

	FormName.action="SaveEditAllJxc_clbm.jsp";
	FormName.submit();
	return true;
} 

var mark=1;
function selectAll(FormName)//转换字符串
{
	var i = 0;
	if (<%=row%>==1)
	{
		if (mark==0)
		{
			FormName.chitem.checked =false
		}
		else{
			FormName.chitem.checked =true
		}
	}
	else
	{ 
		for (i=0;i <<%=row%> ;i++ )
		{
			if (mark==0)
			{
				FormName.chitem[i].checked =false
			}
			else{
				FormName.chitem[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}

function f_delete(FormName)
{
	if (!confirm("确实要删除吗？") )	
	{
		return false;
	}

	var choo=0;
	var i = 0;
	if (<%=row%>==1)
	{
		if( FormName.chitem.checked )
		{
			choo=1;
		}
	} 
	else
	{ 
		for (i=0;i <<%=row%> ;i++ )
		{
			if( FormName.chitem[i].checked )
			{
				choo=1;
			}
		} 
	} 
	if (choo == 0)
	{
		alert("请选择所要删除的项目");
		return false;
	}

	FormName.action="DeleteJxc_clbm.jsp";
	FormName.submit();
	return true;

}

//-->
</script>

