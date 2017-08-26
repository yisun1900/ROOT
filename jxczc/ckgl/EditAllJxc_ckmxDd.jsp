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
String hjbh=null;
String scph=null;

String bgcolor="";

int row=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String lydh=null;
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
		lydh=cf.fillNull(rs.getString("lydh"));
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
<table border="1" cellspacing="0" cellpadding="1" width="130%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td width="2%">序号</td>
	<td width="6%">内部编码</td>
	<td width="12%">材料名称</td>
	<td width="10%">型号</td>
	<td width="4%">计量单位</td>
	<td width="5%">订单数量</td>
	<td width="5%">已出库数</td>
	<td width="5%">库存数量</td>
	<td width="7%">出库数量</td>
	<td width="5%">提醒</td>
	<td width="10%">货架</td>
	<td width="8%">生产批号</td>
	<td width="10%">规格</td>
	<td width="5%">出库单价</td>
	<td width="4%">销售方式</td>
</tr>
<%
	ls_sql="SELECT ckxh,jxc_ckmx.clbm,nbbm,jxc_ckmx.clmc,xh,jxc_ckmx.gg,ppmc,jldwbm,ckdj,cksl,scph,hjbh";
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
		scph=cf.fillNull(rs.getString("scph"));
		hjbh=cf.fillNull(rs.getString("hjbh"));

		//查询主材配送明细
		double sl=0;
		double ycksl=0;
		double xcksl=0;//需出库数量＝开单数量－已出库数量
		ls_sql = " select sl,cksl,sl-cksl xcksl";
		ls_sql+= " from jc_zcddmx ";
		ls_sql+=" where ddbh='"+lydh+"' and zcbm='"+clbm+"'";
		ls_sql+=" and lx='1' ";//1：合同项；2：增项 
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			sl=rs1.getDouble("sl");
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
		<td><%=xh%></td>

		<td><%=jldwbm%></td>
		<td><%=sl%></td>
		<td><%=ycksl%></td>
		<td><%=kcsl%></td>
		<td> 
			<input type="text" name="cksl" size="8" maxlength="10" value=<%=cksl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >		</td>
		<td><%=txxx%></td>
			<td > 
				<select name="hjbh" style="FONT-SIZE:12PX;WIDTH:112PX" onChange="changeHj(listform,'<%=clbm%>',<%=row%>)">
				  <option value=""></option>
				  <%
						cf.selectItem(out,"select distinct jxc_kcb.hjbh,jxc_hjmc.hjmc from jxc_kcb,jxc_hjmc where jxc_kcb.hjbh=jxc_hjmc.hjbh and jxc_kcb.ckbh='"+ckbh+"' and jxc_kcb.clbm='"+clbm+"' order by jxc_kcb.hjbh",hjbh);
					%>
				</select>      
			</td>
			<td > 
				<select name="scph" style="FONT-SIZE:12PX;WIDTH:92PX" >
				  <option value=""></option>
				  <%
						cf.selectItem(out,"select distinct scph c1,scph c2 from jxc_kcb where ckbh='"+ckbh+"' and hjbh='"+hjbh+"' and clbm='"+clbm+"' order by scph",scph);
					%>
				</select>      
			</td>
		<td><%=gg%></td>
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
        <input name="button" type=button onClick="selectAll(listform)" value='全选删除项'>
&nbsp;&nbsp;
<input name="button" type=button onClick="f_delete(listform)" value='删除'></td>
      <td colspan="10" >&nbsp;
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value='重输' name="reset" >      
</td>
    </tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

<%
	//启用Ajax
	cf.ajax(out);
%>

var currow=0;
function changeHj(FormName,clbm,row)
{
	row=row-1;
	currow=row;

	if (<%=row%>>1)
	{
		FormName.scph[currow].length=1;

		if (FormName.hjbh[currow].value=="")
		{
			return;
		}



		var sql;
		sql="select distinct scph c1,scph c2 from jxc_kcb where ckbh='<%=ckbh%>' and clbm='"+clbm+"' and hjbh='"+FormName.hjbh[currow].value+"' order by scph";

		var actionStr="/ajax/selectstr.jsp?sql="+sql;

//		window.open(actionStr);
		openAjax(actionStr);
	}
	else{
		FormName.scph.length=1;

		if (FormName.hjbh.value=="")
		{
			return;
		}



		var sql;
		sql="select distinct scph c1,scph c2 from jxc_kcb where ckbh='<%=ckbh%>' and clbm='"+clbm+"' and hjbh='"+FormName.hjbh.value+"' order by scph";

		var actionStr="/ajax/selectstr.jsp?sql="+sql;

//		window.open(actionStr);
		openAjax(actionStr);
	}

}

function getAjax(ajaxRetStr) 
{
	if (<%=row%>>1)
	{
		strToSelect(listform.scph[currow],ajaxRetStr);
	}
	else{
		strToSelect(listform.scph,ajaxRetStr);
	}
}

function f_do(FormName)
{
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


		if (parseFloat(FormName.cksl.value) > parseFloat(FormName.kcsl.value))
		{
			alert("错误！【出库数量】不能大于【库存数量:"+FormName.kcsl.value+"】");
			FormName.cksl.select();
			return false;
		}

		if (parseFloat(FormName.cksl.value) > parseFloat(FormName.xcksl.value))
		{
			alert("错误！【出库数量】不能大于【需出库数量:"+FormName.xcksl.value+"】");
			FormName.cksl.select();
			return false;
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

			if (parseFloat(FormName.cksl[i].value) > parseFloat(FormName.kcsl[i].value))
			{
				alert("错误！【出库数量】不能大于【库存数量:"+FormName.kcsl[i].value+"】");
				FormName.cksl[i].select();
				return false;
			}

			if (parseFloat(FormName.cksl[i].value) > parseFloat(FormName.xcksl[i].value))
			{
				alert("错误！【出库数量】不能大于【需出库数量:"+FormName.xcksl[i].value+"】");
				FormName.cksl[i].select();
				return false;
			}
		}
	}

	FormName.action="SaveEditAllJxc_ckmxDd.jsp";
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

