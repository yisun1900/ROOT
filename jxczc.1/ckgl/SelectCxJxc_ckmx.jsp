<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">出库单明细－查询 </div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC">查询结果排序</td>
    <td colspan="3"> 第一列
      <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sgd">施工队</option>
          <option value="jxc_ckd.ckph" selected>出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
        </select>
      第二列
      <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sgd">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm" selected>材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
      </select>
      第三列
      <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sgd">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc" selected>材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
      </select>
      <BR>
      第四列
      <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sgd">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
      </select>
      第五列
      <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sgd">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
      </select>
      第六列
      <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sgd">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" >显示风格</td>
    <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
      网页
      <input type="radio" name="xsfg" value="2">
      EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每页显示数量
      <input type="text" name="myxssl" size="7" maxlength="13" value="25">    </td>
  </tr>
  <tr align="center">
    <td colspan="4"><input type="button"  value="查询" onClick="f_do(selectform,'cx')">
        <input type="reset"  value="重输">    </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">统计表</td>
    <td colspan="3"> 第一列
      <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="sgdmc">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
        </select>
      第二列
      <input type="hidden" name="tj2name" value="">
      <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="sgdmc">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
      </select>
      第三列
      <input type="hidden" name="tj3name" value="">
      <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="sgdmc">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
      </select>
      <BR>
      第四列
      <input type="hidden" name="tj4name" value="">
      <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="sgdmc">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
      </select>
      第五列
      <input type="hidden" name="tj5name" value="">
      <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="sgdmc">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
      </select>
      第六列
      <input type="hidden" name="tj6name" value="">
      <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="sgdmc">施工队</option>
          <option value="jxc_ckd.ckph">出库批号</option>
          <option value="jxc_ckd.lrsj">录入时间</option>
          <option value="jxc_ckd.lydh">来源单号</option>
          <option value="jxc_ckd.cksj">出库时间</option>

          <option value="jxc_ckmx.cldlbm">材料大类</option>
          <option value="jxc_ckmx.clxlbm">材料小类</option>
          <option value="jxc_ckmx.ppmc">子品牌</option>
          <option value="jxc_ckmx.gysmc">供应商</option>
          <option value="jxc_ckmx.clbm">材料编码</option>
          <option value="jxc_ckmx.nbbm">内部编码</option>
          <option value="jxc_ckmx.clmc">材料名称</option>
          <option value="jxc_ckmx.xh">型号</option>
          <option value="jxc_ckmx.gg">规格</option>
      </select>    </td>
  </tr>
  <tr align="center">
    <td colspan="4"><input type="button"  value="统计表" onClick="f_do(selectform,'tj')" ></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"> 分公司 </td>
    <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
      </select>    </td>
    <td align="right"> 签约店面 </td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
					%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">签约日期 从</td>
    <td><input type="text" name="qyrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">合同号</td>
    <td><input type="text" name="hth" size="20" maxlength="20">    </td>
    <td align="right">客户编号</td>
    <td><input type="text" name="khbh" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">设计师</td>
    <td><input type="text" name="sjs" size="20" maxlength="20">    </td>
    <td align="right">质检</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
    <td><input type="text" name="khxm" size="20" maxlength="50">    </td>
    <td align="right">客户姓名</td>
    <td><input type="text" name="khxm2" size="14" maxlength="50" >
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>联系方式</b></font> </td>
    <td><input type="text" name="lxfs" size="20" maxlength="50">    </td>
    <td align="right"> 联系方式 </td>
    <td><input type="text" name="lxfs2" size="14" maxlength="50">
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
    <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 房屋地址 </td>
    <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">出库时间</span> 从</td>
    <td><input type="text" name="jxc_ckd_cksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right"><span class="STYLE1">到</span></td>
    <td><input type="text" name="jxc_ckd_cksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">出库批号</td>
    <td><input type="text" name="jxc_ckd_ckph" size="20" maxlength="13" ></td>
    <td align="right">出库单状态</td>
    <td><select name="jxc_ckd_ckdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectToken(out,"0+未提交&1+等待报废审核&2+等待退货审核&3+等待调拨入库&4+已结算&5+退货审核通过&6+报废审核未通过&7+退货审核未通过&8+审核通过&9+提交","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">录入日期 从</td>
    <td><input type="text" name="jxc_ckd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="jxc_ckd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">计划送货时间 从</td>
    <td><input type="text" name="jxc_ckd_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="jxc_ckd_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">录入人</td>
    <td><input type="text" name="jxc_ckd_lrr" size="20" maxlength="20" ></td>
    <td align="right">来源单号</td>
    <td><input name="lydh" type="text" size="20" maxlength="13"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">材料大类</td>
    <td><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeClxlbm(selectform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select></td>
    <td align="right">材料小类</td>
    <td><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
    </select></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">材料编码</td> 
  <td width="32%"><input type="text" name="jxc_ckmx_clbm" size="20" maxlength="13" ></td>
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"><input type="text" name="jxc_ckmx_nbbm" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">材料名称</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckmx_clmc" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">材料名称</td> 
  <td width="32%"><input type="text" name="jxc_ckmx_clmc2" size="20" maxlength="100" >
    (模糊查询)</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型号</td> 
  <td width="32%"><input type="text" name="jxc_ckmx_xh" size="20" maxlength="100" >
    (模糊查询)</td>
  <td align="right" width="18%">规格</td> 
  <td width="32%"><input type="text" name="jxc_ckmx_gg" size="20" maxlength="100" >
    (模糊查询)</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">品牌</td> 
  <td width="32%"> 
    <select name="jxc_ckmx_ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
    </select>  </td>
  <td align="right" width="18%">供应商</td> 
  <td width="32%"> 
    <select name="jxc_ckmx_gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
%>
    </select>  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
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
<%
	cf.ajax(out);//启用AJAX
%>

var lx;
function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	lx="fgs";

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeClxlbm(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.clxlbm.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}

	lx="cldlbm";

	var sql;
	sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (lx=="fgs")
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
	else if (lx=="cldlbm")
	{
		strToItem2(selectform.clxlbm,ajaxRetStr);
	}
}

function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jxc_ckd_cksj)=="") {
		alert("请输入[出库时间]！");
		FormName.jxc_ckd_cksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_cksj, "出库时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jxc_ckd_cksj2)=="") {
		alert("请输入[出库时间]！");
		FormName.jxc_ckd_cksj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_cksj2, "出库时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.jxc_ckd_lrsj, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_lrsj2, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_jhshsj, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_jhshsj2, "计划送货时间"))) {
		return false;
	}
	
	if (lx=="cx")
	{
		FormName.action="Jxc_ckmxCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jxc_ckmxTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
