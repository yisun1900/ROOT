<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zjxxh=request.getParameter("zjxxh");
String dqbm=request.getParameter("dqbm");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 
        请录入其它收费项目明细
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertBj_sfxmmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">客户编号</font></td>
              <td width="32%"> 
                <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="7" readonly>
				</td>
              <td width="18%">&nbsp; </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#FF0000">*</font>收费项目</td>
              <td colspan="3"> 
                <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:522PX" onChange="getSfxm(insertform)" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sfxmbm,sfxmmc||DECODE(sfbxx,'1','（必选）','2','') from bdm_sfxmbm where dqbm='"+dqbm+"' and sfxmbm not in(select sfxmbm from bj_sfxmmx where khbh='"+khbh+"') and (sfxsq='1' OR (sfxsq='2' and sfxmbm in(select sfxmbm from sq_sfxmsq where ygbh='"+ygbh+"'))) order by sfxmbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">收费计算方式</font></td>
              <td colspan="3"><input name="sflx" type="text" id="sflx" value="" size="73" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">计量单位</font></td>
              <td><input type="text" name="jldw" value="" size="20" maxlength="17" readonly>
                <strong><font color="#0000FF">不可修改</font></strong></td>
              <td align="right"><font color="#FF0000">*</font>数量</td>
              <td><input type="text" name="sl" value="" size="20" maxlength="17" onChange="getJe(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>单价</td>
              <td><input type="text" name="dj" value="" size="20" maxlength="17"  onchange="getJe(insertform)">
              <input type="hidden" name="bzdj" value="" ></td>
              <td align="right"><font color="#FF0000">*</font>收费百分比</td>
              <td><input name="sfbfb" type="text" value="" size="20" maxlength="8">
%</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">收费金额</font></td>
              <td colspan="3"><input type="text" name="zqsfje" value="" size="20" maxlength="17" readonly>
                <strong><font color="#0000FF">不可修改</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
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

function getSfxm(FormName)
{

	var str="Bj_sfxmmxCx.jsp?dqbm=<%=dqbm%>&sfxmbm="+FormName.sfxmbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getJe(FormName)
{
	if (FormName.sflx.value=='固定金额（可改）')
	{
		var zqsfje=0;
		zqsfje=FormName.dj.value*FormName.sl.value
		zqsfje=round(zqsfje,2);
		FormName.zqsfje.value=zqsfje;
	}
	else if (FormName.sflx.value=='固定金额（不可改）')
	{
		var zqsfje=0;
		zqsfje=FormName.dj.value*FormName.sl.value
		zqsfje=round(zqsfje,2);
		FormName.zqsfje.value=zqsfje;
	}
	else{
		FormName.zqsfje.value="不需录入，自动计算";
	}
}


function f_do(FormName)//参数FormName:Form的名称
{
	getJe(FormName);

	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("请选择[收费项目]！");
		FormName.sfxmbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") 
	{
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}

	if(!(isFloat(FormName.sl, "数量"))) 
	{
		return false;
	}

	if(	javaTrim(FormName.sl)=="" || FormName.sl.value=='0') {
		alert("请录入[数量]！");
		FormName.sl.select();
		return false;
	}

	if (FormName.sflx.value=='固定金额（可改）')
	{
		if(	javaTrim(FormName.dj)=="") {
			alert("请输入[单价]！");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "单价"))) {
			return false;
		}

		if(	javaTrim(FormName.dj)=="" || FormName.dj.value=='0') {
			alert("请录入[单价]！");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="") {
			alert("请输入[收费金额]！");
			FormName.zqsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.zqsfje, "收费金额"))) {
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="" || FormName.zqsfje.value=='0') {
			alert("请录入[收费金额]！");
			FormName.zqsfje.select();
			return false;
		}

		FormName.sfbfb.value="";
	}
	else if (FormName.sflx.value=='固定金额（不可改）')
	{
		if(FormName.dj.value!=FormName.bzdj.value) 
		{
			alert("错误！不能修改[单价]！");
			FormName.dj.value=FormName.bzdj.value;
			return false;
		}


		if(	javaTrim(FormName.dj)=="") {
			alert("请输入[单价]！");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "单价"))) {
			return false;
		}

		if(	javaTrim(FormName.dj)=="" || FormName.dj.value=='0') {
			alert("请录入[单价]！");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="") {
			alert("请输入[收费金额]！");
			FormName.zqsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.zqsfje, "收费金额"))) {
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="" || FormName.zqsfje.value=='0') {
			alert("请录入[收费金额]！");
			FormName.zqsfje.select();
			return false;
		}

		FormName.sfbfb.value="";
	}
	else if (FormName.sflx.value=='工程直接费百分比（可改）')
	{
		if(	javaTrim(FormName.sfbfb)=="") {
			alert("请输入[收费百分比]！");
			FormName.sfbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.sfbfb, "收费百分比"))) {
			return false;
		}

		FormName.dj.value="";
		FormName.zqsfje.value="";
	}
	else{
		FormName.dj.value="";
		FormName.zqsfje.value="";
		FormName.sfbfb.value="";
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
