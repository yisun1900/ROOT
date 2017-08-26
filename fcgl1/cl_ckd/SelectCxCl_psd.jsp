<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_psdCxList.jsp" name="selectform">
<div align="center">配送单出库</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">配送单号</td>
      <td width="31%"> 
        <input type="text" name="psdh" size="20" maxlength="11" >
      </td>
      <td align="right" width="18%">分公司</td>
      <td width="33%"> <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"> ");
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
			out.println("        </select>");
		}
		else{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
			out.println("        </select>");
		}
		%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">配送状态</td>
      <td width="31%"> 
        <select name="pszt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value="2">已提交</option>
        </select>
      </td>
      <td align="right" width="18%">录入人</td>
      <td width="33%"> 
        <input type="text" name="lrr2" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">合同号</td>
      <td width="31%"> 
        <input type="text" name="hth" size="20" maxlength="20">
      </td>
      <td width="18%" align="right">客户编号</td>
      <td width="33%"> 
        <input type="text" name="khbh" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">客户姓名</div>
      </td>
      <td width="31%"> 
        <input type="text" name="khxm" size="20" maxlength="50">
      </td>
      <td width="18%"> 
        <div align="right">联系方式</div>
      </td>
      <td width="33%"> 
        <input type="text" name="lxfs" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">房屋地址</div>
      </td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="73" maxlength="100">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">配送总数量 从</td>
      <td width="31%"> 
        <input type="text" name="pszsl" size="20" maxlength="17" >
      </td>
      <td align="right" width="18%">到</td>
      <td width="33%"> 
        <input type="text" name="pszsl2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">配送总金额 从</td>
      <td width="31%"> 
        <input type="text" name="pszje" size="20" maxlength="17" >
        <BR>
      </td>
      <td align="right" width="18%">到</td>
      <td width="33%"> 
        <input type="text" name="pszje2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">出库时间 从</td>
      <td width="31%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="33%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">出库人</td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">配送方式</td>
      <td width="31%"> 
        <input type="radio" name="psfs" value="1">
        配送 
        <input type="radio" name="psfs" value="2">
        自提 
        <input type="radio" name="psfs" value="9">
        其它 </td>
      <td align="right" width="18%">施工队</td>
      <td width="33%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh  order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
	}
	else{
		
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">计划送货时间 从</td>
      <td width="31%"> 
        <input type="text" name="jhshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="33%"> 
        <input type="text" name="jhshsj2" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">类型</td>
      <td width="31%"> 
        <input type="radio" name="lx" value="1">
        配货 
        <input type="radio" name="lx" value="2">
        退货</td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.pszsl, "配送总数量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszsl2, "配送总数量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszje, "配送总金额"))) {
		return false;
	}
	if(!(isFloat(FormName.pszje2, "配送总金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj2, "计划送货时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
