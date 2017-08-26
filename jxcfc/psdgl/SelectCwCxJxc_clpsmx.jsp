<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">材料单明细－财务查询 </div>
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
          <option value="jxc_clpsd.psph" selected>材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
        </select>
      第二列
      <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sgd">施工队</option>
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm" selected>材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
      </select>
      第三列
      <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sgd">施工队</option>
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc" selected>材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
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
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
      </select>
      第五列
      <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sgd">施工队</option>
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
      </select>
      第六列
      <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.hth">合同号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sgd">施工队</option>
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
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
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
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
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
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
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
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
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
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
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
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
          <option value="jxc_clpsd.psph">材料单号</option>
          <option value="jxc_clpsd.lrrq">录入时间</option>
          <option value="jxc_clpsd.shsj">审核时间</option>
          <option value="jxc_clpsd.dysj">打印时间</option>

          <option value="jxc_clpsmx.cldlbm">材料大类</option>
          <option value="jxc_clpsmx.clxlbm">材料小类</option>
          <option value="jxc_clpsmx.ppmc">子品牌</option>
          <option value="jxc_clpsmx.gysmc">供应商</option>
          <option value="jxc_clpsmx.clbm">材料编码</option>
          <option value="jxc_clpsmx.nbbm">内部编码</option>
          <option value="jxc_clpsmx.clmc">材料名称</option>
          <option value="jxc_clpsmx.xh">型号</option>
          <option value="jxc_clpsmx.gg">规格</option>
      </select>    </td>
  </tr>
  <tr align="center">
    <td colspan="4"><input type="button"  value="统计表" onClick="f_do(selectform,'tj')" name="button2">    </td>
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
    <td align="right">在职施工队</td>
    <td><select name="zzsgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('zzsgd')">
        <option value=""></option>
      </select>
    </td>
    <td align="right">离职施工队</td>
    <td><select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd')">
        <option value=""></option>
      </select>
    </td>
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
    <td align="right">材料单状态</td>
    <td colspan="3">
	<input type="radio" name="yxcld" value="1">有效（等待出库、已出库、部分出库）
	<BR>
	<input type="radio" name="yxcld" value="2">无效（等待提交、等待审核、驳回重新修改、作废）	
	<BR>
	<input type="radio" name="yxcld" value="3">未出库（等待出库、部分出库）	
	<BR>
	<input type="radio" name="yxcld" value="4">已出库（已出库、部分出库）	</td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">材料单号</td>
    <td><input type="text" name="jxc_clpsd_psph" size="20" maxlength="13" ></td>
    <td align="right">材料单状态</td>
    <td><select name="jxc_clpsd_psdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
	<option value="0">等待提交</option>
	<option value="1">等待审核</option>
	<option value="2">等待出库</option>
	<option value="3">已出库</option>
	<option value="5">部分出库</option>
	<option value="6">驳回重新修改</option>
	<option value="7">作废</option>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">录入日期 从</td>
    <td><input type="text" name="jxc_clpsd_lrrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="jxc_clpsd_lrrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">计划送货时间 从</td>
    <td><input type="text" name="jxc_clpsd_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="jxc_clpsd_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">审核时间 从</td>
    <td><input name="shsj" type="text" id="shsj" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
    <td align="right">到</td>
    <td><input name="shsj2" type="text" id="shsj2" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right">打印时间 从</td>
    <td><input type="text" name="jxc_clpsd_dysj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="jxc_clpsd_dysj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">录入人</td>
    <td><input type="text" name="jxc_clpsd_lrr" size="20" maxlength="20" ></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">审核结论</td>
    <td><%
	cf.radioToken(out, "jxc_clpsd_shjl","Y+同意&N+不同意","");
%>    </td>
    <td align="right">打印标志</td>
    <td><%
	cf.radioToken(out, "jxc_clpsd_dybz","Y+打印&N+未打印","");
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">材料大类</td>
    <td><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeClxlbm(selectform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('2','3') order by cldlmc","");
%>
    </select></td>
    <td align="right">材料小类</td>
    <td><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
    </select></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">材料编码</td> 
  <td width="32%"><input type="text" name="jxc_clpsmx_clbm" size="20" maxlength="13" ></td>
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"><input type="text" name="jxc_clpsmx_nbbm" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">材料名称</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clpsmx_clmc" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">材料名称</td> 
  <td width="32%"><input type="text" name="jxc_clpsmx_clmc2" size="20" maxlength="100" >
    (模糊查询)</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型号</td> 
  <td width="32%"><input type="text" name="jxc_clpsmx_xh" size="20" maxlength="100" >
    (模糊查询)</td>
  <td align="right" width="18%">规格</td> 
  <td width="32%"><input type="text" name="jxc_clpsmx_gg" size="20" maxlength="100" >
    (模糊查询)</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">品牌</td> 
  <td width="32%"> 
    <select name="jxc_clpsmx_ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('2','3') order by ppmc","");
%>
    </select>  </td>
  <td align="right" width="18%">供应商</td> 
  <td width="32%"> 
    <select name="jxc_clpsmx_gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('2','3') order by gysmc","");
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

var fieldName="";
var zzsgdMark=0;
var sgdMark=0;

function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="dwbh";
	zzsgdMark=0;
	sgdMark=0;

	FormName.zzsgd.length=1;
	FormName.crm_khxx_sgd.length=1;

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

	fieldName="cldlbm";

	var sql;
	sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="fgs")
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
	else if (fieldName=="cldlbm")
	{
		strToItem2(selectform.clxlbm,ajaxRetStr);
	}
	else if (fieldName=="zzsgd")
	{
		strToSelect(selectform.zzsgd,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToSelect(selectform.crm_khxx_sgd,ajaxRetStr);
	}
}
function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="zzsgd")
	{
		if (zzsgdMark==0)
		{
			sql="select sgd,sgdmc||'（'||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属')||'）' from sq_sgd where ssfgs='"+selectform.fgs.value+"' and cxbz='N' order by sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zzsgdMark=1;
		}
		else{
			zzsgdMark=2;
		}
	}
	else if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			sql="select sgd,sgdmc||'（'||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属')||'）' from sq_sgd where ssfgs='"+selectform.fgs.value+"' and cxbz='Y' order by sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			sgdMark=1;
		}
		else{
			sgdMark=2;
		}
	}

}


function f_do(FormName,lx)//参数FormName:Form的名称
{
/*	
	if(	javaTrim(FormName.jxc_clpsd_lrrq)=="") {
		alert("请输入[录入日期]！");
		FormName.jxc_clpsd_lrrq.focus();
		return false;
	}
	if(	javaTrim(FormName.jxc_clpsd_lrrq2)=="") {
		alert("请输入[录入日期]！");
		FormName.jxc_clpsd_lrrq2.focus();
		return false;
	}
*/
	if(!(isDatetime(FormName.jxc_clpsd_lrrq, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clpsd_lrrq2, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clpsd_dysj, "打印时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clpsd_dysj2, "打印时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.shsj2, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clpsd_jhshsj, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clpsd_jhshsj2, "计划送货时间"))) {
		return false;
	}
	
	if (lx=="cx")
	{
		FormName.action="Jxc_clpsmxCwCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jxc_clpsmxCwTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
