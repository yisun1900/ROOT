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
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");

String ssfgs=request.getParameter("ssfgs");

String zcxlbmstr=cf.getItemData("select zcxlmc c1,zcxlmc c2,zcdlmc from jdm_zcxlbm order by zcdlmc,zcxlbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right">所属公司</td>
      <td width="29%"> <%
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
%> </td>
      <td width="22%" align="right">签约店面</td>
      <td width="28%"> 
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
      <td align="right" width="21%">客户编号</td>
      <td width="29%"> 
        <input type="text" name="jc_zcdd_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="22%">客户姓名</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">房屋地址</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="22%">联系方式</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">合同号</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="22%">家装设计师</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">工程签约额从</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">家装签约日期 从</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">施工队</td>
      <td width="29%"> 
        <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc","");
%> 
        </select>
      </td>
      <td align="right" width="22%">质检</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">驻店家居顾问</td>
      <td width="29%"> 
        <select name="jc_zcdd_clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
      <td align="right" width="22%">展厅家居顾问</td>
      <td width="28%"> 
        <select name="jc_zcdd_ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">项目专员</td>
      <td width="29%"> 
        <select name="jc_zcdd_xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
      <td align="right" width="22%">家居设计师</td>
      <td width="28%"> 
        <select name="jc_zcdd_jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2  from sq_yhxx where zwbm='12' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">订单编号</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_ddbh" size="20" maxlength="9" >
      </td>
      <td align="right" width="22%">主材名称</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_zcmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">主材大类</td>
      <td width="29%"> 
        <select name="jc_zcddmx_zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(jc_zcddmx_zcdlbm,jc_zcddmx_zcxlbm,<%=zcxlbmstr%>)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm order by zcdlbm","");
%> 
        </select>
      </td>
      <td align="right" width="22%">主材小类</td>
      <td width="28%"> 
        <select name="jc_zcddmx_zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm  order by zcxlbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">主材品牌</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_dwbh" size="20" maxlength="50" >
      </td>
      <td align="right" width="22%">主材类别系列</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_zclbbm" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">主材型号</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_xinghao" size="20" maxlength="100" >
      </td>
      <td align="right" width="22%">主材规格</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_gg" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">主材颜色</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zcysbm" size="20" maxlength="100" >
      </td>
      <td align="right" width="22%">厂家是否有促销</td>
      <td width="28%"> <%
	cf.radioToken(out, "jc_zcddmx_sfycx","N+没促销&Y+有促销","");
%> </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">销开始时间 从</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxkssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_cxkssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">促销结束时间 从</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_cxjzsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">选择价格</td>
      <td width="29%"> <%
	cf.radioToken(out, "jc_zcddmx_xzjg","1+销售限价&2+促销价","");
%> </td>
      <td align="right" width="22%">实销单价</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_dj" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">合同数量 从</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_sl" size="20" maxlength="9" >
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_sl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">材料费 从</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_je" size="20" maxlength="17" >
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_je2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">增减后数量 从</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zjhsl" size="20" maxlength="9" >
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_zjhsl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">增减后材料费 从</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zjhje" size="20" maxlength="17" >
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_zjhje2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">增减后远程费</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zjhycf" size="20" maxlength="17" >
      </td>
      <td align="right" width="22%">主材铺装位置</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_zcpzwzbm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%" bgcolor="#FFFFFF">是否参加促销活动</td>
      <td width="29%"> <%
	cf.radioToken(out, "jc_zcddmx_cxhdbz","Y+参加&N+不参加","");
%> </td>
      <td align="right" width="22%">录入人</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">计入促销活动比率 从</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxhdbl" size="20" maxlength="9" >
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_cxhdbl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">计入促销活动金额 从</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxhdje" size="20" maxlength="17" >
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_cxhdje2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">录入时间 从</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">订单签订时间 从</td>
      <td width="29%"> 
        <input type="text" name="jc_zcdd_qhtsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="22%">到</td>
      <td width="28%"> 
        <input type="text" name="jc_zcdd_qhtsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">手写标志</td>
      <td width="29%"> <%
	cf.radioToken(out, "jc_zcddmx_sxbz","1+非手写&2+手写","");
%> </td>
      <td align="right" width="22%">类型 </td>
      <td width="28%"><%
	cf.radioToken(out, "jc_zcddmx_lx","1+合同项&2+增项","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right" bgcolor="#FFFFCC">查询结果排序</td>
      <td colspan="3"> 第一列 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh" selected>订单编号</option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao">主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">选择价格</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
        </select>
        第二列 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh" >订单编号</option>
          <option value="jc_zcddmx.zcdlbm" >主材大类</option>
          <option value="jc_zcddmx.zcxlbm" >主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao">主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">选择价格</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
        </select>
        第三列 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm" >主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao">主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">选择价格</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
        </select>
        <BR><BR>
		第四列 
        <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh" >品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao">主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">选择价格</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
        </select>
        第五列 
        <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm" >主材类别系列</option>
          <option value="jc_zcddmx.xinghao">主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">选择价格</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
        </select>
        第六列 
        <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">选择价格</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="21%" >显示风格</td>
      <td colspan="3" > 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每页显示数量 
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
      <td width="21%" align="right">统计表</td>
      <td colspan="3"> 第一列 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','销售限价','2','促销价')">选择价格</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
        </select>
        第二列 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','销售限价','2','促销价')">选择价格</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
        </select>
        第三列 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','销售限价','2','促销价')">选择价格</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
        </select>

        <BR><BR>
		第四列 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','销售限价','2','促销价')">选择价格</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
        </select>
        第五列 
        <input type="hidden" name="tj5name" value="">
        <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','销售限价','2','促销价')">选择价格</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
        </select>
        第六列 
        <input type="hidden" name="tj6name" value="">
        <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','销售限价','2','促销价')">选择价格</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(!(isDatetime(FormName.crm_khxx_qyrq, "家装签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "家装签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_qhtsj, "订单签订时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_qhtsj2, "订单签订时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_cxkssj, "销开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_cxkssj2, "销开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_cxjzsj, "促销结束时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_cxjzsj2, "促销结束时间"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_dj, "实销单价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_sl, "合同数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_sl2, "合同数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_je, "材料费"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_je2, "材料费"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhsl, "增减后数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhsl2, "增减后数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhje, "增减后材料费"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhje2, "增减后材料费"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhycf, "增减后远程费"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_cxhdbl, "计入促销活动比率"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_cxhdbl2, "计入促销活动比率"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_cxhdje, "计入促销活动金额"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_cxhdje2, "计入促销活动金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_lrsj2, "录入时间"))) {
		return false;
	}
	
	if (lx=="cx")
	{
		FormName.action="Jc_zcddmxCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jc_zcddmxTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
