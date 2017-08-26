<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
String dqbm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">主材库存查询－特权</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center" bgcolor="#D6D3CE"> 
  <td colspan="4"> 
   <input type="button"  value="库存统计" onClick="f_do(selectform,5)">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <input type="button"  value="库存明细查询" onClick="f_do(selectform,1)">&nbsp;&nbsp;&nbsp;
	 <input type="button"  value="材料保质期提醒" onClick="f_do(selectform,3)">&nbsp;&nbsp;&nbsp;
    <input type="reset"  value="重输">  </td>
</tr>
<tr align="center" bgcolor="#D6D3CE"> 
  <td colspan="4"> 
   <input type="button"  value="供应商统计" onClick="f_do(selectform,6)">&nbsp;&nbsp;&nbsp;
<!--     <input type="button"  value="品牌统计" onClick="f_do(selectform,11)">&nbsp;&nbsp;&nbsp;
 -->    <input type="button"  value="子品牌统计" onClick="f_do(selectform,7)">&nbsp;&nbsp;&nbsp;
    <input type="button"  value="大类小类统计" onClick="f_do(selectform,8)">&nbsp;&nbsp;&nbsp;
	 <input type="button"  value="在途货物查询" onClick="f_do(selectform,9)">&nbsp;&nbsp;&nbsp;
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="left" bgcolor="#D6D3CE">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;显示图片
  <input name="sfxstp" type="checkbox" value="Y"> &nbsp;&nbsp;||&nbsp;&nbsp;
    排序方式
    <select name="pxfs" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value=""></option>
      <option value=" order by jxc_kcb.clbm" >材料编码</option>
	  <option value=" order by jxc_kcb.clmc" >材料名称</option>
	  <option value=" order by jxc_kcb.xh" >型号</option>
	  <option value=" order by jxc_kcb.gg" >规格</option>
	  <option value=" order by jxc_kcb.cllbbm" >类别系列</option>
	  <option value=" order by jxc_kcb.cldlbm" >材料大类</option>
	  <option value=" order by jxc_kcb.clxlbm" >材料小类</option>
	  <option value=" order by jxc_kcb.scsmc" >品牌</option>
	  <option value=" order by jxc_kcb.ppmc" >子品牌</option>
	  <option value=" order by jxc_kcb.kcsl" >库存数量</option>
    </select>&nbsp;&nbsp;||&nbsp;&nbsp;
	每页显示数量<input type="text" name="myxssl" value="30" size="10" maxlength="8" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">材料编码</td>
  <td bgcolor="#FFFFCC"><input type="text" name="jxc_kcb_clbm" size="20" maxlength="13"  onkeyup="singleAdd(selectform)"></td>
  <td rowspan="5" align="right" bgcolor="#FFFFCC">
<div align="right"  valign="middle"> 
                  <p> 
                    <input type="button"  value="增加" onClick="add(selectform)">
                  </p>
                  <p> 
                    <input type="button"  value="删除" onClick="remove(selectform)">
                  </p>
                </div></td>
  <td rowspan="5" bgcolor="#FFFFCC">
<select name="clbmlist" size="7" multiple style="FONT-SIZE:12px;WIDTH:152px">
                </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99FFCC">所在地区</td>
  <td bgcolor="#99FFCC"><select name="jxc_kcb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(selectform)">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where (1=1)  order by dqmc","");
	}
	else
	{
	out.print("<option value=\"\"></option>");
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm in (select dm_dqbm.dqbm dqbm from dm_dqbm,sq_dwxx,sq_yhxx,sq_sqfgs where sq_yhxx.yhdlm='"+yhdlm+"' and sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_dwxx.dqbm=dm_dqbm.dqbm union all select dqbm from dm_dqbm where dqbm='"+dqbm+"' )group by dqbm,dqmc order by dqmc","");	
	}
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99FFCC">所在仓库</td>
  <td bgcolor="#99FFCC"><select name="jxc_kcb_ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeckbh(selectform)">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.print("<option value=\"\"></option>");
	}
	else
	{
	out.print("<option value=\"\"></option>");
	cf.selectItem(out,"select ckbh,ckmc from jxc_ckmc where dqbm='"+dqbm+"'  order by ckmc","");
	}
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99FFCC">所在货架</td>
  <td bgcolor="#99FFCC"><select name="jxc_kcb_hjbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changehjbh(selectform)">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99FFCC">所在货位</td>
  <td bgcolor="#99FFCC"><select name="jxc_kcb_hwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#66CCCC">材料名称</td> 
  <td width="35%" bgcolor="#66CCCC"><input type="text" name="jxc_kcb_clmc" size="20" maxlength="50" >&nbsp;&nbsp;模糊<input name="jxc_kcb_clmc_mh" type="checkbox" value="Y"></td>
  <td width="15%" align="right" bgcolor="#66CCCC">材料类别</td> 
  <td width="35%" bgcolor="#66CCCC">
  <select name="jxc_kcb_cllb" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value="2">库存主材</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#66CCCC">材料大类</td> 
  <td width="35%" bgcolor="#66CCCC">
  <select name="jxc_kcb_cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeClxlbm(selectform)">
    <option value=""></option>
 <%
	  out.print("<optgroup label=\"主材大类\"> </optgroup>");
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb='1' order by cldlmc","");
	out.print("<optgroup label=\"通用大类\"> </optgroup>");
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb='3' order by cldlmc","");
%>
  </select></td>
  <td width="15%" align="right" bgcolor="#66CCCC">材料小类</td> 
  <td width="35%" bgcolor="#66CCCC">
  <select name="jxc_kcb_clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
<td width="15%" align="right" bgcolor="#66CCCC">品牌</td> 
  <td width="35%" bgcolor="#66CCCC"> 
	<select name="jxc_kcb_scsmc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePp(selectform)">
    <option value=""></option>
<%
	out.print("<optgroup label=\"主材品牌\"> </optgroup>");
	cf.selectItem(out,"select scsmc mc,scsmc from jxc_scsxx where scslb='1' order by scsmc","");
		out.print("<optgroup label=\"通用品牌\"> </optgroup>");

	cf.selectItem(out,"select scsmc mc,scsmc from jxc_scsxx where scslb='3' order by scsmc","");

%>
  </select></td>
  <td width="15%" align="right" bgcolor="#66CCCC">子品牌</td> 
  <td width="35%" bgcolor="#66CCCC">
 <select name="jxc_kcb_ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#66CCCC">型号</td> 
  <td width="35%" bgcolor="#66CCCC"><input type="text" name="jxc_kcb_xh" size="20" maxlength="100" >&nbsp;&nbsp;模糊<input name="jxc_kcb_xh_mh" type="checkbox" value="Y"></td>
  <td width="15%" align="right" bgcolor="#66CCCC">规格</td> 
  <td width="35%" bgcolor="#66CCCC"><input type="text" name="jxc_kcb_gg" size="20" maxlength="100" >&nbsp;&nbsp;模糊<input name="jxc_kcb_gg_mh" type="checkbox" value="Y"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#66CCCC">类别系列</td> 
  <td width="35%" bgcolor="#66CCCC"><input type="text" name="jxc_kcb_cllbbm" size="20" maxlength="100" ></td>
  <td width="15%" align="right" bgcolor="#66CCCC">产品级别</td> 
  <td width="35%" bgcolor="#66CCCC"><input type="text" name="jxc_kcb_cpjb" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#66CCCC">颜色</td> 
  <td width="35%" bgcolor="#66CCCC"> 
    <input type="text" name="jxc_kcb_clysbm" size="20" maxlength="100" >  </td>
  <td width="15%" align="right" bgcolor="#66CCCC">计量单位</td> 
  <td width="35%" bgcolor="#66CCCC"> 
	<select name="jxc_kcb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
	<%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">是否包含配件</td> 
  <td width="35%"> 
	<select name="jxc_kcb_sfbhpj" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<option value="Y">包含</option>
	<option value="N">不包含</option>
    </select>  </td>
  <td align="right" width="15%">配件套数</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcb_pjts" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">是否有货</td> 
  <td width="35%"> 
	<select name="jxc_kcb_sfyh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
	<option value="Y">有货</option>
	<option value="N">无货</option>
    </select> </td>
  <td align="right" width="15%">产地</td> 
  <td width="35%"><input type="text" name="jxc_kcb_cd" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">风格属性</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcb_fgsx" size="20" maxlength="50" >&nbsp;&nbsp;模糊<input name="jxc_kcb_fgsx_mh" type="checkbox" value="Y">  </td>
  <td align="right" width="15%">产品说明</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcb_cpsm" size="20" maxlength="200" >&nbsp;&nbsp;模糊<input name="jxc_kcb_cpsm_mh" type="checkbox" value="Y">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">采购周期 从</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcb_cgzq" size="20" maxlength="8" >  </td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="jxc_kcb_cgzq2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">成本价 从</td> 
  <td width="35%"><input type="text" name="jxc_kcb_cbj" size="20" maxlength="9" ></td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="jxc_kcb_cbj2" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">库存数量 从</td> 
  <td width="35%"><input type="text" name="jxc_kcb_kcsl" size="20" maxlength="8" ></td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="jxc_kcb_kcsl2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">库存金额 从</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcb_kcje" size="20" maxlength="9" >  </td>
  <td align="right" width="15%">到</td>
  <td width="35%"><input type="text" name="jxc_kcb_kcje2" size="20" maxlength="9" ></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
   <input type="button"  value="库存统计" onClick="f_do(selectform,5)">&nbsp;&nbsp;&nbsp;
   <input type="button"  value="负库存查询" onClick="f_do(selectform,4)">&nbsp;&nbsp;&nbsp; 
    <input type="button"  value="流水查询" onClick="f_do(selectform,1)">&nbsp;&nbsp;&nbsp;
	 <input type="button"  value="材料保质期提醒" onClick="f_do(selectform,3)">&nbsp;&nbsp;&nbsp;
    <input type="reset"  value="重输">  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
   <input type="button"  value="供应商统计" onClick="f_do(selectform,6)">&nbsp;&nbsp;&nbsp;
<!--     <input type="button"  value="品牌统计" onClick="f_do(selectform,11)">&nbsp;&nbsp;&nbsp;
 -->    <input type="button"  value="子品牌统计" onClick="f_do(selectform,7)">&nbsp;&nbsp;&nbsp;
    <input type="button"  value="大类小类统计" onClick="f_do(selectform,8)">&nbsp;&nbsp;&nbsp;
	 <input type="button"  value="在途货物查询" onClick="f_do(selectform,9)">&nbsp;&nbsp;&nbsp;
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function singleAdd(FormName)
{               
	if (FormName.jxc_kcb_clbm.value=="")
	{
		return;
	}
	if (event.keyCode==13)	
	{
		add(FormName);
		FormName.jxc_kcb_clbm.value="";
		FormName.jxc_kcb_clbm.focus();
	}        
}                                                                                                                                                       

function add(FormName)//参数FormName:Form的名称
{
	if (isExisted(FormName.clbmlist,FormName.jxc_kcb_clbm.value)!=-1){        
		alert("材料编码["+FormName.jxc_kcb_clbm.value+"]已被扫入到列表中！");        
		FormName.jxc_kcb_clbm.focus() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.jxc_kcb_clbm.value;
	op1.text=FormName.clbmlist.options.length+1+":"+FormName.jxc_kcb_clbm.value;
	FormName.clbmlist.add(op1);
}
function remove(FormName)//参数FormName:Form的名称
{
	for (var i=FormName.clbmlist.options.length-1; i>=0; i--)
	{
		if (FormName.clbmlist.options[i].selected)
		{
			FormName.clbmlist.remove(i);
		}
	}
	for (var i=0;i<FormName.clbmlist.options.length; i++)
	{
		FormName.clbmlist.options[i].text=i+1+":"+FormName.clbmlist.options[i].value;
	}
}

//判断重复录入                                          
  
function isExisted(o,val){//在出库产品列表中判断        
	index=0;    
	while(index<o.length){  
		if ( o.options[index].value.substring(0,13)==val) return index;  
		index++;  
	}    
	return -1;    
}        
function f_do(FormName,cxlx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jxc_kcb_dqbm)=="") {
		alert("请输入[所属地区]！");
		FormName.jxc_kcb_dqbm.focus();
		return false;
	}
	if(!(isNumber(FormName.jxc_kcb_pjts, "配件套数"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_kcb_cgzq, "采购周期"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_kcb_cgzq2, "采购周期"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_kcb_cbj, "成本价"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_kcb_cbj2, "成本价"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_kcb_kcsl, "库存数量"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_kcb_kcsl2, "库存数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_kcb_kcje, "库存金额"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_kcb_kcje2, "库存金额"))) {
		return false;
	}
	for(i=0;i<FormName.clbmlist.length;i++){                                                                      
        FormName.clbmlist.options[i].selected = true; 
	}
	if (cxlx=="1")
	{
	FormName.action="Jxc_kcbTqCxList.jsp";
	FormName.submit();
	return true;
	}
	else if (cxlx=="2")
	{
	FormName.action="Jxc_kcbTj.jsp";
	FormName.submit();
	return true;
	}
	else if (cxlx=="3")
	{
	FormName.action="Jxc_kcbGq.jsp";
	FormName.submit();
	return true;
	}
	else if (cxlx=="4")
	{
	FormName.action="Jxc_kcbfkc.jsp";
	FormName.submit();
	return true;
	}
	else if (cxlx=="5")
	{
	FormName.action="Jxc_kcbT.jsp";
	FormName.submit();
	return true;
	}
	else if (cxlx=="6")
	{
	FormName.action="Jxc_kcbGystj.jsp";
	FormName.submit();
	return true;
	}
	else if (cxlx=="7")
	{
	FormName.action="Jxc_kcbPptj.jsp";
	FormName.submit();
	return true;
	}
	else if (cxlx=="8")
	{
	FormName.action="Jxc_kcbXltj.jsp";
	FormName.submit();
	return true;
	}
	else if (cxlx=="9")
	{
	FormName.action="Jxc_ckthdZt.jsp";
	FormName.submit();
	return true;
	}
	else if (cxlx=="11")
	{
	FormName.action="Jxc_kcbTx.jsp";
	FormName.submit();
	return true;
	}
}
//-->
<!--

//初始化Ajax＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始，固定代码不需改变
function creatAjax() 
{
   if(window.XMLHttpRequest)
	{ 
		xmlHttp = new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{
		try
		{
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e)
		{
			try
			{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e)
			{
			}
		}
	}
}
function openAjax(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function openAjax2(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax2;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function openAjax3(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax3;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function openAjax4(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax4;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function responseAjax4() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax4(retStr);
		}
		else
		{	
			alert("错误！Ajax响应失败！");
		}
    }
//	else
//	{
//		alert(xmlHttp.readyState);
//	}
}
function openAjax5(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax5;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function responseAjax5() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax5(retStr);
		}
		else
		{	
			alert("错误！Ajax响应失败！");
		}
    }
//	else
//	{
//		alert(xmlHttp.readyState);
//	}
}
function responseAjax3() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax3(retStr);
		}
		else
		{	
			alert("错误！Ajax响应失败！");
		}
    }
//	else
//	{
//		alert(xmlHttp.readyState);
//	}
}
function responseAjax2() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax2(retStr);
		}
		else
		{	
			alert("错误！Ajax响应失败！");
		}
    }
}

function responseAjax() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax(retStr);
		}
		else
		{	
			alert("错误！Ajax响应失败！");
		}
    }
}
//初始化Ajax＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


function changeClxlbm(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.jxc_kcb_clxlbm.length=1;

	if (FormName.jxc_kcb_cldlbm.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select clxlmc mc,clxlmc from jxc_clxlbm where cldlmc='"+FormName.jxc_kcb_cldlbm.value+"' order by clxlmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
	}
}
function changePp(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.jxc_kcb_ppmc.length=1;

	if (FormName.jxc_kcb_scsmc.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select ppmc mc,ppmc from jxc_ppxx where scsmc='"+FormName.jxc_kcb_scsmc.value+"' order by ppmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax2(actionStr);
	}
}

function getAjax(ajaxRetStr) 
{
//	alert("Ajax返回值："+ajaxRetStr);
	
	//需要用javaScript处理返回值
	strToSelect(selectform.jxc_kcb_clxlbm,ajaxRetStr);
}
function getAjax2(ajaxRetStr) 
{
//	alert("Ajax返回值："+ajaxRetStr);
	
	//需要用javaScript处理返回值
	strToSelect(selectform.jxc_kcb_ppmc,ajaxRetStr);
}

function changedqbm(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.jxc_kcb_ckbh.length=1;

	if (FormName.jxc_kcb_dqbm.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select ckbh,ckmc from jxc_ckmc where dqbm='"+FormName.jxc_kcb_dqbm.value+"' order by ckmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax3(actionStr);
	}
}

function getAjax3(ajaxRetStr) 
{
//	alert("Ajax返回值："+ajaxRetStr);
	
	//需要用javaScript处理返回值
	strToSelect(selectform.jxc_kcb_ckbh,ajaxRetStr);
}
function changeckbh(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.jxc_kcb_hjbh.length=1;

	if (FormName.jxc_kcb_ckbh.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select hjbh,hjmc from jxc_hjmc where ckbh='"+FormName.jxc_kcb_ckbh.value+"' order by hjmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax4(actionStr);
	}
}

function getAjax4(ajaxRetStr) 
{
//	alert("Ajax返回值："+ajaxRetStr);
	
	//需要用javaScript处理返回值
	strToSelect(selectform.jxc_kcb_hjbh,ajaxRetStr);
}

function changehjbh(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.jxc_kcb_hwbh.length=1;

	if (FormName.jxc_kcb_hjbh.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select hwbh,hwmc from jxc_hwmc where hjbh='"+FormName.jxc_kcb_hjbh.value+"' order by hwmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax5(actionStr);
	}
}

function getAjax5(ajaxRetStr) 
{
//	alert("Ajax返回值："+ajaxRetStr);
	
	//需要用javaScript处理返回值
	strToSelect(selectform.jxc_kcb_hwbh,ajaxRetStr);
}

//把字符串转换为下拉列表数据，用%、+分割
//不同行%分割，同一行用＋分割
function strToSelect(field,str)
{ 
	//返回值多一个回车换行，需取消＋＋＋＋＋＋＋＋＋开始
	while (true)
	{
		if (str.substring(0,1)=="\r")
		{
			str=str.substring(1);
		}
		else if (str.substring(0,1)=="\n")
		{
			str=str.substring(1);
		}
		else{
			break;
		}
	}
	//返回值多一个回车换行，需取消＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	if (str=="")//空值返回
	{
		return;
	}


	if (str.substring(0,1)=="%")//第一个字符是%，删除
	{
		str=str.substring(1);
	}
	
	//加入下拉框中
	var i=0;
	field.options[i] = new Option("","" );
	i++;
	while((str!="")&&(str!=null))
	{
		lstart=str.indexOf("+");
		lend=str.indexOf("%");
		if (lend==-1)
		{
			lend=str.length;
		}
		lcode=str.substring(0,lstart);
		lname=str.substring(lstart+1,lend);

		field.options[i] = new Option(lname,lcode );
		i++;
		str=str.substring(lend+1,str.length);
	}
	field.length = i;
}
//-->
</SCRIPT>
