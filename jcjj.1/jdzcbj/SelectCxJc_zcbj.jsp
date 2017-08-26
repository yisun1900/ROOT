<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">产品报价查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_zcbjCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF">主材大类</td>
              <td width="33%" bgcolor="#FFFFFF"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="zcxlbmMark=0;zcxlbm.length=1;gysMark=0;gys.length=1;dwbhMark=0;dwbh.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm  order by zcdlbm","");
%> 
              </select></td>
              <td align="right" bgcolor="#FFFFFF">主材小类</td>
              <td bgcolor="#FFFFFF"><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcxlbm');" onChange="gysMark=0;gys.length=1;dwbhMark=0;dwbh.length=1;ppmcMark=0;ppmc.length=1;">
                <option value=""></option>
              </select></td>
            </tr>
            
            
            
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right">品牌</td>
              <td bgcolor="#FFFFFF"><input type="text" name="ppmc" size="20" maxlength="50" ></td>
              <td align="right" bgcolor="#FFFFFF">型号</td>
              <td bgcolor="#FFFFFF"><input type="text" name="xh" size="20" maxlength="100" onKeyUp="singleAdd(selectform)"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right" bgcolor="#FFFFFF">主材编码</td>
              <td width="33%" bgcolor="#FFFFFF"><input type="text" name="zcbm" size="20" maxlength="7" ></td>
              <td width="17%" align="right" bgcolor="#FFFFFF">主材名称</td>
              <td width="33%" bgcolor="#FFFFFF"><input type="text" name="zcmc" size="20" maxlength="50" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF">颜色</td>
              <td width="33%" bgcolor="#FFFFFF"><input type="text" name="zcysbm" value="" size="20" maxlength="100" ></td>
              <td width="17%" align="right" bgcolor="#FFFFFF">规格</td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <input type="text" name="gg" size="20" maxlength="100" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">结果排序</td>
              <td colspan="3"> 
                <select name="jgpx" style="FONT-SIZE:14PX;WIDTH:515PX">
                  <option value=""></option>
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




function f_do(FormName)//参数FormName:Form的名称
{


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
