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
	String yhdlm=(String)session.getAttribute("yhdlm");
	String dwbh=(String)session.getAttribute("dwbh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertHy_hyxxb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">会员编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hybh" value="" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">水质分析卡号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hykh" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">会员级别</div>
              </td>
              <td width="35%"> 
                <select name="hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">服务类型</div>
              </td>
              <td width="35%"> 
                <select name="fwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">基本服务</option>
                  <option value="2">增值服务</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">入会日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="rhrq" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">有效日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yxrq" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">所属专卖店</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">信息录入人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xxlrr" value="<%=yhdlm%>" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">会员密码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hymm" value="" size="20" maxlength="12" >
              </td>
              <td width="15%"> 
                <div align="right">会员姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hyxm" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">性别</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="xb"  value="M">
                男 
                <input type="radio" name="xb"  value="W">
                女 </td>
              <td width="15%"> 
                <div align="right">邮政编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yzbm" value="" size="20" maxlength="12" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">会员地址</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hydz" value="" size="20" maxlength="200" >
              </td>
              <td width="15%"> 
                <div align="right">身份证号码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sfzhm" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">电话</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dh" value="" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">手机</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sj" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">电子信箱</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dzxx" value="" size="20" maxlength="40" >
              </td>
              <td width="15%"> 
                <div align="right">出生日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="csrq" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">职业</div>
              </td>
              <td width="35%"> 
                <select name="zydm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,zymc from hy_zydmb order by xh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">月收入</div>
              </td>
              <td width="35%"> 
                <select name="ysrdm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,ysrdm from hy_ysrdmb order by xh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">婚姻状况</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="hyzk"  value="Y">
                已婚 
                <input type="radio" name="hyzk"  value="N">
                未婚 </td>
              <td width="15%"> 
                <div align="right">结婚纪念日</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jhjnr" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">爱人姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="arxm" value="" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">爱人生日</div>
              </td>
              <td width="35%"> 
                <input type="text" name="arsr" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">价格印象</div>
              </td>
              <td width="35%"> 
                <select name="jgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jgyxbm,jgyxmc from hy_jgyxbm order by jgyxbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">服务印象</div>
              </td>
              <td width="35%"> 
                <select name="fwyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwyxbm,fwyxmc from hy_fwyxbm order by fwyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">风格印象</div>
              </td>
              <td width="35%"> 
                <select name="fgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgyxbm,fgyxmc from hy_fgyxbm order by fgyxbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">工艺印象</div>
              </td>
              <td width="35%"> 
                <select name="gyyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gyyxbm,gyyxmc from hy_gyyxbm order by gyyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">专店风格</div>
              </td>
              <td width="35%"> 
                <select name="zdfgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zdfgbm,zdfgmc from hy_zdfgbm order by zdfgbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">平时爱好</div>
              </td>
              <td width="35%"> 
                <select name="psahbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select psahbm,psahmc  from hy_psahbm order by psahbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">喜爱报纸杂志</td>
              <td colspan="3"> 
                <textarea name="bzzz" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">所知同类品牌</div>
              </td>
              <td colspan="3"> 
                <textarea name="sztlpp" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">喜欢去的商店</td>
              <td colspan="3"> 
                <textarea name="shop" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">喜欢化妆品品牌</div>
              </td>
              <td colspan="3"> 
                <textarea name="hzppp" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">喜欢服装品牌</td>
              <td colspan="3"> 
                <textarea name="fzpp" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">消费总金额</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xfzje" value="" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">购买次数</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gmcs" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">积分</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jf" value="" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">未兑换积分</div>
              </td>
              <td width="35%"> 
                <input type="text" name="wdhjf" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.hybh)=="") {
		alert("请输入[会员编号]！");
		FormName.hybh.focus();
		return false;
	}
	if(	javaTrim(FormName.hyxm)=="") {
		alert("请输入[会员姓名]！");
		FormName.hyxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.csrq, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjnr, "结婚纪念日"))) {
		return false;
	}
	if(!(isDatetime(FormName.arsr, "爱人生日"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[所属专卖店]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.rhrq)=="") {
		alert("请输入[入会日期]！");
		FormName.rhrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.rhrq, "入会日期"))) {
		return false;
	}
	if(	javaTrim(FormName.yxrq)=="") {
		alert("请输入[有效日期]！");
		FormName.yxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxrq, "有效日期"))) {
		return false;
	}
	if(	javaTrim(FormName.hykh)=="") {
		alert("请输入[水质分析卡号]！");
		FormName.hykh.focus();
		return false;
	}
	if(	javaTrim(FormName.gmcs)=="") {
		alert("请输入[购买次数]！");
		FormName.gmcs.focus();
		return false;
	}
	if(!(isNumber(FormName.gmcs, "购买次数"))) {
		return false;
	}
	if(	javaTrim(FormName.xfzje)=="") {
		alert("请输入[消费总金额]！");
		FormName.xfzje.focus();
		return false;
	}
	if(!(isFloat(FormName.xfzje, "消费总金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jf)=="") {
		alert("请输入[积分]！");
		FormName.jf.focus();
		return false;
	}
	if(!(isNumber(FormName.jf, "积分"))) {
		return false;
	}
	if(	javaTrim(FormName.wdhjf)=="") {
		alert("请输入[未兑换积分]！");
		FormName.wdhjf.focus();
		return false;
	}
	if(!(isNumber(FormName.wdhjf, "未兑换积分"))) {
		return false;
	}
	if(	javaTrim(FormName.xxlrr)=="") {
		alert("请输入[信息录入人]！");
		FormName.xxlrr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
