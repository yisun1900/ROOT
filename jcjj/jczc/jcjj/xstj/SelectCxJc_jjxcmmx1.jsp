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
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");

String ssfgs=request.getParameter("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">型材门--查询</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">所属公司</td>
      <td width="30%"> <%
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
%> </td>
      <td width="20%" align="right">签约店面</td>
      <td width="30%"> 
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
      <td align="right" width="20%">客户编号</td>
      <td width="30%"> 
        <input type="text" name="jc_jjdd_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">合同号</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">客户姓名</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">房屋地址</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">联系方式</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
      <td align="right" width="20%">家装设计师</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">签约日期 从</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%">到</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">施工队</td>
      <td width="30%"> 
        <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc","");
%> 
        </select>
      </td>
      <td align="right" width="20%">质检</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">订单编号</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_ddbh" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">处理状态</td>
      <td width="30%"> 
        <select name="jc_jjdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select clzt,clztmc from jdm_jjddzt order by clzt","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">驻店家居顾问</td>
      <td width="30%"> 
        <select name="jc_jjdd_clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
      <td align="right" width="20%">展厅家居顾问</td>
      <td width="30%"> 
        <select name="jc_jjdd_ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">家具设计师</td>
      <td width="30%"> 
        <select name="jc_jjdd_jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2 from sq_yhxx where zwbm='12' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
      <td align="right" width="20%">项目专员</td>
      <td width="30%"> 
        <select name="jc_jjdd_xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2 from sq_yhxx where zwbm='10' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">家具工厂</td>
      <td width="30%"> 
        <select name="jc_jjdd_pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and ssfgs='"+ssfgs+"' order by gysmc","");
%> 
        </select>
      </td>
      <td align="right" width="20%">型材门工厂</td>
      <td width="30%"> 
        <select name="jc_jjdd_xcmgc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and ssfgs='"+ssfgs+"' order by gysmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">型材门名称</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_xcmmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">安装位置</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_azwz" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">边框系列型号</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_bklxxh" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">边框颜色</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_bkys" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">面板材料1</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_mbcl1" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">面板材料2</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_mbcl2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">签合同时间 从</td>
      <td width="30%"> 
        <input type="text" name="jc_jjdd_qhtsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%">到</td>
      <td width="30%"> 
        <input type="text" name="jc_jjdd_qhtsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">录入时间 从</td>
      <td width="30%"> 
        <input type="text" name="jc_jjdd_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%">到</td>
      <td width="30%"> 
        <input type="text" name="jc_jjdd_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#CCFFFF"> 
      <td width="20%" align="right">结果排序</td>
      <td colspan="3" bgcolor="#CCFFFF"> 第一列 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="jc_jjdd.lrsj desc">录入时间</option>
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

          <option value="jc_jjdd.ddbh">订单编号</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="jc_jjdd.clgw">驻店家居顾问</option>
          <option value="jc_jjdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_jjdd.jjsjs">家居设计师</option>
          <option value="jc_jjdd.pdgc">家具工厂</option>
          <option value="jc_jjdd.xcmgc">型材门工厂</option>
          <option value="jc_jjdd.clzt">订单状态</option>

          <option value="jc_jjxcmmx.xcmmc">型材门名称</option>
          <option value="jc_jjxcmmx.azwz">安装位置</option>
          <option value="jc_jjxcmmx.bklxxh">边框系列型号</option>
          <option value="jc_jjxcmmx.bkys">边框颜色</option>
          <option value="jc_jjxcmmx.mbcl1">面板材料1</option>
          <option value="jc_jjxcmmx.mbcl2">面板材料2</option>
        </select>
        第二列 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_jjdd.lrsj desc">录入时间</option>
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

          <option value="jc_jjdd.ddbh">订单编号</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="jc_jjdd.clgw">驻店家居顾问</option>
          <option value="jc_jjdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_jjdd.jjsjs">家居设计师</option>
          <option value="jc_jjdd.pdgc">家具工厂</option>
          <option value="jc_jjdd.xcmgc">型材门工厂</option>
          <option value="jc_jjdd.clzt">订单状态</option>

          <option value="jc_jjxcmmx.xcmmc">型材门名称</option>
          <option value="jc_jjxcmmx.azwz">安装位置</option>
          <option value="jc_jjxcmmx.bklxxh">边框系列型号</option>
          <option value="jc_jjxcmmx.bkys">边框颜色</option>
          <option value="jc_jjxcmmx.mbcl1">面板材料1</option>
          <option value="jc_jjxcmmx.mbcl2">面板材料2</option>
        </select>
        第三列 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_jjdd.lrsj desc">录入时间</option>
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

          <option value="jc_jjdd.ddbh">订单编号</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="jc_jjdd.clgw">驻店家居顾问</option>
          <option value="jc_jjdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_jjdd.jjsjs">家居设计师</option>
          <option value="jc_jjdd.pdgc">家具工厂</option>
          <option value="jc_jjdd.xcmgc">型材门工厂</option>
          <option value="jc_jjdd.clzt">订单状态</option>

          <option value="jc_jjxcmmx.xcmmc">型材门名称</option>
          <option value="jc_jjxcmmx.azwz">安装位置</option>
          <option value="jc_jjxcmmx.bklxxh">边框系列型号</option>
          <option value="jc_jjxcmmx.bkys">边框颜色</option>
          <option value="jc_jjxcmmx.mbcl1">面板材料1</option>
          <option value="jc_jjxcmmx.mbcl2">面板材料2</option>
        </select>
        <br>
        <br>
        第四列 
        <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_jjdd.lrsj desc">录入时间</option>
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

          <option value="jc_jjdd.ddbh">订单编号</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="jc_jjdd.clgw">驻店家居顾问</option>
          <option value="jc_jjdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_jjdd.jjsjs">家居设计师</option>
          <option value="jc_jjdd.pdgc">家具工厂</option>
          <option value="jc_jjdd.xcmgc">型材门工厂</option>
          <option value="jc_jjdd.clzt">订单状态</option>

          <option value="jc_jjxcmmx.xcmmc">型材门名称</option>
          <option value="jc_jjxcmmx.azwz">安装位置</option>
          <option value="jc_jjxcmmx.bklxxh">边框系列型号</option>
          <option value="jc_jjxcmmx.bkys">边框颜色</option>
          <option value="jc_jjxcmmx.mbcl1">面板材料1</option>
          <option value="jc_jjxcmmx.mbcl2">面板材料2</option>
        </select>
        第五列 
        <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_jjdd.lrsj desc">录入时间</option>
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

          <option value="jc_jjdd.ddbh">订单编号</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="jc_jjdd.clgw">驻店家居顾问</option>
          <option value="jc_jjdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_jjdd.jjsjs">家居设计师</option>
          <option value="jc_jjdd.pdgc">家具工厂</option>
          <option value="jc_jjdd.xcmgc">型材门工厂</option>
          <option value="jc_jjdd.clzt">订单状态</option>

          <option value="jc_jjxcmmx.xcmmc">型材门名称</option>
          <option value="jc_jjxcmmx.azwz">安装位置</option>
          <option value="jc_jjxcmmx.bklxxh">边框系列型号</option>
          <option value="jc_jjxcmmx.bkys">边框颜色</option>
          <option value="jc_jjxcmmx.mbcl1">面板材料1</option>
          <option value="jc_jjxcmmx.mbcl2">面板材料2</option>
        </select>
        第六列 
        <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_jjdd.lrsj desc">录入时间</option>
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

          <option value="jc_jjdd.ddbh">订单编号</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="jc_jjdd.clgw">驻店家居顾问</option>
          <option value="jc_jjdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_jjdd.jjsjs">家居设计师</option>
          <option value="jc_jjdd.pdgc">家具工厂</option>
          <option value="jc_jjdd.xcmgc">型材门工厂</option>
          <option value="jc_jjdd.clzt">订单状态</option>

          <option value="jc_jjxcmmx.xcmmc">型材门名称</option>
          <option value="jc_jjxcmmx.azwz">安装位置</option>
          <option value="jc_jjxcmmx.bklxxh">边框系列型号</option>
          <option value="jc_jjxcmmx.bkys">边框颜色</option>
          <option value="jc_jjxcmmx.mbcl1">面板材料1</option>
          <option value="jc_jjxcmmx.mbcl2">面板材料2</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%" >显示风格</td>
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
      <td width="20%" align="right">统计表</td>
      <td colspan="3"> 第一列 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
          <option value="jjsjs">家居设计师</option>
          <option value="a.gysmc">家具工厂</option>
          <option value="b.gysmc">型材门工厂</option>
          <option value="clztmc">订单状态</option>

          <option value="xcmmc">型材门名称</option>
          <option value="azwz">安装位置</option>
          <option value="bklxxh">边框系列型号</option>
          <option value="bkys">边框颜色</option>
          <option value="mbcl1">面板材料1</option>
          <option value="mbcl2">面板材料2</option>
        </select>
        第二列 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">家装设计师</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
          <option value="cgsjs">橱柜设计师</option>
          <option value="gysmc">派单工厂</option>
          <option value="clztmc">订单状态</option>

          <option value="xcmmc">型材门名称</option>
          <option value="azwz">安装位置</option>
          <option value="bklxxh">边框系列型号</option>
          <option value="bkys">边框颜色</option>
          <option value="mbcl1">面板材料1</option>
          <option value="mbcl2">面板材料2</option>
        </select>
        第三列 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">家装设计师</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
          <option value="cgsjs">橱柜设计师</option>
          <option value="gysmc">派单工厂</option>
          <option value="clztmc">订单状态</option>

          <option value="xcmmc">型材门名称</option>
          <option value="azwz">安装位置</option>
          <option value="bklxxh">边框系列型号</option>
          <option value="bkys">边框颜色</option>
          <option value="mbcl1">面板材料1</option>
          <option value="mbcl2">面板材料2</option>
        </select>
        <br>
        <br>
        第四列 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">家装设计师</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
          <option value="cgsjs">橱柜设计师</option>
          <option value="gysmc">派单工厂</option>
          <option value="clztmc">订单状态</option>

          <option value="xcmmc">型材门名称</option>
          <option value="azwz">安装位置</option>
          <option value="bklxxh">边框系列型号</option>
          <option value="bkys">边框颜色</option>
          <option value="mbcl1">面板材料1</option>
          <option value="mbcl2">面板材料2</option>
        </select>
        第五列 
        <input type="hidden" name="tj5name" value="">
        <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">家装设计师</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
          <option value="cgsjs">橱柜设计师</option>
          <option value="gysmc">派单工厂</option>
          <option value="clztmc">订单状态</option>

          <option value="xcmmc">型材门名称</option>
          <option value="azwz">安装位置</option>
          <option value="bklxxh">边框系列型号</option>
          <option value="bkys">边框颜色</option>
          <option value="mbcl1">面板材料1</option>
          <option value="mbcl2">面板材料2</option>
        </select>
        第六列 
        <input type="hidden" name="tj6name" value="">
        <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">家装设计师</option>
          <option value="jc_jjdd.xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
          <option value="cgsjs">橱柜设计师</option>
          <option value="gysmc">派单工厂</option>
          <option value="clztmc">订单状态</option>

          <option value="xcmmc">型材门名称</option>
          <option value="azwz">安装位置</option>
          <option value="bklxxh">边框系列型号</option>
          <option value="bkys">边框颜色</option>
          <option value="mbcl1">面板材料1</option>
          <option value="mbcl2">面板材料2</option>
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_qhtsj, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_qhtsj2, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_lrsj2, "录入时间"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Jc_jjxcmmxCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jc_jjxcmmxTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
