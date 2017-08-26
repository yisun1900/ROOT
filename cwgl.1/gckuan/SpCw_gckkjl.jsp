<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String kkjlh=null;
String khbh=null;
String sjsfy=null;
String sgdfy=null;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String gckk=null;

String spsjsfy=null;
String spsgdfy=null;
String spzjfy=null;
String spgsfy=null;
String spqtfy=null;
String spgckk=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;


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


String wherekkjlh=cf.GB2Uni(request.getParameter("kkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kkjlh,khbh,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,spgckk,spsjsfy,spsgdfy,spzjfy,spgsfy,spqtfy,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_gckkjl";
	ls_sql+=" where  (kkjlh='"+wherekkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kkjlh=cf.fillNull(rs.getString("kkjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjsfy=cf.fillNull(rs.getString("sjsfy"));
		sgdfy=cf.fillNull(rs.getString("sgdfy"));
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		gckk=cf.fillNull(rs.getString("gckk"));

		spsjsfy=cf.fillNull(rs.getString("spsjsfy"));
		spsgdfy=cf.fillNull(rs.getString("spsgdfy"));
		spzjfy=cf.fillNull(rs.getString("spzjfy"));
		spgsfy=cf.fillNull(rs.getString("spgsfy"));
		spqtfy=cf.fillNull(rs.getString("spqtfy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		spgckk=cf.fillNull(rs.getString("spgckk"));
	}
	rs.close();
	ps.close();

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

}
catch (Exception e) {
	out.print("Exception: " + e);
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

<html>
<head>
<title>审批审批后工程扣款</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">审批工程扣款（扣款记录号：<%=kkjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveSpCw_gckkjl.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">客户编号</td>
  <td><%=khbh%></td>
  <td align="right">合同号</td>
  <td><%=hth%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">客户姓名</div></td>
  <td><%=khxm%>（<%=lxfs%>） </td>
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
  <td><div align="right"><strong><font color="#000099">设计师承担费用</font></strong></div></td>
  <td><%=sjsfy%></td>
  <td><div align="right"><font color="#000099"><strong>施工队承担费用</strong></font></div></td>
  <td><%=sgdfy%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right"><strong><font color="#000099">质检承担费用</font></strong></div></td>
  <td><%=zjfy%></td>
  <td><div align="right"><strong><font color="#000099">公司承担费用</font></strong></div></td>
  <td><%=gsfy%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right"><strong><font color="#000099">其它方承担费用</font></strong></div></td>
  <td><%=qtfy%></td>
  <td><div align="right"><strong><font color="#000099">工程扣款</font></strong></div></td>
  <td><%=gckk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="20%"> 
    <div align="right">录入人</div>  </td>
  <td width="30%"><%=lrr%></td>
  <td width="21%"> 
    <div align="right">录入时间</div>  </td>
  <td width="29%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="20%"> 
    <div align="right">录入部门</div>  </td>
  <td colspan="3">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>
  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="20%"> 
    <div align="right">备注</div>  </td>
  <td colspan="3"><%=bz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">审批后<font color="#990000"><strong>设计师承担费用</strong></font></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spsjsfy" size="20" maxlength="17"  value="<%=spsjsfy%>" onChange="f_js(editform)">  </td>
  <td bgcolor="#FFFFCC"><div align="right">审批后<strong><font color="#990000">施工队承担费用</font></strong></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spsgdfy" size="20" maxlength="17"  value="<%=spsgdfy%>" onChange="f_js(editform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">审批后<font color="#990000"><strong>质检承担费用</strong></font></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spzjfy" size="20" maxlength="17"  value="<%=spzjfy%>" onChange="f_js(editform)">  </td>
  <td bgcolor="#FFFFCC"><div align="right">审批后<strong><font color="#990000">公司承担费用</font></strong></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spgsfy" size="20" maxlength="17"  value="<%=spgsfy%>" onChange="f_js(editform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">审批后<font color="#990000"><strong>其它方承担费用</strong></font></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spqtfy" size="20" maxlength="17"  value="<%=spqtfy%>" onChange="f_js(editform)">  </td>
  <td bgcolor="#FFFFCC"><div align="right">审批后<strong><font color="#990000">工程扣款</font></strong></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spgckk" value="<%=spgckk%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">审批人</div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td bgcolor="#FFFFCC"><div align="right">审批时间</div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">审批标志</td>
  <td colspan="3" bgcolor="#FFFFCC"><input type="radio" name="spbz" value="3">
    审批通过
    <input type="radio" name="spbz" value="4">
    审批未通过</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">审批意见</div></td>
  <td colspan="3" bgcolor="#FFFFCC"><textarea name="spyj" cols="69" rows="3"></textarea>
      <div align="right"></div></td>
</tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center">
					<input type="hidden" name="wherekkjlh"  value="<%=wherekkjlh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>              </td>
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
	var gk=FormName.spsjsfy.value*1.0+FormName.spsgdfy.value*1.0+FormName.spzjfy.value*1.0+FormName.spgsfy.value*1.0+FormName.spqtfy.value*1.0;
	gk=round(gk,2);
	FormName.spgckk.value=gk;
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.spsjsfy)=="") {
		alert("请输入[审批后设计师承担费用]！");
		FormName.spsjsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.spsjsfy, "审批后设计师承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.spsgdfy)=="") {
		alert("请输入[审批后施工队承担费用]！");
		FormName.spsgdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.spsgdfy, "审批后施工队承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.spzjfy)=="") {
		alert("请输入[审批后质检承担费用]！");
		FormName.spzjfy.focus();
		return false;
	}
	if(!(isFloat(FormName.spzjfy, "审批后质检承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.spgsfy)=="") {
		alert("请输入[审批后公司承担费用]！");
		FormName.spgsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.spgsfy, "审批后公司承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.spqtfy)=="") {
		alert("请输入[审批后其它方承担费用]！");
		FormName.spqtfy.focus();
		return false;
	}
	if(!(isFloat(FormName.spqtfy, "审批后其它方承担费用"))) {
		return false;
	}

	f_js(FormName);

	if (FormName.spgckk.value!=(FormName.spsjsfy.value*1.0+FormName.spsgdfy.value*1.0+FormName.spzjfy.value*1.0+FormName.spgsfy.value*1.0+FormName.spqtfy.value*1.0))
	{
		alert("错误！[审批后工程扣款]与明细加在一起数值不符！");
		FormName.spgckk.focus();
		return false;
	}

	if(	!radioChecked(FormName.spbz)) {
		alert("请选择[审批标志]！");
		FormName.spbz[0].focus();
		return false;
	}
	
	if(	javaTrim(FormName.spr)=="") {
		alert("请录入审批人");
		FormName.spsj.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("请输入[审批时间]！");
		FormName.spsj.focus();
		return false;
	}
  if(!(isDatetime(FormName.spsj, "审批时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
