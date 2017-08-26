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
PreparedStatement ps1=null;
ResultSet rs1=null;

String bgcolor=null;
int row=0;

String rkph=cf.GB2Uni(request.getParameter("rkph"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));

String ckbh=null;

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
  <B><font size="3">快速录入入库明细（入库批号:<%=rkph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action=""  >
<table border="1" cellspacing="0" cellpadding="1" width="170%" style='FONT-SIZE: 12px' >
<tr bgcolor="#FFFFFF"> 
      <td colspan="17" > 
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
      </td>
    </tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">内部编码</td>
	<td  width="10%">材料名称</td>
	<td  width="3%">计量单位</td>
	<td  width="4%">库存数</td>
	<td  width="3%">已录入</td>
	<td  width="3%">已录入数量</td>
	<td  width="4%"><span class="STYLE1">*</span>入库单价</td>
	<td  width="4%"><span class="STYLE1">*</span>入库数量</td>
	<td  width="5%"><span class="STYLE1">*</span>生产日期</td>
	<td  width="8%"><span class="STYLE1">*</span>生产批号</td>
	<td  width="7%"><span class="STYLE1">*</span>入库货架</td>
	<td  width="7%">入库货位</td>
	<td  width="8%">规格</td>
	<td  width="8%">型号</td>
	<td  width="7%">材料小类</td>
	<td  width="7%">子品牌</td>
	<td  width="7%">供应商</td>
</tr>
<%
	String clbm=null;
	String nbbm=null;
	String clmc=null;
	String xh=null;
	String gg=null;
	String jldwbm=null;
	String cldlbm=null;
	String clxlbm=null;
	double cbj=0;
	String ppmc=null;
	String gysmc=null;
	double zcpzsl=0;


	ls_sql="SELECT jxc_cljgb.zcpzsl,jxc_cljgb.clbm,jxc_clbm.nbbm,clmc,jxc_clbm.xh,jxc_clbm.gg,jldwbm,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_cljgb.cbj,jxc_clbm.ppmc,jxc_cljgb.gysmc";
	ls_sql+=" FROM jxc_cljgb,jxc_clbm,dm_dqbm  ";
    ls_sql+=" where jxc_cljgb.dqbm=dm_dqbm.dqbm and jxc_cljgb.clbm=jxc_clbm.clbm ";
	ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"'";
	ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
	ls_sql+=" and jxc_cljgb.sfcy='Y'";//N：否；Y：是
	ls_sql+=" and jxc_cljgb.xsfs in ('2','3','4') ";//1：代销品；2：现货销售；3：期货销售；4：允许负库存
	ls_sql+=" order by  jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.clbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zcpzsl=rs.getDouble("zcpzsl");
		clbm=cf.fillNull(rs.getString("clbm"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		cbj=rs.getDouble("cbj");
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));

		double rksl=0;
		String rkslstr="";
		int rkcount=0;
		String rkcountstr="";

		ls_sql="SELECT count(*),sum(rksl)";
		ls_sql+=" FROM jxc_rkmx";
		ls_sql+=" where rkph='"+rkph+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rkcount=rs1.getInt(1);
			rksl=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();


		if (row%2==1)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}

		if (rksl==0)
		{
			rkslstr="&nbsp;";
		}
		else{
			rkslstr=""+rksl;
		}
		if (rkcount==0)
		{
			rkcountstr="<A HREF='InsertJxc_rkmx.jsp?rkph="+rkph+"&clbm="+clbm+"&dqbm="+dqbm+"' target='_blank'>录入</A>";
		}
		else{
			rkcountstr="<A HREF='InsertJxc_rkmx.jsp?rkph="+rkph+"&clbm="+clbm+"&dqbm="+dqbm+"' target='_blank'>"+rkcount+"笔</A>";
			bgcolor="#FFFFCC";
		}

		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
		<td><%=nbbm%>
			<input type="hidden" name="clbm" value="<%=clbm%>">
		</td>
		<td><%=clmc%></td>
		<td><%=jldwbm%></td>
		<td><%=zcpzsl%></td>
		<td><%=rkcountstr%></td>
		<td><%=rkslstr%></td>
		<td>
			<input type="text" name="rkj" value="<%=cbj%>" size="8" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(rksl[<%=row%>])" >
		</td>
		<td>
			<input type="text" name="rksl" value="" size="8" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(scrq[<%=row%>])" >
		</td>
		<td>
			<input type="text" name="scrq" value="" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onDblClick="JSCalendar(this)" onKeyUp="keyGo(scph[<%=row%>])">
		</td>
		<td>
			<input type="text" name="scph" value="" size="16" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(rkj[<%=(row+1)%>])" >
		</td>
		<td>
			<select name="hjbh" style="FONT-SIZE:12PX;WIDTH:112PX" onChange="changeHj(listform,<%=row%>)">
			<option value=""></option>
			<%
				cf.selectItem(out,"select hjbh,hjmc from jxc_hjmc where ckbh='"+ckbh+"' order by hjbh","");
			%>
			</select>
		</td>
		<td>
			<select name="hwbh" style="FONT-SIZE:12PX;WIDTH:112PX" >
			<option value=""></option>
			</select>
		</td>
		<td><%=gg%></td>
		<td><%=xh%></td>
		<td><%=clxlbm%></td>
		<td><%=ppmc%></td>
		<td><%=gysmc%></td>

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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#FFFFFF"> 
      <td colspan="17" > 
	  &nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="rkph" value="<%=rkph%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	  <input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
      </td>
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

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(listform.hwbh[row],ajaxRetStr);
}


function f_do(FormName)
{
	FormName.action="SavePlInsertJxc_rkmx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

