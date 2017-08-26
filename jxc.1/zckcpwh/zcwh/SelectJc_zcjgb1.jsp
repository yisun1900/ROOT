<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String clxlbmstr=cf.getItemData("select zcxlmc c1,zcxlmc c2,zcdlmc from jdm_clxlbm order by zcdlmc,clxlbm");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");

String ppstr=null;
if (yhjs.equals("A0") || yhjs.equals("A1"))
{
	ppstr=cf.getItemData("select sq_gysxx.gysmc c1,sq_gysxx.gysmc||'('||dwmc||')' c2,zclb from sq_gysxx,sq_dwxx where sq_gysxx.ssdw=sq_dwxx.ppmc(+) and sq_gysxx.gyslb='4' order by sq_gysxx.zclb,sq_gysxx.gysmc,sq_gysxx.ssfgs");
}
else{
	ppstr=cf.getItemData("select sq_gysxx.gysmc c1,sq_gysxx.gysmc||'('||dwmc||')' c2,zclb from sq_gysxx,sq_dwxx where sq_gysxx.ssdw=sq_dwxx.ppmc(+) and sq_gysxx.gyslb='4' and sq_gysxx.dqbm='"+dqbm+"' order by sq_gysxx.ssfgs,sq_gysxx.zclb,sq_gysxx.gysmc");
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">主材大类</td>
              <td width="32%"> 
                <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(cldlbm,clxlbm,<%=clxlbmstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_cldlbm  order by cldlbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">主材小类</td>
              <td width="33%"> 
                <select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange=" selectItem(clxlbm,ppbm,<%=ppstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_clxlbm  order by clxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">品牌</td>
              <td width="32%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>
              </td>
              <td width="17%" align="right"><font color="#0000CC">所属地区</font></td>
              <td width="33%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="18%" bgcolor="#FFFFFF" align="right">品牌</td>
              <td width="32%">
                <input type="text" name="ppbm2" size="20" maxlength="50" >
              </td>
              <td width="17%">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">主材编码</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_clbm" size="20" maxlength="7" >
              </td>
              <td width="17%"> 
                <div align="right">主材名称</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_clmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">类别/系列</td>
              <td colspan="3"> 
                <input type="text" name="cllbbm" value="" size="72" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">型号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_xh" size="20" maxlength="100" >
              </td>
              <td width="17%"> 
                <div align="right">规格</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_gg" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">颜色</div>
              </td>
              <td width="32%"> 
                <input type="text" name="clysbm" value="" size="20" maxlength="100" >
              </td>
              <td width="17%"> 
                <div align="right">计量单位</div>
              </td>
              <td width="33%"> 
                <select name="jc_zcjgb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">市场标价 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_lsj" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_lsj2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">销售价 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_xsj" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_xsj2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">是否包含配件</div>
              </td>
              <td width="32%"><%
	cf.radioToken(out, "jc_zcjgb_sfbhpj","Y+包含&N+不包含","");
%> </td>
              <td width="17%"> 
                <div align="right">照片名称</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_zp" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">配件套数 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_pjts" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_pjts2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">是否有促销</td>
              <td width="32%"><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销","");
%></td>
              <td width="17%" align="right">是否有货</td>
              <td width="33%"> 
                <input type="radio" name="sfyh" value="Y">
                有货 
                <input type="radio" name="sfyh" value="N">
                无货</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">促销开始时间 从</td>
              <td width="32%"> 
                <input type="text" name="cxkssj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="cxkssj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">促销结束时间 从</td>
              <td width="32%"> 
                <input type="text" name="cxjzsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="cxjzsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">结果排序</td>
              <td colspan="3"> 
                <select name="jgpx" style="FONT-SIZE:14PX;WIDTH:515PX">
                  <option value=""></option>
                  <option  value="jc_zcjgb.clbm">主材编码</option>
                  <option  value="jc_zcjgb.cldlbm,jc_zcjgb.ppmc,jc_zcjgb.cllbbm,jc_zcjgb.xh,jc_zcjgb.clbm">大类,品牌,类别系列，型号</option>
                  <option  value="jc_zcjgb.cldlbm,jc_zcjgb.ppmc,jc_zcjgb.cllbbm,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.clbm">大类,品牌,类别系列，型号，规格</option>
                  <option  value="jc_zcjgb.cldlbm,jc_zcjgb.ppmc,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.clbm">大类,品牌，型号，规格</option>
                  <option  value="jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.clbm">型号，规格</option>
                  <option  value="jc_zcjgb.xh,jc_zcjgb.clbm">型号</option>
                  <option  value="jc_zcjgb.clmc">主材名称</option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
                <p> 
                  <input type="button"  value="备份主材报价到临时库" onClick="f_back(selectform)" name="button" >
                  <input type="button"  value="从临时库还原主材报价" onClick="f_restore(selectform)" name="button2" >
                </p>
                <p> 
                  <input type="button"  value="根据条件导出报价" onClick="f_dc(selectform)" name="button">
                  <input type="button"  value="修改现有主材报价" onClick="f_gx(selectform)" name="button">
                </p>
                <p> 
                  <input type="button"  value="更换全部主材报价" onClick="f_drall(selectform)" name="button3">
                  <input type="button"  value="增加新的主材报价" onClick="f_drnew(selectform)" name="button32">
                </p>
              </td>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}

	if(!(isFloat(FormName.jc_zcjgb_lsj, "市场统一限价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_lsj2, "市场统一限价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_xsj, "优惠价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_xsj2, "优惠价"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts, "配件套数"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts2, "配件套数"))) {
		return false;
	}

	if(!(isDatetime(FormName.cxkssj, "促销开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxkssj2, "促销开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxjzsj, "促销结束时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxjzsj2, "促销结束时间"))) {
		return false;
	}

	FormName.target="";
	FormName.action="Jc_zcjgbList.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if ( confirm("确实要导出主材报价吗?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("请选择[所属地区]！");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ExpData.jsp";
		FormName.submit();
		return true;
	}
}
function f_back(FormName)//参数FormName:Form的名称
{
	if ( confirm("确实要备份报价表吗?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("请选择[所属地区]！");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="DbToBack.jsp";
		FormName.submit();
		return true;
	}
}
function f_restore(FormName)//参数FormName:Form的名称
{
	if ( confirm("确实要还原备份报价吗?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("请选择[所属地区]！");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ChooseBack.jsp";
		FormName.submit();
		return true;
	}
}
function f_drall(FormName)//参数FormName:Form的名称
{
	if ( confirm("确实要[替换全部主材报价]吗?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("请选择[所属地区]！");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ImpData.jsp";
		FormName.submit();
		return true;
	}
}
function f_drnew(FormName)//参数FormName:Form的名称
{
	if ( confirm("确实要[增加新的主材报价]吗?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("请选择[所属地区]！");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ImpAddData.jsp";
		FormName.submit();
		return true;
	}
}
function f_gx(FormName)//参数FormName:Form的名称
{
	if ( confirm("确实要更新主材报价吗?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("请选择[所属地区]！");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="UpdateData.jsp";
		FormName.submit();
		return true;
	}
}
//-->
</SCRIPT>
