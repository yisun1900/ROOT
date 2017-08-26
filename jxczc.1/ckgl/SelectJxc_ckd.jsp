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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_ckdList.jsp" name="selectform">
<div align="center">出库单－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">分公司</td>
  <td><select name="jxc_ckd_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
	%>
  </select></td>
  <td align="right">地区</td>
  <td><select name="jxc_ckd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">出库批号</td> 
  <td width="32%"><input type="text" name="jxc_ckd_ckph" size="20" maxlength="11" ></td>
  <td align="right" width="18%">出库仓库</td> 
  <td width="32%"> 
    <select name="jxc_ckd_ckbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ckbh,ckmc from jxc_ckmc order by ckbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">出库类型</td> 
  <td width="32%"><select name="jxc_ckd_cklx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="D">订单出库</option>
    <option value="B">报废出库</option>
    <option value="T">退货出库</option>
    <option value="S">申购出库</option>
    <option value="J">辅材代金券出库</option>
    <option value="X">销售出库</option>
    <option value="R">调拨出库</option>
  </select></td>
  <td align="right" width="18%">来源单号</td> 
  <td width="32%"><input type="text" name="jxc_ckd_lydh" size="20" maxlength="13" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">出库方式</td>
  <td colspan="3"><%
	cf.radioToken(out, "jxc_ckd_ckfs","1+自动出库（先生产先出库）&2+自动出库（先入库先出库）&3+手工出库","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">配送方式</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "jxc_ckd_psfs","0+厂家配送&1+公司送货&2+自取","");
%>  </td>
  <td align="right" width="18%">出库单状态</td> 
  <td width="32%"><select name="jxc_ckd_ckdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="0">未提交</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划送货时间 从</td>
  <td><input type="text" name="jxc_ckd_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_ckd_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">出库人</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_ckr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">经手人</td> 
  <td width="32%"><input type="text" name="jxc_ckd_jsr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">出库时间 从</td>
  <td><input type="text" name="jxc_ckd_cksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_ckd_cksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否有负库存</td>
  <td colspan="3"><%
	cf.radioToken(out, "jxc_ckd_sfyfkc","1+无负库存&2+负库存未入库&3+负库存入库","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="jxc_ckd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_ckd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"><select name="jxc_ckd_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
  </select></td>
</tr>

<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isDatetime(FormName.jxc_ckd_jhshsj, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_jhshsj2, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_cksj, "出库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_cksj2, "出库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
