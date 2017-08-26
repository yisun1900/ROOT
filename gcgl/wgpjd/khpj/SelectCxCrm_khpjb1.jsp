<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=request.getParameter("ssfgs");
%>

<body bgcolor="#FFFFFF" onload="selectform.hth.focus();">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">查询-客户评价表</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">分公司</div>
              </td>
              <td width="33%"> <%
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
%> </td>
              <td width="19%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">合同号</td>
              <td width="33%"> 
                <input type="text" name="hth" size="20" maxlength="20">
              </td>
              <td width="19%" align="right">客户编号</td>
              <td width="31%"> 
                <input type="text" name="khbh" size="20" maxlength="20">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khxm" size="20" maxlength="50">
              </td>
              <td width="19%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">房屋地址</td>
              <td width="33%"> 
                <input type="text" name="fwdz" size="20" maxlength="100">
              </td>
              <td align="right" width="19%">施工队</td>
              <td width="31%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' order by sgdmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">设计师</td>
              <td width="33%"> 
                <input type="text" name="sjs" size="20" maxlength="20" >
              </td>
              <td align="right" width="19%">工程担当</td>
              <td width="31%"> 
                <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">受评价人员</td>
              <td width="33%"> 
                <select name="spjry" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select spjry c1,spjry c2 from crm_spjrybm order by spjrybm","");
%> 
                </select>
              </td>
              <td align="right" width="19%">项目分类</td>
              <td width="31%"> 
                <select name="xmfl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmfl c1,xmfl c2 from crm_xmflbm order by xmflbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">评价项目</td>
              <td colspan="3"> 
                <select name="pjxm" style="FONT-SIZE:12PX;WIDTH:522PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select pjxm c1,pjxm||'（'||spjry||'）（'||xmfl||'）' c2 from crm_pjxmbm order by spjrybm,xmflbm,pjxmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">评价结果</td>
              <td width="33%"> 
                <input type="radio" name="pjjgbm" value="1">
                √ 
                <input type="radio" name="pjjgbm" value="2">
                ×
                <input type="radio" name="pjjgbm" value="9">
                空</td>
              <td align="right" width="19%">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">录入时间 从</td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="19%">到</td>
              <td width="31%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="21%" align="right">结果排序</td>
              <td colspan="3" bgcolor="#CCFFFF"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_khxx.lrsj desc">录入时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">工程担当</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期')">工程是否延期</option>
                  <option value="crm_khxx.yqts">工程延期天数</option>
                  <option value="crm_khxx.cxhdbm">参加促销活动</option>
                  <option value="crm_khxx.jzbz">家装标志</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">工程担当</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="crm_khxx.lrsj">录入时间</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期')">工程是否延期</option>
                  <option value="crm_khxx.yqts">工程延期天数</option>
                  <option value="crm_khxx.cxhdbm">参加促销活动</option>
                  <option value="crm_khxx.jzbz">家装标志</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">工程担当</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="crm_khxx.lrsj">录入时间</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期')">工程是否延期</option>
                  <option value="crm_khxx.yqts">工程延期天数</option>
                  <option value="crm_khxx.cxhdbm">参加促销活动</option>
                  <option value="crm_khxx.jzbz">家装标志</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">显示风格</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="75">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询-明细" onClick="f_do(selectform)">
                <input type="button"  value="查询-考核结果" onClick="f_do1(selectform)">
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.lrsj, "录入时间 "))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间 "))) {
		return false;
	}

	FormName.action="Crm_khpjbCxList.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间 "))) {
		return false;
	}

	if(	javaTrim(FormName.lrsj2)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间 "))) {
		return false;
	}

	FormName.action="Crm_khpjbCxHxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
