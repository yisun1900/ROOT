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
String dwbh=(String)session.getAttribute("dwbh");
String dwstr=cf.getItemData("select dwbh,dwmc||'（'||dwdh||'）',ssdw from sq_dwxx where dwlx='4' order by ssdw,dwbh");
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

<form method="post" action="Crm_khxxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >
              </td>
              <td width="16%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="34%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">性别</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "xb","M+男&W+女","");
%> </td>
              <td width="16%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="34%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >
              </td>
              <td width="16%"> 
                <div align="right">风格分类</div>
              </td>
              <td width="34%"> 
                <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">装修价位</div>
              </td>
              <td width="33%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">面积</div>
              </td>
              <td width="34%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">油色</div>
              </td>
              <td width="33%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">合同号</div>
              </td>
              <td width="34%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">设计师</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sjs" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">是否有优惠</div>
              </td>
              <td width="34%"><%
	cf.radioToken(out, "sfyyh","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">签约额 从</td>
              <td width="33%"> 
                <input type="text" name="qye" size="20" maxlength="8" >
              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="qye2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">签约日期 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">应开工日期 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="kgrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="kgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">首款日期 从</td>
              <td width="33%"> 
                <input type="text" name="skrq" size="20" maxlength="10" >
              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="skrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">首款金额</div>
              </td>
              <td width="33%"> 
                <input type="text" name="skje" size="20" maxlength="8" >
              </td>
              <td width="16%"> 
                <div align="right">中款金额</div>
              </td>
              <td width="34%"> 
                <input type="text" name="zkje" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">附赠项目</div>
              </td>
              <td width="34%"> 
                <input type="text" name="fzxm" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">上报日期 从</td>
              <td width="33%"> 
                <input type="text" name="sbrq" size="20" maxlength="10" >
              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="sbrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">所属区域</div>
              </td>
              <td width="33%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">派单状态</div>
              </td>
              <td width="34%"> 
                <select name="pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">申请派单</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">回单标志</div>
              </td>
              <td width="33%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="3">施工队回单</option>
                  <option value="2">设计师回单</option>
                  <option value="4">老客户回单</option>
                  <option value="5">员工回单</option>
                  <option value="6">班长回单</option>
                  <option value="7">售楼处</option>
                  <option value="8">材料商</option>
                  <option value="9">其他</option>
                </select>
              </td>
              <td width="16%"> 
                <div align="right">客户类型</div>
              </td>
              <td width="34%"> 
                <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="2">签约客户</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right">回单施工队</td>
              <td width="33%">
                <select name="hdsgd" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(hdsgd,hdsgbz,<%=dwstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','8') order by dwbh","");
%> 
                </select>
              </td>
              <td width="16%" align="right">回单班组</td>
              <td width="34%">
                <select name="hdsgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">回单设计师</td>
              <td width="33%">
                <input type="text" name="hdsjs" value="" size="20" maxlength="20" >
              </td>
              <td width="16%" align="right">参观地址</td>
              <td width="34%">
                <input type="text" name="cgdz" value="" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">关系客户</div>
              </td>
              <td width="33%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">信息录入人</div>
              </td>
              <td width="34%"> 
                <input type="text" name="lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到&nbsp;</div>
              </td>
              <td width="34%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
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
	if(!(isNumber(FormName.qye, "签约额"))) {
		return false;
	}
	if(!(isNumber(FormName.qye2, "签约额"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq2, "应开工日期"))) {
		return false;
	}
	if(!(isNumber(FormName.skje, "首款金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.skrq, "首款日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.skrq2, "首款日期"))) {
		return false;
	}
	if(!(isNumber(FormName.zkje, "中款金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.sbrq, "上报日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sbrq2, "上报日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
