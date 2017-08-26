<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=null;
String dwbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;
String sfzhm=null;
String sjs=null;
String zjxm=null;
String sgdmc=null;
String sgbz=null;

String hth=null;
String smhtbh=null;

String ywy=null;
String ywyssxz=null;
String ywybm=null;
String scbjl=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,khxm,xb,fwdz,crm_khxx.lxfs,crm_khxx.qtdh,crm_khxx.email,crm_khxx.sfzhm,sjs,zjxm,sgdmc,crm_khxx.sgbz ";
	ls_sql+=" ,hth,smhtbh,ywy,ywyssxz,ywybm,scbjl ";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		hth=cf.fillNull(rs.getString("hth"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		ywy=cf.fillNull(rs.getString("ywy"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		ywybm=cf.fillNull(rs.getString("ywybm"));
		scbjl=cf.fillNull(rs.getString("scbjl"));
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body >

  <div align="center"> 请修改信息（客户编号：<%=khbh%>）</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">客户姓名</font>      </td>
      <td width="34%"><%=khxm%>      </td>
      <td width="19%" align="right"><font color="#0000FF">性别      </font></td>
      <td width="31%">
<%
	cf.radioToken(out, "xb","M+男&W+女",xb,true);
%>	  </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">手机</font></td>
      <td colspan="3"> <%=lxfs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">其它电话</font></td>
      <td colspan="3"> <%=qtdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">电子邮件</font></td>
      <td width="34%"> <%=email%></td>
      <td width="19%" align="right"><font color="#0000FF">业主身份证号码</font></td>
      <td width="31%"><%=sfzhm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">房屋地址</font>      </td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">设计师</font></td>
      <td width="34%"> <%=sjs%></td>
      <td width="19%" align="right"><font color="#0000FF">工程担当</font></td>
      <td width="31%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">施工队</font></td>
      <td width="34%"> <%=sgdmc%></td>
      <td width="19%" align="right"><font color="#0000FF">班长</font></td>
      <td width="31%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">合同号</font></td>
      <td width="34%"><%=hth%></td>
      <td width="19%" align="right"><font color="#0000FF">书面合同编号</font></td>
      <td width="31%"><%=smhtbh%></td>
    </tr>
  </TABLE>

<form method="post" action="SaveEditCrm_khxx.jsp" name="editform">
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><span class="STYLE2"><font color="#FF0000">*</font></span><span class="STYLE1">分公司</span></td>
              <td width="33%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' order by dwbh",ssfgs);
%> 
                </select>              </td>
              <td width="15%" align="right"><span class="STYLE1">原业务员</span></td>
              <td width="35%"><input type="text" name="oldywy" value="<%=ywy%>" size="20" maxlength="20" readonly></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>业务员部门</td>
              <td>
			  <select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeYwybm(editform)">
                <option value=""></option>
                <%
		cf.selectItem(out,"select distinct sq_dwxx.dwbh,sq_dwxx.dwmc from sq_dwxx,sq_yhxx where sq_dwxx.dwbh=sq_yhxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') and cxbz='N' order by dwbh",ywybm);
	%>
              </select></td>
              <td align="right">业务员所属小组</td>
              <td><select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeXz(editform)">
                <option value=""></option>
                <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+ywybm+"' and dwlx='F4' and cxbz='N' order by dwbh",ywyssxz);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right"><font color="#FF0000">*</font>新业务员</td>
              <td><select name="newywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
		String sql=null;
		if (ywyssxz!=null && !ywyssxz.equals(""))
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
			sql+=" from sq_yhxx ";
			sql+=" where sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
			sql+=" and sq_yhxx.dwbh='"+ywybm+"'";
			sql+=" and sq_yhxx.sjsbh='"+ywyssxz+"'";

			sql+=" ORDER BY c1";
		}
		else{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
			sql+=" from sq_yhxx ";
			sql+=" where sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
			sql+=" and sq_yhxx.dwbh='"+ywybm+"'";

			sql+=" ORDER BY c1";
		}

		cf.selectItem(out,sql,"");

%>
              </select></td>
              <td align="right"><font color="#FF0000">*</font>市场部经理</td>
              <td><select name="scbjl" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.xzzwbm||')' from sq_yhxx where sq_yhxx.dwbh='"+ywybm+"' and (INSTR(xzzwbm,'经理')>0  or INSTR(xzzwbm,'主管')>0) and sq_yhxx.sfzszg in('Y','N') order by yhmc",scbjl);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right"><font color="#FF0000">*</font>修改说明</td>
              <td colspan="3"> 
                <textarea name="xgsm" rows="3" cols="68"></textarea>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
                  <input type="hidden" name="khxm"  value="<%=khxm%>" >
                  <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
              <input type="reset"  value="重输"></td>
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

var lx;

function changeYwybm(FormName)
{
	FormName.ywyssxz.length=1;
	FormName.newywy.length=1;

	if (FormName.ywybm.value=="")
	{
		return;
	}

	var sql;
	sql =" select dwbh,dwmc";
	sql+=" from sq_dwxx ";
	sql+=" where dwlx='F4' and cxbz='N' and ssdw='"+FormName.ywybm.value+"'";
	sql+=" ORDER BY dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	lx="1";
	openAjax(actionStr);

}

function getBmYwy(FormName)
{
	FormName.newywy.length=1;

	if (FormName.ywybm.value=="")
	{
		return;
	}


	var sql;
	sql =" select yhmc";
	sql+=" from sq_yhxx ";
	sql+=" where dwbh='"+FormName.ywybm.value+"'";
	sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
	sql+=" ORDER BY yhmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	lx="2";
	openAjax(actionStr);

}

function getScbjl(FormName)
{
	FormName.scbjl.length=1;

	if (FormName.ywybm.value=="")
	{
		return;
	}


	var sql;
	sql =" select yhmc";
	sql+=" from sq_yhxx ";
	sql+=" where dwbh='"+FormName.ywybm.value+"'";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";
	sql+=" and (INSTR(xzzwbm,'经理')>0  or INSTR(xzzwbm,'主管')>0) ";
	sql+=" ORDER BY yhmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	lx="3";
	openAjax(actionStr);

}


function changeXz(FormName)
{
	var sql ="";
	FormName.newywy.length=1;

	if (FormName.ywyssxz.value=="")
	{
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='<%=ssfgs%>' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.dwbh='"+FormName.ywybm.value+"'";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='<%=dwbh%>' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.dwbh='"+FormName.ywybm.value+"'";

		sql+=" ORDER BY c1";
	}
	else{
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='<%=ssfgs%>' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.dwbh='"+FormName.ywybm.value+"'";
		sql+=" and sq_yhxx.sjsbh='"+FormName.ywyssxz.value+"'";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='<%=dwbh%>' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.dwbh='"+FormName.ywybm.value+"'";
		sql+=" and sq_yhxx.sjsbh='"+FormName.ywyssxz.value+"'";

		sql+=" ORDER BY c1";
	}


	lx="4";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		strToSelect(editform.ywyssxz,ajaxRetStr);
		getBmYwy(editform);
	}
	else if (lx=="2")
	{
		strToItem2(editform.newywy,ajaxRetStr);
		getScbjl(editform);
	}
	else if (lx=="3")
	{
		strToItem2(editform.scbjl,ajaxRetStr);
	}
	else if (lx=="4")
	{
		strToSelect(editform.newywy,ajaxRetStr);
	}

}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ywybm)=="") {
		alert("请输入[业务员部门]！");
		FormName.ywybm.focus();
		return false;
	}
	if(	javaTrim(FormName.scbjl)=="") {
		alert("请输入[市场部经理]！");
		FormName.scbjl.focus();
		return false;
	}
	if(	javaTrim(FormName.newywy)=="") {
		alert("请输入[新业务员]！");
		FormName.newywy.focus();
		return false;
	}

	if(FormName.newywy.value==FormName.oldywy.value) {
		alert("[新业务员]与[原业务员]不能相同！");
		FormName.newywy.focus();
		return false;
	}
	if(	javaTrim(FormName.xgsm)=="") {
		alert("请输入[修改说明]！");
		FormName.xgsm.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>


