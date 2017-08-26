<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");

String zwbm=(String)session.getAttribute("zwbm");//08:家居顾问;10:项目专员;12:家居设计师;18:木门测量师

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">查询－全部合同(金额)
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
                <input type="reset"  value="重输">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="jc_zcdd.lrsj desc">录入时间</option>
                  <option value="jc_zcdd.ddqrsj desc">订单确认时间</option>
                  <option value="jc_zcdd.dwbh">录入部门</option>
                  <option value="jc_zcdd.ddbh">订单编号</option>
                  <option value="jc_zcdd.jhshsj">计划送货时间</option>
                  <option value="jc_zcdd.zcdlbm">主材大类</option>
                  <option value="jc_zcdd.zcxlbm">主材小类</option>
                  <option value="jc_zcdd.ppbm">子品牌</option>
                  <option value="jc_zcdd.gys">供应商</option>
                  <option value="jc_zcdd.ppmc">品牌</option>
                  <option value="jc_zcdd.xmzy">项目专员</option>
                  <option value="jc_zcdd.clgw">驻店家居顾问</option>
                  <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
                  <option value="jc_zcdd.hkze">合同总额</option>
                  <option value="jc_zcdd.clzt">处理状态</option>
                  <option value="jc_zcdd.ddlx">订单类型</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.hth">合同号</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_zcdd.lrsj desc">录入时间</option>
                  <option value="jc_zcdd.ddqrsj desc">订单确认时间</option>
                  <option value="jc_zcdd.dwbh">录入部门</option>
                  <option value="jc_zcdd.ddbh">订单编号</option>
                  <option value="jc_zcdd.jhshsj">计划送货时间</option>
                  <option value="jc_zcdd.zcdlbm">主材大类</option>
                  <option value="jc_zcdd.zcxlbm">主材小类</option>
                  <option value="jc_zcdd.ppbm">子品牌</option>
                  <option value="jc_zcdd.gys">供应商</option>
                  <option value="jc_zcdd.ppmc">品牌</option>
                  <option value="jc_zcdd.xmzy">项目专员</option>
                  <option value="jc_zcdd.clgw">驻店家居顾问</option>
                  <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
                  <option value="jc_zcdd.hkze">合同总额</option>
                  <option value="jc_zcdd.clzt">处理状态</option>
                  <option value="jc_zcdd.ddlx">订单类型</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.hth">合同号</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_zcdd.lrsj desc">录入时间</option>
                  <option value="jc_zcdd.ddqrsj desc">订单确认时间</option>
                  <option value="jc_zcdd.dwbh">录入部门</option>
                  <option value="jc_zcdd.ddbh">订单编号</option>
                  <option value="jc_zcdd.jhshsj">计划送货时间</option>
                  <option value="jc_zcdd.zcdlbm">主材大类</option>
                  <option value="jc_zcdd.zcxlbm">主材小类</option>
                  <option value="jc_zcdd.ppbm">子品牌</option>
                  <option value="jc_zcdd.gys">供应商</option>
                  <option value="jc_zcdd.ppmc">品牌</option>
                  <option value="jc_zcdd.xmzy">项目专员</option>
                  <option value="jc_zcdd.clgw">驻店家居顾问</option>
                  <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
                  <option value="jc_zcdd.hkze">合同总额</option>
                  <option value="jc_zcdd.clzt">处理状态</option>
                  <option value="jc_zcdd.ddlx">订单类型</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.hth">合同号</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="19%" >显示风格</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">所属公司</td>
              <td width="31%"> <%
	if (yhjs.equals("G0"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select distinct sq_dwxx.dwbh,sq_dwxx.dwmc from jxc_ppgysdzb,sq_dwxx where jxc_ppgysdzb.ssfgs=sq_dwxx.dwbh and jxc_ppgysdzb.gysbm='"+ygbh+"' order by sq_dwxx.dwbh","");
        out.println("        </select>");
	}
	else
	{
		out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onchange=\"changeFgs(selectform)\">");
		
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

        out.println("        </select>");
	}
	
%> </td>
              <td width="19%" align="right">签约店面</td>
              <td width="31%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("G0"))
	{
		out.println("<option value=\"\"></option>");
	}
	else
	{
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
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                订单编号              </td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_ddbh" size="20" maxlength="9" >              </td>
              <td width="19%" align="right"> 
                处理状态              </td>
              <td width="31%"> 
                <select name="jc_zcdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clzt,clztmc from jdm_zcddzt order by clzt","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">客户编号</td>
              <td width="31%"> 
                <input type="text" name="khbh" size="20" maxlength="20" >              </td>
              <td width="19%" align="right">合同号</td>
              <td width="31%"> 
                <input type="text" name="hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#0000CC"><b>客户姓名</b></font>              </td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td width="19%" align="right"> 
                客户姓名              </td>
              <td width="31%"> 
                <input type="text" name="khxm2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>联系方式</b></font></td>
              <td width="31%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td width="19%" align="right">联系方式</td>
              <td width="31%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#0000CC"><b>房屋地址</b></font>              </td>
              <td width="31%"> 
                <input type="text" name="fwdz" size="20" maxlength="100">              </td>
              <td width="19%" align="right"> 
                房屋地址              </td>
              <td width="31%"> 
                <input type="text" name="fwdz2" size="14" maxlength="100">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">设计师</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >              </td>
              <td width="19%" align="right">质检</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                施工队              </td>
              <td width="31%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd');">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">客户交款性质</td>
              <td colspan="3"><%
	cf.radioToken(out, "jc_zcdd_jkxz","1+未付款&2+全款&3+材料商收余款&4+预付款减出&5+退货款减出","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">交款地点</td>
              <td colspan="3"><%
	cf.radioToken(out, "jc_zcdd_jkdd","1+材料商现场收余款&2+店面收款&3+公司财务收款","");
%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">是否已结算</td>
              <td><INPUT type="radio" name="sfjs" value="N">
                未结算
                <INPUT type="radio" name="sfjs" value="Y">
                已结算</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">结算时间 从 </td>
              <td><input name="jssj" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
              <td align="right">到</td>
              <td><input name="jssj2" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">主材大类</td>
              <td width="31%"> 
                <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcdlbm');" onChange="zcxlbmMark=0;zcxlbm.length=1;gysMark=0;gys.length=1;ppbmMark=0;ppbm.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">主材小类</td>
              <td width="31%"> 
                <select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcxlbm');" onChange="gysMark=0;gys.length=1;ppbmMark=0;ppbm.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>子品牌</b></font></td>
              <td width="31%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppbm')">
                  <option value=""></option>
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select jxc_ppgysdzb.ppmc c1,jxc_ppgysdzb.ppmc c2 from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_gysxx.gysbm='"+ygbh+"' order by jxc_ppgysdzb.ppmc","");
	}
%> 
                </select>              </td>
              <td width="19%" align="right">子品牌</td>
              <td width="31%"> 
                <input type="text" name="ppbm2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>品牌名称</b></font></td>
              <td width="31%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                  <option value=""></option>
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select distinct jxc_ppxx.scsmc c1,jxc_ppxx.scsmc c2 from jxc_gysxx,jxc_ppgysdzb,jxc_ppxx where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_gysxx.gysbm='"+ygbh+"' order by jxc_ppxx.scsmc","");
	}
%> 
                </select>              </td>
              <td width="19%" align="right">品牌名称</td>
              <td width="31%"> 
                <input type="text" name="ppmc2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>供应商名称</b></font></td>
              <td width="31%"> 
                <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gys')">
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where gysbm='"+ygbh+"' order by gysmc","");
	}
%> 
                </select>              </td>
              <td width="19%" align="right">供应商名称</td>
              <td width="31%"> 
                <input type="text" name="gys2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"> 
                <font color="#0000CC"><b>驻店家居顾问</b></font>              </td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('clgw')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right"> 
                驻店家居顾问              </td>
              <td width="31%"> 
                <input type="text" name="clgw2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>展厅家居顾问</b></font></td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ztjjgw')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">展厅家居顾问</td>
              <td width="31%"> 
                <input type="text" name="ztjjgw2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>项目专员</b></font></td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">项目专员</td>
              <td width="31%"> 
                <input type="text" name="xmzy2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>家居设计师</b></font></td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('jjsjs')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">家居设计师</td>
              <td width="31%"> 
                <input type="text" name="jjsjs2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                产品类型              </td>
              <td width="31%"> 
                <select name="jc_zcdd_xclbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">非定制式产品</option>
                  <option value="2">定制式产品</option>
                </select>              </td>
              <td width="19%" align="right"> 
                是否等待送货通知              </td>
              <td width="31%"> 
                <select name="jc_zcdd_ddshbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                录入人              </td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_lrr" size="20" maxlength="20" >              </td>
              <td width="19%" align="right"> 
                录入部门              </td>
              <td width="31%"> 
                <select name="jc_zcdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('lrbm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">录入时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                签合同时间 从              </td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_qhtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right"> 
                到              </td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_qhtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">可减项截止时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_kjxsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_kjxsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">计划测量时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_jhclsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_jhclsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">合同送货时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_htshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_htshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">计划送货时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">发送货通知时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_tzshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_tzshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">实送货时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_sshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_sshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">主材完结时间 从</td>
              <td width="31%"> 
                <input type="text" name="wjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="wjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">延迟处理状态</td>
              <td width="31%"> 
                <select name="jc_zcdd_ycclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">延迟未核实</option>
                  <option value="2">延迟原因属实</option>
                  <option value="3">延迟原因不属实</option>
                  <option value="4">延迟已处理</option>
                </select>              </td>
              <td width="19%" align="right">客户完结标志</td>
              <td width="31%"> 
                <input type="radio" name="crm_khxx_wjbz" value="1">
                未完结 
                <input type="radio" name="crm_khxx_wjbz" value="2">
                已完结 </td>
            </tr>
			<tr bgcolor="#FFFFFF">
  <td align="right"><strong><font color="#FF0000">套餐分解订单标志</font></strong></td>
  <td>
	  <input type="radio" name="crm_khxx_fjtcbz" value="Y">分解
	  <input type="radio" name="crm_khxx_fjtcbz" value="N">未分解  </td>
	  </tr>
            <%
if (!zwbm.equals("08") && !zwbm.equals("12") && !yhjs.equals("G0"))//08:家居顾问;10:项目专员;12:家居设计师;18:木门测量师
{
	%> 
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">统计表</td>
              <td colspan="3"> 第一列 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                  <option value="a.dwmc">录入部门</option>
                  <option value="c.dwmc">签约店面</option>
                  <option value="zcdlbm">主材大类</option>
                  <option value="zcxlbm">主材小类</option>
                  <option value="ppbm">子品牌</option>
                  <option value="gys">供应商</option>
                  <option value="ppmc">品牌</option>
                  <option value="jc_zcdd.xmzy">项目专员</option>
                  <option value="clgw">驻店家居顾问</option>
                  <option value="ztjjgw">展厅家居顾问</option>
                  <option value="clztmc">处理状态</option>
                  <option value="DECODE(jc_zcdd.ddlx,'1','存在品牌','2','系统不存在品牌订单','3','补录合同')">订单类型</option>
                </select>
                第二列 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                  <option value="a.dwmc">录入部门</option>
                  <option value="c.dwmc">签约店面</option>
                  <option value="zcdlbm">主材大类</option>
                  <option value="zcxlbm">主材小类</option>
                  <option value="ppbm">子品牌</option>
                  <option value="gys">供应商</option>
                  <option value="ppmc">品牌</option>
                  <option value="jc_zcdd.xmzy">项目专员</option>
                  <option value="clgw">驻店家居顾问</option>
                  <option value="ztjjgw">展厅家居顾问</option>
                  <option value="clztmc">处理状态</option>
                  <option value="DECODE(jc_zcdd.ddlx,'1','存在品牌','2','系统不存在品牌订单','3','补录合同')">订单类型</option>
                </select>
                第三列 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                  <option value="a.dwmc">录入部门</option>
                  <option value="c.dwmc">签约店面</option>
                  <option value="zcdlbm">主材大类</option>
                  <option value="zcxlbm">主材小类</option>
                  <option value="ppbm">子品牌</option>
                  <option value="gys">供应商</option>
                  <option value="ppmc">品牌</option>
                  <option value="jc_zcdd.xmzy">项目专员</option>
                  <option value="clgw">驻店家居顾问</option>
                  <option value="ztjjgw">展厅家居顾问</option>
                  <option value="clztmc">处理状态</option>
                  <option value="DECODE(jc_zcdd.ddlx,'1','存在品牌','2','系统不存在品牌订单','3','补录合同')">订单类型</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="统计表" onClick="f_do(selectform,'tj')" name="button2">              </td>
            </tr>
            <%
}
%> 
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
<%
	cf.ajax(out);//启用AJAX
%>

var lrbmMark=0;
var clgwMark=0;
var ztjjgwMark=0;
var xmzyMark=0;
var jjsjsMark=0;
var gysMark=0;

var ppbmMark=0;
var ppmcMark=0;
var zcdlbmMark=0;
var zcxlbmMark=0;
var sgdMark=0;

var fieldName="";

function changeFgs(FormName) 
{
	FormName.crm_khxx_dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	lrbmMark=0;
	clgwMark=0;
	ztjjgwMark=0;
	xmzyMark=0;
	jjsjsMark=0;
	gysMark=0;
	ppbmMark=0;
	ppmcMark=0;
	sgdMark=0;

	FormName.jc_zcdd_dwbh.length=1;
	FormName.clgw.length=1;
	FormName.ztjjgw.length=1;
	FormName.xmzy.length=1;
	FormName.jjsjs.length=1;
	FormName.gys.length=1;
	FormName.ppbm.length=1;
	FormName.ppmc.length=1;
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

function getThis(lx)
{
	if ("<%=yhjs%>"=="G0")
	{
		return;
	}

	var sql;

	fieldName=lx;

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="lrbm")
	{
		if (lrbmMark==0)
		{
			var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssfgs='"+selectform.fgs.value+"' and  cxbz='N' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			lrbmMark=1;
		}
	}
	else if (lx=="clgw")
	{
		if (clgwMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			clgwMark=1;
		}
	}
	else if (lx=="ztjjgw")
	{
		if (ztjjgwMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			ztjjgwMark=1;
		}
	}
	else if (lx=="xmzy")
	{
		if (xmzyMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			xmzyMark=1;
		}
	}
	else if (lx=="jjsjs")
	{
		if (jjsjsMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			jjsjsMark=1;
		}
	}
	else if (lx=="gys")
	{
		if (gysMark==0)
		{
			if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_gysxx.gysmc from jxc_ppxx,jxc_gysxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.cldl='"+selectform.zcdlbm.value+"' order by jxc_gysxx.gysmc";
			}
			else
			{
				sql="select distinct jxc_gysxx.gysmc from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_gysxx.gysmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}


	else if (lx=="ppbm")
	{
		if (ppbmMark==0)
		{

			if (selectform.zcxlbm.value!="")
			{
				sql="select jxc_ppxx.ppmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.clxl='"+selectform.zcxlbm.value+"' order by jxc_ppxx.ppmc";
			}
			else if (selectform.zcdlbm.value!="")
			{
				sql="select jxc_ppxx.ppmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.zcdlbm.value+"') order by jxc_ppxx.ppmc";
			}
			else
			{
				sql="select jxc_ppxx.ppmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.ppmc";
			}
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppbmMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			if (selectform.zcxlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.clxl='"+selectform.zcxlbm.value+"' order by jxc_ppxx.scsmc";
			}
			else if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.zcdlbm.value+"') order by jxc_ppxx.scsmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.scsmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppmcMark=1;
		}
	}
	else if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			var sql="select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+selectform.fgs.value+"' order by sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sgdMark=1;
		}
	}

}


function getThisOne(lx)
{
	if ("<%=yhjs%>"=="G0")
	{
		return;
	}

	var sql;

	fieldName=lx;

	if (lx=="zcdlbm")
	{
		if (zcdlbmMark==0)
		{
			var sql="select cldlmc from jxc_cldlbm where cldllb in('1','3')  order by cldlmc";
			var actionStr="/ajax/getstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			zcdlbmMark=1;
		}
	}
	else if (lx=="zcxlbm")
	{
		if (zcxlbmMark==0)
		{
			if (selectform.zcdlbm.value=="")
			{
				zcxlbmMark=0;
				selectform.zcdlbm.focus();
				alert("请选择【主材大类】");
				return;
			}

			sql="select clxlmc from jxc_clxlbm where cldlmc='"+selectform.zcdlbm.value+"' order by clxlmc";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			zcxlbmMark=1;
		}
	}
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.crm_khxx_dwbh,ajaxRetStr);
	}
	else if (fieldName=="lrbm")
	{
		strToSelect(selectform.jc_zcdd_dwbh,ajaxRetStr);
	}
	else if (fieldName=="clgw")
	{
		strToSelect(selectform.clgw,ajaxRetStr);
	}
	else if (fieldName=="ztjjgw")
	{
		strToSelect(selectform.ztjjgw,ajaxRetStr);
	}
	else if (fieldName=="xmzy")
	{
		strToSelect(selectform.xmzy,ajaxRetStr);
	}
	else if (fieldName=="jjsjs")
	{
		strToSelect(selectform.jjsjs,ajaxRetStr);
	}
	else if (fieldName=="gys")
	{
		strToItem2(selectform.gys,ajaxRetStr);
	}
	else if (fieldName=="ppbm")
	{
		strToItem2(selectform.ppbm,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="zcdlbm")
	{
		strToItem2(selectform.zcdlbm,ajaxRetStr);
	}
	else if (fieldName=="zcxlbm")
	{
		strToItem2(selectform.zcxlbm,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToItem(selectform.crm_khxx_sgd,ajaxRetStr);
	}
}

function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.jc_zcdd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_qhtsj, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_qhtsj2, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_kjxsj, "可减项截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_kjxsj2, "可减项截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_jhclsj, "计划测量时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_jhclsj2, "计划测量时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_htshsj, "合同送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_htshsj2, "合同送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_jhshsj, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_jhshsj2, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_tzshsj, "发送货通知时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_tzshsj2, "发送货通知时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_sshsj, "实送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_sshsj2, "实送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.wjsj, "完结时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.wjsj2, "完结时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj, "结算时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj2, "结算时间"))) {
		return false;
	}

	
	if (lx=="cx")
	{
		FormName.action="Jc_zcddCxJeList.jsp";
	}
	else if (lx=="tj")
	{
		FormName.action="Jc_zcddTjList.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
