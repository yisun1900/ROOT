<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String bgcolor=null;
int row=0;

String rkph=request.getParameter("rkph");

String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String jldwbm=null;

String cldlbm=null;
String clxlbm=null;

double rkj=0;
double rksl=0;
String scrq=null;
String scph=null;

String ckbh=null;
String hjbh=null;
String hwbh=null;
String rkxh=null;

try {
	conn=cf.getConnection();

	ls_sql=" select ckbh";
	ls_sql+=" from jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckbh=cf.fillNull(rs.getString("ckbh"));
	}
	rs.close();
	ps.close();
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">修改入库单明细(入库批号:<%=rkph%>)</font></B>
</CENTER>

<form method="POST" name="listform" action="" target="_blank">

<input name="button" type="button"  value="批量设置右侧信息-->" onclick="f_plzs(listform)">&nbsp;&nbsp;
  生产日期
    <input type="text" name="plszscrq" value="" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onDblClick="JSCalendar(this)" onKeyUp="keyGo(scph[<%=row%>])">
    生产批号
    <input type="text" name="plszscph" value="" size="16" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(rkj[<%=(row+1)%>])" >
    入库货架
    <select name="plszhjbh" style="FONT-SIZE:12PX;WIDTH:112PX" onChange="changePlHj(listform)">
      <option value=""></option>
      <%
				cf.selectItem(out,"select hjbh,hjmc from jxc_hjmc where ckbh='"+ckbh+"' order by hjbh","");
			%>
    </select>
    入库货位
    <select name="plszhwbh" style="FONT-SIZE:12PX;WIDTH:112PX" >
      <option value=""></option>
    </select>
<table border="1" cellspacing="0" cellpadding="1" width="130%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">序号</td>
	<td  width="6%">内部编码</td>
	<td  width="12%">材料名称</td>
	<td  width="4%">计量单位</td>
	<td  width="5%"><span class="STYLE1">*</span>入库单价</td>
	<td  width="5%"><span class="STYLE1">*</span>入库数量</td>
	<td  width="7%"><span class="STYLE1">*</span>生产日期</td>
	<td  width="10%"><span class="STYLE1">*</span>生产批号</td>
	<td  width="9%"><span class="STYLE1">*</span>入库货架</td>
	<td  width="9%">入库货位</td>
	<td  width="9%">规格</td>
	<td  width="7%">材料编码</td>
	<td  width="11%">材料小类</td>
</tr>
<%
	ls_sql="SELECT jxc_rkmx.rkxh,jxc_rkmx.clbm,jxc_rkmx.nbbm,jxc_rkmx.clmc,jxc_rkmx.xh,jxc_rkmx.gg,jxc_rkmx.jldwbm,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,jxc_rkmx.rksl,jxc_rkmx.rkj,jxc_rkmx.scrq,jxc_rkmx.scph,jxc_rkmx.hjbh,jxc_rkmx.hwbh";
	ls_sql+=" FROM jxc_rkmx ";
	ls_sql+=" where jxc_rkmx.rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		rkxh=cf.fillNull(rs.getString("rkxh"));
		clbm=cf.fillNull(rs.getString("clbm"));
		nbbm=cf.fillHtml(rs.getString("nbbm"));
		clmc=cf.fillHtml(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldwbm=cf.fillHtml(rs.getString("jldwbm"));
		cldlbm=cf.fillHtml(rs.getString("cldlbm"));
		clxlbm=cf.fillHtml(rs.getString("clxlbm"));

		rkj=rs.getDouble("rkj");
		rksl=rs.getDouble("rksl");
		scrq=cf.fillNull(rs.getDate("scrq"));
		scph=cf.fillNull(rs.getString("scph"));
		hjbh=cf.fillNull(rs.getString("hjbh"));
		hwbh=cf.fillNull(rs.getString("hwbh"));

		String rkslstr="";
		String rkjstr="";
		if (rksl==0)
		{
			rkjstr="";
			rkslstr="";
			scrq="";
			scph="";
		}
		else{
			rkslstr=""+rksl;
			rkjstr=""+rkj;
		}

		if (row%2==1)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}

%>
		<tr bgcolor="<%=bgcolor%>" align="center">
		<td><A HREF=# onclick="f_del(listform,'<%=rkph%>','<%=rkxh%>');return false;" >删除</A></td>
		<td><%=(row+1)%></td>
		<td><%=nbbm%>
			<input type="hidden" name="clbm" value="<%=clbm%>">
			<input type="hidden" name="rkxh" value="<%=rkxh%>">
		</td>
		<td><%=clmc%></td>
		<td><%=jldwbm%></td>
		<td>
			<input type="text" name="rkj" value="<%=rkjstr%>" size="8" maxlength="8" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(rksl[<%=row%>])" >
		</td>
		<td>
			<input type="text" name="rksl" value="<%=rkslstr%>" size="7" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(scrq[<%=row%>])" >
		</td>
		<td>
			<input type="text" name="scrq" value="<%=scrq%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onDblClick="JSCalendar(this)" onKeyUp="keyGo(scph[<%=row%>])">
		</td>
		<td>
			<input type="text" name="scph" value="<%=scph%>" size="16" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(rkj[<%=(row+1)%>])" >
		</td>
		<td>
			<select name="hjbh" style="FONT-SIZE:12PX;WIDTH:112PX" onChange="changeHj(listform,<%=row%>)">
			<option value=""></option>
			<%
				cf.selectItem(out,"select hjbh,hjmc from jxc_hjmc where ckbh='"+ckbh+"' order by hjbh",hjbh);
			%>
			</select>
		</td>
		<td>
			<select name="hwbh" style="FONT-SIZE:12PX;WIDTH:112PX" >
			<option value=""></option>
			<%
				cf.selectItem(out,"select hwbh,hwmc from jxc_hwmc where hjbh='"+hjbh+"' order by hjbh,hwbh",hwbh);
			%>
			</select>
		</td>
		<td><%=gg%></td>
		<td><%=clbm%></td>
		<td><%=clxlbm%></td>
		</tr>
<%
		row++;
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
      <td colspan="9" > 
	  &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="hidden" name="rkph" value="<%=rkph%>">
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
      <input type="reset" value=' 重 输 ' name="reset" >      </td>
    </tr>
</table>
</form>
</body>

</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
<%
	cf.ajax(out);//启用AJAX
%>

var row=0;
var mark="";
function changeHj(FormName,i) 
{
	row=i;
	FormName.hwbh[i].length=1;

	if (FormName.hjbh[i].value=="")
	{
		return;
	}

	var sql;
	sql="select hwbh,hwmc from jxc_hwmc where hjbh='"+FormName.hjbh[i].value+"' order by hwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	mark="1";

//	window.open(actionStr);
	openAjax(actionStr);
}

function changePlHj(FormName) 
{
	FormName.plszhwbh.length=1;

	if (FormName.plszhjbh.value=="")
	{
		return;
	}

	var sql;
	sql="select hwbh,hwmc from jxc_hwmc where hjbh='"+FormName.plszhjbh.value+"' order by hwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	mark="2";

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (mark=="1")
	{
		strToSelect(listform.hwbh[row],ajaxRetStr);
	}
	else{
		strToSelect(listform.plszhwbh,ajaxRetStr);
	}
}

function f_plzs(FormName)
{
	if (<%=row%>==1)
	{
		FormName.scrq.value=FormName.plszscrq.value
		FormName.scph.value=FormName.plszscph.value
		FormName.hjbh.value=FormName.plszhjbh.value

		FormName.hwbh[0] = new Option("","" );
		FormName.hwbh[0].text=FormName.plszhwbh.options[FormName.plszhwbh.selectedIndex].text;
		FormName.hwbh[0].value=FormName.plszhwbh.options[FormName.plszhwbh.selectedIndex].value;
	}
	else{
		for (var i=0;i<<%=row%> ;i++ )
		{
			FormName.scrq[i].value=FormName.plszscrq.value
			FormName.scph[i].value=FormName.plszscph.value
			FormName.hjbh[i].value=FormName.plszhjbh.value

			FormName.hwbh[i][0] = new Option("","" );
			FormName.hwbh[i][0].text=FormName.plszhwbh.options[FormName.plszhwbh.selectedIndex].text;
			FormName.hwbh[i][0].value=FormName.plszhwbh.options[FormName.plszhwbh.selectedIndex].value;
		}
	}
} 

function f_do(FormName)
{
	FormName.action="SaveAllEditRkmx.jsp.jsp";
	FormName.submit();
	return true;
} 

function f_del(FormName,rkph,rkxh)
{
	if ( confirm("确实要删除吗?") )	
	{
		FormName.action="DeleteJxc_rkmx.jsp?rkph="+rkph+"&rkxh="+rkxh;
		FormName.submit();
		return true;
	}

} 

//-->
</script>

