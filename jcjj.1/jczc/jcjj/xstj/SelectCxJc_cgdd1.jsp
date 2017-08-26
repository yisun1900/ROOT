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
      <div align="center">橱柜订单查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="19%">所属公司</td>
              <td width="31%"> <%
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
%> </td>
              <td align="right" width="17%">签约店面</td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1") || yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 订单编号</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_ddbh" size="20" maxlength="9" >
              </td>
              <td width="17%" align="right"> 客户编号</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 合同号</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
              <td width="17%" align="right"> 客户姓名</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 房屋地址</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="17%" align="right"> 联系方式</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">驻店家居顾问</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by yhmc","");
	}
%> 
                </select>
              </td>
              <td width="17%" align="right">展厅家居顾问</td>
              <td width="33%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by yhmc","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">是否需派设计师</td>
              <td width="31%"> 
                <input type="radio" name="sfpsjs" value="1">
                是 
                <input type="radio" name="sfpsjs" value="2">
                否 </td>
              <td align="right" width="17%">橱柜工厂</td>
              <td width="33%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='2' order by ssfgs,gysmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='2' and ssfgs='"+ssfgs+"' order by gysmc","");
		}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 项目专员</td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (dlxmzy.equals(""))
	{
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='10' order by sq_dwxx.ssdw,yhmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssdw='"+ssfgs+"' and zwbm='10' order by yhmc","");
		}
	}
	else{
		out.println("<option value=\""+dlxmzy+"\">"+dlxmzy+"</option>");
	}
%> 
                </select>
              </td>
              <td width="17%" align="right">家居设计师</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_cgsjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"> 计划初测时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_jhccsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right"> 到</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_jhccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"> 实初测时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_sccsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right"> 到</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_sccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">计划复测时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_jhfcsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_jhfcsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">实复测时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_sfcsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_sfcsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">签合同时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_qhtsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right"> 到</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_qhtsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">计划安装日期 从</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_jhazrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_jhazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"> 实安装日期 从</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_sazrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right"> 到</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_sazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">录入时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_lrsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">退单时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_tdsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_tdsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 录入人</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_lrr" size="20" maxlength="20" >
              </td>
              <td width="17%" align="right">客户类型</td>
              <td width="33%"> 
                <input type="radio" name="jc_cgdd_khlx" value="2">
                家装客户 
                <input type="radio" name="jc_cgdd_khlx" value="4">
                非家装客户 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">橱柜款式</td>
              <td width="31%"> 
                <input type="text" name="sdks" size="20" maxlength="50">
              </td>
              <td width="17%" align="right">箱体板材</td>
              <td width="33%"> 
                <input type="text" name="xtbc" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">橱柜花色</td>
              <td width="31%"> 
                <input type="text" name="cghs" size="20" maxlength="50">
              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">台面品牌</td>
              <td width="31%"> 
                <input type="text" name="tmpp" size="20" maxlength="50">
              </td>
              <td width="17%" align="right">台面花色</td>
              <td width="33%"> 
                <input type="text" name="tmhs" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">玻璃材质</td>
              <td width="31%"> 
                <input type="text" name="blcz" size="20" maxlength="50">
              </td>
              <td width="17%" align="right">铰链</td>
              <td width="33%"> 
                <input type="text" name="jiaolian" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 处理状态</td>
              <td width="31%"> 
                <select name="jc_cgdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clzt,clztmc from jdm_cgddzt order by clzt","");
%> 
                </select>
              </td>
              <td width="17%" align="right">退单原因 </td>
              <td width="33%"> 
                <select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">客户完结标志</td>
              <td width="31%"> 
                <input type="radio" name="crm_khxx_wjbz" value="1">
                未完结 
                <input type="radio" name="crm_khxx_wjbz" value="2">
                已完结 </td>
              <td width="17%" align="right">录入部门</td>
              <td width="33%"> 
                <select name="jc_cgdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="19%" align="right">结果排序</td>
              <td colspan="3" bgcolor="#CCFFFF"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="jc_cgdd.lrsj desc">录入时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">家装设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="jc_cgdd.clgw">驻店家居顾问</option>
                  <option value="jc_cgdd.ztjjgw">展厅家居顾问</option>
                  <option value="jc_cgdd.cgsjs">橱柜设计师</option>
                  <option value="jc_cgdd.pdgc">派单工厂</option>
                  <option value="jc_cgdd.clzt">订单状态</option>

                  <option value="jc_cgdd.sdks">橱柜款式</option>
                  <option value="jc_cgdd.xtbc">箱体板材</option>
                  <option value="jc_cgdd.cghs">橱柜花色</option>
                  <option value="jc_cgdd.tmpp">台面品牌</option>
                  <option value="jc_cgdd.tmhs">台面花色</option>
                  <option value="jc_cgdd.blcz">玻璃材质</option>
                  <option value="jc_cgdd.jiaolian">铰链</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_cgdd.lrsj desc">录入时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">家装设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="jc_cgdd.clgw">驻店家居顾问</option>
                  <option value="jc_cgdd.ztjjgw">展厅家居顾问</option>
                  <option value="jc_cgdd.cgsjs">橱柜设计师</option>
                  <option value="jc_cgdd.pdgc">派单工厂</option>
                  <option value="jc_cgdd.clzt">订单状态</option>

                  <option value="jc_cgdd.sdks">橱柜款式</option>
                  <option value="jc_cgdd.xtbc">箱体板材</option>
                  <option value="jc_cgdd.cghs">橱柜花色</option>
                  <option value="jc_cgdd.tmpp">台面品牌</option>
                  <option value="jc_cgdd.tmhs">台面花色</option>
                  <option value="jc_cgdd.blcz">玻璃材质</option>
                  <option value="jc_cgdd.jiaolian">铰链</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_cgdd.lrsj desc">录入时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">家装设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="jc_cgdd.clgw">驻店家居顾问</option>
                  <option value="jc_cgdd.ztjjgw">展厅家居顾问</option>
                  <option value="jc_cgdd.cgsjs">橱柜设计师</option>
                  <option value="jc_cgdd.pdgc">派单工厂</option>
                  <option value="jc_cgdd.clzt">订单状态</option>

                  <option value="jc_cgdd.sdks">橱柜款式</option>
                  <option value="jc_cgdd.xtbc">箱体板材</option>
                  <option value="jc_cgdd.cghs">橱柜花色</option>
                  <option value="jc_cgdd.tmpp">台面品牌</option>
                  <option value="jc_cgdd.tmhs">台面花色</option>
                  <option value="jc_cgdd.blcz">玻璃材质</option>
                  <option value="jc_cgdd.jiaolian">铰链</option>
                </select>
				<br><br>
				第四列 
                <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_cgdd.lrsj desc">录入时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">家装设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="jc_cgdd.clgw">驻店家居顾问</option>
                  <option value="jc_cgdd.ztjjgw">展厅家居顾问</option>
                  <option value="jc_cgdd.cgsjs">橱柜设计师</option>
                  <option value="jc_cgdd.pdgc">派单工厂</option>
                  <option value="jc_cgdd.clzt">订单状态</option>

                  <option value="jc_cgdd.sdks">橱柜款式</option>
                  <option value="jc_cgdd.xtbc">箱体板材</option>
                  <option value="jc_cgdd.cghs">橱柜花色</option>
                  <option value="jc_cgdd.tmpp">台面品牌</option>
                  <option value="jc_cgdd.tmhs">台面花色</option>
                  <option value="jc_cgdd.blcz">玻璃材质</option>
                  <option value="jc_cgdd.jiaolian">铰链</option>
                </select>
                第五列 
                <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_cgdd.lrsj desc">录入时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">家装设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="jc_cgdd.clgw">驻店家居顾问</option>
                  <option value="jc_cgdd.ztjjgw">展厅家居顾问</option>
                  <option value="jc_cgdd.cgsjs">橱柜设计师</option>
                  <option value="jc_cgdd.pdgc">派单工厂</option>
                  <option value="jc_cgdd.clzt">订单状态</option>

                  <option value="jc_cgdd.sdks">橱柜款式</option>
                  <option value="jc_cgdd.xtbc">箱体板材</option>
                  <option value="jc_cgdd.cghs">橱柜花色</option>
                  <option value="jc_cgdd.tmpp">台面品牌</option>
                  <option value="jc_cgdd.tmhs">台面花色</option>
                  <option value="jc_cgdd.blcz">玻璃材质</option>
                  <option value="jc_cgdd.jiaolian">铰链</option>
                </select>
                第六列 
                <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_cgdd.lrsj desc">录入时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">家装设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="jc_cgdd.clgw">驻店家居顾问</option>
                  <option value="jc_cgdd.ztjjgw">展厅家居顾问</option>
                  <option value="jc_cgdd.cgsjs">橱柜设计师</option>
                  <option value="jc_cgdd.pdgc">派单工厂</option>
                  <option value="jc_cgdd.clzt">订单状态</option>

                  <option value="jc_cgdd.sdks">橱柜款式</option>
                  <option value="jc_cgdd.xtbc">箱体板材</option>
                  <option value="jc_cgdd.cghs">橱柜花色</option>
                  <option value="jc_cgdd.tmpp">台面品牌</option>
                  <option value="jc_cgdd.tmhs">台面花色</option>
                  <option value="jc_cgdd.blcz">玻璃材质</option>
                  <option value="jc_cgdd.jiaolian">铰链</option>
                </select>

			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" >显示风格</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
				<input type="button"  value="查询" onClick="f_do(selectform,'cx')">
                <input type="reset"  value="重输">
              </td>
            </tr>
			<tr bgcolor="#FFFFCC"> 
			  <td width="19%" align="right">统计表</td>
			  <td colspan="3"> 第一列 
				<input type="hidden" name="tj1name" value="">
				<select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">家装设计师</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="clgw">驻店家居顾问</option>
                  <option value="ztjjgw">展厅家居顾问</option>
                  <option value="cgsjs">橱柜设计师</option>
                  <option value="gysmc">派单工厂</option>
                  <option value="clztmc">订单状态</option>

                  <option value="sdks">橱柜款式</option>
                  <option value="xtbc">箱体板材</option>
                  <option value="cghs">橱柜花色</option>
                  <option value="tmpp">台面品牌</option>
                  <option value="tmhs">台面花色</option>
                  <option value="blcz">玻璃材质</option>
                  <option value="jiaolian">铰链</option>
				</select>
				第二列 
				<input type="hidden" name="tj2name" value="">
				<select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">家装设计师</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="clgw">驻店家居顾问</option>
                  <option value="ztjjgw">展厅家居顾问</option>
                  <option value="cgsjs">橱柜设计师</option>
                  <option value="gysmc">派单工厂</option>
                  <option value="clztmc">订单状态</option>

                  <option value="sdks">橱柜款式</option>
                  <option value="xtbc">箱体板材</option>
                  <option value="cghs">橱柜花色</option>
                  <option value="tmpp">台面品牌</option>
                  <option value="tmhs">台面花色</option>
                  <option value="blcz">玻璃材质</option>
                  <option value="jiaolian">铰链</option>
				</select>
				第三列 
				<input type="hidden" name="tj3name" value="">
				<select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">家装设计师</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="clgw">驻店家居顾问</option>
                  <option value="ztjjgw">展厅家居顾问</option>
                  <option value="cgsjs">橱柜设计师</option>
                  <option value="gysmc">派单工厂</option>
                  <option value="clztmc">订单状态</option>

                  <option value="sdks">橱柜款式</option>
                  <option value="xtbc">箱体板材</option>
                  <option value="cghs">橱柜花色</option>
                  <option value="tmpp">台面品牌</option>
                  <option value="tmhs">台面花色</option>
                  <option value="blcz">玻璃材质</option>
                  <option value="jiaolian">铰链</option>
				</select>
				<br>
				<br>
				第四列 
				<input type="hidden" name="tj4name" value="">
				<select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">家装设计师</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="clgw">驻店家居顾问</option>
                  <option value="ztjjgw">展厅家居顾问</option>
                  <option value="cgsjs">橱柜设计师</option>
                  <option value="gysmc">派单工厂</option>
                  <option value="clztmc">订单状态</option>

                  <option value="sdks">橱柜款式</option>
                  <option value="xtbc">箱体板材</option>
                  <option value="cghs">橱柜花色</option>
                  <option value="tmpp">台面品牌</option>
                  <option value="tmhs">台面花色</option>
                  <option value="blcz">玻璃材质</option>
                  <option value="jiaolian">铰链</option>
				</select>
				第五列 
				<input type="hidden" name="tj5name" value="">
				<select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">家装设计师</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="clgw">驻店家居顾问</option>
                  <option value="ztjjgw">展厅家居顾问</option>
                  <option value="cgsjs">橱柜设计师</option>
                  <option value="gysmc">派单工厂</option>
                  <option value="clztmc">订单状态</option>

                  <option value="sdks">橱柜款式</option>
                  <option value="xtbc">箱体板材</option>
                  <option value="cghs">橱柜花色</option>
                  <option value="tmpp">台面品牌</option>
                  <option value="tmhs">台面花色</option>
                  <option value="blcz">玻璃材质</option>
                  <option value="jiaolian">铰链</option>
				</select>
				第六列 
				<input type="hidden" name="tj6name" value="">
				<select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">家装设计师</option>
                  <option value="jc_cgdd.xmzy">项目专员</option>
                  <option value="clgw">驻店家居顾问</option>
                  <option value="ztjjgw">展厅家居顾问</option>
                  <option value="cgsjs">橱柜设计师</option>
                  <option value="gysmc">派单工厂</option>
                  <option value="clztmc">订单状态</option>

                  <option value="sdks">橱柜款式</option>
                  <option value="xtbc">箱体板材</option>
                  <option value="cghs">橱柜花色</option>
                  <option value="tmpp">台面品牌</option>
                  <option value="tmhs">台面花色</option>
                  <option value="blcz">玻璃材质</option>
                  <option value="jiaolian">铰链</option>
				</select>
			  </td>
			</tr>
			<tr align="center"> 
			  <td colspan="4"> 
				<input type="button"  value="统计表" onClick="f_do(selectform,'tj')" name="button2">
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
	if(!(isDatetime(FormName.jc_cgdd_jhccsj, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhccsj2, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sccsj, "实初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sccsj2, "实初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhfcsj, "计划复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhfcsj2, "计划复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sfcsj, "实复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sfcsj2, "实复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_qhtsj, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_qhtsj2, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhazrq, "计划安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhazrq2, "计划安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq, "实安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq2, "实安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_tdsj, "退单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_tdsj2, "退单时间"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Jc_cgddCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jc_cgddTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
