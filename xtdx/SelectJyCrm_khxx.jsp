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
	String kkbbz=(String)session.getAttribute("kkbbz");
	String dwbh=(String)session.getAttribute("dwbh");
	String jzbm=(String)session.getAttribute("jzbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">向客户发送短信</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxJyList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCFFFF"> 
              <td width="19%" align="right">结果排序</td>
              <td colspan="3" bgcolor="#CCFFFF"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_khxx.lrsj desc">录入时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">质检员</option>
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
                  <option value="crm_khxx.zjxm">质检员</option>
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
                  <option value="crm_khxx.zjxm">质检员</option>
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
            <%
			if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
			{
				%> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" >每页显示数量</td>
              <td colspan="3" > 
                <input type="text" name="myxssl" size="7" maxlength="13" value="200">
              </td>
            </tr>
            <%
			}
			%> 
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'gccx')" name="button">
                <input type="reset"  value="重输" name="reset">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> <%

	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"change(this);\">");
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
              <td width="18%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="19%" align="right">客户编号</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_khbh" size="20" maxlength="20" >
              </td>
              <td width="18%" align="right">合同号</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">设计师</td>
              <td width="31%"> 
                <input type="text" name="sjs" size="20" maxlength="20">
              </td>
              <td width="18%" align="right">质检</td>
              <td width="32%"> 
                <input type="text" name="zjxm" size="20" maxlength="20">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50">
              </td>
              <td width="18%" align="right">客户姓名</td>
              <td width="32%"> 
                <input type="text" name="khxm2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000CC"><b>联系方式</b></font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">
              </td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">房屋地址</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz2" size="65" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4" height="24" bgcolor="#FFFFCC">查询工期</td>
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
              <td width="18%" align="right">客户类型</td>
              <td width="32%">
                <select name="crm_khxx_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="2">家装客户</option>
                  <option value="3">退单客户</option>
                  <option value="4">非家装客户</option>
                  <option value="5">设计客户</option>
                </select>
              </td>
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
              <td width="18%" align="right">完结标志</td>
              <td width="32%"> 
                <select name="crm_khxx_wjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未完结&2+已完结","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">合同开工日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">实际开工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">合同竣工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">实际竣工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjjgrq" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_sjjgrq2" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4" bgcolor="#FFFFCC" height="28">查询保修</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">保修标志</td>
              <td colspan="3"> 
                <input type="radio" name="kbxbz" value="Y">
                保修 
                <input type="radio" name="kbxbz" value="N">
                不保修 
                <input type="radio" name="kbxbz" value="M">
                部分保修 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">保修开始时间 从</td>
              <td width="31%"> 
                <input type="text" name="bxkssj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="bxkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">保修截止时间 从</td>
              <td width="31%"> 
                <input type="text" name="bxjzsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="bxjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td colspan="4" align="right" bgcolor="#FFFFCC" height="27">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">签约日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value="" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">家装标志</td>
              <td width="31%"> 
                <input type="radio" name="jzbz" value="1">
                家装 
                <input type="radio" name="jzbz" value="2">
                公装 </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="19%" align="right">关系客户</td>
              <td width="31%"> 
                <select name="crm_khxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">回单标志</td>
              <td width="32%"> 
                <select name="crm_khxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单","");
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
              <td width="18%" align="right">出开工证标志</td>
              <td width="32%"> 
                <select name="kgzbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未出开工证</option>
                  <option value="Y">已出开工证</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">房屋面积 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fwmj" size="20" maxlength="8" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_fwmj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">工程签约额 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">实完结日期 从</td>
              <td width="31%"> 
                <input type="text" name="sjwjrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="sjwjrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
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
              <td width="18%" align="right">中期验收进度</td>
              <td width="32%"> 
                <select name="zqysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='4' order by gcjdbm,gcyszxmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">停工标志</td>
              <td width="31%"> 
                <select name="tgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="W">正常</option>
                  <option value="Y">已停工</option>
                  <option value="N">停工已复工</option>
                </select>
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">投诉标志</td>
              <td width="31%"> 
                <input type="radio" name="tsbz" value="Y">
                有投诉 
                <input type="radio" name="tsbz" value="N">
                无投诉 </td>
              <td width="18%" align="right">报修标志</td>
              <td width="32%">
                <input type="radio" name="bxbz" value="Y">
                有报修 
                <input type="radio" name="bxbz" value="N">
                无报修 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">工程是否延期</td>
              <td width="31%"> 
                <input type="radio" name="gcsfyq" value="1">
                未延期 
                <input type="radio" name="gcsfyq" value="2">
                延期 </td>
              <td width="18%" align="right">工程延期原因</td>
              <td width="32%"> 
                <select name="gcyqyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyqyybm,gcyqyymc from dm_gcyqyybm order by gcyqyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">水质分析卡是否发放</td>
              <td width="31%"> 
                <input type="radio" name="sffk" value="Y">
                发卡 
                <input type="radio" name="sffk" value="N">
                未发卡 </td>
              <td width="18%" align="right">登记卡号</td>
              <td width="32%"> 
                <input type="text" name="djkh" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">发卡日期 从</td>
              <td width="31%"> 
                <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="fkrq2" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">是否已上保险</td>
              <td width="31%"> 
                <input type="radio" name="sfysbx" value="1">
                未上保险 
                <input type="radio" name="sfysbx" value="2">
                已保险 </td>
              <td width="18%" align="right">参加促销活动</td>
              <td width="32%"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(yhyy)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'（'||DECODE(jsbz,'N','未结束','Y','结束')||'）' c2 from jc_cxhd where fgsbh='"+ssfgs+"' order by jsbz,cxhdbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">保险开始时间 从</td>
              <td width="31%"> 
                <input type="text" name="baokssj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="baokssj2" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">保险终止时间 从</td>
              <td width="31%"> 
                <input type="text" name="baozzsj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="baozzsj2" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'gccx')" name="button">
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

<%
	cf.ajax(out);
%>


function change(fromID) 
{
	var sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssfgs='"+fromID.value+"' order by ssfgs,dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
//	alert("ajaxRetStr=["+ajaxRetStr+"]");
	strToSelect(selectform.dwbh,ajaxRetStr);
}



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

	if(!(isDatetime(FormName.bxkssj, "保修开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxkssj2, "保修开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxjzsj, "保修截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxjzsj2, "保修截止时间"))) {
		return false;
	}


	if(!(isDatetime(FormName.crm_khxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_lrsj2, "录入时间"))) {
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

	if(!(isDatetime(FormName.fkrq, "发卡日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.fkrq2, "发卡日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.baokssj, "保险开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.baokssj2, "保险开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.baozzsj, "保险终止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.baozzsj2, "保险终止时间"))) {
		return false;
	}


	FormName.action="Crm_khxxJyList.jsp";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
