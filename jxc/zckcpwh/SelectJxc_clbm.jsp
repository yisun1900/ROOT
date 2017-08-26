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
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%" height="705">
  <tr>
    <td width="100%"> 
      <div align="center">主材库存品维护</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="680" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
                <input type="button"  value="根据条件导出报价" onClick="f_dc(selectform)" name="button" >
                <BR><BR> 
                  <input type="button"  value="增加新主材报价（Excel）" onClick="f_drnewExcel(selectform)" >
                &nbsp;&nbsp;&nbsp;&nbsp;
				<A HREF="主材报价.xls"><B>点击右键另存为，下载Excel报价模板</B></A></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">所属地区</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDq(selectform)" >
                  <%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
%> 
                </select>              </td>
              <td width="16%" align="right">型号是否模糊查询</td>
              <td width="34%"> 
                <input type="radio" name="mhcx" value="Y" checked>
                模糊查询 
                <input type="radio" name="mhcx" value="N">
                精确查询 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">型号</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="xh" size="20" maxlength="100" onKeyUp="singleAdd(selectform)">              </td>
              <td rowspan="9" align="center" bgcolor="#CCCCFF" width="16%"> 
                <p>被选型号</p>
                <p> 
                  <input type="button"  value="增加" onClick="add(selectform)" name="button4" >
                </p>
                <p> 
                  <input type="button"  value="删除" onClick="remove(selectform)" name="button22" >
                </p>              </td>
              <td rowspan="9" bgcolor="#CCCCFF" width="34%"> 
                <select name="xhlist" size="18" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">主材大类</td>
              <td width="32%"><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="clxlbmMark=0;clxlbm.length=1;gysMark=0;gysmc.length=1;ppmcMark=0;ppmc.length=1;">
                <option value=""></option>
                <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">主材小类</td>
              <td width="32%"><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('clxlbm');" onChange="gysMark=0;gysmc.length=1;">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC"><b>子品牌</b></font></td>
              <td width="32%"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC"><b>品牌名称</b></font></td>
              <td><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('scsmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC"><b>供应商名称</b></font></td>
              <td><select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gysmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">子品牌</td>
              <td width="32%"><input type="text" name="ppmc2" size="14" maxlength="50" >
（模糊查询）</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right">品牌名称</td>
              <td><input type="text" name="scsmc2" size="14" maxlength="50" >
（模糊查询） </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">供应商名称</td>
              <td width="32%"><input type="text" name="gysmc2" size="14" maxlength="50" >
（模糊查询）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><strong><font color="#0000CC">是否推荐产品</font></strong></td>
              <td><input type="radio" name="sftjcp" value="Y">
是
  <input type="radio" name="sftjcp" value="N">
否</td>
              <td align="right">采购类别</td>
              <td><input type="radio" name="cglb" value="J">
集团采购
  <input type="radio" name="cglb" value="D">
地方采购</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">销售方式 </td>
              <td><input type="radio" name="xsfs" value="2">现货销售
				  <input type="radio" name="xsfs" value="3">期货销售</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">主材编码</td>
              <td><input type="text" name="clbm" size="20" maxlength="13" ></td>
              <td align="right">主材名称</td>
              <td><input type="text" name="clmc" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                类别/系列              </td>
              <td width="32%"> 
                <input type="text" name="cllbbm" value="" size="20" maxlength="100" >              </td>
              <td width="16%" align="right"> 
                规格              </td>
              <td width="34%"> 
                <input type="text" name="gg" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                颜色              </td>
              <td width="32%"> 
                <input type="text" name="clysbm" value="" size="20" maxlength="100" >              </td>
              <td width="16%" align="right"> 
                计量单位              </td>
              <td width="34%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 库存数量 从 </td>
              <td><input type="text" name="zcpzsl" size="20" maxlength="16" >
              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="zcpzsl2" size="20" maxlength="16" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                市场标价 从              </td>
              <td width="32%"> 
                <input type="text" name="lsj" size="20" maxlength="9" >              </td>
              <td width="16%" align="right"> 
                到              </td>
              <td width="34%"> 
                <input type="text" name="lsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                销售价 从              </td>
              <td width="32%"> 
                <input type="text" name="xsj" size="20" maxlength="9" >              </td>
              <td width="16%" align="right"> 
                到              </td>
              <td width="34%"> 
                <input type="text" name="xsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                是否包含配件              </td>
              <td width="32%"><%
	cf.radioToken(out, "sfbhpj","Y+包含&N+不包含","");
%> </td>
              <td width="16%" align="right"> 
                照片名称              </td>
              <td width="34%"> 
                <input type="text" name="zp" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                配件套数 从              </td>
              <td width="32%"> 
                <input type="text" name="pjts" size="20" maxlength="8" >              </td>
              <td width="16%" align="right"> 
                到              </td>
              <td width="34%"> 
                <input type="text" name="pjts2" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">是否有促销</td>
              <td width="32%"><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销","");
%></td>
              <td width="16%" align="right">是否有货</td>
              <td width="34%"> 
                <input type="radio" name="sfyh" value="Y">
                有货 
                <input type="radio" name="sfyh" value="N">
                无货</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">促销开始时间 从</td>
              <td width="32%"> 
                <input type="text" name="cxkssj" size="20" maxlength="10" >              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="cxkssj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">促销结束时间 从</td>
              <td width="32%"> 
                <input type="text" name="cxjzsj" size="20" maxlength="10" >              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="cxjzsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">计入活动比例 从</td>
              <td width="32%"> 
                <input type="text" name="cxhdbl" size="10" maxlength="10" >
                % </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="cxhdbl2" size="10" maxlength="10" >
                % </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">结果排序</td>
              <td colspan="3"> 
                <select name="jgpx" style="FONT-SIZE:14PX;WIDTH:515PX">
                  <option value=""></option>
                  <option  value="jxc_clbm.sftjcp desc">是否推荐产品</option>
                  <option  value="jxc_clbm.clbm">主材编码</option>
                  <option  value="jxc_clbm.cldlbm,jxc_clbm.ppmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.clbm">大类,品牌,类别系列，型号</option>
                  <option  value="jxc_clbm.cldlbm,jxc_clbm.ppmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clbm">大类,品牌,类别系列，型号，规格</option>
                  <option  value="jxc_clbm.cldlbm,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clbm">大类,品牌，型号，规格</option>
                  <option  value="jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clbm">型号，规格</option>
                  <option  value="jxc_clbm.xh,jxc_clbm.clbm">型号</option>
                  <option  value="jxc_clbm.clmc">主材名称</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> &nbsp;&nbsp;&nbsp;每页显示数量</td>
              <td colspan="3"> 
                <input type="text" name="myxssl" size="7" maxlength="13" value="200">              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">              </td>
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
<%
	cf.ajax(out);//启用AJAX
%>

var gysMark=0;
var scsmcMark=0;
var ppmcMark=0;
var clxlbmMark=0;

var fieldName="";

function changeDq(FormName) 
{
	gysMark=0;
	ppmcMark=0;
	ppmcMark=0;
	scsmcMark=0;

	FormName.gysmc.length=1;
	FormName.ppmc.length=1;
	FormName.scsmc.length=1;
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

	if (lx=="gysmc")
	{
		if (gysMark==0)
		{
			if (selectform.clxlbm.value!="")
			{
				sql="select jxc_gysxx.gysmc from jxc_ppxx,jxc_ppgysdzb,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl='"+selectform.clxlbm.value+"' order by jxc_gysxx.gysmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select jxc_gysxx.gysmc from jxc_ppxx,jxc_ppgysdzb,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"') order by jxc_gysxx.gysmc";
			}
			else
			{
				sql="select jxc_gysxx.gysmc from jxc_gysxx where jxc_gysxx.dqbm='"+selectform.dqbm.value+"' order by jxc_gysxx.gysmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}
	else if (lx=="scsmc")
	{
		if (scsmcMark==0)
		{

			if (selectform.clxlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl='"+selectform.clxlbm.value+"' order by jxc_ppxx.scsmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"') order by jxc_ppxx.scsmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') order by jxc_ppxx.scsmc";
			}
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			scsmcMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			if (selectform.cldlbm.value!="")
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.pplb in('1','3') and jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dwlx in('A0','F0') and cxbz='N' and dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.cldl='"+selectform.cldlbm.value+"' order by jxc_ppxx.ppmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.pplb in('1','3') and jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dwlx in('A0','F0') and cxbz='N' and dqbm='"+selectform.dqbm.value+"') order by jxc_ppxx.ppmc";
			}


			var actionStr="/ajax/getstr.jsp?sql="+sql;
//			window.open(actionStr);

			openAjax(actionStr);
			ppmcMark=1;
		}
	}

}


function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="clxlbm")
	{
		if (clxlbmMark==0)
		{
			if (selectform.cldlbm.value=="")
			{
				clxlbmMark=0;
				selectform.cldlbm.focus();
				alert("请选择【主材大类】");
				return;
			}

			sql =" select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"' order by clxlmc";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			clxlbmMark=1;
		}
	}
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="gysmc")
	{
		strToItem2(selectform.gysmc,ajaxRetStr);
	}
	else if (fieldName=="scsmc")
	{
		strToItem2(selectform.scsmc,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="clxlbm")
	{
		strToItem2(selectform.clxlbm,ajaxRetStr);
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
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[型号]！");
		FormName.xh.focus();
		return false;
	}

	if (isExisted(FormName.xhlist,FormName.xh.value)!=-1){        
		alert("此[型号]已被选择！");        
		FormName.xh.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.xh.value;
	op1.text=FormName.xhlist.options.length+1+":"+FormName.xh.value;
	FormName.xhlist.add(op1);


	FormName.xh.value="" ;              
	FormName.xh.select() ;              
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

	if(!(isFloat(FormName.lsj, "市场统一限价"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "市场统一限价"))) {
		return false;
	}
	if(!(isFloat(FormName.xsj, "优惠价"))) {
		return false;
	}
	if(!(isFloat(FormName.xsj2, "优惠价"))) {
		return false;
	}
	if(!(isNumber(FormName.pjts, "配件套数"))) {
		return false;
	}
	if(!(isNumber(FormName.pjts2, "配件套数"))) {
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
	if(!(isFloat(FormName.zcpzsl, "库存数量"))) {
		return false;
	}
	if(!(isFloat(FormName.zcpzsl2, "库存数量"))) {
		return false;
	}

	FormName.target="";
	FormName.action="Jxc_clbmList.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if ( confirm("确实要导出主材报价吗?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("请选择[所属地区]！");
			FormName.dqbm.focus();
			return false;
		}
		if(!(isFloat(FormName.cxhdbl, "计入活动比例"))) {
			return false;
		}
		if(!(isFloat(FormName.cxhdbl2, "计入活动比例"))) {
			return false;
		}

		FormName.target="_blank";
		FormName.action="ExpData.jsp";
		FormName.submit();
		return true;
	}
}



function f_drnewExcel(FormName)//参数FormName:Form的名称
{

	FormName.target="_blank";
	FormName.action="ImpAddData.jsp";
	FormName.submit();
	return true;

}





//-->
</SCRIPT>
