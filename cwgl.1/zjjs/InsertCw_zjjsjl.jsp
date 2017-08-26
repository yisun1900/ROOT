<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #3300FF}
-->
</style>
</head>
<%
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String fgsbh=request.getParameter("fgsbh");
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String[] khbh=request.getParameterValues("khbh");

%>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="insertform" >


<center>《完工结算－－工地明细》</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">合同号</td>
	<td  width="7%">姓名</td>
	<td  width="28%">房屋地址</td>
	<td  width="7%">施工队</td>
	<td  width="6%">质检</td>
	<td  width="9%">完工日期</td>
	<td  width="10%">工程签约额</td>
	<td  width="10%">家装实收款 </td>
	<td  width="7%">工程进度</td>
	<td  width="7%">结算</td>
</tr>

<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
String sjs=null;
String qyrq=null;
String sjjgrq=null;
String tdsj=null;
double qye=0;
double sfke=0;
double allqye=0;
double allsfke=0;
double zjxmqdjsbl=0;
double ywyqdjsje=0;
double allywyqdjsje=0;
String ysgcjdmc=null;
String ywyjsbz=null;
String zt=null;
String zjlx=null;

String bgcolor="#E8E8FF";

int row=0;
int row1=0;
int row2=0;

String jsjlh=null;

try {
	conn=cf.getConnection();

	String ygbh=null;
	String xzzwbm=null;
	ls_sql="select ygbh,xzzwbm";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where sq_yhxx.ssfgs='"+fgsbh+"' and sfzszg in('Y','N') and zwbm='05' and yhmc='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygbh=rs.getString("ygbh");
		xzzwbm=rs.getString("xzzwbm");
	}
	rs.close();
	ps.close();

	String xzzwmc="";
	ls_sql="select xzzwmc";
	ls_sql+=" from  dm_xzzwbm";
	ls_sql+=" where xzzwbm='"+xzzwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xzzwmc=rs.getString("xzzwmc");
	}
	rs.close();
	ps.close();

	if (xzzwmc.equals("主任监理"))
	{
		zjlx="1";
	}
	else{
		zjlx="2";
	}

	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,6,5)),0)";
	ls_sql+=" from  cw_zjjsjl";
	ls_sql+=" where fgsbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=fgsbh+cf.addZero(count+1,5);

	allqye=0;
	allsfke=0;

	if (khbh!=null)
	{
		for (int i=0;i<khbh.length ;i++ )
		{
			ls_sql="SELECT hth,khxm,fwdz,sgdmc,sjs,qyrq,sjjgrq,tdsj,qye,sfke,ysgcjdmc,DECODE(ywyjsbz,'0','未结算','1','签单结算','2','完工结算') ywyjsbz,DECODE(crm_khxx.zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') zt";
			ls_sql+=" FROM crm_khxx,sq_sgd,dm_gcjdbm";
			ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
			ls_sql+=" and crm_khxx.khbh='"+khbh[i]+"' ";//0：未结算；1：签单结算；2：完工结算
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hth=rs.getString("hth");
				khxm=rs.getString("khxm");
				fwdz=rs.getString("fwdz");
				sgdmc=cf.fillHtml(rs.getString("sgdmc"));
				sjs=cf.fillHtml(rs.getString("sjs"));
				qyrq=cf.fillHtml(rs.getDate("qyrq"));
				sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
				tdsj=cf.fillHtml(rs.getDate("tdsj"));
				qye=rs.getDouble("qye");
				sfke=rs.getDouble("sfke");
				ysgcjdmc=rs.getString("ysgcjdmc");
				ywyjsbz=rs.getString("ywyjsbz");
				zt=rs.getString("zt");

				allqye+=qye;
				allsfke+=sfke;
				allywyqdjsje+=ywyqdjsje;

				row1++;
				if (row1%2==0)
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}

				%>
				<tr bgcolor="<%=bgcolor%>"  align="center">
					<td><%=hth%>
						<input type="hidden" name="khbh" value="<%=khbh[i]%>" >				
					</td>
					<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh[i]%>" target="_blank"><%=khxm%></A></td>
					<td><%=fwdz%></td>
					<td><%=sgdmc%></td>
					<td><%=sjs%></td>
					<td><%=sjjgrq%></td>
					<td><%=qye%></td>
					<td><%=sfke%></td>
					<td><%=ysgcjdmc%></td>
					<td><%=ywyjsbz%></td>
				</tr>
				<%
			}
			rs.close();
			ps.close();
		}


		allqye=cf.doubleTrim(allqye);
		allsfke=cf.doubleTrim(allsfke);
	}

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allqye%></td>
		<td><%=allsfke%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>

<DIV align="center">质检结算（结算记录号：<%=jsjlh%>）</DIV>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">分公司</td>
      <td width="30%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>
      </td>
      <td width="22%" align="right">&nbsp;</td>
      <td width="30%">&nbsp; 
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">质检</td>
      <td width="30%">
        <input type="text" name="zjxm" size="20" maxlength="20"  value="<%=zjxm%>" readonly>
      </td>
      <td align="right" width="22%">质检类型</td>
      <td width="30%">
        <select name="zjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
         <%
	cf.selectToken(out,"1+主任监理&2+监理",zjlx,false);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">时间范围 从</td>
      <td width="30%"> 
        <input type="text" name="sjfw" size="20" maxlength="10"  value="<%=sjfw%>" readonly>
      </td>
      <td align="right" width="22%">时间范围 到</td>
      <td width="30%"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=sjfw2%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入人</td>
      <td width="30%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="22%">录入时间</td>
      <td width="30%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">录入部门 </td>
      <td width="30%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td width="22%">&nbsp; </td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">备注</div>
      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="jsjlh" value="<%=jsjlh%>" >
        <input type="button"  value="存盘" onClick="f_do(insertform)" >
        <input type="button"  value="开始结算" onClick="f_ksjs(insertform)" name="ksjs" disabled>
        <input type="reset"  value="重输" name="reset">
      </td>
    </tr>
  </table>
</form>



</body>
</html>



<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[分公司编号]！");
		FormName.fgsbh.focus();
		return false;
	}

	if(	javaTrim(FormName.zjxm)=="") {
		alert("请输入[质检]！");
		FormName.zjxm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjlx)=="") {
		alert("请输入[质检类型]！");
		FormName.zjlx.focus();
		return false;
	}


	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围"))) {
		return false;
	}

	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围"))) {
		return false;
	}


	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveInsertCw_zjjsjl.jsp";
	FormName.submit();
	FormName.ksjs.disabled=false;
	return true;
}


function f_ksjs(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}

	FormName.target="";
	FormName.action="EditCw_zjjsjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
