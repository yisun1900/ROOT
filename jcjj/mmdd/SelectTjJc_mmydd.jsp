<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">木门订单查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_mmyddCxListTj.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">预订单编号</div>              </td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_yddbh" size="20" maxlength="9" >              </td>
              <td width="17%"> 
              <div align="right">处理状态</div>              </td>
              <td width="33%"> 
                <select name="jc_mmydd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt order by clzt","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">客户编号</td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_khbh" size="20" maxlength="20" >              </td>
              <td width="17%" align="right">合同号</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户姓名</div>              </td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >              </td>
              <td width="17%"> 
              <div align="right">联系方式</div>              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">房屋地址</div>              </td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
              <td width="17%"> 
              <div align="right">设计师</div>              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">合同开工日期 从</td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">合同竣工日期 从</div>              </td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10" >              </td>
              <td width="17%"> 
              <div align="right">到</div>              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">施工队</div>              </td>
              <td width="30%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
%> 
                </select>              </td>
              <td width="17%"> 
              <div align="right">质检姓名</div>              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">签约日期</div>              </td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >              </td>
              <td width="17%"> 
              <div align="right">签约店面</div>              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">驻店家居顾问</td>
              <td width="30%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx where zwbm='08'","");
%> 
                </select>              </td>
              <td width="17%" align="right">展厅家居顾问</td>
              <td width="33%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx where zwbm='08'","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">五金情况</div>              </td>
              <td width="30%"> <%
	cf.radioToken(out, "jc_mmydd_wjqk","1+客户自购&2+公司购买","");
%> </td>
              <td width="17%"> 
              <div align="right">项目专员</div>              </td>
              <td width="33%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">促销活动</div>              </td>
              <td width="30%"> 
                <select name="jc_mmydd_cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc c2 from jc_cxhd order by jsbz,cxhdbm","");
%> 
                </select>              </td>
              <td width="17%"> 
              <div align="right">派单工厂</div>              </td>
              <td width="33%"> 
                <select name="jc_mmydd_pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='1' order by gysmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">自购五金件送到公司</td>
              <td width="30%"> 
                <select name="jc_mmydd_wjsgsbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+已送公司&N+未送公司","");
%> 
                </select>              </td>
              <td width="17%"> 
              <div align="right">合同签定人</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_mmydd_htqdr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">真实延迟原因</div>              </td>
              <td width="30%"> 
                <select name="jc_mmydd_zsycyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm","");
%> 
                </select>              </td>
              <td width="17%"> 
              <div align="right">延迟原因</div>              </td>
              <td width="33%"> 
                <select name="jc_mmydd_mmycyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">计划初测时间 从</td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_jhccsj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="jc_mmydd_jhccsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">签合同日期 从</div>              </td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_htrq" size="20" maxlength="10" >              </td>
              <td width="17%"> 
              <div align="right">到</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_mmydd_htrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">合同安装时间 从</div>              </td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_jhazsj" size="20" maxlength="10" >              </td>
              <td width="17%"> 
              <div align="right">到</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_mmydd_jhazsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">实入库时间 从</td>
              <td width="30%"> 
              <input type="text" name="srksj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="srksj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">协商安装时间 从</td>
              <td width="30%"> 
              <input type="text" name="kazsj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="kazsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">发安装通知时间 从</td>
              <td width="30%"> 
              <input type="text" name="aztzsj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="aztzsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">安装完成时间 从</td>
              <td width="30%"> 
              <input type="text" name="azjssj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="azjssj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">录入时间 从</td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_lrsj" size="20" maxlength="10" value="<%=cf.firstDay()%>">              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="jc_mmydd_lrsj2" size="20" maxlength="10" value="<%=cf.today()%>">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">录入人</div>              </td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_lrr" size="20" maxlength="20" >              </td>
              <td width="17%"> 
              <div align="right">录入部门</div>              </td>
              <td width="33%"> 
                <select name="jc_mmydd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">客户类型</td>
              <td><input type="radio" name="khlx" value="2">
                家装客户
                <input type="radio" name="khlx" value="4">
                非家装客户</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%" >显示风格</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)" name="Button">
                <input type="reset"  value="重输">              </td>
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
	if(!(isDatetime(FormName.crm_khxx_kgrq, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhccsj, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhccsj2, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_htrq, "签合同日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_htrq2, "签合同日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhazsj, "合同安装时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhazsj2, "合同安装时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.srksj, "实入库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.srksj2, "实入库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kazsj, "协商安装时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kazsj2, "协商安装时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.aztzsj, "发安装通知时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.aztzsj2, "发安装通知时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.azjssj, "安装完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.azjssj2, "安装完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
