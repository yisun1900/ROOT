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
	String zdyhbz=(String)session.getAttribute("zdyhbz");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");

	String yhdlm=(String)session.getAttribute("yhdlm");
	String yhmc=cf.executeQuery("select yhmc from sq_yhxx where zwbm='05' and yhdlm='"+yhdlm+"' ");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">分项验收－维护</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"> 
                分公司              </td>
              <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
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
              <td width="18%" align="right"> 
                签约店面              </td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">客户编号</td>
              <td width="33%"> 
              <input type="text" name="crm_gcfxysjl_khbh" size="20" maxlength="20" >              </td>
              <td width="18%" align="right">合同号</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
              <td width="33%"> 
              <input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td width="18%" align="right">客户姓名</td>
              <td width="32%"> 
                <input type="text" name="khxm2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#0000CC"><b>联系方式</b></font>              </td>
              <td width="33%"> 
              <input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td width="18%" align="right"> 
                联系方式              </td>
              <td width="32%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                房屋地址              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz2" size="65" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">设计师</td>
              <td width="33%"> 
              <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >              </td>
              <td width="18%">              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                施工队              </td>
              <td width="33%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by cxbz,sgdmc","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                工程担当              </td>
              <td width="32%"> 
                <select name="crm_khxx_zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='05' order by yhmc","");
	}
	else
	{
		if (zdyhbz.equals("Y") || yhmc==null)
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx where zwbm='05' and ssfgs='"+ssfgs+"' order by yhmc","");
		}
		else{
			cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx where zwbm='05' and ssfgs='"+ssfgs+"' order by yhmc",yhmc,false);
		}
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                项目分类              </td>
              <td width="33%"> 
                <select name="crm_gcfxysjl_ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
					<option value=""></option>
				<%
					cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm order by ysxmflbm","");
				%>
                </select>              </td>
              <td width="18%" align="right"> 
                验收项目              </td>
              <td width="32%"> 
                <select name="crm_gcfxysjl_gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm order by ysxmflbm,gcysxmbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否客户本人签字</td>
              <td><input type="radio" name="sfkhbrqz"  value="Y">
                是
                <input type="radio" name="sfkhbrqz"  value="N">
                否 </td>
              <td align="right">代签字是否有授权</td>
              <td><input type="radio" name="dqzysq"  value="Y">
                有
                <input type="radio" name="dqzysq"  value="N">
                无授权 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">验收时间 从</td>
              <td width="33%"> 
              <input type="text" name="crm_gcfxysjl_yssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_gcfxysjl_yssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                验收人              </td>
              <td width="33%"> 
              <input type="text" name="crm_gcfxysjl_ysr" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"> 
                录入人              </td>
              <td width="32%"> 
                <input type="text" name="crm_gcfxysjl_lrr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                录入时间 从              </td>
              <td width="33%"> 
              <input type="text" name="crm_gcfxysjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"> 
                到              </td>
              <td width="32%"> 
                <input type="text" name="crm_gcfxysjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                录入部门              </td>
              <td width="33%"> 
                <select name="crm_gcfxysjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A1','F1') and  cxbz='N' order by ssfgs,dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A1','F1') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                验收记录号              </td>
              <td width="32%"> 
                <input type="text" name="crm_gcfxysjl_ysjlh" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right">结果排序</td>
              <td colspan="3" bgcolor="#CCFFFF"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_gcfxysjl.ysjlh">验收记录号</option>
                  <option value="crm_gcfxysjl.gcysxmbm ">验收项目</option>
                  <option value="crm_gcfxysjl.ysxmflbm ">项目分类</option>
                  <option value="crm_gcfxysjl.ysr ">验收人</option>
                  <option value="crm_gcfxysjl.lrsj desc " selected>录入时间</option>
                  <option value="crm_gcfxysjl.yssj desc " >验收时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">工程担当</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.ysxmflbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期')">工程是否延期</option>
                  <option value="crm_khxx.yqts">工程延期天数</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_gcfxysjl.ysjlh">验收记录号</option>
                  <option value="crm_gcfxysjl.gcysxmbm ">验收项目</option>
                  <option value="crm_gcfxysjl.ysxmflbm ">项目分类</option>
                  <option value="crm_gcfxysjl.ysr ">验收人</option>
                  <option value="crm_gcfxysjl.yssj desc ">验收时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">工程担当</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.ysxmflbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期')">工程是否延期</option>
                  <option value="crm_khxx.yqts">工程延期天数</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_gcfxysjl.ysjlh">验收记录号</option>
                  <option value="crm_gcfxysjl.gcysxmbm ">验收项目</option>
                  <option value="crm_gcfxysjl.ysxmflbm ">项目分类</option>
                  <option value="crm_gcfxysjl.ysr ">验收人</option>
                  <option value="crm_gcfxysjl.yssj desc ">验收时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">工程担当</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.ysxmflbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%" >显示风格</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询明细" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_gcfxysjl_yssj, "验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcfxysjl_yssj2, "验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcfxysjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcfxysjl_lrsj2, "录入时间"))) {
		return false;
	}

	FormName.action="Crm_gcfxysjlList.jsp";


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
