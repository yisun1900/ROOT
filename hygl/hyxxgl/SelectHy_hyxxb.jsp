<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

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

<form method="post" action="Hy_hyxxbList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">会员编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_hybh" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">是否作废</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_sfzf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+作废&N+未作废","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <div align="right">水质分析卡号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_hykh" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right"> 
                <div align="right">所属专卖店</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','2','3') order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <div align="right">会员级别</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                <div align="right">服务类型</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_fwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+基本服务&2+增值服务","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">入会日期 从</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_rhrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_rhrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">有效日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_yxrq" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_yxrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">会员密码</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_hymm" size="20" maxlength="12" >
              </td>
              <td width="19%"> 
                <div align="right">会员姓名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_hyxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">性别</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "hy_hyxxb_xb","M+男&W+女","");
%> </td>
              <td width="19%"> 
                <div align="right">邮政编码</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_yzbm" size="20" maxlength="12" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">会员地址</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="hy_hyxxb_hydz" size="57" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">电话</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_dh" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">手机</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_sj" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">电子信箱</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_dzxx" size="20" maxlength="40" >
              </td>
              <td width="19%"> 
                <div align="right">身份证号码</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_sfzhm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">出生日期 从</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_csrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_csrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">职业</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_zydm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,zymc from hy_zydmb order by xh","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">月收入</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_ysrdm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,ysrdm from hy_ysrdmb order by xh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">结婚纪念日 从</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_jhjnr" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_jhjnr2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" height="28"> 
                <div align="right">婚姻状况</div>
              </td>
              <td width="31%" height="28"> <%
	cf.radioToken(out, "hy_hyxxb_hyzk","Y+已婚&N+未婚","");
%> </td>
              <td width="19%" height="28"> 
                <div align="right">爱人姓名</div>
              </td>
              <td width="31%" height="28"> 
                <input type="text" name="hy_hyxxb_arxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">爱人生日 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_arsr" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_arsr2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">价格印象</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_jgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jgyxbm,jgyxmc from hy_jgyxbm order by jgyxbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">服务印象</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_fwyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwyxbm,fwyxmc from hy_fwyxbm order by fwyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">风格印象</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_fgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgyxbm,fgyxmc from hy_fgyxbm order by fgyxbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">工艺印象</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_gyyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gyyxbm,gyyxmc from hy_gyyxbm order by gyyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">专店风格</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_zdfgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zdfgbm,zdfgmc from hy_zdfgbm order by zdfgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">平时爱好</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_psahbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select psahbm,psahmc  from hy_psahbm order by psahbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">喜爱报纸杂志</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_bzzz" size="20" value="">
              </td>
              <td width="19%"> 
                <div align="right">所知同类品牌</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_sztlpp" size="20" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">喜欢去的商店</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_shop" size="20" value="">
              </td>
              <td width="19%"> 
                <div align="right">喜欢化妆品品牌</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_hzppp" size="20" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">喜欢服装品牌</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_fzpp" size="20" value="">
              </td>
              <td width="19%"> 
                <div align="right">信息录入人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_xxlrr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">购买次数 从</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_gmcs" size="20" maxlength="8" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_gmcs2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">消费总金额 从</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_xfzje" size="20" maxlength="17" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_xfzje2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">积分 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_jf" size="20" maxlength="8" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_jf2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">未兑换积分 从</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_wdhjf" size="20" maxlength="8" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_wdhjf2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
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
	if(!(isDatetime(FormName.hy_hyxxb_csrq, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_csrq2, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_jhjnr, "结婚纪念日"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_jhjnr2, "结婚纪念日"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_arsr, "爱人生日"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_arsr2, "爱人生日"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_rhrq, "入会日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_rhrq2, "入会日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_yxrq, "有效日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_yxrq2, "有效日期"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_gmcs, "购买次数"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_gmcs2, "购买次数"))) {
		return false;
	}
	if(!(isFloat(FormName.hy_hyxxb_xfzje, "消费总金额"))) {
		return false;
	}
	if(!(isFloat(FormName.hy_hyxxb_xfzje2, "消费总金额"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_jf, "积分"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_jf2, "积分"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_wdhjf, "未兑换积分"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_wdhjf2, "未兑换积分"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
