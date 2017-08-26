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
String yddbh=request.getParameter("yddbh");
String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 木门初测单（<font color="#FF6699">注意：影响到价格部分，[门/窗/立口/护角高]包含[地材厚]</font>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_mmccd.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">预订单编号</div>
              </td>
              <td width="29%"> 
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="18%"> 
                <div align="right">订购类型</div>
              </td>
              <td width="32%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDglx(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">门类型</div>
              </td>
              <td width="29%" bgcolor="#FFFFFF"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform);tx(mlx)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mlx,mlxmc||':'||tx from jdm_mlx order by mlx","");
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right">油色</div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" bgcolor="#FFCCFF" align="right">木门型号</td>
              <td colspan="3" bgcolor="#FFCCFF"> 
                <select name="mmxh" style="FONT-SIZE:12PX;WIDTH:452PX" onChange="getMmxh(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmxh,trim(mmxh)||'('||mxmc||','||myt||')' from jc_mmxhb,jdm_mxbm,jdm_mytbm where jc_mmxhb.mxbm=jdm_mxbm.mxbm and jc_mmxhb.mytbm=jdm_mytbm.mytbm and jc_mmxhb.dqbm='"+dqbm+"' and jc_mmxhb.mmxh in(select distinct mmxh from jc_mmbjb where dqbm='"+dqbm+"') order by mmxh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" bgcolor="#FFCCFF"> 
                <div align="right">材质</div>
              </td>
              <td colspan="3" bgcolor="#FFCCFF"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:452PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">安装位置</div>
              </td>
              <td width="29%"> 
                <select name="azwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select azwzbm,azwzmc from jdm_azwzbm order by azwzbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">开启方向</div>
              </td>
              <td width="32%"> 
                <select name="kqfxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">（门,哑口,窗套）门套线</td>
              <td width="29%"> 
                <select name="mtxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mtxbm,mtxmc from jdm_mtxbm order by mtxbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">（门,哑口,窗套）门芯线</td>
              <td width="32%"> 
                <select name="mxxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mxxbm,mxxmc from jdm_mxxbm order by mxxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">地材种类</td>
              <td width="29%"> 
                <select name="dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(dczlbm,dbh);getDj(insertform);">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dczlbm,dczlmc||'，厚度:'||dzhd from jdm_dczlbm order by dczlbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">玻璃型号</td>
              <td width="32%"> 
                <select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select blxhbm,blxh from jc_blbj order by blxhbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFCCFF">门/窗/平台上口/立口墙厚</td>
              <td width="29%" bgcolor="#FFCCFF"> 
                <input type="text" name="qh" value="" size="14" maxlength="8"  onChange="getDj(insertform)">
                （mm） </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">地材厚</td>
              <td width="32%"> 
                <input type="text" name="dbh" value="" size="14" maxlength="8"  onChange="getDj(insertform)" >
                （mm） </td>
            </tr>
            <tr bgcolor="#FFCCFF"> 
              <td width="21%" align="right"> 门/窗/平台上口/护角宽</td>
              <td width="29%"> 
                <input type="text" name="mdk" value="" size="14" maxlength="8"  onChange="getDj(insertform)">
                （mm） </td>
              <td width="18%" align="right"> 门/窗/立口/护角高</td>
              <td width="32%"> 
                <input type="text" name="mdg" value="" size="14" maxlength="8"  onChange="getDj(insertform)">
                （mm） （<b><font color="#0000FF">包含地材厚</font></b>）</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">门扇宽</td>
              <td width="29%"> 
                <input type="text" name="msk" value="" size="14" maxlength="8">
                （mm） </td>
              <td width="18%" align="right">门扇高</td>
              <td width="32%"> 
                <input type="text" name="msg" value="" size="14" maxlength="8">
                （mm）（<b><font color="#0000FF">包含地材厚</font></b>）</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">单双口</td>
              <td width="29%"> 
                <input type="radio" name="dsk" value="1">
                单口 
                <input type="radio" name="dsk" value="2">
                双口 </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#FFFFFF" align="right">是否有顶窗</td>
              <td width="29%" bgcolor="#FFFFFF"> 
                <input type="radio" name="sfydc" value="Y">
                有顶窗 
                <input type="radio" name="sfydc" value="N">
                无顶窗</td>
              <td width="18%" bgcolor="#FFFFFF" align="right">门套/哑口材质</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <select name="sfsmjcc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+松木集成材&N+非松木集成材","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">门套/窗套边数</div>
              </td>
              <td width="29%"> 
                <select name="ctbs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <option value="3">三边</option>
                  <option value="4">四边</option>
                </select>
              </td>
              <td width="18%"> 
                <div align="right">踢脚线/欧式上帽</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tjx" value="" size="12" maxlength="8"  onChange="getDj(insertform)">
                延米 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">订购数量</div>
              </td>
              <td width="29%"> 
                <input type="text" name="sl" value="" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">标准单价（元）</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="dj" value="" size="20" maxlength="9" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="jjfs" value="" >
                <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
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
function tx(mlx)//参数FormName:Form的名称
{
	var tx=getSubStr(mlx);
	if (tx!="")
	{
		alert("注意！"+tx);
	}
}

function addItem(f1,text,value)
{
	var op1=document.createElement("OPTION");
	op1.text=text;
	op1.value=value;
	f1.add(op1);
}

function getDglx(FormName)
{
	FormName.mmxh.value="";
	FormName.ysbm.value="";
	FormName.jjfs.value="";

	if (FormName.mmdglxbm.value=='')
	{
		return;
	}


	var str="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp?getlx=1&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getMmxh(FormName)
{
	if (FormName.mmdglxbm.value=='')
	{
		return;
	}
	if (FormName.mmxh.value=='')
	{
		return;
	}

	FormName.ysbm.value="";

	var str="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp?getlx=2&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value+"&mmxh="+FormName.mmxh.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getDj(FormName)
{
	FormName.dj.value="";

	if (FormName.mmdglxbm.value=='')
	{
		return;
	}
	if (FormName.jjfs.value=='')
	{
		return;
	}

	var getjjfs=FormName.jjfs.value;

	if (getjjfs=='11')//11：木门
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
		if (FormName.dbh.value=='')
		{
			return;
		}
	}
	//12：双口哑口；13：双口窗套；14：单口哑口；15：单口窗套
	else if (getjjfs=="12" || getjjfs=="13" || getjjfs=="14" || getjjfs=="15" )
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//21：门连窗;22：门顶窗
	else if (getjjfs=="21" || getjjfs=="22")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//31：外飘窗立口
	else if (getjjfs=="31" )
	{
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//32：外飘窗平台上口
	else if (getjjfs=="32" )
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//41：平方米计价
	else if (getjjfs=="41")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
	}
	//42：延米计价
	else if (getjjfs=="42")
	{
		if (FormName.tjx.value=='')
		{
			return;
		}
	}
	//43：分段平方米计价
	else if (getjjfs=="43")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//44：分段延米计价
	else if (getjjfs=="44")
	{
		if (FormName.qh.value=='')
		{
			return;
		}
		if (FormName.tjx.value=='')
		{
			return;
		}
	}
	//45：分段按长度计价
	else if (getjjfs=="45")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
	}

	var str="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp?getlx=3&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value+"&mlx="+FormName.mlx.value+"&dbh="+FormName.dbh.value;
	str+="&mmxh="+FormName.mmxh.value+"&ysbm="+FormName.ysbm.value+"&ctbs="+FormName.ctbs.value;
	str+="&mdk="+FormName.mdk.value+"&mdg="+FormName.mdg.value+"&qh="+FormName.qh.value+"&tjx="+FormName.tjx.value;
	str+="&sfsmjcc="+FormName.sfsmjcc.value+"&mtxbm="+FormName.mtxbm.value+"&mxxbm="+FormName.mxxbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("请选择[木门订购类型]！");
		FormName.mmdglxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jjfs)=="") {
		alert("[计价方式]为空，请联系系统管理员！");
		FormName.jjfs.focus();
		return false;
	}

	var getjjfs=FormName.jjfs.value;

	if (getjjfs=='11')//11：木门
	{
		if(	javaTrim(FormName.mlx)=="") {
			alert("请选择[门类型]！");
			FormName.mlx.focus();
			return false;
		}
		if(	javaTrim(FormName.azwzbm)=="") {
			alert("请选择[安装位置]！");
			FormName.azwzbm.focus();
			return false;
		}
		if(	javaTrim(FormName.kqfxbm)=="") {
			alert("请选择[开启方向]！");
			FormName.kqfxbm.focus();
			return false;
		}

		if(	javaTrim(FormName.dczlbm)=="") {
			alert("请输入[地材种类]！");
			FormName.dczlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.dbh)=="") {
			alert("请输入[地材厚]！");
			FormName.dbh.focus();
			return false;
		}
		if(!(isNumber(FormName.dbh, "地材厚"))) {
			return false;
		}

		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "墙厚"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[门/窗洞宽]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "门/窗洞宽"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[门/窗洞高]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "门/窗洞高"))) {
			return false;
		}
		if(!(isNumber(FormName.msk, "门扇宽"))) {
		return false;
		}
		if(!(isNumber(FormName.msg, "门扇高"))) {
			return false;
		}
	}
	//12：双口哑口；13：双口窗套；14：单口哑口；15：单口窗套;21：门连窗;22：门顶窗
	else if (getjjfs=="12" || getjjfs=="13" || getjjfs=="14" || getjjfs=="15" || getjjfs=="21" || getjjfs=="22")
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "墙厚"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[门洞宽]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "门洞宽"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[门洞高]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "门洞高"))) {
			return false;
		}
		if(	javaTrim(FormName.ctbs)=="") {
			alert("请输入[门套/窗套边数]！");
			FormName.ctbs.focus();
			return false;
		}
	}
	//31：外飘窗立口
	else if (getjjfs=="31" )
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[立口墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "立口墙厚"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[立口高]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "立口高"))) {
			return false;
		}
	}
	//32：外飘窗平台上口
	else if (getjjfs=="32" )
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[平台上口墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "平台上口墙厚"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[平台上口宽]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "平台上口宽"))) {
			return false;
		}
	}
	//41：平方米计价
	else if (getjjfs=="41")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[门洞宽]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "门洞宽"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[门洞高]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "门洞高"))) {
			return false;
		}
	}
	//42：延米计价
	else if (getjjfs=="42")
	{
		if(	javaTrim(FormName.tjx)=="") {
			alert("请输入[踢脚线/欧式上帽]！");
			FormName.tjx.focus();
			return false;
		}
		if(!(isFloat(FormName.tjx, "踢脚线/欧式上帽"))) {
			return false;
		}
	}
	//43：分段平方米计价
	else if (getjjfs=="43")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[门洞宽]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "门洞宽"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[门洞高]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "门洞高"))) {
			return false;
		}
		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "墙厚"))) {
			return false;
		}
	}
	//44：分段延米计价
	else if (getjjfs=="44")
	{
		if(	javaTrim(FormName.tjx)=="") {
			alert("请输入[踢脚线/欧式上帽]！");
			FormName.tjx.focus();
			return false;
		}
		if(!(isFloat(FormName.tjx, "踢脚线/欧式上帽"))) {
			return false;
		}
		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "墙厚"))) {
			return false;
		}
	}
	//45：分段按长度计价
	else if (getjjfs=="45")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[宽度]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "宽度"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[高度]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "高度"))) {
			return false;
		}
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[订购数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "订购数量"))) {
		return false;
	}

	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
