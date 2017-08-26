<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	String ssfgs=cf.GB2Uni(request.getParameter("fgsbh"));

	String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
	String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
	String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));

	
	String clzt=cf.executeQuery("select clzt from jc_zcdd where ddbh='"+ddbh+"'");
	if (!clzt.equals("07"))
	{
		out.println("<BR>错误，不能再进行修改！合同已完成");
		return;
	}
%>

<html>
<head>
<title>手写合同</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 手写合同（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_zcddmxSxht.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>主材大类</td>
              <td width="33%"> 
                <input type="text" name="zcdlbm" value="<%=zcdlbm%>" readonly>              </td>
              <td align="right"><font color="#FF0000">*</font>主材小类</td>
              <td><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <OPTION  value=""></OPTION>
                  <%
	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+zcdlbm+"' order by clxlmc",zcxlbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>子品牌</td>
              <td width="33%"> 
                <input type="text" name="dwbh" value="<%=ppbm%>" readonly>              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>计量单位</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>主材名称</td>
              <td colspan="3"> 
                <input type="text" name="zcmc" value="" size="73" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">类别/系列</td>
              <td colspan="3"> 
                <input type="text" name="zclbbm" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">型号</td>
              <td colspan="3"> 
                <input type="text" name="xinghao" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">规格</td>
              <td colspan="3"> 
                <input type="text" name="gg" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>是否有促销</td>
              <td width="33%"> 
                <input type="radio" name="sfycx" value="N" checked>
                没促销 
                <input type="radio" name="sfycx" value="Y">
                有促销</td>
              <td width="17%" align="right"><font color="#FF0000">*</font>折前实销单价</td>
              <td width="33%"> 
                <input type="text" name="zqdj" size="17" maxlength="16"  onChange="f_jsjg(editform)">
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>折扣率</td>
              <td><input type="text" name="dpzk" size="8" maxlength="9"  value="10" onChange="f_jsjg(editform)">
                <b><font color="#0000FF">（>0且<=10）</font></b></td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">折后实销单价</font></td>
              <td><input type="text" name="dj" size="17" maxlength="9"  value="" readonly>
元</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right" bgcolor="#FFFFCC">颜色</td>
              <td width="33%"> 
                <input type="text" name="zcysbm" size="20" maxlength="50"  value="" onKeyUp="keyGo(zcpzwzbm)" ></td>
              <td width="17%" align="right">铺装位置</td>
              <td width="33%"> 
                <select name="zcpzwzbm" style="FONT-SIZE:12PX;WIDTH:132PX" >
                  <option value=""></option>
                  <%
						cf.selectItem(out,"select pzwz c1,pzwz c2 from jdm_pzwz  order by pzwz","");
					%>
                </select></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>订货数量</td>
              <td width="33%"> 
                <input type="text" name="sl" size="20" maxlength="16"  value="" onChange="f_jsjg(editform)" onKeyUp="keyGo(ycf)">              </td>
              <td width="17%" align="right"><strong><font color="#FF0000">*</font></strong>是否推荐产品</td>
              <td width="33%"><%
	cf.radioToken(out, "sftjcp","Y+是&N+否","N");
%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">折前材料费</font></td>
              <td width="33%"><input type="text" name="zqje" size="17" maxlength="17"  value="" readonly>
元 </td>
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">折后材料费</font></td>
              <td width="33%"><input name="je" type="text" id="je"  value="" size="17" maxlength="17" readonly>
元 </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">远程费</td>
              <td><input type="text" name="ycf" size="17" maxlength="16"  value="0" onKeyUp="keyTo(qtfy[0])">
元 </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>其它费用</td>
              <td width="33%"> <%
	cf.radioToken(out, "qtfy","1+安装费&2+加工费&3+其它收费&W+无","W");
%> </td>
              <td width="17%" align="right">其它费金额</td>
              <td width="33%"> 
                <input type="text" name="qtfyje" size="17" maxlength="16"  value="" onKeyUp="keyTo(cxhdbz[0])">
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><strong><font color="#FF0000">*</font></strong>是否赠品</td>
              <td><%
	cf.radioToken(out, "sfzp","Y+是&N+否","N");
%></td>
              <td align="right"><font color="#FF0000">*</font>赠送单价</td>
              <td><input type="text" name="zsdj" size="17" maxlength="9"  value="0"  >
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>参加促销活动标志</td>
              <td width="33%"><%
	cf.radioToken(out, "cxhdbz","Y+参加&N+不参加","N");
%></td>
              <td width="17%" align="right"><font color="#FF0000">*</font>手写合同原因</td>
              <td width="33%"> 
                <select name="sxhtyy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sxhtyy c1,sxhtyy c2 from jdm_sxhtyybm order by sxhtyybm","调换套餐外产品");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">计入促销活动比率</td>
              <td width="33%"> 
                <input type="text" name="cxhdbl" size="14" maxlength="9"  value="" onChange="f_jsjg(editform)" onKeyUp="keyGo(bz)">
                % </td>
              <td width="17%" align="right"><font color="#0000CC">计入促销活动金额</font></td>
              <td width="33%"> 
                <input type="text" name="cxhdje" size="17" maxlength="16"  value="" readonly>
                元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="68" rows="3"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
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
function f_jsjg(FormName)//参数FormName:Form的名称
{
	var dj=FormName.dpzk.value/10.0*FormName.zqdj.value;
	dj=round(dj,2);
	FormName.dj.value=dj;

	var zqje=FormName.zqdj.value*FormName.sl.value;
	zqje=round(zqje,2);
	FormName.zqje.value=zqje;

	var je=FormName.dj.value*FormName.sl.value;
	je=round(je,2);
	FormName.je.value=je;

	var cxhdje=FormName.je.value*FormName.cxhdbl.value/100;
	cxhdje=round(cxhdje,2);
	FormName.cxhdje.value=cxhdje;
}
function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	!radioChecked(FormName.sftjcp)) {
		alert("请选择[是否推荐产品]！");
		FormName.sftjcp[0].focus();
		return false;
	}

	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("请选择[主材小类]！");
		FormName.zcxlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[子品牌]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcmc)=="") {
		alert("请输入[主材名称]！");
		FormName.zcmc.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfycx)) {
		alert("请选择[是否有促销]！");
		FormName.sfycx[0].focus();
		return false;
	}


	if(	javaTrim(FormName.zqdj)=="") {
		alert("请输入[折前实销单价]！");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "折前实销单价"))) {
		return false;
	}

	if(	javaTrim(FormName.dpzk)=="") {
		alert("请输入[折扣率]！");
		FormName.dpzk.focus();
		return false;
	}
	if(!(isFloat(FormName.dpzk, "折扣率"))) {
		return false;
	}
	if (FormName.dpzk.value<0 || FormName.dpzk.value>10)
	{
		alert("错误！[折扣率]应该在0和10之间！");
		FormName.dpzk.select();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[折后实销单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "折后实销单价"))) {
		return false;
	}
/*
	if (FormName.dj.value=="0")
	{
		alert("[折后实销单价]不能为0！");
		FormName.dj.select();
		return false;
	}
*/
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[订货数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "订货数量"))) {
		return false;
	}
	if (parseFloat(FormName.sl.value)<=0)
	{
		alert("[订货数量]不能<=0！");
		FormName.sl.select();
		return false;
	}

	if(	javaTrim(FormName.zqje)=="") {
		alert("请输入[折前材料费]！");
		FormName.zqje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqje, "折前材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[折后材料费]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "折后材料费"))) {
		return false;
	}

	if(	javaTrim(FormName.ycf)=="") {
		alert("请输入[远程费]！");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "远程费"))) {
		return false;
	}

	if(	!radioChecked(FormName.qtfy)) {
		alert("请选择[其它费用]！");
		FormName.qtfy[0].focus();
		return false;
	}
	if(FormName.qtfy[0].checked || FormName.qtfy[1].checked || FormName.qtfy[2].checked) 
	{
		if(	javaTrim(FormName.qtfyje)=="") {
			alert("请输入[其它费金额]！");
			FormName.qtfyje.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfyje, "其它费金额"))) {
			return false;
		}
		if (FormName.qtfyje.value=="0")
		{
			alert("[其它费金额]不能为0！");
			FormName.qtfyje.select();
			return false;
		}
	}
	else{
		FormName.qtfyje.value="0";
	}

	if(	!radioChecked(FormName.cxhdbz)) {
		alert("请选择[参加促销活动标志]！");
		FormName.cxhdbz[0].focus();
		return false;
	}
	if (FormName.cxhdbz[0].checked)
	{
		if(	javaTrim(FormName.cxhdbl)=="") {
			alert("请输入[计入促销活动比率]！");
			FormName.cxhdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.cxhdbl, "计入促销活动比率"))) {
			return false;
		}
		if (FormName.cxhdbl.value<=0 || FormName.cxhdbl.value>300)
		{
			alert("[计入促销活动比率]应在0％和300％之间！");
			FormName.cxhdbl.select();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.cxhdbl)!="" && FormName.cxhdbl.value!="0") {
			alert("错误！不参加促销活动，[计入促销活动比率]应为0！");
			FormName.cxhdbl.select();
			return false;
		}
		if(	javaTrim(FormName.cxhdje)!="" && FormName.cxhdje.value!="0") {
			alert("错误！不参加促销活动，[计入促销活动金额]应为0！");
			FormName.cxhdbl.select();
			return false;
		}
	}
	if(	!radioChecked(FormName.sfzp)) {
		alert("请选择[是否赠品]！");
		FormName.sfzp[0].focus();
		return false;
	}
	if (FormName.sfzp[0].checked)
	{
		if (parseFloat(FormName.dj.value)!=0)
		{
			alert("错误！赠品【折后实销单价】应为0");
			FormName.dj.select();
			return false;
		}
		if(	javaTrim(FormName.zsdj)=="") {
			alert("请输入[赠送单价]！");
			FormName.zsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zsdj, "赠送单价"))) {
			return false;
		}
		if (parseFloat(FormName.zsdj.value)==0)
		{
			alert("错误！赠品【赠送单价】不能为0");
			FormName.zsdj.select();
			return false;
		}
	}
	else{
		if (parseFloat(FormName.dj.value)==0)
		{
			alert("错误！非赠品【折后实销单价】不能为0");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zsdj)=="") {
			alert("请输入[赠送单价]！");
			FormName.zsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zsdj, "赠送单价"))) {
			return false;
		}
		if (parseFloat(FormName.zsdj.value)!=0)
		{
			alert("错误！非赠品【赠送单价】应为0");
			FormName.zsdj.select();
			return false;
		}
	}


	if(	javaTrim(FormName.sxhtyy)=="") {
		alert("请输入[手写合同原因]！");
		FormName.sxhtyy.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
