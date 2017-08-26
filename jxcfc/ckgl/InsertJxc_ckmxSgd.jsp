<%@ page contentType="text/html;charset=gb2312" %>
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

<form method="post" action="" name="selectform" target="_blank">

<div align="center"><b>材料出库（批号：<%=ckph%>）</font></b></div>

<table width="105%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2" >
<tr bgcolor="CCCCCC" align="center"> 
	<td width="3%">序号</td>
	<td width="8%">内部编码</td>
	<td width="16%">材料名称</td>
	<td width="10%">规格</td>
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

String bgcolor="E8E8FF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String sgph=null;
String dqbm = null;
String ckbh = null;
String ckdzt = null;
String ckjxz = null;
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
		sgph=cf.fillNull(rs.getString("lydh"));
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
	String clmc=null;
	String xh=null;
	String gg=null;
	String jldwbm=null;
	double shsl=0;
	double ycksl=0;
	double xcksl=0;//需出库数量＝开单数量－已出库数量
	double cksl=0;
	double dj=0;
	int row=0;
	ls_sql = " select clbm,nbbm,clmc,xh,gg,jldwbm,shjg,shsl,ycksl,shsl-ycksl xcksl";
	ls_sql+= " from jxc_clsgmx ";
	ls_sql+=" where sgph='"+sgph+"' ";
	ls_sql+=" order by sgxh ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dj=rs.getDouble("shjg");
		shsl=rs.getDouble("shsl");
		ycksl=rs.getDouble("ycksl");
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

		if (ckjxz.equals("1"))//1：取价格表；2：取入库时定价；3：取来源单价格；4：人工录入
		{
			ckdj=dfgsjg;
		}
		else if (ckjxz.equals("2"))//出库提交后再修改
		{
			ckdj=dfgsjg;
		}
		else if (ckjxz.equals("3"))
		{
			ckdj=dj;
		}
		else
		{
			ckdj=dfgsjg;
		}

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
					if (ycksl==0)
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
					if (ycksl==0)
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
				out.print("<br><font color=red>材料："+clbm+"]销售方式不正确，请在【辅材价格管理】中修改：</font>"+xsfs);
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
			<td><%=shsl%></td>
			<td><%=ycksl%></td>
			<td><%=kcsl%></td>
			<td > 
				<input type="text" name="cksl"  value="<%=cksl%>" size="9" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
			<td><%=txxx%></td>
			<td><%=xh%></td>
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
	<td colspan="13"> 
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
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="SaveInsertJxc_ckmx.jsp" 
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
