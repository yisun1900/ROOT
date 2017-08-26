<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<noscript><iframe scr="*.htm"></iframe></noscript>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入电子报价标准项目</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>报价版本号</td>
              <td colspan="3">
                <select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:515PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||dqmc||'）（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') order by bj_dzbjbb.dqbm,bjbbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||dqmc||'）（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') and bj_dzbjbb.dqbm='"+dqbm+"' order by bj_dzbjbb.dqbm,bjbbh","");
	}
%> 
                </select>				</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>地区</td>
              <td width="34%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                </select>              </td>
              <td width="15%" align="right"><font color="#FF0000">*</font>报价级别</td>
              <td width="35%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#FF0000">*</font>项目大类              </td>
              <td width="34%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>              </td>
              <td width="15%" align="right"> 
                <font color="#FF0000">*</font>项目小类              </td>
              <td width="35%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">项目分类</td>
              <td><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm","");
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#FF0000">*</font>项目编号              </td>
              <td width="34%"> 
                <input type="text" name="xmbh" value="" size="20" maxlength="16" >              </td>
              <td width="15%" align="right">排序序号</td>
              <td width="35%"><input type="text" name="xh" value="" size="20" maxlength="17" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>项目名称</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                饰面              </td>
              <td width="34%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select>              </td>
              <td width="15%" align="right"><font color="#FF0000">*</font>计量单位</td>
              <td width="35%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" ><font color="#FF0000">*</font>是否必选项</td>
              <td colspan="3"><%
	cf.radioToken(out, "sfbxx","1+必报项&2+必列项&3+可选项&9+作废项","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">关联项目编号</td>
              <td colspan="3"><input type="text" name="glxmbh" size="56" maxlength="100"  value="" >
                <font color="#FF0000"><strong>（项目编号用逗号分割）</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否需要材料</td>
              <td><%
	cf.radioToken(out, "sfxycl","Y+需要&N+否","Y");
%></td>
              <td align="right"><font color="#FF0000">*</font>是否需要预交底</td>
              <td><%
	cf.radioToken(out, "sfxyyjd","Y+需要&N+否","N");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>成本价</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>材料成本</td>
              <td bgcolor="#E8E8FF"><input type="text" name="clcb" value="0" size="20" maxlength="17" onChange="f_jscb(insertform)"></td>
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>人工成本</td>
              <td bgcolor="#E8E8FF"><input type="text" name="rgcb" value="0" size="20" maxlength="17" onChange="f_jscb(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>机械成本</td>
              <td bgcolor="#E8E8FF"><input type="text" name="jxcb" value="0" size="20" maxlength="17" onChange="f_jscb(insertform)"></td>
              <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
              <td bgcolor="#E8E8FF">
			    <p>&nbsp;</p>		      </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">成本价</font></td>
              <td colspan="3" bgcolor="#E8E8FF"><input type="text" name="cbenj" value="不需录入自动生成" size="20" maxlength="17" readonly>
                  <font color="#0000CC"><strong>注意：成本价<font color="#FF0000">(<font color="#0000CC"><strong>自动生成</strong></font>)</font>＝材料成本＋人工成本＋机械成本</strong></font> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF"><strong>对外报价</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>辅材费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="clbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>主材费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="zcf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>人工费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="rgbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>运输费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="ysf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>机械费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="jxbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>损耗费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="shf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>其它费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="qtf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right">&nbsp;</td>
              <td bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font><font color="#0000CC">工程预算价</font></td>
              <td colspan="3" bgcolor="#CCCCFF"><input type="text" name="bj" value="不需录入自动生成" size="20" maxlength="17" readonly>
              <font color="#0000CC"><strong>工程预算价＝辅材费+主材费＋人工费＋运输费＋机械费＋损耗费＋其它费</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>工程基础报价</td>
              <td colspan="3" bgcolor="#E8E8FF"><input type="text" name="sgdbj" value="0" size="20" maxlength="17" >
              工程基础报价=工程预算价/参数</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>施工成本价</td>
              <td colspan="3" bgcolor="#E8E8FF"><input name="sgcbj" type="text" value="0" size="20" maxlength="17">
                施工成本价=工程预算价×参数</td>
            </tr>
            
              <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>是否允许打折</td>
              <td bgcolor="#CCCCFF">
				  <input type="radio" name="sfyxdz" value="Y">允许打折
				  <input type="radio" name="sfyxdz" value="N">否			  </td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>最低折扣</td>
              <td bgcolor="#CCCCFF"><input name="zdzk" type="text" value="10" size="10" maxlength="10" >
                (0到10之间)</td>
            </tr>
          
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="71" rows="8"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">辅料名称规格</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="4"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">备注</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
              <td width="34%"> 
                <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>              </td>
              <td width="15%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
              <td width="35%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                  <p>
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="button" onClick="f_wh(insertform)"  value="维护工料分析" name="wh"  >
                  <input name="button" type="button" onClick="copyBj(insertform)"  value="复制报价">
                  <input type="reset"  value="重输" name="reset">
                  </p>
              </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jscb(FormName)//参数FormName:Form的名称
{
	var cbenj=FormName.clcb.value*1+FormName.rgcb.value*1+FormName.jxcb.value*1;
	cbenj=round(cbenj,2);
	FormName.cbenj.value=cbenj;
}

function f_jsjg(FormName)//参数FormName:Form的名称
{
	var bj=FormName.clbj.value*1+FormName.rgbj.value*1+FormName.jxbj.value*1+FormName.zcf.value*1+FormName.shf.value*1+FormName.ysf.value*1+FormName.qtf.value*1;
	bj=round(bj,2);
	FormName.bj.value=bj;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jscb(FormName);
	f_jsjg(FormName);

	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请选择[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请输入[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	
	if(	javaTrim(FormName.clcb)=="") {
		alert("请输入[材料成本]！");
		FormName.clcb.focus();
		return false;
	}
	if(!(isFloat(FormName.clcb, "材料成本"))) {
		return false;
	}
	if(	javaTrim(FormName.rgcb)=="") {
		alert("请输入[人工成本]！");
		FormName.rgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.rgcb, "人工成本"))) {
		return false;
	}
	if(	javaTrim(FormName.jxcb)=="") {
		alert("请输入[机械成本]！");
		FormName.jxcb.focus();
		return false;
	}
	if(!(isFloat(FormName.jxcb, "机械成本"))) {
		return false;
	}
	if(	javaTrim(FormName.cbenj)=="") {
		alert("请输入[成本价]！");
		FormName.cbenj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbenj, "成本价"))) {
		return false;
	}

	if(	javaTrim(FormName.clbj)=="") {
		alert("请输入[辅材费]！");
		FormName.clbj.focus();
		return false;
	}
	if(!(isFloat(FormName.clbj, "辅材费"))) {
		return false;
	}
	if(	javaTrim(FormName.rgbj)=="") {
		alert("请输入[人工费]！");
		FormName.rgbj.focus();
		return false;
	}
	if(!(isFloat(FormName.rgbj, "人工费"))) {
		return false;
	}
	if(	javaTrim(FormName.jxbj)=="") {
		alert("请输入[机械费]！");
		FormName.jxbj.focus();
		return false;
	}
	if(!(isFloat(FormName.jxbj, "机械费"))) {
		return false;
	}
	if(	javaTrim(FormName.zcf)=="") {
		alert("请输入[主材费]！");
		FormName.zcf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcf, "主材费"))) {
		return false;
	}
	if(	javaTrim(FormName.shf)=="") {
		alert("请输入[损耗费]！");
		FormName.shf.focus();
		return false;
	}
	if(!(isFloat(FormName.shf, "损耗费"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("请输入[运输费]！");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "运输费"))) {
		return false;
	}
	if(	javaTrim(FormName.qtf)=="") {
		alert("请输入[其它费]！");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "其它费"))) {
		return false;
	}
	if(	javaTrim(FormName.bj)=="") {
		alert("请输入[工程预算价]！");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "工程预算价"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdbj)=="") {
		alert("请输入[工程基础报价]！");
		FormName.sgdbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdbj, "工程基础报价"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbj)=="") {
		alert("请输入[施工成本价]！");
		FormName.sgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "施工成本价"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyxdz)) {
		alert("请选择[是否可打折]！");
		FormName.sfyxdz[0].focus();
		return false;
	}
	if (FormName.sfyxdz[0].checked)
	{
		if(	javaTrim(FormName.zdzk)=="") {
			alert("请输入[最低折扣]！");
			FormName.zdzk.select();
			return false;
		}
		if(!(isFloat(FormName.zdzk, "最低折扣"))) {
			return false;
		}
		if (FormName.zdzk.value<0 || FormName.zdzk.value>10)
		{
			alert("错误！[最低折扣]应该在0和10之间！");
			FormName.zdzk.select();
			return false;
		}
	}
	else{
		FormName.zdzk.value=10;
	}

	if(!(isFloat(FormName.xh, "序号"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfbxx)) {
		alert("请选择[是否必选项]！");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxycl)) {
		alert("请选择[是否需要材料]！");
		FormName.sfxycl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxyyjd)) {
		alert("请选择[是否需要预交底]！");
		FormName.sfxyyjd[0].focus();
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请选择[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请选择[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	FormName.action="SaveInsertBj_jzbjb.jsp";
	FormName.submit();
	FormName.wh.disabled=false;
	return true;
}




function f_wh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请选择[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请输入[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}

	FormName.action="EditBj_jzglfxb.jsp";
	FormName.submit();
	return true;
}
function copyBj(FormName)//参数FormName:Form的名称
{
	FormName.action="chooseCopyBj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
