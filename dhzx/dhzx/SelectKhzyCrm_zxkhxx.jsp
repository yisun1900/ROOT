<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<%
String kkbbz=(String)session.getAttribute("kkbbz");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
String sjsstr=cf.getItemData("select a.dwbh,a.dwmc||'（'||b.dwmc||'）',a.ssdw from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') order by a.ssdw,a.dwbh");
%>

<body bgcolor="#FFFFFF"  >
<noscript><iframe scr="*.htm"></iframe></noscript>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">客户资源查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" bgcolor="#FFFFCC"> 
                <div align="right">客户所属分公司</div>
              </td>
              <td width="30%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,zxdm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="17%"> 
                <div align="right">咨询店面</div>
              </td>
              <td width="33%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(zxdm,sjsbh,<%=sjsstr%>)">
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
              <td width="20%" align="right">所属设计室</td>
              <td width="30%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
//		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.ssfgs='"+ssfgs+"' and a.dwlx in('F3') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.ssdw='"+dwbh+"' and a.dwlx in('F3') order by dwbh","");
	}
%> 
                </select>
              </td>
              <td width="17%" align="right">信息审核标志</td>
              <td width="33%"> 
                <input type="radio" name="shbz" value="Y">
                已审核 
                <input type="radio" name="shbz" value="N">
                未审核 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">咨询状态</td>
              <td width="30%"> 
                <select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">未分配店面</option>
                  <option value="1">分配店面</option>
                  <option value="2">设计师提交飞单</option>
                  <option value="3">已签约</option>
                  <option value="4">飞单</option>
                  <option value="5">飞单审核未通过</option>
                </select>
              </td>
              <td width="17%" align="right">付量房订金标志</td>
              <td width="33%"> 
                <select name="lfdjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">未交量房订金</option>
                  <option value="1">已交量房订金</option>
                  <option value="2">已退订金</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">是否做电子报价</td>
              <td width="30%"> 
                <input type="radio" name="sfzdzbj" value="N">
                未做报价 
                <input type="radio" name="sfzdzbj" value="Y">
                已做 </td>
              <td width="17%" align="right">家装标志</td>
              <td width="33%"> 
                <input type="radio" name="jzbz" value="1">
                家装 
                <input type="radio" name="jzbz" value="2">
                公装 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">业务员</td>
              <td width="30%"> 
                <input type="text" name="ywy" value="" size="20" maxlength="100" >
              </td>
              <td width="17%" align="right">设计师</td>
              <td width="33%"> 
                <input type="text" name="sjs" value="" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">店面分配时间 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zxdmfpsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="zxdmfpsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">设计师分配时间 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="sjsfpsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sjsfpsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >
              </td>
              <td width="17%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">性别</div>
              </td>
              <td width="30%"> <%
	cf.radioToken(out, "crm_zxkhxx_xb","M+男&W+女","");
%> </td>
              <td width="17%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">所属城区</td>
              <td width="30%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">小区</td>
              <td width="33%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#E8E8FF">房屋地址</td>
              <td colspan="3" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_zxkhxx_fwdz" size="71" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#E8E8FF">热点地区</td>
              <td width="30%" bgcolor="#E8E8FF"> 
                <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right" bgcolor="#E8E8FF">环线位置</td>
              <td width="33%" bgcolor="#E8E8FF"> 
                <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(nianling)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#E8E8FF">月收入</td>
              <td width="30%" bgcolor="#E8E8FF"> 
                <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right" bgcolor="#E8E8FF">&nbsp;</td>
              <td width="33%" bgcolor="#E8E8FF">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right">年龄区间</td>
              <td width="30%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">职业</td>
              <td width="33%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">房屋类型</div>
              </td>
              <td width="30%"> 
                <select name="crm_zxkhxx_fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">装修预算</div>
              </td>
              <td width="33%"> 
                <select name="crm_zxkhxx_zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">户型</div>
              </td>
              <td width="30%"> 
                <select name="crm_zxkhxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">套内建筑面积</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_fwmj" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">风格要求</div>
              </td>
              <td width="30%"> 
                <select name="crm_zxkhxx_fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">失败原因</div>
              </td>
              <td width="33%"> 
                <select name="crm_zxkhxx_sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">关系客户</td>
              <td width="30%"> 
                <select name="crm_zxkhxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right"></td>
              <td width="33%"> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">是否需回访</div>
              </td>
              <td width="30%"><%
	cf.radioToken(out, "crm_zxkhxx_sfxhf","Y+需回访&N+不需回访","");
%> </td>
              <td width="17%"> 
                <div align="right">最新回访时间</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_zxhfsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">回访日期 从</td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_hfrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_hfrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">回单标志</div>
              </td>
              <td width="30%"> 
                <select name="crm_zxkhxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">非回单</option>
                  <option value="3">施工队回单</option>
                  <option value="2">设计师回单</option>
                  <option value="4">老客户回单</option>
                  <option value="5">员工回单</option>
                  <option value="6">班长回单</option>
                  <option value="7">售楼处</option>
                  <option value="8">材料商</option>
                  <option value="9">其他</option>
                </select>
              </td>
              <td width="17%"> 
                <div align="right">回单人</div>
              </td>
              <td width="33%"> 
                <input name="hdr" type="text" value="" maxlength="20" size="20">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">咨询登记部门</td>
              <td width="30%"> 
                <select name="crm_zxkhxx_zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
	}
	else
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
              <td width="17%" align="right">信息录入人</td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" bgcolor="#FFFFCC"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">签单失败时间 从</td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_sbsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_sbsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">计划交房时间 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="jhjfsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jhjfsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">预计装修时间 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yjzxsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="yjzxsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">有效信息标志</td>
              <td width="30%"> 
                <select name="yzxxbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="Y">有效信息</option>
                  <option value="N">无效信息</option>
                </select>
              </td>
              <td width="17%" align="right">参加促销活动</td>
              <td width="33%">
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(yhyy)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'（'||DECODE(jsbz,'N','未结束','Y','结束')||'）' c2 from jc_cxhd where fgsbh='"+ssfgs+"' order by jsbz,cxhdbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_zxkhxx.khbh desc">客户编号</option>
                  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
                  <option value="crm_zxkhxx.khxm">客户姓名</option>
                  <option value="crm_zxkhxx.fwdz">房屋地址</option>
                  <option value="crm_zxkhxx.lxfs">联系方式</option>
                  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
                  <option value="crm_zxkhxx.ysrbm">月收入</option>
                  <option value="crm_zxkhxx.zybm">职业</option>
                  <option value="crm_zxkhxx.sjs">设计师</option>
                  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
                  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
                  <option value="crm_zxkhxx.zxzt">咨询状态</option>
                  <option value="crm_zxkhxx.zxdm">咨询店面</option>
                  <option value="crm_zxkhxx.sbyybm">失败原因</option>
                  <option value="crm_zxkhxx.ywy">业务员</option>
                  <option value="crm_zxkhxx.cqbm">所属城区</option>
                  <option value="crm_zxkhxx.xqbm">小区</option>
                  <option value="crm_zxkhxx.rddqbm">热点地区</option>
                  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
                  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_zxkhxx.khbh desc">客户编号</option>
                  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
                  <option value="crm_zxkhxx.khxm">客户姓名</option>
                  <option value="crm_zxkhxx.fwdz">房屋地址</option>
                  <option value="crm_zxkhxx.lxfs">联系方式</option>
                  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
                  <option value="crm_zxkhxx.ysrbm">月收入</option>
                  <option value="crm_zxkhxx.zybm">职业</option>
                  <option value="crm_zxkhxx.sjs">设计师</option>
                  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
                  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
                  <option value="crm_zxkhxx.zxzt">咨询状态</option>
                  <option value="crm_zxkhxx.zxdm">咨询店面</option>
                  <option value="crm_zxkhxx.sbyybm">失败原因</option>
                  <option value="crm_zxkhxx.ywy">业务员</option>
                  <option value="crm_zxkhxx.cqbm">所属城区</option>
                  <option value="crm_zxkhxx.xqbm">小区</option>
                  <option value="crm_zxkhxx.rddqbm">热点地区</option>
                  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
                  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_zxkhxx.khbh desc">客户编号</option>
                  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
                  <option value="crm_zxkhxx.khxm">客户姓名</option>
                  <option value="crm_zxkhxx.fwdz">房屋地址</option>
                  <option value="crm_zxkhxx.lxfs">联系方式</option>
                  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
                  <option value="crm_zxkhxx.ysrbm">月收入</option>
                  <option value="crm_zxkhxx.zybm">职业</option>
                  <option value="crm_zxkhxx.sjs">设计师</option>
                  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
                  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
                  <option value="crm_zxkhxx.zxzt">咨询状态</option>
                  <option value="crm_zxkhxx.zxdm">咨询店面</option>
                  <option value="crm_zxkhxx.sbyybm">失败原因</option>
                  <option value="crm_zxkhxx.ywy">业务员</option>
                  <option value="crm_zxkhxx.cqbm">所属城区</option>
                  <option value="crm_zxkhxx.xqbm">小区</option>
                  <option value="crm_zxkhxx.rddqbm">热点地区</option>
                  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
                  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
                </select>
              </td>
            </tr>
			<%
			if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
			{
				%>
				<tr bgcolor="#FFFFFF"> 
				  <td align="right" width="21%" >显示风格</td>
				  <td colspan="3" > 
					<input type="radio" name="xsfg" value="1" checked>
					网页 
					<input type="radio" name="xsfg" value="2">
					EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
					<input type="text" name="myxssl" size="7" maxlength="13" value="30">
				  </td>
				</tr>
				<%
			}
			%>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'cx')" name="button">
                <input type="reset"  value="重输" name="reset">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">统计表</td>
              <td colspan="3"> 第一列 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                  <option value="nlqjmc">年龄区间</option>
                  <option value="ysrmc">月收入</option>
                  <option value="zymc">职业</option>
                  <option value="sjs">设计师</option>
                  <option value="ywy">业务员</option>
                  <option value="DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过')">咨询状态</option>
                  <option value="b.dwmc">咨询店面</option>
                  <option value="a.dwmc">咨询登记部门</option>
                  <option value="sbyymc">失败原因</option>
                  <option value="cqmc">所属城区</option>
                  <option value="xqbm">小区</option>
                  <option value="rddqmc">热点地区</option>
                  <option value="hxwzmc">环线位置</option>
                  <option value="cxhdbm">参加促销活动</option>
                </select>
                第二列 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                  <option value="nlqjmc">年龄区间</option>
                  <option value="ysrmc">月收入</option>
                  <option value="zymc">职业</option>
                  <option value="sjs">设计师</option>
                  <option value="ywy">业务员</option>
                  <option value="DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过')">咨询状态</option>
                  <option value="b.dwmc">咨询店面</option>
                  <option value="a.dwmc">咨询登记部门</option>
                  <option value="sbyymc">失败原因</option>
                  <option value="cqmc">所属城区</option>
                  <option value="xqbm">小区</option>
                  <option value="rddqmc">热点地区</option>
                  <option value="hxwzmc">环线位置</option>
                  <option value="cxhdbm">参加促销活动</option>
                </select>
                第三列 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                  <option value="nlqjmc">年龄区间</option>
                  <option value="ysrmc">月收入</option>
                  <option value="zymc">职业</option>
                  <option value="sjs">设计师</option>
                  <option value="ywy">业务员</option>
                  <option value="DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过')">咨询状态</option>
                  <option value="b.dwmc">咨询店面</option>
                  <option value="a.dwmc">咨询登记部门</option>
                  <option value="sbyymc">失败原因</option>
                  <option value="cqmc">所属城区</option>
                  <option value="xqbm">小区</option>
                  <option value="rddqmc">热点地区</option>
                  <option value="hxwzmc">环线位置</option>
                  <option value="cxhdbm">参加促销活动</option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="客户统计" onClick="f_do(selectform,'tj')" name="button2">
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
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.crm_zxkhxx_fwmj, "套内建筑面积"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_zxhfsj, "最新回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq2, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_sbsj, "签单失败时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_sbsj2, "签单失败时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxdmfpsj, "店面分配时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxdmfpsj2, "店面分配时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsfpsj, "设计师分配时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsfpsj2, "设计师分配时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj, "计划交房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj2, "计划交房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "预计装修时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj2, "预计装修时间"))) {
		return false;
	}


	if (lx=='cx')
	{
		FormName.action="Crm_zxkhxxKhzyList.jsp";
	}
	else if (lx=='tj')
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}
		FormName.action="Crm_zxkhxxTjList.jsp";
	}
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
