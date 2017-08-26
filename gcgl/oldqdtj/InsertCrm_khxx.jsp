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
	String dqbm=(String)session.getAttribute("dqbm");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入工程信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_khxx.jsp" name="insertform" target='_blank'>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0033">签约序号</font></td>
              <td width="33%"> 
                <input type="text" name="qyxh" value="1" size="20" maxlength="8" onKeyUp="keyTo(gcjdbm)" >
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">合同号</td>
              <td width="33%"> 
                <input type="text" name="hth" value="" size="20" maxlength="20" onKeyUp="keyGo(qyrq)">
              </td>
              <td width="18%" align="right">签约店面</td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(hdsjs)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dqbm='"+dqbm+"' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50"  onKeyUp="keyGo(lxfs)">
              </td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lxfs" value="" size="20" maxlength="50" onKeyUp="keyGo(kgrq)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">所属城区</td>
              <td width="33%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xqbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">小区</td>
              <td width="33%"> 
                <select name="xqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqbm,xqmc from dm_xqbm where dqbm='"+dqbm+"' order by xqmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">房屋地址</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="" size="74" maxlength="100"  onKeyUp="keyGo(qyxh)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">出生日期</td>
              <td width="33%"> 
                <input type="text" name="csrq" value="" size="20" maxlength="10" onKeyUp="keyTo(zybm)" >
              </td>
              <td width="18%" align="right">职业</td>
              <td width="33%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">设计师</td>
              <td width="33%"> 
                <input type="text" name="sjs" value="" size="20" maxlength="20" onKeyUp="keyTo(sgd)" >
              </td>
              <td width="18%" align="right">施工队</td>
              <td width="33%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX"  onKeyUp="keyGo(zjxm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd order by sgdmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">工程担当</td>
              <td width="33%"> 
                <input type="text" name="zjxm" size="20" maxlength="20" onKeyUp="keyGo(qye)">
              </td>
              <td width="18%" align="right">现场班长</td>
              <td width="33%"> 
                <input type="text" name="sgbz" size="20" maxlength="20" onKeyUp="keyGo(qye)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">房屋面积</td>
              <td width="33%"> 
                <input type="text" name="fwmj" value="" size="20" maxlength="20"  onChange="calValue(insertform)" onKeyUp="keyTo(hxmjbm)">
              </td>
              <td width="18%" align="right">面积编码</td>
              <td width="33%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(zxjwbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">是否有优惠</td>
              <td width="33%"> 
                <input type="radio" name="sfyyh"  value="Y" onKeyUp="keyGo(zkl)">
                是 
                <input type="radio" name="sfyyh"  value="N" onKeyUp="keyGo(zkl)">
                否 </td>
              <td width="18%" align="right">折扣率（&gt;0且&lt;=10）</td>
              <td width="33%"> 
                <input type="text" name="zkl" value="" size="20" maxlength="20" onKeyUp="keyGo(yhyy)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">签约日期</td>
              <td width="33%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" onKeyUp="keyGo(kgrq)" >
              </td>
              <td width="18%" align="right">签约额</td>
              <td width="33%"> 
                <input type="text" name="qye" value="" size="20" maxlength="8" onKeyUp="keyGo(fwdz)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right">是否返券</td>
              <td width="33%">
                <input type="radio" name="sffj"  value="Y">
                是 
                <input type="radio" name="sffj"  value="N">
                否 </td>
              <td width="18%" align="right">是否已认证</td>
              <td width="33%">
                <input type="radio" name="sfyrz"  value="Y">
                是 
                <input type="radio" name="sfyrz"  value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">应开工日期</td>
              <td width="33%"> 
                <input type="text" name="kgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(jgrq)" >
              </td>
              <td width="18%" align="right">实际开工日期</td>
              <td width="33%"> 
                <input type="text" name="sjkgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(sjjgrq)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">应竣工日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jgrq" size="20" maxlength="10" onKeyUp="keyGo(sjkgrq)" >
              </td>
              <td width="18%"> 
                <div align="right">实际竣工日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sjjgrq" size="20" maxlength="10" onKeyUp="keyGo(sjs)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">交合同日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jhtrq" size="20" maxlength="10" onKeyUp="keyGo(sjkgrq)" >
              </td>
              <td width="18%"> 
                <div align="right">保修截止时间</div>
              </td>
              <td width="33%"> 
                <input type="text" name="bxjzsj" size="20" maxlength="10" onKeyUp="keyGo(sjkgrq)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">工程进度</td>
              <td width="33%"> 
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(wgbz)">
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","4");
%> 
                </select>
              </td>
              <td width="18%" align="right">完工标志</td>
              <td width="33%"> 
                <select name="wgbz" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(khlxbm)">
                  <%
	cf.selectToken(out,"Y+已完工&N+未完工","Y");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">首款日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="skrq" value="" size="20" maxlength="10" onKeyUp="keyGo(skje)" >
              </td>
              <td width="18%"> 
                <div align="right">首款金额</div>
              </td>
              <td width="33%"> 
                <input type="text" name="skje" value="" size="20" maxlength="8" onKeyUp="keyGo(zkrq)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">中期款日期</td>
              <td width="33%"> 
                <input type="text" name="zkrq" size="20" maxlength="10" onKeyUp="keyGo(zkje)" >
              </td>
              <td width="18%" align="right">中款金额</td>
              <td width="33%"> 
                <input type="text" name="zkje" value="" size="20" maxlength="8" onKeyUp="keyTo(hdbz)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">户型</td>
              <td width="33%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fgflbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">装修价位</td>
              <td width="33%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(qye)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">油色</td>
              <td width="33%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(czbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">材质</td>
              <td width="33%"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fwmj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">关系客户</div>
              </td>
              <td width="33%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(bz)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">回单标志</div>
              </td>
              <td width="33%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(ybjbh)">
                  <option value="1">非回单</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">录入时间</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">信息录入人</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3" onKeyUp="keyTo(savebutton)"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
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
	if(	javaTrim(FormName.qyxh)=="") {
		alert("请输入[签约序号]！");
		FormName.qyxh.focus();
		return false;
	}
	if(!(isNumber(FormName.qyxh, "签约序号"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[签约店面]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.sjs)=="") {
		alert("请输入[设计师]！");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxm)=="") {
		alert("请输入[工程担当]！");
		FormName.zjxm.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "房屋面积"))) {
		return false;
	}
	if(!(isFloat(FormName.qye, "工程签约额"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyyh)) {
		alert("请选择[是否有优惠]！");
		FormName.sfyyh[0].focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "折扣率"))) {
		return false;
	}
	if (parseFloat(FormName.zkl.value)>10 || parseFloat(FormName.zkl.value)<=0) 
	{
		alert("[折扣率]输入错误，应该介于0和10之间！");
		FormName.zkl.select();
		return false;
	}
	if(	javaTrim(FormName.qyrq)=="") {
		alert("请输入[签约日期]！");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(	!radioChecked(FormName.sffj)) {
		alert("请选择[是否返券]！");
		FormName.sffj[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyrz)) {
		alert("请选择[是否已认证]！");
		FormName.sfyrz[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjkgrq, "实际开工日期"))) {
		return false;
	}

	if(!(isDatetime(FormName.jgrq, "应竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjjgrq, "实际竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhtrq, "交合同日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxjzsj, "保修截止时间"))) {
		return false;
	}


	if(	javaTrim(FormName.gcjdbm)=="") {
		alert("请选择[工程进度]！");
		FormName.gcjdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wgbz)=="") {
		alert("请选择[完工标志]！");
		FormName.wgbz.focus();
		return false;
	}
	if (FormName.wgbz.value=="Y")
	{
		if (FormName.gcjdbm.value!="4")
		{
			alert("[工程进度]与[完工标志]不一致！");
			FormName.gcjdbm.focus();
			return false;
		}
	}
	else{
		if (FormName.gcjdbm.value=="4")
		{
			alert("[工程进度]与[完工标志]不一致！");
			FormName.gcjdbm.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[关系客户]！");
		FormName.khlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hdbz)=="") {
		alert("请选择[回单标志]！");
		FormName.hdbz.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[信息录入人]！");
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



	FormName.submit();
	FormName.khxm.select();
	return true;
}
//-->
</SCRIPT>
