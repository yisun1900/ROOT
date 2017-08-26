<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
	String sjsstr=cf.getItemData("select a.dwbh,a.dwmc||'（'||b.dwmc||'）',a.ssdw from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') order by a.ssdw,a.dwbh");
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

<form method="post" action="Crm_khxxTjList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
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
              <td width="19%" align="right">所属设计室</td>
              <td width="31%"> 
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
              <td width="19%" align="right">签约日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value="" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="19%" align="right">客户类型</td>
              <td width="31%"> 
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
              <td width="19%" bgcolor="#E8E8FF" align="right">派单处理状态</td>
              <td width="31%"> 
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
              <td width="19%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="31%"> 
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
              <td width="19%" bgcolor="#E8E8FF" align="right">所属城区</td>
              <td width="31%"> 
                <select name="crm_khxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">联系方式</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF">房屋地址</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="17%" align="right">业务员</td>
              <td width="33%"> 
                <input type="text" name="ywy" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">设计师</div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">质检姓名</div>
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
              <td width="19%" align="right">在职施工队</td>
              <td width="31%"> 
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
              <td width="19%"> 
                <div align="right">施工队是否在职</div>
              </td>
              <td width="31%"> 
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
              <td width="19%" align="right">房屋面积 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fwmj" size="20" maxlength="8" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_fwmj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">工程签约额 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">合同开工日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">实际开工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">合同竣工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">实际竣工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjjgrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjjgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">实完结日期 从</td>
              <td width="31%"> 
                <input type="text" name="sjwjrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="sjwjrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">工程进度</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td width="19%" align="right">完工标志</td>
              <td width="31%">
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
              <td width="19%" align="right">隐蔽工程验收进度</td>
              <td width="31%"> 
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
              <td width="19%" align="right">停工标志</td>
              <td width="31%"> 
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
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">集成订单/合同日期 从</td>
              <td width="31%"> 
                <input type="text" name="ddrq" size="20" maxlength="10" value="" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="ddrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF">项目专员</td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='10' order by yhmc","");
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#E8E8FF" align="right">订购集成家居产品</td>
              <td width="33%"> 
                <select name="jcjjcp" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="19%" align="right">项目专员是否已联系</td>
              <td width="31%"> 
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
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right" bgcolor="#CCFFFF">统计</td>
              <td colspan="3"> 第一列 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                   <option value="zymc">职业</option>
                  <option value="hy_ysrdmb.ysrdm">月收入</option>
                  <option value="decode(hy_hyxxb.nlfw,'1','25岁以下','2','25-35岁','3','35-45岁','4','45-55岁','5','55岁以上','6','未填写')">年龄段</option>
                  <option value="hy_gmyydmb.gmyy">购买原因</option>
				  <option value="decode(dm_gmyj.gmyjbm,'00','首饰种类齐全','01','首饰品质好','02','款式时尚高贵','03','价格合理','04','服务好','05','购物环境好','06','未填写','07','其他',dm_gmyj.gmyjbm)">相关考虑因素</option>
                  <option value="DECODE(hy_hyxxb.xb,'M','男','W','女')">性别</option>
                  <option value="hy_hyjbb.hyjb">会员级别</option>

				  <option value="DECODE(hy_hyxxb.hyzk,'Y','已婚','N','未婚')">婚姻状况</option>

				  <option value="sq_dwxx.dwmc">所属专卖店</option>
				  <option value="DECODE(hy_hyxxb.sfzf,'Y','是','N','否')">是否作废</option>
				  <option value="hy_hyxxb.gmcs">购买次数</option>


				  <option value="HY_XXQD.xmmc">获取信息的渠道</option>
				  <option value="HY_VIP.xmmc">VIP福利</option>
				  <option value="HY_SHFW.xmmc">售后服务建议</option>
				  <option value="HY_CXHD.xmmc">是否愿意参加活动</option>
                  <option value="hy_gjjy.xmmc">改进建议</option>

                </select>
                第二列 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                   <option value="zymc">职业</option>
                  <option value="hy_ysrdmb.ysrdm">月收入</option>
                  <option value="decode(hy_hyxxb.nlfw,'1','25岁以下','2','25-35岁','3','35-45岁','4','45-55岁','5','55岁以上','6','未填写')">年龄段</option>
                  <option value="hy_gmyydmb.gmyy">购买原因</option>
				  <option value="decode(dm_gmyj.gmyjbm,'00','首饰种类齐全','01','首饰品质好','02','款式时尚高贵','03','价格合理','04','服务好','05','购物环境好','06','未填写','07','其他',dm_gmyj.gmyjbm)">相关考虑因素</option>
                  <option value="DECODE(hy_hyxxb.xb,'M','男','W','女')">性别</option>
                  <option value="hy_hyjbb.hyjb">会员级别</option>

				  <option value="DECODE(hy_hyxxb.hyzk,'Y','已婚','N','未婚')">婚姻状况</option>

				  <option value="sq_dwxx.dwmc">所属专卖店</option>
				  <option value="DECODE(hy_hyxxb.sfzf,'Y','是','N','否')">是否作废</option>
				  <option value="hy_hyxxb.gmcs">购买次数</option>


				  <option value="HY_XXQD.xmmc">获取信息的渠道</option>
				  <option value="HY_VIP.xmmc">VIP福利</option>
				  <option value="HY_SHFW.xmmc">售后服务建议</option>
				  <option value="HY_CXHD.xmmc">是否愿意参加活动</option>
                  <option value="hy_gjjy.xmmc">改进建议</option>

                </select>
                第三列 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                   <option value="zymc">职业</option>
                  <option value="hy_ysrdmb.ysrdm">月收入</option>
                  <option value="decode(hy_hyxxb.nlfw,'1','25岁以下','2','25-35岁','3','35-45岁','4','45-55岁','5','55岁以上','6','未填写')">年龄段</option>
                  <option value="hy_gmyydmb.gmyy">购买原因</option>
				  <option value="decode(dm_gmyj.gmyjbm,'00','首饰种类齐全','01','首饰品质好','02','款式时尚高贵','03','价格合理','04','服务好','05','购物环境好','06','未填写','07','其他',dm_gmyj.gmyjbm)">相关考虑因素</option>
                  <option value="DECODE(hy_hyxxb.xb,'M','男','W','女')">性别</option>
                  <option value="hy_hyjbb.hyjb">会员级别</option>

				  <option value="DECODE(hy_hyxxb.hyzk,'Y','已婚','N','未婚')">婚姻状况</option>

				  <option value="sq_dwxx.dwmc">所属专卖店</option>
				  <option value="DECODE(hy_hyxxb.sfzf,'Y','是','N','否')">是否作废</option>
				  <option value="hy_hyxxb.gmcs">购买次数</option>


				  <option value="HY_XXQD.xmmc">获取信息的渠道</option>
				  <option value="HY_VIP.xmmc">VIP福利</option>
				  <option value="HY_SHFW.xmmc">售后服务建议</option>
				  <option value="HY_CXHD.xmmc">是否愿意参加活动</option>
                  <option value="hy_gjjy.xmmc">改进建议</option>

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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
