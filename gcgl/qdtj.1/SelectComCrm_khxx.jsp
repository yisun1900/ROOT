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
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='050110'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[通用查询]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<%
	String kkbbz=(String)session.getAttribute("kkbbz");
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String sjsstr=cf.getItemData("select a.dwbh,a.dwmc||'（'||b.dwmc||'）',a.ssdw from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') order by a.ssdw,a.dwbh");
	
	String ppstr="";
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		ppstr=cf.getItemData("select gysbh,gysmc,gyslb from sq_gysxx order by gyslb,gysmc");
	}
	else{
		ppstr=cf.getItemData("select gysbh,gysmc,gyslb from sq_gysxx where ssfgs='"+ssfgs+"' order by gyslb,gysmc");
	}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">签单查询-快速检索</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxJyList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">分公司</div>
              </td>
              <td width="30%"> <%
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
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(crm_khxx_dwbh,sjsbh,<%=sjsstr%>)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
//	cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') order by dwbh","");
%> 
                </select>
              </td>
              <td width="17%" align="right">合同号</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">签约日期 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value="" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">家装标志</td>
              <td width="30%"> 
                <input type="radio" name="jzbz" value="1">
                家装 
                <input type="radio" name="jzbz" value="2">
                公装 </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="20%" align="right">关系客户</td>
              <td width="30%"> 
                <select name="crm_khxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">回单标志</td>
              <td width="33%"> 
                <select name="crm_khxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" bgcolor="#E8E8FF" align="right">派单处理状态</td>
              <td width="30%"> 
                <select name="crm_khxx_pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未派单&2+派单&4+接受派单","");
%> 
                </select>
              </td>
              <td width="17%" align="right">出开工证标志</td>
              <td width="33%"> 
                <select name="kgzbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未出开工证</option>
                  <option value="Y">已出开工证</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_khbh" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" bgcolor="#E8E8FF" align="right">房屋地址</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="17%" align="right">联系方式</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#E8E8FF">所属城区</td>
              <td width="30%" bgcolor="#E8E8FF"> 
                <select name="crm_khxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right" bgcolor="#E8E8FF">小区/街道</td>
              <td width="33%" bgcolor="#E8E8FF"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#E8E8FF">所属热点地区</td>
              <td width="30%" bgcolor="#E8E8FF"> 
                <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right" bgcolor="#E8E8FF">所属环线位置</td>
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
              <td width="17%" align="right" bgcolor="#E8E8FF">身份证号码</td>
              <td width="33%" bgcolor="#E8E8FF"> 
                <input type="text" name="sfzhm" size="20" maxlength="20" >
              </td>
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
                <div align="right">设计师</div>
              </td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">工程担当</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='05' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' order by yhmc","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">在职施工队</td>
              <td width="30%"> 
                <select name="zzsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where cxbz='N'  order by sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssdw='"+ssfgs+"' and cxbz='N' order by sgdmc","");
	}
%> 
                </select>
              </td>
              <td width="17%" align="right">全部施工队</td>
              <td width="33%"> 
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
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">施工队是否在职</div>
              </td>
              <td width="30%"> 
                <input type="radio" name="cxbz" value="N">
                在职 
                <input type="radio" name="cxbz" value="Y">
                离职 </td>
              <td width="17%"> 
                <div align="right">施工班组</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">房屋面积 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwmj" size="20" maxlength="8" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_fwmj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">工程签约额 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" bgcolor="#FFFFCC"> 
                <div align="right">合同开工日期 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">实际开工日期 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">合同竣工日期 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF">实际竣工日期 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjjgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjjgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">实完结日期 从</td>
              <td width="30%"> 
                <input type="text" name="sjwjrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="sjwjrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">工程进度</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">业务员</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ywy" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">完工标志</td>
              <td width="30%"> 
                <select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未完工&2+已完工","");
%> 
                </select>
              </td>
              <td width="17%" align="right">完结标志</td>
              <td width="33%"> 
                <select name="crm_khxx_wjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未完结&2+已完结","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">隐蔽工程验收进度</td>
              <td width="30%"> 
                <select name="ybysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='3' order by gcjdbm,gcyszxmbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">中期验收进度</td>
              <td width="33%"> 
                <select name="zqysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='4' order by gcjdbm,gcyszxmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">停工标志</td>
              <td width="30%"> 
                <select name="tgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="W">正常</option>
                  <option value="Y">已停工</option>
                  <option value="N">停工已复工</option>
                </select>
              </td>
              <td width="17%" align="right">退单标志</td>
              <td width="33%"> 
                <select name="crm_khxx_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"2+未退单&3+已退单","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">投诉标志</td>
              <td width="30%"> 
                <input type="radio" name="tsbz" value="Y">
                有投诉 
                <input type="radio" name="tsbz" value="N">
                无投诉 </td>
              <td width="17%" align="right">报修标志</td>
              <td width="33%"> 
                <input type="radio" name="bxbz" value="Y">
                有报修 
                <input type="radio" name="bxbz" value="N">
                无报修 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">工程是否延期</td>
              <td width="30%"> 
                <input type="radio" name="gcsfyq" value="1">
                未延期 
                <input type="radio" name="gcsfyq" value="2">
                延期 </td>
              <td width="17%" align="right">工程延期原因</td>
              <td width="33%"> 
                <select name="gcyqyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyqyybm,gcyqyymc from dm_gcyqyybm order by gcyqyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">总延期天数 从</td>
              <td width="30%"> 
                <input type="text" name="yqts" value="" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="yqts2" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">某项原因延期天数 从</td>
              <td width="30%"> 
                <input type="text" name="yyyqts" value="" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="yyyqts2" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">水质分析卡是否发放</td>
              <td width="30%"> 
                <input type="radio" name="sffk" value="Y">
                发卡 
                <input type="radio" name="sffk" value="N">
                未发卡 </td>
              <td width="17%" align="right">登记卡号</td>
              <td width="33%"> 
                <input type="text" name="djkh" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">发卡日期 从</td>
              <td width="30%"> 
                <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="fkrq2" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right">集成订单/合同日期 从</td>
              <td width="30%"> 
                <input type="text" name="ddrq" size="20" maxlength="10" value=""  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="ddrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right" bgcolor="#E8E8FF">项目专员</td>
              <td width="30%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='10' order by yhmc","");
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#E8E8FF" align="right">订购集成家居产品</td>
              <td width="33%"> 
                <select name="jcjjcp" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(jcjjcp,gysbh,<%=ppstr%>);selectItem(jcjjcp,jcddzt,'[1]录入未完成%00+预订单完成%01+已派单%02+已完成初测%03+签订合同%04+收款确认%23+工厂接收%05+已入库%06+已确定安装时间%07+已通知安装%09+开始安装%11+安装完成%15+已完结%20+取消订单%99[2]预订单未完成%00+预订单已完成%01+已派设计师%03+确定初测时间%05+已初测%07+已通知复测%09+已复测%11+签订合同%13+交款已确认%15+已派工厂%17+工厂接收%19+已入库%25+确定安装时间%27+已通知安装%29+开始安装%31+安装完成%33+已完结%35+退单%99[3]预订单未完成%00+预订单已完成%01+已派设计师%03+确定初测时间%05+已初测%07+签订合同%13+交款已确认%15+已派工厂%17+工厂接收%19+已入库%25+确定安装时间%27+已通知安装%29+开始安装%31+安装完成%33+已完结%35+退单%99[4]录入预订单%00+测量已通知%01+已测量%02+合同未完成%03+合同已完成%04+合同已确认%05+确定送货时间%06+已通知送货%07+已送货%09+已通知退补货%11+已退补货%13+单项完结%20+退单%99');">
                  <option value=""></option>
                  <option value="1">木门</option>
                  <option value="2">橱柜</option>
                  <option value="3">家具</option>
                  <option value="4">主材</option>
                  <option value="5">全部</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right">项目专员是否已联系</td>
              <td width="30%"> 
                <select name="sfylx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未联系</option>
                  <option value="Y">已联系</option>
                </select>
              </td>
              <td width="17%" bgcolor="#E8E8FF" align="right">客户接受联系方式</td>
              <td width="33%"> 
                <select name="jslxfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">电话联系</option>
                  <option value="2">发短信</option>
                  <option value="3">不受限制</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right">工厂/品牌</td>
              <td width="30%"> 
                <select name="gysbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                </select>
              </td>
              <td width="17%" bgcolor="#E8E8FF" align="right">家居设计师</td>
              <td width="33%"> 
                <input type="text" name="jjsjs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right">订单状态</td>
              <td width="30%"> 
                <select name="jcddzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                </select>
              </td>
              <td width="17%" bgcolor="#E8E8FF" align="right">参加促销活动</td>
              <td width="33%"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(yhyy)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'（'||DECODE(jsbz,'N','未结束','Y','结束')||'）' c2 from jc_cxhd  where fgsbh='"+ssfgs+"' order by jsbz,cxhdbm","");
%> 
                </select>
              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10"  value=""  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10"  value=""  ondblclick="JSCalendar(this)">
              </td>
            </tr>

            <tr bgcolor="#CCFFFF"> 
              <td width="20%" align="right">结果排序</td>
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
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)" name="button">
                <input type="reset"  value="重输" name="reset">
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
	if(!(isNumber(FormName.crm_khxx_fwmj, "房屋面积"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fwmj2, "房屋面积"))) {
		return false;
	}
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
	if(!(isDatetime(FormName.ddrq, "订单合同日期 "))) {
		return false;
	}
	if(!(isDatetime(FormName.ddrq2, "订单合同日期 "))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq2, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq, "实际竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq2, "实际竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq, "实际完结日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq2, "实际完结日期"))) {
		return false;
	}
	if(!(isNumber(FormName.yqts, "延期天数"))) {
		return false;
	}
	if(!(isNumber(FormName.yqts2, "延期天数"))) {
		return false;
	}
	if(!(isDatetime(FormName.fkrq, "发卡日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.fkrq2, "发卡日期"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "录入时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "录入时间"))) {
		return false;
	}

	if (FormName.ddrq.value=="" && FormName.ddrq2.value=="" && FormName.xmzy.value=="" && FormName.jcjjcp.value=="" && FormName.sfylx.value=="" && FormName.jslxfs.value=="")
	{
		FormName.action="Crm_khxxComList.jsp";
	}
	else{
		FormName.action="Crm_khxxComJcList.jsp";
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
