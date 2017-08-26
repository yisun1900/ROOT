<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph = request.getParameter("ckph");
%>

<html>
<head>
<title>材料出库</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" align="center">

<form method="post" action="" name="selectform"  >

<div align="center"><b>材料出库（批号：<%=ckph%>）</font></b></div>

<table width="130%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2" >
<tr bgcolor="CCCCCC" align="center"> 
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
	<td width="11%">规格</td>
	<td width="6%">出库单价</td>
	<td width="4%">销售方式</td>
  </tr>
<%

String bgcolor="E8E8FF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String ddbh=null;
String dqbm = null;
String ckbh = null;
String ckdzt = null;
String ckjxz = null;

int row=0;
try {
	conn=cf.getConnection();    //得到连接

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
		ddbh=cf.fillNull(rs.getString("lydh"));
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


	//根据订单查询订单明细
	String nbbm=null;
	String clbm=null;
	String zcmc=null;
	String xinghao=null;
	String gg=null;
	String jldwbm=null;
	double sl=0;
	double ycksl=0;
	double xcksl=0;//需出库数量＝开单数量－已出库数量
	double cksl=0;
	double dj=0;

	ls_sql = " select zcbm,xsxh,zcmc,xinghao,gg,jldwbm,dj,sl,cksl,sl-cksl xcksl";
	ls_sql+= " from jc_zcddmx ";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ls_sql+=" and lx='1' ";//1：合同项；2：增项 
	ls_sql+=" order by xh ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("zcbm"));
		nbbm=cf.fillNull(rs.getString("xsxh"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		ycksl=rs.getDouble("cksl");
		xcksl=rs.getDouble("xcksl");

		row++;
		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}

		//查询材料信息
		double dfgsjg=0;
		double dgzjg=0;
		double jqpjcbj=0;
		double kcsl=0;
		double ckdj=0;
		String xsfs=null;
		String xsfsmc=null;
		ls_sql = " select dfgsjg,dgzjg,jqpjcbj,zcpzsl,xsfs,DECODE(xsfs,'1','代销品','2','现货','3','期货','4','可负库存') xsfsmc ";
		ls_sql+= " from jxc_cljgb ";
		ls_sql +=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			dfgsjg=rs1.getDouble("dfgsjg");
			dgzjg=rs1.getDouble("dgzjg");
			jqpjcbj=rs1.getDouble("jqpjcbj");
			kcsl=rs1.getDouble("zcpzsl");//正常品总数量
			xsfs=cf.fillNull(rs1.getString("xsfs"));
			xsfsmc=cf.fillNull(rs1.getString("xsfsmc"));
		}
		else
		{
			rs1.close();
			ps1.close();

			out.print("材料:["+clbm+"]在地区["+dqbm+"]不存在！");
			return;
		}
		rs1.close();
		ps1.close();


		ckdj=dj;


		String txxx="&nbsp";

		if (xcksl==0)
		{
			txxx="<font color=blue>已出完<font>";

			cksl=0;
		}
		else{
			if (xsfs.equals("1"))//1：代销品；出库数量＝需出库数量＝开单数量－已出库数量
			{
				cksl=xcksl;
			}
			else if (xsfs.equals("2"))//2：现货销售
			{
				if (kcsl<xcksl)
				{
					cksl=kcsl;
					if (cksl==0)
					{
						txxx="<font color=red>无法出库<font>";
					}
					else{
						txxx="<font color=red>库存不足<font>";
					}
				}
				else{
					cksl=xcksl;
				}
			}
			else if (xsfs.equals("3"))//3：期货销售
			{
				if (kcsl<xcksl)
				{
					cksl=kcsl;
					if (cksl==0)
					{
						txxx="<font color=red>无法出库<font>";
					}
					else{
						txxx="<font color=red>库存不足<font>";
					}
				}
				else{
					cksl=xcksl;
				}
			}
			else if (xsfs.equals("4"))//4：允许负库存；
			{
				if (kcsl<xcksl)
				{
					txxx="<font color=red>已负库存<font>";
				}
				cksl=xcksl;
			}
			else
			{
				out.print("<br><font color=red>材料："+clbm+"]销售方式不正确，请在【主材价格管理】中修改：</font>"+xsfs);
				return;
			}
		}

		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
			<td><%=row%></td>
			<td><%=nbbm%>
				<input type="hidden" name="clbm" value="<%=clbm%>" >
				<input type="hidden" name="kcsl"  value="<%=kcsl%>" >
				<input type="hidden" name="xcksl"  value="<%=xcksl%>" >
				<input type="hidden" name="xsfs"  value="<%=xsfs%>" >
				<input type="hidden" name="cbdj"  value="<%=jqpjcbj%>" >
			</td>
			<td><%=zcmc%></td>
			<td><%=xinghao%></td>
			<td><%=jldwbm%></td>
			<td><%=sl%></td>
			<td><%=ycksl%></td>
			<td><%=kcsl%></td>
			<td > 
				<input type="text" name="cksl"  value="<%=cksl%>" size="9" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
			<td><%=txxx%></td>
			<td > 
				<select name="hjbh" style="FONT-SIZE:12PX;WIDTH:112PX" onChange="changeHj(selectform,'<%=clbm%>',<%=row%>)">
				  <option value=""></option>
				  <%
						cf.selectItem(out,"select distinct jxc_kcb.hjbh,jxc_hjmc.hjmc from jxc_kcb,jxc_hjmc where jxc_kcb.hjbh=jxc_hjmc.hjbh and jxc_kcb.ckbh='"+ckbh+"' and jxc_kcb.clbm='"+clbm+"' order by jxc_kcb.hjbh","");
					%>
				</select>      
			</td>
			<td > 
				<select name="scph" style="FONT-SIZE:12PX;WIDTH:92PX" >
				  <option value=""></option>
				</select>      
			</td>
			<td><%=gg%></td>
			<td>
				<input type="hidden" name="ckdj"  value="<%=ckdj%>" ><%=ckdj%>
			</td>
			<td><%=xsfsmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch(Exception e){
	out.print("<BR>存盘失败,发生意外: " + e+ls_sql);
}
finally{
	try{
		if (rs!= null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>

<tr bgcolor="CCCCCC" align="center"> 
	<td colspan="15"> 
		<input type="hidden" name="ckph"  value="<%=ckph%>" >
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
		<input type="hidden" name="ckbh"  value="<%=ckbh%>" >
		<input type="button"  value=" 保 存 " onClick="f_do(selectform)">
	</td>
</tr>
</table>

</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
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
		strToSelect(selectform.scph[currow],ajaxRetStr);
	}
	else{
		strToSelect(selectform.scph,ajaxRetStr);
	}
}


function f_do(FormName)//参数FormName:Form的名称
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

		if (parseFloat(FormName.cksl.value)<0)
		{
			alert("【出库数量】不能小于0！！！");
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

			if (parseFloat(FormName.cksl[i].value)<0)
			{
				alert("【出库数量】不能小于0！！！");
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

	FormName.action="SaveInsertJxc_ckmxDd.jsp" 
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
