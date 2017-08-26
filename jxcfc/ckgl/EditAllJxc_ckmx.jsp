<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<%
String ckph=request.getParameter("ckph");

String ckxh=null;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String ppmc=null;
double ckdj=0;
double cksl=0;
String jldwbm=null;

String bgcolor="";

int row=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String psph=null;
String dqbm = null;
String ckbh = null;
String ckdzt = null;
String ckjxz = null;
try {
	conn=cf.getConnection();

	//查询出库单
	ls_sql = " select dqbm,ckbh,lydh,ckdzt,ckjxz ";
	ls_sql+= " from jxc_ckd ";
	ls_sql +=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		psph=cf.fillNull(rs.getString("lydh"));
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		ckjxz=cf.fillNull(rs.getString("ckjxz"));
	}
	else
	{
		out.print("错误！不存在的出库单");
		return;
	}
	rs.close();
	ps.close();
	if (!ckdzt.equals("0"))
	{
		out.print("错误！出库单已提交");
		return;
	}

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">修改出库明细(出库批号:<%=ckph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
<table border="1" cellspacing="0" cellpadding="1" width="105%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td width="3%">序号</td>
	<td width="8%">材料编码</td>
	<td width="14%">材料名称</td>
	<td width="9%">规格</td>
	<td width="6%">计量单位</td>
	<td width="8%">出库单价</td>
	<td width="6%">销售方式</td>
	<td width="7%">开单数量</td>
	<td width="6%">已出库数</td>
	<td width="8%">库存数量</td>
	<td width="8%">出库数量</td>
	<td width="6%">提醒</td>
	<td width="8%">型号</td>
</tr>
<%
	ls_sql="SELECT ckxh,jxc_ckmx.clbm,nbbm,jxc_ckmx.clmc,xh,jxc_ckmx.gg,ppmc,jldwbm,ckdj,cksl";
	ls_sql+=" FROM jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ls_sql+=" order by ckxh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		row++;

		ckxh=cf.fillNull(rs.getString("ckxh"));
		clbm=cf.fillNull(rs.getString("clbm"));
		nbbm=cf.fillHtml(rs.getString("nbbm"));
		clmc=cf.fillHtml(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		jldwbm=cf.fillHtml(rs.getString("jldwbm"));
		ckdj=rs.getDouble("ckdj");
		cksl=rs.getDouble("cksl");

		//查询辅材配送明细
		double pssl=0;
		double ycksl=0;
		double xcksl=0;//需出库数量＝开单数量－已出库数量
		ls_sql = " select pssl,cksl,pssl-cksl xcksl";
		ls_sql+= " from jxc_clpsmx ";
		ls_sql+=" where psph='"+psph+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			pssl=rs1.getDouble("pssl");
			ycksl=rs1.getDouble("cksl");
			xcksl=rs1.getDouble("xcksl");
		}
		rs1.close();
		ps1.close();


		
		//查询材料信息
		double kcsl=0;
		String xsfs=null;
		String xsfsmc=null;
		ls_sql = " select zcpzsl,xsfs,DECODE(xsfs,'1','代销品','2','现货','3','期货','4','可负库存') xsfsmc ";
		ls_sql+= " from jxc_cljgb ";
		ls_sql +=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			kcsl=rs1.getDouble("zcpzsl");//正常品总数量
			xsfs=cf.fillNull(rs1.getString("xsfs"));
			xsfsmc=cf.fillNull(rs1.getString("xsfsmc"));
		}
		else
		{
			rs1.close();
			ps1.close();

			out.print("材料:["+clbm+"]不存在！");
			return;
		}
		rs1.close();
		ps1.close();

		String txxx="&nbsp";

		if (xsfs.equals("2"))//2：现货销售
		{
			if (kcsl<xcksl)
			{
				if (cksl==0)
				{
					txxx="<font color=red>无法出库<font>";
				}
				else{
					txxx="<font color=red>库存不足<font>";
				}
			}
		}
		else if (xsfs.equals("3"))//3：期货销售
		{
			if (kcsl<xcksl)
			{
				if (cksl==0)
				{
					txxx="<font color=red>无法出库<font>";
				}
				else{
					txxx="<font color=red>库存不足<font>";
				}
			}
		}
		else if (xsfs.equals("4"))//4：允许负库存；
		{
			if (kcsl<xcksl)
			{
				txxx="<font color=red>负库存<font>";
			}
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
		<td>
			<input name="chitem" type="checkbox" value="<%=ckxh%>">		</td>
		<td><%=row%>
			<input type="hidden" name="ckxh" value="<%=ckxh%>">
			<input type="hidden" name="clbm" value="<%=clbm%>" >
			<input type="hidden" name="kcsl"  value="<%=kcsl%>" >
			<input type="hidden" name="xcksl"  value="<%=xcksl%>" >
			<input type="hidden" name="xsfs"  value="<%=xsfs%>" >		</td>
		<td><%=nbbm%></td>
		<td><%=clmc%></td>
		<td><%=gg%></td>
		<td><%=jldwbm%></td>
			<td>
<%
		if (ckjxz.equals("4"))//4：人工录入
		{
			%>
			<input type="text" name="ckdj"  value="<%=ckdj%>" size="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			<%
		}
		else{
			%>
			<input type="hidden" name="ckdj"  value="<%=ckdj%>" ><%=ckdj%>
			<%
		}
%>
			</td>
		<td><%=xsfsmc%></td>
		<td><%=pssl%></td>
		<td><%=ycksl%></td>
		<td><%=kcsl%></td>
		<td> 
			<input type="text" name="cksl" size="8" maxlength="10" value=<%=cksl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >		</td>
		<td><%=txxx%></td>
		<td><%=xh%></td>
		</tr>
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr align="center" bgcolor="#FFFFFF"> 
      <td colspan="6" > 
		<input type="hidden" name="ckph" value="<%=ckph%>">
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value='重输' name="reset" >      
</td>
      <td colspan="8" >&nbsp;
        <input name="button" type=button onClick="selectAll(listform)" value='全选删除项'>
&nbsp;&nbsp;
<input name="button" type=button onClick="f_delete(listform)" value='删除'></td>
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
/*
	if (<%=row%><=1)
	{
		if(	javaTrim(FormName.cksl)=="") {
			alert("请输入[出库数量]！");
			FormName.cksl.select();
			return false;
		}
		if(!(isFloat(FormName.cksl, "出库数量"))) {
			return false;
		}

		if (parseFloat(FormName.cksl.value)<=0)
		{
			alert("【出库数量】必须大于零！！！");
			FormName.cksl.select();
			return false;
		}
		if (parseFloat(FormName.cksl.value) < parseFloat(FormName.zxqdl.value))
		{
			alert("【出库数量】必须大于【最小起订量"+FormName.zxqdl.value+"】！！！");
			FormName.cksl.select();
			return false;
		}

		if (FormName.xsfs.value=="2")//1：代销品；2：现货销售；3：期货销售
		{
			if (parseFloat(FormName.cksl.value) > parseFloat(FormName.kdhsl.value))
			{
				alert("错误！现货销售，【出库数量】不能大于【可订货数量"+FormName.kdhsl.value+"】，可订货数量＝正常品库存－订货");
				FormName.cksl.select();
				return false;
			}
		}
	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (i=0;i<<%=row%> ;i++ )
		{
			if(	javaTrim(FormName.cksl[i])=="") {
				alert("请输入[出库数量]！");
				FormName.cksl[i].select();
				return false;
			}
			if(!(isFloat(FormName.cksl[i], "出库数量"))) {
				return false;
			}

			if (parseFloat(FormName.cksl[i].value)<=0)
			{
				alert("【出库数量】必须大于零！！！");
				FormName.cksl[i].select();
				return false;
			}

			if (parseFloat(FormName.cksl[i].value) < parseFloat(FormName.zxqdl[i].value))
			{
				alert("【出库数量】必须大于【最小起订量"+FormName.zxqdl[i].value+"】！！！");
				FormName.cksl[i].select();
				return false;
			}

			if (FormName.xsfs[i].value=="2")//1：代销品；2：现货销售；3：期货销售
			{
				if (parseFloat(FormName.cksl[i].value) > parseFloat(FormName.kdhsl[i].value))
				{
					alert("错误！现货销售，【出库数量】不能大于【可订货数量"+FormName.kdhsl[i].value+"】，可订货数量＝正常品库存－订货");
					FormName.cksl[i].select();
					return false;
				}
			}
		}
	}
*/
	FormName.action="SaveEditAllJxc_ckmx.jsp";
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

	FormName.action="DeleteJxc_ckmx.jsp";
	FormName.submit();
	return true;

}

//-->
</script>

