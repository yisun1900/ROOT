<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>联系客户</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");


	String yhdlm=(String)session.getAttribute("yhdlm");
	String dlxmzy=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='10'");
	if (dlxmzy==null)
	{
		dlxmzy="";
	}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">联系客户</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxJyList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="21%"> 
                <div align="right">分公司</div>
              </td>
              <td width="29%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_khxx_dwbh,"+dwstr+");\">");
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
              <td width="19%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">签约日期 从</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value="" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" bgcolor="#E8E8FF" align="right">合同号</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">派单处理状态</td>
              <td width="31%"> 
                <select name="crm_khxx_pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+申请派单&2+派单&3+拒绝派单&4+接受派单&5+保持原派&6+同意改派","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_khbh" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" bgcolor="#E8E8FF" align="right">所属城区</td>
              <td width="29%"> 
                <select name="crm_khxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right">小区</td>
              <td width="31%"> 
                <select name="crm_khxx_xqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqbm,xqmc from dm_xqbm where dqbm='"+dqbm+"' order by xqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#E8E8FF">房屋地址</td>
              <td width="29%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="19%" align="right">业务员</td>
              <td width="31%"> 
                <input type="text" name="ywy" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">设计师</div>
              </td>
              <td width="29%" bgcolor="#FFFFFF"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">质检姓名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">施工队</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd order by sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
	}
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">施工班组</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right" bgcolor="#FFFFCC">工程签约额 从</td>
              <td width="29%" bgcolor="#FFFFCC"> 
                <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%"> 
                <div align="right">工程进度</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">在施工程标志</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_zsbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未开工&2+在施工程&3+已完工","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">完工标志</td>
              <td width="29%"> 
                <select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未完工&2+已完工","");
%> 
                </select>
              </td>
              <td width="19%" align="right">退单标志</td>
              <td width="31%"> 
                <select name="crm_khxx_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"2+未退单&3+已退单","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right" bgcolor="#E8E8FF">项目专员</td>
              <td width="29%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (dlxmzy.equals(""))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssdw='"+ssfgs+"' and zwbm='10' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssdw='"+ssfgs+"' and zwbm='10' and yhmc='"+dlxmzy+"'",dlxmzy);
	}
%> 
                </select>
              </td>
              <td width="19%" bgcolor="#E8E8FF" align="right">&nbsp;</td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">项目专员是否已联系</td>
              <td width="29%"> 
                <select name="sfylx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">未联系</option>
                  <option value="Y">已联系</option>
                </select>
              </td>
              <td width="19%" bgcolor="#E8E8FF" align="right">客户接受联系方式</td>
              <td width="31%"> 
                <select name="jslxfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">电话联系</option>
                  <option value="2">发短信</option>
                  <option value="3">不受限制</option>
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'gccx')">
                <input type="reset"  value="重输">
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
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.crm_khxx_qye, "工程签约额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye2, "工程签约额"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}

	FormName.action="Crm_khxxJcList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
