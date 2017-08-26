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
      <div align="center">查询－订单明细</div></td>
  </tr>
  <tr>
    <td width="100%" > 
<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">所属公司</td>
              <td width="30%"> <%
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
              <td width="18%" align="right">签约店面</td>
              <td width="32%"> 
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
            <tr bgcolor="#FFCCFF">
              <td align="right"><b>*订单签订时间 从</b></td>
              <td><b>
                <input type="text" name="jc_zcdd_qhtsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">
              </b></td>
              <td align="right"><b>*到</b></td>
              <td><b>
                <input type="text" name="jc_zcdd_qhtsj2" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">
              </b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                订单编号              </td>
              <td width="30%"> 
                <input type="text" name="jc_zcdd_ddbh" size="20" maxlength="9" >              </td>
              <td width="18%" align="right"> 
                处理状态              </td>
              <td width="32%"> 
                <select name="jc_zcdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clzt,clztmc from jdm_zcddzt order by clzt","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><strong>客户报价级别</strong></td>
              <td><select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('bjjb')">
                <option value=""></option>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">客户编号</td>
              <td width="30%"> 
                <input type="text" name="khbh" size="20" maxlength="20" >              </td>
              <td width="18%" align="right">合同号</td>
              <td width="32%"> 
                <input type="text" name="hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#0000CC"><b>客户姓名</b></font>              </td>
              <td width="30%"> 
                <input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td width="18%" align="right"> 
                客户姓名              </td>
              <td width="32%"> 
                <input type="text" name="khxm2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>联系方式</b></font></td>
              <td width="30%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td width="18%" align="right">联系方式</td>
              <td width="32%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#0000CC"><b>房屋地址</b></font>              </td>
              <td width="30%"> 
                <input type="text" name="fwdz" size="20" maxlength="100">              </td>
              <td width="18%" align="right"> 
                房屋地址              </td>
              <td width="32%"> 
                <input type="text" name="fwdz2" size="14" maxlength="100">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">工程签约额从</td>
              <td><input type="text" name="crm_khxx_qye" size="20" maxlength="17" >              </td>
              <td align="right">到</td>
              <td><input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">家装签约日期 从</td>
              <td><input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right">到</td>
              <td><input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">设计师</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >              </td>
              <td width="18%" align="right">质检</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                施工队              </td>
              <td width="30%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd');">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">主材大类</td>
              <td width="30%"> 
                <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcdlbm');" onChange="zcxlbmMark=0;zcxlbm.length=1;gysMark=0;gys.length=1;ppbmMark=0;ppbm.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">主材小类</td>
              <td width="32%"> 
                <select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcxlbm');" onChange="gysMark=0;gys.length=1;ppbmMark=0;ppbm.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>子品牌</b></font></td>
              <td width="30%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppbm')">
                  <option value=""></option>
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select jxc_ppgysdzb.ppmc c1,jxc_ppgysdzb.ppmc c2 from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_gysxx.gysbm='"+ygbh+"' order by jxc_ppgysdzb.ppmc","");
	}
%> 
                </select>              </td>
              <td width="18%" align="right">子品牌</td>
              <td width="32%"> 
                <input type="text" name="ppbm2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>品牌名称</b></font></td>
              <td width="30%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                  <option value=""></option>
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select distinct jxc_ppxx.scsmc c1,jxc_ppxx.scsmc c2 from jxc_gysxx,jxc_ppgysdzb,jxc_ppxx where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_gysxx.gysbm='"+ygbh+"' order by jxc_ppxx.scsmc","");
	}
%> 
                </select>              </td>
              <td width="18%" align="right">品牌名称</td>
              <td width="32%"> 
                <input type="text" name="ppmc2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>供应商名称</b></font></td>
              <td width="30%"> 
                <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gys')">
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where gysbm='"+ygbh+"' order by gysmc","");
	}
%> 
                </select>              </td>
              <td width="18%" align="right">供应商名称</td>
              <td width="32%"> 
                <input type="text" name="gys2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"> 
                <font color="#0000CC"><b>驻店家居顾问</b></font>              </td>
              <td width="30%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('clgw')">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right"> 
                驻店家居顾问              </td>
              <td width="32%"> 
                <input type="text" name="clgw2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>展厅家居顾问</b></font></td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ztjjgw')">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">展厅家居顾问</td>
              <td width="32%"> 
                <input type="text" name="ztjjgw2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>项目专员</b></font></td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">项目专员</td>
              <td width="32%"> 
                <input type="text" name="xmzy2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>家居设计师</b></font></td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('jjsjs')">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">家居设计师</td>
              <td width="32%"> 
                <input type="text" name="jjsjs2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">主材编码</td>
              <td><input type="text" name="jc_zcddmx_zcbm" size="20" maxlength="100" ></td>
              <td align="right">主材名称</td>
              <td><input type="text" name="jc_zcddmx_zcmc" size="20" maxlength="100" ></td>
            </tr>
            
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">主材型号</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_xinghao" size="20" maxlength="100" >      </td>
      <td align="right" width="18%">主材规格</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_gg" size="20" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">主材颜色</td>
      <td><input type="text" name="jc_zcddmx_zcysbm" size="20" maxlength="100" ></td>
      <td align="right">主材铺装位置</td>
      <td><input type="text" name="jc_zcddmx_zcpzwzbm" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">主材类别系列</td>
      <td width="30%"><input type="text" name="jc_zcddmx_zclbbm" size="20" maxlength="100" ></td>
      <td align="right" width="18%">厂家是否有促销</td>
      <td width="32%"> <%
	cf.radioToken(out, "jc_zcddmx_sfycx","N+没促销&Y+有促销","");
%> </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">促销开始时间 从</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_cxkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_cxkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">促销结束时间 从</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_cxjzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_cxjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">选择价格</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_zcddmx_xzjg","1+销售限价&2+促销价","");
%> </td>
      <td align="right" width="18%">实销单价</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_dj" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">合同数量 从</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_sl" size="20" maxlength="9" >      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_sl2" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">合同金额 从</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_je" size="20" maxlength="17" >      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_je2" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">增减后数量 从</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_zjhsl" size="20" maxlength="9" >      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_zjhsl2" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">增减后金额 从</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_zjhje" size="20" maxlength="17" >      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_zjhje2" size="20" maxlength="17" >      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%" bgcolor="#FFFFFF">是否参加促销活动</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_zcddmx_cxhdbz","Y+参加&N+不参加","");
%> </td>
      <td align="right" width="18%">录入人</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_lrr" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">计入促销活动比率 从</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_cxhdbl" size="20" maxlength="9" >      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_cxhdbl2" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">计入促销活动金额 从</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_cxhdje" size="20" maxlength="17" >      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_cxhdje2" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">录入时间 从</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">手写标志</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_zcddmx_sxbz","1+非手写&2+手写","");
%> </td>
      <td align="right" width="18%">类型 </td>
      <td width="32%"><%
	cf.radioToken(out, "jc_zcddmx_lx","1+合同项&2+增项","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">手写合同原因</td>
      <td width="30%"> 
        <select name="sxhtyy" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sxhtyy c1,sxhtyy c2 from jdm_sxhtyybm order by sxhtyybm","");
%> 
        </select>      </td>
      <td align="right" width="18%">手写合同原因</td>
      <td width="32%"> 
        <input type="text" name="sxhtyy2" size="20" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right" bgcolor="#FFFFCC">查询结果排序</td>
      <td colspan="3"> 第一列 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh" selected>订单编号</option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao">主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
          <option value="jc_zcddmx.sxhtyy">手写合同原因</option>
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
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao">主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
          <option value="jc_zcddmx.sxhtyy">手写合同原因</option>
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
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao">主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
          <option value="jc_zcddmx.sxhtyy">手写合同原因</option>
        </select>
        <BR>
        <BR>
        第四列 
        <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao">主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
          <option value="jc_zcddmx.sxhtyy">手写合同原因</option>
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
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm" >主材类别系列</option>
          <option value="jc_zcddmx.xinghao">主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
          <option value="jc_zcddmx.sxhtyy">手写合同原因</option>
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
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="jc_zcddmx.sfycx">厂家是否有促销</option>
          <option value="jc_zcddmx.xzjg">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="jc_zcddmx.qtfy">其它费用</option>
          <option value="jc_zcddmx.cxhdbz">是否参加促销活动</option>
          <option value="jc_zcddmx.lx">类型</option>
          <option value="jc_zcddmx.sxbz">手写标志</option>
          <option value="jc_zcddmx.sxhtyy">手写合同原因</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="20%" >显示风格</td>
      <td colspan="3" > 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每页显示数量 
        <input type="text" name="myxssl" size="7" maxlength="13" value="25">      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
        <input type="reset"  value="重输">      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">统计表</td>
      <td colspan="3"> 第一列 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',手写项目,'1','销售限价','2','促销价','3','市场标价')">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="sxhtyy">手写合同原因</option>
          <option value="bjjbmc">报价级别</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sjs">家装设计师</option>
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
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',手写项目,'1','销售限价','2','促销价','3','市场标价')">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="sxhtyy">手写合同原因</option>
          <option value="bjjbmc">报价级别</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sjs">家装设计师</option>
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
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',手写项目,'1','销售限价','2','促销价','3','市场标价')">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="sxhtyy">手写合同原因</option>
          <option value="bjjbmc">报价级别</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sjs">家装设计师</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
        </select>
        <BR>
        <BR>
        第四列 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">主材大类</option>
          <option value="jc_zcddmx.zcxlbm">主材小类</option>
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',手写项目,'1','销售限价','2','促销价','3','市场标价')">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="sxhtyy">手写合同原因</option>
          <option value="bjjbmc">报价级别</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sjs">家装设计师</option>
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
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',手写项目,'1','销售限价','2','促销价','3','市场标价')">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="sxhtyy">手写合同原因</option>
          <option value="bjjbmc">报价级别</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sjs">家装设计师</option>
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
          <option value="jc_zcddmx.dwbh">子品牌</option>
          <option value="jc_zcddmx.gys">供应商</option>
          <option value="jc_zcddmx.ppmc">品牌</option>
          <option value="jc_zcddmx.zclbbm">主材类别系列</option>
          <option value="jc_zcddmx.xinghao" >主材型号</option>
          <option value="jc_zcddmx.gg">主材规格</option>
          <option value="jc_zcddmx.zcysbm">主材颜色</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','没促销','Y','有促销')">厂家是否有促销</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',手写项目,'1','销售限价','2','促销价','3','市场标价')">销售价格</option>
          <option value="jc_zcddmx.dj">销售价</option>
          <option value="jc_zcddmx.cxhdbl">计入活动比率</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费')">其它费用</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加')">是否参加促销活动</option>
          <option value="DECODE(jc_zcddmx.lx,'1','合同项','2','增项')">类型</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写')">手写标志</option>
          <option value="sxhtyy">手写合同原因</option>
          <option value="bjjbmc">报价级别</option>
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="crm_khxx.sjs">家装设计师</option>
          <option value="jc_zcdd.ddbh">订单编号</option>
          <option value="jc_zcdd.xmzy">项目专员</option>
          <option value="jc_zcdd.clgw">驻店家居顾问</option>
          <option value="jc_zcdd.ztjjgw">展厅家居顾问</option>
        </select>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="统计表" onClick="f_do(selectform,'tj')" name="button2">      </td>
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
<%
	cf.ajax(out);//启用AJAX
%>

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

	clgwMark=0;
	ztjjgwMark=0;
	xmzyMark=0;
	jjsjsMark=0;
	gysMark=0;
	ppbmMark=0;
	ppmcMark=0;
	sgdMark=0;

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

	if (lx=="clgw")
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
			if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.cldl='"+selectform.zcdlbm.value+"' order by jxc_ppxx.ppmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.ppmc";
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
			if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.cldl='"+selectform.zcdlbm.value+"' order by jxc_ppxx.scsmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.scsmc";
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
	if(!(isFloat(FormName.jc_zcddmx_je, "合同金额"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_je2, "合同金额"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhsl, "增减后数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhsl2, "增减后数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhje, "增减后金额"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhje2, "增减后金额"))) {
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
