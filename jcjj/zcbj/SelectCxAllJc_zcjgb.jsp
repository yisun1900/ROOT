<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");

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

<form method="post" action="Jc_zcjgbCxAllList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">所属地区</font></td>
              <td width="33%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDq(selectform)" >
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
              <td width="17%" align="right">型号是否模糊查询</td>
              <td width="33%"> 
                <input type="radio" name="mhcx" value="Y" checked>
                模糊查询 
                <input type="radio" name="mhcx" value="N">
                精确查询 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#CCCCFF">型号</td>
              <td width="33%" bgcolor="#CCCCFF"> 
                <input type="text" name="jc_zcjgb_xh" size="20" maxlength="100" onKeyUp="singleAdd(selectform)">              </td>
              <td rowspan="10" align="center" bgcolor="#CCCCFF"> 
                <p>被选型号</p>
                <p> 
                  <input type="button"  value="增加" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="删除" onClick="remove(selectform)" name="button2" >
                </p>              </td>
              <td rowspan="10" bgcolor="#CCCCFF"> 
                <select name="xhlist" size="18" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><strong><font color="#0000CC">是否推荐产品</font></strong></td>
              <td><input type="radio" name="sftjcp" value="Y">
是
  <input type="radio" name="sftjcp" value="N">
否</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">主材大类</td>
              <td width="33%"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="zcxlbmMark=0;zcxlbm.length=1;gysMark=0;gys.length=1;dwbhMark=0;dwbh.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm  order by zcdlbm","");
%> 
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">主材小类</td>
              <td width="33%"><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcxlbm');" onChange="gysMark=0;gys.length=1;dwbhMark=0;dwbh.length=1;ppmcMark=0;ppmc.length=1;">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC"><b>品牌供应商</b></font></td>
              <td width="33%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('dwbh')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC"><b>品牌名称</b></font></td>
              <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC"><b>供应商名称</b></font></td>
              <td><select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gys')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" bgcolor="#FFFFFF" align="right">品牌供应商</td>
              <td width="33%"><input type="text" name="dwbh2" size="14" maxlength="50" >
（模糊查询） </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right">品牌名称</td>
              <td><input type="text" name="ppmc2" size="14" maxlength="50" >
（模糊查询） </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" bgcolor="#FFFFFF" align="right">供应商名称</td>
              <td width="33%"><input type="text" name="gys2" size="14" maxlength="50" >
（模糊查询）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right">主材编码</td>
              <td width="33%"><input type="text" name="jc_zcjgb_zcbm" size="20" maxlength="7" ></td>
              <td width="17%" align="right">主材名称</td>
              <td width="33%"><input type="text" name="jc_zcjgb_zcmc" size="20" maxlength="50" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">类别/系列</div>              </td>
              <td width="33%"> 
                <input type="text" name="zclbbm" size="20" maxlength="100" >              </td>
              <td width="17%"> 
                <div align="right">规格</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_gg" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">颜色</div>              </td>
              <td width="33%"> 
                <input type="text" name="zcysbm" value="" size="20" maxlength="100" >              </td>
              <td width="17%"> 
                <div align="right">计量单位</div>              </td>
              <td width="33%"> 
                <select name="jc_zcjgb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">市场标价 从</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_lsj" size="20" maxlength="9" >              </td>
              <td width="17%"> 
                <div align="right">到</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_lsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">销售限价 从</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_yhj" size="20" maxlength="9" >              </td>
              <td width="17%"> 
                <div align="right">到</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_yhj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">是否包含配件</div>              </td>
              <td width="33%"><%
	cf.radioToken(out, "jc_zcjgb_sfbhpj","Y+包含&N+不包含","");
%> </td>
              <td width="17%"> 
                <div align="right">照片名称</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_zp" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">配件套数 从</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_pjts" size="20" maxlength="8" >              </td>
              <td width="17%"> 
                <div align="right">到</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_pjts2" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">是否有促销</td>
              <td width="33%"><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销","");
%></td>
              <td width="17%" align="right">是否有货</td>
              <td width="33%"> 
                <input type="radio" name="sfyh" value="Y">
                有货 
                <input type="radio" name="sfyh" value="N">
                无货</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">促销开始时间 从</td>
              <td width="33%"> 
                <input type="text" name="cxkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="cxkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">促销结束时间 从</td>
              <td width="33%"> 
                <input type="text" name="cxjzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="cxjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">计入活动比例 从</td>
              <td width="33%"> 
                <input type="text" name="cxhdbl" size="10" maxlength="10" >
                % </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="cxhdbl2" size="10" maxlength="10" >
                % </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">结果排序</td>
              <td colspan="3"> 
                <select name="jgpx" style="FONT-SIZE:14PX;WIDTH:515PX">
                  <option value=""></option>
                  <option  value="jc_zcjgb.sftjcp desc">是否推荐产品</option>
                  <option  value="jc_zcjgb.zcbm">主材编码</option>
                  <option  value="jc_zcjgb.zcdlbm,jc_zcjgb.dwbh,jc_zcjgb.zclbbm,jc_zcjgb.xh,jc_zcjgb.zcbm">大类,品牌供应商,类别系列，型号</option>
                  <option  value="jc_zcjgb.zcdlbm,jc_zcjgb.dwbh,jc_zcjgb.zclbbm,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.zcbm">大类,品牌供应商,类别系列，型号，规格</option>
                  <option  value="jc_zcjgb.zcdlbm,jc_zcjgb.dwbh,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.zcbm">大类,品牌供应商，型号，规格</option>
                  <option  value="jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.zcbm">型号，规格</option>
                  <option  value="jc_zcjgb.xh,jc_zcjgb.zcbm">型号</option>
                  <option  value="jc_zcjgb.zcmc">主材名称</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> &nbsp;&nbsp;&nbsp;每页显示数量</td>
              <td colspan="3"> 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//启用AJAX
%>

var gysMark=0;
var dwbhMark=0;
var ppmcMark=0;
var zcxlbmMark=0;

var fieldName="";

function changeDq(FormName) 
{
	gysMark=0;
	dwbhMark=0;
	ppmcMark=0;

	FormName.gys.length=1;
	FormName.dwbh.length=1;
	FormName.ppmc.length=1;
}

function getThis(lx)
{
	if(	javaTrim(selectform.dqbm)=="") {
		alert("请选择[所属地区]！");
		selectform.dqbm.focus();
		return false;
	}

	var sql;
	fieldName=lx;

	if (lx=="gys")
	{
		if (gysMark==0)
		{
			if (selectform.zcxlbm.value!="")
			{
				sql="select distinct sq_gysxx.gys from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+selectform.zcxlbm.value+"' order by sq_gysxx.gys";
			}
			else if (selectform.zcdlbm.value!="")
			{
				sql="select distinct sq_gysxx.gys from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb in(select zcxlmc from jdm_zcxlbm where zcdlmc='"+selectform.zcdlbm.value+"') order by sq_gysxx.gys";
			}
			else
			{
				sql="select distinct sq_gysxx.gys from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' order by sq_gysxx.gys";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}
	else if (lx=="dwbh")
	{
		if (dwbhMark==0)
		{

			if (selectform.zcxlbm.value!="")
			{
				sql="select sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+selectform.zcxlbm.value+"' order by sq_gysxx.gysmc";
			}
			else if (selectform.zcdlbm.value!="")
			{
				sql="select sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb in(select zcxlmc from jdm_zcxlbm where zcdlmc='"+selectform.zcdlbm.value+"') order by sq_gysxx.gysmc";
			}
			else
			{
				sql="select sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' order by sq_gysxx.gysmc";
			}
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			dwbhMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			if (selectform.zcxlbm.value!="")
			{
				sql="select distinct sq_gysxx.ppmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+selectform.zcxlbm.value+"' order by sq_gysxx.ppmc";
			}
			else if (selectform.zcdlbm.value!="")
			{
				sql="select distinct sq_gysxx.ppmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb in(select zcxlmc from jdm_zcxlbm where zcdlmc='"+selectform.zcdlbm.value+"') order by sq_gysxx.ppmc";
			}
			else
			{
				sql="select distinct sq_gysxx.ppmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' order by sq_gysxx.ppmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppmcMark=1;
		}
	}

}


function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="zcxlbm")
	{
		if (zcxlbmMark==0)
		{
			if (selectform.zcdlbm.value=="")
			{
				zcxlbmMark=0;
				selectform.zcdlbm.focus();
				alert("请选择【主材大类】");
				return;
			}

			sql =" select zcxlmc from jdm_zcxlbm where zcdlmc='"+selectform.zcdlbm.value+"' order by zcxlbm";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			zcxlbmMark=1;
		}
	}
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="gys")
	{
		strToItem2(selectform.gys,ajaxRetStr);
	}
	else if (fieldName=="dwbh")
	{
		strToItem2(selectform.dwbh,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="zcxlbm")
	{
		strToItem2(selectform.zcxlbm,ajaxRetStr);
	}
}



//将型号加入列表               
function singleAdd(FormName)
{               
	if (event.keyCode==13)//回车
	{
		add(FormName);
	}        
}                                                                                                                                                       

function add(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jc_zcjgb_xh)=="") {
		alert("请输入[型号]！");
		FormName.jc_zcjgb_xh.focus();
		return false;
	}

	if (isExisted(FormName.xhlist,FormName.jc_zcjgb_xh.value)!=-1){        
		alert("此[型号]已被选择！");        
		FormName.jc_zcjgb_xh.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.jc_zcjgb_xh.value;
	op1.text=FormName.xhlist.options.length+1+":"+FormName.jc_zcjgb_xh.value;
	FormName.xhlist.add(op1);


	FormName.jc_zcjgb_xh.value="" ;              
	FormName.jc_zcjgb_xh.select() ;              
}
function remove(FormName)//参数FormName:Form的名称
{
	for (var i=FormName.xhlist.options.length-1; i>=0; i--)
	{
		if (FormName.xhlist.options[i].selected)
		{
			FormName.xhlist.remove(i);
		}
	}
	for (var i=0;i<FormName.xhlist.options.length; i++)
	{
		FormName.xhlist.options[i].text=i+1+":"+FormName.xhlist.options[i].value;
	}

}

//判断重复录入                                          
  
function isExisted(o,val){//在列表中判断        
	index=0;    
	while(index<o.length){  
		if ( o.options[index].value==val) 
			return index;  
		index++;  
	}    
	return -1;    
}        


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}

	for(i=0;i<FormName.xhlist.length;i++){                                                                         
		FormName.xhlist.options[i].selected = true;                                                                         
	}                                                                        

	if(!(isFloat(FormName.jc_zcjgb_lsj, "市场统一限价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_lsj2, "市场统一限价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_yhj, "优惠价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_yhj2, "优惠价"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts, "配件套数"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts2, "配件套数"))) {
		return false;
	}

	if(!(isDatetime(FormName.cxkssj, "促销开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxkssj2, "促销开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxjzsj, "促销结束时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxjzsj2, "促销结束时间"))) {
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "计入活动比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cxhdbl2, "计入活动比例"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
