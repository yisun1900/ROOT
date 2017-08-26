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
String dwstr=cf.getItemData("select dwbh,dwmc||'（'||dwdh||'）',ssdw from sq_dwxx where dwlx='4' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入工程信息（<font color="#FF0033">*</font>为必填字段）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_khxx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>客户姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>性别</div>
              </td>
              <td width="32%"> 
                <input type="radio" name="xb"  value="M">
                男 
                <input type="radio" name="xb"  value="W">
                女 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>房屋地址</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="" size="57" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>所属城区</td>
              <td width="33%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font>联系方式</td>
              <td width="32%"> 
                <input type="text" name="lxfs" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>户型</div>
              </td>
              <td width="33%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>风格分类</div>
              </td>
              <td width="32%"> 
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
                <div align="right"><font color="#FF0033">*</font>装修价位</div>
              </td>
              <td width="33%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>油色</div>
              </td>
              <td width="32%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>面积编码</div>
              </td>
              <td width="33%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>房屋面积</div>
              </td>
              <td width="32%"> 
                <input type="text" name="fwmj" value="" size="20" maxlength="20"  onChange="calValue(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>签约额</div>
              </td>
              <td width="33%"> 
                <input type="text" name="qye" value="" size="20" maxlength="8"  onChange="calValue(insertform)">
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">每平米均价</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="pmjj" value="" size="20" maxlength="8" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>是否有优惠</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="sfyyh"  value="Y">
                是 
                <input type="radio" name="sfyyh"  value="N">
                否 </td>
              <td width="18%"> 
                <div align="right">优惠原因</div>
              </td>
              <td width="32%"> 
                <input type="text" name="yhyy" value="" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>签约日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="qyrq" value="" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">应开工日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="kgrq" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">首款日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="skrq" value="" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">首款金额</div>
              </td>
              <td width="32%"> 
                <input type="text" name="skje" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">中期款日期</td>
              <td width="33%"> 
                <input type="text" name="zkrq" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">中款金额</td>
              <td width="32%"> 
                <input type="text" name="zkje" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">应竣工日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jgrq" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">附赠项目</div>
              </td>
              <td width="32%"> 
                <input type="text" name="fzxm" value="" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>设计师</td>
              <td width="33%"> 
                <input type="text" name="sjs" value="" size="20" maxlength="20" >
              </td>
              <td width="18%" align="right">合同号</td>
              <td width="32%"> 
                <input type="text" name="hth" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>关系客户</div>
              </td>
              <td width="33%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>回单标志</div>
              </td>
              <td width="32%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
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
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">参观地址</td>
              <td colspan="3"> 
                <input type="text" name="cgdz" value="" size="57" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0033">*</font>回单施工队</div>
              </td>
              <td width="35%"> 
                <select name="hdsgd" disabled  style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(hdsgd,hdsgbz,<%=dwstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','8') order by dwbh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">回单班组</div>
              </td>
              <td width="35%"> 
                <select name="hdsgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">签约店面</font></div>
              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">回单设计师</div>
              </td>
              <td width="32%">
                <input type="text" name="hdsjs" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">上报日期</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="sbrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">信息录入人</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
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
function calValue(FormName){  
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}      

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("请输入[所属区域]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请输入[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("请输入[风格分类]！");
		FormName.fgflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zxjwbm)=="") {
		alert("请输入[装修价位]！");
		FormName.zxjwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("请输入[油色]！");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxmjbm)=="") {
		alert("请输入[面积编码]！");
		FormName.hxmjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "面积"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isNumber(FormName.qye, "签约额"))) {
		return false;
	}

	calValue(FormName);

	if(	javaTrim(FormName.pmjj)=="") {
		alert("请输入[每平米均价]！");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "每平米均价"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyyh)) {
		alert("请选择[是否有优惠]！");
		FormName.sfyyh[0].focus();
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
	if(!(isDatetime(FormName.kgrq, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.skrq, "首款日期"))) {
		return false;
	}
	if(!(isNumber(FormName.skje, "首款金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.zkrq, "中期款日期"))) {
		return false;
	}
	if(!(isNumber(FormName.zkje, "中款金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.jgrq, "应竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sbrq, "上报日期"))) {
		return false;
	}
	if(	javaTrim(FormName.sjs)=="") {
		alert("请输入[设计师]！");
		FormName.sjs.focus();
		return false;
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

	if(	javaTrim(FormName.hdsgd)=="") {
		alert("请输入[回单施工队]！");
		FormName.hdsgd.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
