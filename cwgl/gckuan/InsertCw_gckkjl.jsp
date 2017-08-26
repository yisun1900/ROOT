<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*,java.util.*"%>

<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String khbh=request.getParameter("khbh");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;
String sgd=null;
String zjxm=null;
String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
double wdzgce=0;
double qye=0;
double sjf=0;
double glf=0;
double sfke=0;
double zjxje=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String kkjlh=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,glf,sfke,zjxje,sgbz,jgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
	}
	rs.close();
	ps.close();


	//设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//质检电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(kkjlh,8,2)),0)";
	ls_sql+=" from  cw_gckkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	kkjlh=khbh+cf.addZero(count+1,2);
	
	}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">请录入工程扣款（扣款记录号：<%=kkjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCw_gckkjl.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">客户编号</td>
  <td><%=khbh%></td>
  <td align="right">合同号</td>
  <td><%=hth%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">客户姓名</div></td>
  <td><%=khxm%> </td>
  <td><div align="right">质检姓名</div></td>
  <td><%=zjxm%>（<%=zjdh%>） </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">房屋地址</td>
  <td colspan="3"><%=fwdz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">签约店面</div></td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>  </td>
  <td><div align="right">设计师</div></td>
  <td><%=sjs%>（<%=sjsdh%>） </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">所属分公司</td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%></td>
  <td align="right">所属设计室</td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">施工队</td>
  <td><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
  <td align="right">班长</td>
  <td><%=sgbz%>（<%=bzdh%>）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">签约日期</div></td>
  <td><%=qyrq%> </td>
  <td><div align="right">合同竣工日期</div></td>
  <td><%=jgrq%> </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td><div align="right">家装工程签约额</div></td>
  <td><%=qye%> </td>
  <td><div align="right">工程原报价</div></td>
  <td><%=wdzgce%> </td>
</tr>

<tr bgcolor="#E8E8FF">
  <td align="right">设计费</td>
  <td><%=sjf%></td>
  <td align="right">服务费</td>
  <td><%=glf%></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right">增减项总额</td>
  <td><%=cf.formatDouble(zjxje)%>￥</td>
  <td align="right"><font color="#0000FF">已收工程款</font></td>
  <td><font color="#0000FF"><%=cf.formatDouble(sfke)%>￥；（<font color="#0000FF">未收<%=cf.formatDouble(qye+zjxje-sfke)%>￥</font>）</font> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">工程扣款</div>  </td>
  <td width="32%"> 
    <input type="text" name="gckk" value="" size="20" maxlength="17" >  </td>
  <td width="18%"> 
    <div align="right">设计师承担费用</div>  </td>
  <td width="32%"> 
    <input type="text" name="sjsfy" value="" size="20" maxlength="17" onchange="f_js(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">施工队承担费用</div>  </td>
  <td width="32%"> 
    <input type="text" name="sgdfy" value="" size="20" maxlength="17" onchange="f_js(insertform)">  </td>
  <td width="18%"> 
    <div align="right">质检承担费用</div>  </td>
  <td width="32%"> 
    <input type="text" name="zjfy" value="" size="20" maxlength="17" onchange="f_js(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">公司承担费用</div>  </td>
  <td width="32%"> 
    <input type="text" name="gsfy" value="" size="20" maxlength="17" onchange="f_js(insertform)">  </td>
  <td width="18%"> 
    <div align="right">其它方承担费用</div>  </td>
  <td width="32%"> 
    <input type="text" name="qtfy" value="" size="20" maxlength="17" onchange="f_js(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">录入人</div>  </td>
  <td width="32%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td width="18%"> 
    <div align="right">录入时间</div>  </td>
  <td width="32%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">录入部门</div>  </td>
  <td colspan="3"> 
    <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">备注</div>  </td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea> 
    <div align="right"></div></td>
  </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="hidden" name="kkjlh" value="<%=kkjlh%>" size="20" maxlength="9" readonly>
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly ></td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_js(FormName)//参数FormName:Form的名称
{
	var gk=FormName.sjsfy.value*1.0+FormName.sgdfy.value*1.0+FormName.zjfy.value*1.0+FormName.gsfy.value*1.0+FormName.qtfy.value*1.0;
	gk=round(gk,2);
	FormName.gckk.value=gk;
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kkjlh)=="") {
		alert("请输入[扣款记录号]！");
		FormName.kkjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gckk)=="") {
		alert("请输入[工程扣款]！");
		FormName.gckk.focus();
		return false;
	}
	if(!(isFloat(FormName.gckk, "工程扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfy)=="") {
		alert("请输入[设计师承担费用]！");
		FormName.sjsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfy, "设计师承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfy)=="") {
		alert("请输入[施工队承担费用]！");
		FormName.sgdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfy, "施工队承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.zjfy)=="") {
		alert("请输入[质检承担费用]！");
		FormName.zjfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zjfy, "质检承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.gsfy)=="") {
		alert("请输入[公司承担费用]！");
		FormName.gsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.gsfy, "公司承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.qtfy)=="") {
		alert("请输入[其它方承担费用]！");
		FormName.qtfy.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfy, "其它方承担费用"))) {
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
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	if (FormName.gckk.value!=(FormName.sjsfy.value*1.0+FormName.sgdfy.value*1.0+FormName.zjfy.value*1.0+FormName.gsfy.value*1.0+FormName.qtfy.value*1.0))
	{
		alert("错误！[工程扣款]与明细加在一起数值不符！");
		FormName.gckk.focus();
		return false;
	}

	if(	javaTrim(FormName.bz)=="") {
		alert("请输入[备注]！");
		FormName.bz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
