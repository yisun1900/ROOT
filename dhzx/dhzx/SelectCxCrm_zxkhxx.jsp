<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
.STYLE4 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>


<%
String kkbbz=(String)session.getAttribute("kkbbz");//可拷贝
String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}
String ysy=yhmc;
if (!zwbm.equals("20"))
{
	ysy="";
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
String ywyssxz=cf.fillNull(cf.executeQuery("select sjsbh from sq_yhxx where ygbh='"+ygbh+"'"));
%>

<body bgcolor="#FFFFFF"  >
<noscript><iframe scr="*.htm"></iframe></noscript>


<form method="post" action="" name="selectform">
      <div align="center">咨询客户--查询</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_zxkhxx.khbh desc">客户编号</option>
                  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
                  <option value="crm_zxkhxx.khxm">客户姓名</option>
                  <option value="crm_zxkhxx.fwdz">房屋地址</option>
                  <option value="crm_zxkhxx.lxfs">联系方式</option>
                  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
                  <option value="crm_zxkhxx.ysrbm">月收入</option>
                  <option value="crm_zxkhxx.zybm">职业</option>
                  <option value="crm_zxkhxx.sjs">设计师</option>
                  <option value="crm_zxkhxx.khjl">客户经理</option>
                  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
                  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
                  <option value="crm_zxkhxx.zxzt">咨询状态</option>
                  <option value="crm_zxkhxx.zxdm">咨询店面</option>
                  <option value="crm_zxkhxx.sbyybm">失败原因</option>
                  <option value="crm_zxkhxx.ywy">业务员</option>
                  <option value="crm_zxkhxx.cqbm">所属城区</option>
                  <option value="crm_zxkhxx.xqbm">小区</option>
                  <option value="crm_zxkhxx.rddqbm">热点地区</option>
                  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
                  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
                  <option value="crm_zxkhxx.lfdjbz desc">量房订金标志</option>
                  <option value="crm_zxkhxx.hddjbz desc">活动订金标志</option>
                  <option value="crm_zxkhxx.sjfbz desc">设计费标志</option>
                  <option value="crm_zxkhxx.xxlysm">信息来源说明</option>
                  <option value="crm_zxkhxx.jhctsj">计划出平面图时间</option>
                  <option value="crm_zxkhxx.jhcxgtsj">计划出效果图时间</option>
                  <option value="crm_zxkhxx.jhcsgtsj">计划出施工图时间</option>
                  <option value="crm_zxkhxx.jhzbjsj">计划做电子报价时间</option>
                  <option value="crm_zxkhxx.khzyxz">客户资源性质</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_zxkhxx.khbh desc">客户编号</option>
                  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
                  <option value="crm_zxkhxx.khxm">客户姓名</option>
                  <option value="crm_zxkhxx.fwdz">房屋地址</option>
                  <option value="crm_zxkhxx.lxfs">联系方式</option>
                  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
                  <option value="crm_zxkhxx.ysrbm">月收入</option>
                  <option value="crm_zxkhxx.zybm">职业</option>
                  <option value="crm_zxkhxx.sjs">设计师</option>
                  <option value="crm_zxkhxx.khjl">客户经理</option>
                  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
                  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
                  <option value="crm_zxkhxx.zxzt">咨询状态</option>
                  <option value="crm_zxkhxx.zxdm">咨询店面</option>
                  <option value="crm_zxkhxx.sbyybm">失败原因</option>
                  <option value="crm_zxkhxx.ywy">业务员</option>
                  <option value="crm_zxkhxx.cqbm">所属城区</option>
                  <option value="crm_zxkhxx.xqbm">小区</option>
                  <option value="crm_zxkhxx.rddqbm">热点地区</option>
                  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
                  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
                  <option value="crm_zxkhxx.lfdjbz desc">量房订金标志</option>
                  <option value="crm_zxkhxx.hddjbz desc">活动订金标志</option>
                  <option value="crm_zxkhxx.sjfbz desc">设计费标志</option>
                  <option value="crm_zxkhxx.xxlysm">信息来源说明</option>
                  <option value="crm_zxkhxx.jhctsj">计划出平面图时间</option>
                  <option value="crm_zxkhxx.jhcxgtsj">计划出效果图时间</option>
                  <option value="crm_zxkhxx.jhcsgtsj">计划出施工图时间</option>
                  <option value="crm_zxkhxx.jhzbjsj">计划做电子报价时间</option>
                  <option value="crm_zxkhxx.khzyxz">客户资源性质</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_zxkhxx.khbh desc">客户编号</option>
                  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
                  <option value="crm_zxkhxx.khxm">客户姓名</option>
                  <option value="crm_zxkhxx.fwdz">房屋地址</option>
                  <option value="crm_zxkhxx.lxfs">联系方式</option>
                  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
                  <option value="crm_zxkhxx.ysrbm">月收入</option>
                  <option value="crm_zxkhxx.zybm">职业</option>
                  <option value="crm_zxkhxx.sjs">设计师</option>
                  <option value="crm_zxkhxx.khjl">客户经理</option>
                  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
                  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
                  <option value="crm_zxkhxx.zxzt">咨询状态</option>
                  <option value="crm_zxkhxx.zxdm">咨询店面</option>
                  <option value="crm_zxkhxx.sbyybm">失败原因</option>
                  <option value="crm_zxkhxx.ywy">业务员</option>
                  <option value="crm_zxkhxx.cqbm">所属城区</option>
                  <option value="crm_zxkhxx.xqbm">小区</option>
                  <option value="crm_zxkhxx.rddqbm">热点地区</option>
                  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
                  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
                  <option value="crm_zxkhxx.lfdjbz desc">量房订金标志</option>
                  <option value="crm_zxkhxx.hddjbz desc">活动订金标志</option>
                  <option value="crm_zxkhxx.sjfbz desc">设计费标志</option>
                  <option value="crm_zxkhxx.xxlysm">信息来源说明</option>
                  <option value="crm_zxkhxx.jhctsj">计划出平面图时间</option>
                  <option value="crm_zxkhxx.jhcxgtsj">计划出效果图时间</option>
                  <option value="crm_zxkhxx.jhcsgtsj">计划出施工图时间</option>
                  <option value="crm_zxkhxx.jhzbjsj">计划做电子报价时间</option>
                  <option value="crm_zxkhxx.khzyxz">客户资源性质</option>
                </select>              </td>
            </tr>
            <%
			if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
			{
				%> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" >显示风格</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <%
			}
			%> 
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'cx')" name="button">
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">统计表</td>
              <td colspan="3"> 第一列 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                  <option value="nlqjmc">年龄区间</option>
                  <option value="ysrmc">月收入</option>
                  <option value="zymc">职业</option>
                  <option value="khjl">客户经理</option>
                  <option value="sjs">设计师</option>
                  <option value="ywy">业务员</option>
                  <option value="DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过')">咨询状态</option>
                  <option value="b.dwmc">咨询店面</option>
                  <option value="a.dwmc">咨询登记部门</option>
                  <option value="sbyymc">失败原因</option>
                  <option value="cqmc">所属城区</option>
                  <option value="xqbm">小区</option>
                  <option value="rddq">热点地区</option>
                  <option value="hxwz">环线位置</option>
                  <option value="cxhdbm">参加促销活动</option>
                  <option value="DECODE(crm_zxkhxx.lfdjbz,'N','未交订金','Y','已交订金','T','退订金')">量房订金标志</option>
                  <option value="DECODE(crm_zxkhxx.hddjbz,'N','未交订金','Y','已交订金','T','退订金')">活动订金标志</option>
                  <option value="DECODE(crm_zxkhxx.sjfbz,'N','未交设计费','Y','已交设计费','T','退设计费')">设计费标志</option>
                  <option value="lrr">录入人</option>
                  <option value="xxlysm">信息来源说明</option>
                </select>
                第二列 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                  <option value="nlqjmc">年龄区间</option>
                  <option value="ysrmc">月收入</option>
                  <option value="zymc">职业</option>
                  <option value="khjl">客户经理</option>
                  <option value="sjs">设计师</option>
                  <option value="ywy">业务员</option>
                  <option value="DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过')">咨询状态</option>
                  <option value="b.dwmc">咨询店面</option>
                  <option value="a.dwmc">咨询登记部门</option>
                  <option value="sbyymc">失败原因</option>
                  <option value="cqmc">所属城区</option>
                  <option value="xqbm">小区</option>
                  <option value="rddq">热点地区</option>
                  <option value="hxwz">环线位置</option>
                  <option value="cxhdbm">参加促销活动</option>
                  <option value="DECODE(crm_zxkhxx.lfdjbz,'N','未交订金','Y','已交订金','T','退订金')">量房订金标志</option>
                  <option value="DECODE(crm_zxkhxx.hddjbz,'N','未交订金','Y','已交订金','T','退订金')">活动订金标志</option>
                  <option value="DECODE(crm_zxkhxx.sjfbz,'N','未交设计费','Y','已交设计费','T','退设计费')">设计费标志</option>
                  <option value="lrr">录入人</option>
                  <option value="xxlysm">信息来源说明</option>
                </select>
                第三列 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                  <option value="nlqjmc">年龄区间</option>
                  <option value="ysrmc">月收入</option>
                  <option value="zymc">职业</option>
                  <option value="khjl">客户经理</option>
                  <option value="sjs">设计师</option>
                  <option value="ywy">业务员</option>
                  <option value="DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过')">咨询状态</option>
                  <option value="b.dwmc">咨询店面</option>
                  <option value="a.dwmc">咨询登记部门</option>
                  <option value="sbyymc">失败原因</option>
                  <option value="cqmc">所属城区</option>
                  <option value="xqbm">小区</option>
                  <option value="rddq">热点地区</option>
                  <option value="hxwz">环线位置</option>
                  <option value="cxhdbm">参加促销活动</option>
                  <option value="DECODE(crm_zxkhxx.lfdjbz,'N','未交订金','Y','已交订金','T','退订金')">量房订金标志</option>
                  <option value="DECODE(crm_zxkhxx.hddjbz,'N','未交订金','Y','已交订金','T','退订金')">活动订金标志</option>
                  <option value="DECODE(crm_zxkhxx.sjfbz,'N','未交设计费','Y','已交设计费','T','退设计费')">设计费标志</option>
                  <option value="lrr">录入人</option>
                  <option value="xxlysm">信息来源说明</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="客户统计" onClick="f_do(selectform,'tj')" name="button2">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                客户所属分公司              </td>
              <td width="31%">
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
				</select>              </td>
              <td width="16%" align="right"> 
                咨询店面              </td>
              <td width="34%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
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
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">所属设计室</td>
              <td width="31%"> 
<%
if ( zwbm.equals("04"))
{
	%>
	<select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <option value=""></option>
	</select>
	<%
}
else if (zwbm.equals("23") )
{
	%>
	  <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"' order by dwbh",ywyssxz);
		%>
	  </select>
	<%
}
else{
	%>
	<select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sjsbh')">
	  <option value=""></option>
	</select>
	<%
}
%>				</td>
              <td width="16%" align="right">设计师</td>
              <td width="34%"><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
            </tr>

		  
	        <tr bgcolor="#FFFFFF">
	          <td align="right" bgcolor="#FFFFCC">业务员所属小组</td>
	          <td bgcolor="#FFFFCC">
<%
if ( zwbm.equals("19"))
{
	%>
	  <select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
		<option value=""></option>
	  </select>
	<%
}
else if (zwbm.equals("24") )
{
	%>
	  <select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"' order by dwbh",ywyssxz);
		%>
	  </select>
	<%
}
else{
	%>
	  <select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ywyssxz')">
		<option value=""></option>
	  </select>
	<%
}
%>			  </td>
	          <td align="right" bgcolor="#FFFFCC">业务员</td>
	          <td bgcolor="#FFFFCC"><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" <% if (!ywy.equals("")) out.println("readonly");%>></td>
            </tr>
	        <tr bgcolor="#FFFFFF">
	          <td align="right" bgcolor="#FFFFCC">咨询状态</td>
	          <td bgcolor="#FFFFCC"><select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="0">未分配店面</option>
                <option value="1">分配店面</option>
                <option value="2">设计师提交飞单</option>
                <option value="3">已签约</option>
                <option value="4">飞单</option>
                <option value="5">飞单审核未通过</option>
              </select></td>
	          <td align="right" bgcolor="#FFFFCC"><font color="#0000FF">是否有业务员</font></td>
	          <td bgcolor="#FFFFCC"><input type="radio" name="sfyywy" value="Y">
有
  <input type="radio" name="sfyywy" value="N">
无 </td>
            </tr>
	        <tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"> 
		客户编号              </td>
	  <td width="31%"> 
		<input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >              </td>
	  <td width="16%" align="right">性别</td>
	  <td width="34%"><INPUT type="radio" name="crm_zxkhxx_xb" value="M">男
<INPUT type="radio" name="crm_zxkhxx_xb" value="W">女</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"><span class="STYLE3">客户姓名</span></td>
	  <td width="31%"> 
		<input type="text" name="khxm" size="20" maxlength="20" >              </td>
	  <td width="16%" align="right">客户姓名</td>
	  <td width="34%"> 
		<input type="text" name="khxm2" size="14" maxlength="20" >
		（模糊查询）</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3">房屋地址 </span></td>
	  <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
	  <td align="right">房屋地址</td>
	  <td><input type="text" name="fwdz2" size="14" maxlength="100" >
	  （模糊查询）</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3">联系方式 </span></td>
	  <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
	  <td align="right">联系方式</td>
	  <td> <input type="text" name="lxfs2" size="14" maxlength="50" >
	  （模糊查询）</td>
	</tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right">客户经理</td>
	  <td><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
	  <td align="right">预算员</td>
	  <td>
		<input name="ysy" type="text" value="<%=ysy%>" size="20" maxlength="20" <% if (!ysy.equals("")) out.println("readonly");%>>	  </td>
	  </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">信息来源</font></td>
	  <td><select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('xxlybm')">
        <option value=""></option>
      </select></td>
	  <td align="right">信息来源说明</td>
	  <td><input type="text" name="xxlysm" value="" size="20" maxlength="100" ></td>
	  </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><strong>小区类型</strong></td>
	  <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
      </select></td>
	  <td align="right"><strong>客户资源性质</strong></td>
	  <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm","");
%>
      </select></td>
	  </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><span class="STYLE4">交量房订金标志</span></td>
	  <td colspan="3"><input type="radio" name="lfdjbz" value="N">
	    未交订金
	    <input type="radio" name="lfdjbz" value="Y">
	    已交订金
	    <input type="radio" name="lfdjbz" value="T">
	    退订金 </td>
	  </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right">交量房订金时间 从</td>
	  <td><input type="text" name="jlfdjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
	  <td align="right">到</td>
	  <td><input type="text" name="jlfdjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
	  </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE4">设计费标志</span></td>
	  <td colspan="3"><input type="radio" name="sjfbz" value="N">
	    未交
	    <input type="radio" name="sjfbz" value="Y">
	    已交
	    <input type="radio" name="sjfbz" value="T">
	    退设计费 </td>
	  </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right">交设计费时间 从</td>
	  <td><input type="text" name="jsjfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
	  <td align="right">到</td>
	  <td><input type="text" name="jsjfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
	  </tr>
		  
		  
		  <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">信息审核标志</td>
              <td width="31%">
                <input type="radio" name="shbz" value="Y">
                已审核 
                <input type="radio" name="shbz" value="N">
                未审核 </td>
              <td width="16%" align="right">预算审核</td>
              <td width="34%">
			  <input type="radio" name="ysshbz" value="N">未审核
			  <input type="radio" name="ysshbz" value="Y">审核通过
			  <input type="radio" name="ysshbz" value="M">审核未通过			  </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">是否做电子报价</td>
              <td width="31%"> 
                <input type="radio" name="sfzdzbj" value="N">
                未做报价 
                <input type="radio" name="sfzdzbj" value="Y">
                已做 </td>
              <td width="16%" align="right">报价级别</td>
              <td width="34%"> 
                <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('bjjb')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">家装标志</td>
              <td width="31%"> 
                <input type="radio" name="jzbz" value="1">
                家装 
                <input type="radio" name="jzbz" value="2">
                公装 </td>
              <td width="16%" align="right">是否签单</td>
              <td width="34%"> 
                <input type="radio" name="sfqd" value="1">
                未签单 
                <input type="radio" name="sfqd" value="2">
                签单 
                <input type="radio" name="sfqd" value="3">
                失败 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">签设计合同标志</td>
              <td> 
                <input type="radio" name="qsjhtbz" value="N">
                未签 
                <input type="radio" name="qsjhtbz" value="Y">
                签合同</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">签设计合同时间 从</td>
              <td width="31%"> 
                <input type="text" name="qsjhtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="qsjhtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">是否交活动订金</td>
              <td width="31%"> 
                <input type="radio" name="hddjbz" value="N">
                未交 
                <input type="radio" name="hddjbz" value="Y">
                已交 
                <input type="radio" name="hddjbz" value="T">
                退订金 </td>
              <td width="16%" align="right">参加促销活动</td>
              <td width="34%"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('cxhdbm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">交活动订金时间 从</td>
              <td width="31%"> 
                <input type="text" name="jhddjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="jhddjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">量房标志</td>
              <td width="31%"><%
		cf.radioToken(out, "lfbz","N+未量房&Y+已量房","");
%></td>
              <td width="16%" align="right">出平面图标志</td>
              <td width="34%"><%
		cf.radioToken(out, "ctbz","N+未出图&Y+已出图","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                店面分配时间 从              </td>
              <td width="31%"> 
                <input type="text" name="zxdmfpsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right"> 
                到              </td>
              <td width="34%"> 
                <input type="text" name="zxdmfpsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                设计师分配时间 从              </td>
              <td width="31%"> 
                <input type="text" name="sjsfpsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right"> 
                到              </td>
              <td width="34%"> 
                <input type="text" name="sjsfpsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">所属城区</td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('cqbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right">小区</td>
              <td width="34%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF">热点地区</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('rddqbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right" bgcolor="#E8E8FF">环线位置</td>
              <td width="34%" bgcolor="#E8E8FF"> 
                <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('hxwzbm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF">月收入</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('ysrbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right" bgcolor="#E8E8FF">&nbsp;</td>
              <td width="34%" bgcolor="#E8E8FF">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">年龄区间</td>
              <td width="31%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('nlqjbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right">职业</td>
              <td width="34%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zybm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                房屋类型              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('fwlxbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right"> 
                装修预算              </td>
              <td width="34%"> 
                <select name="crm_zxkhxx_zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zxysbm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                户型              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('hxbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right"> 
                套内建筑面积              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_fwmj" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                风格要求              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('fgyqbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right"> 
                失败原因              </td>
              <td width="34%"> 
                <select name="crm_zxkhxx_sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('sbyybm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">失败原因详述</td>
              <td colspan="3"> 
                <input type="text" name="sbyyxs" size="71" maxlength="200" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">关系客户</td>
              <td width="31%"> 
                <select name="crm_zxkhxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('khlxbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right">是否集成转家装客户</td>
              <td width="34%"> 
                <input type="radio" name="sfjczjz" value="1">
                是 
                <input type="radio" name="sfjczjz" value="2">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                是否需回访              </td>
              <td width="31%"><%
	cf.radioToken(out, "crm_zxkhxx_sfxhf","Y+需回访&N+不需回访","");
%> </td>
              <td width="16%" align="right"> 
                最新回访时间              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_zxhfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">回访日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_hfrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_hfrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                回单标志              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm","");
%>
                </select>              </td>
              <td width="16%" align="right"> 
                回单人              </td>
              <td width="34%"> 
                <input name="hdr" type="text" value="" maxlength="20" size="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">录入部门</td>
              <td width="31%"> 
                <select name="crm_zxkhxx_zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('zxdjbm')">
					<option value=""></option>
                </select>              </td>
              <td width="16%" align="right">信息录入人</td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                录入时间 从              </td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right"> 
                到              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">签单失败时间 从</td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_sbsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_sbsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                计划交房时间 从              </td>
              <td width="31%"> 
                <input type="text" name="jhjfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right"> 
                到              </td>
              <td width="34%"> 
                <input type="text" name="jhjfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                预计装修时间 从              </td>
              <td width="31%"> 
                <input type="text" name="yjzxsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right"> 
                到              </td>
              <td width="34%"> 
                <input type="text" name="yjzxsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 计划出平面图时间 从 </td>
              <td><input type="text" name="jhctsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="jhctsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 计划出效果图时间 从 </td>
              <td><input type="text" name="jhcxgtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="jhcxgtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 计划出施工图时间 从 </td>
              <td><input type="text" name="jhcsgtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="jhcsgtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 计划做电子报价时间 从 </td>
              <td><input type="text" name="jhzbjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="jhzbjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 实际做电子报价时间 从 </td>
              <td><input type="text" name="sczbjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="sczbjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">有效信息标志</td>
              <td><select name="yzxxbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="Y">有效信息</option>
                  <option value="N">无效信息</option>
                </select>              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'cx')" name="button">
                <input type="reset"  value="重输" name="reset">
                <input type="button"  value="客户统计" onClick="f_do(selectform,'tj')" name="button2">              </td>
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
	//启用Ajax
	cf.ajax(out);
%>

var sjsbhMark=0;
var ywyssxzMark=0;
var cxhdbmMark=0;
var khlxbmMark=0;

var bjjbMark=0;
var xxlybmMark=0;
var fwlxbmMark=0;
var zxysbmMark=0;
var hxbmMark=0;
var fgyqbmMark=0;
var sbyybmMark=0;
var khlxbmMark=0;
var ysrbmMark=0;
var nlqjbmMark=0;
var zybmMark=0;

var zxdjbmMark=0;
var cqbmMark=0;
var rddqbmMark=0;
var hxwzbmMark=0;


var fieldName="";

function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	sjsbhMark=0;
	ywyssxzMark=0;
	cxhdbmMark=0;
	zxdjbmMark=0;
	cqbmMark=0;
	rddqbmMark=0;
	hxwzbmMark=0;
	FormName.sjsbh.length=1;
	FormName.ywyssxz.length=1;
	FormName.cxhdbm.length=1;
	FormName.crm_zxkhxx_zxdjbm.length=1;
	FormName.cqbm.length=1;
	FormName.rddqbm.length=1;
	FormName.hxwzbm.length=1;

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.ssfgs.value=="")
	{
		selectform.ssfgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="sjsbh")
	{
		if (sjsbhMark==0)
		{
			if (selectform.zxdm.value=="")
			{
				sjsbhMark=0;
				selectform.zxdm.focus();
				alert("请首先选择【咨询店面】");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+selectform.zxdm.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sjsbhMark=1;
		}
		else{
			sjsbhMark=2;
		}
	}
	else if (lx=="ywyssxz")
	{
		if (ywyssxzMark==0)
		{
			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F4' and  cxbz='N' and ssfgs='"+selectform.ssfgs.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			ywyssxzMark=1;
		}
		else{
			ywyssxzMark=2;
		}
	}
	else if (lx=="cxhdbm")
	{
		if (cxhdbmMark==0)
		{
			sql="select cxhdmc c1,cxhdmc||DECODE(jsbz,'N','','Y','（结束）') c2 from jc_cxhd where fgsbh='"+selectform.ssfgs.value+"' order by jsbz,cxhdbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			cxhdbmMark=1;
		}
		else{
			cxhdbmMark=2;
		}
	}
	else if (lx=="zxdjbm")
	{
		if (zxdjbmMark==0)
		{
			sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssfgs='"+selectform.ssfgs.value+"' order by cxbz,dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zxdjbmMark=1;
		}
		else{
			zxdjbmMark=2;
		}
	}
	else if (lx=="cqbm")
	{
		if (cqbmMark==0)
		{
			sql="select cqbm,cqmc from dm_cqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by cqbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
//			window.open(actionStr);

			openAjax(actionStr);
			cqbmMark=1;
		}
		else{
			cqbmMark=2;
		}
	}
	else if (lx=="rddqbm")
	{
		if (rddqbmMark==0)
		{
			sql="select rddqbm,rddq from dm_rddqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by rddqbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			rddqbmMark=1;
		}
		else{
			rddqbmMark=2;
		}
	}
	else if (lx=="hxwzbm")
	{
		if (hxwzbmMark==0)
		{
			sql="select hxwzbm,hxwz from dm_hxwzbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by hxwzbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			hxwzbmMark=1;
		}
		else{
			hxwzbmMark=2;
		}
	}
}

function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="khlxbm")
	{
		if (khlxbmMark==0)
		{
			var sql="select khlxbm,khlxmc from dm_khlxbm order by khlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			khlxbmMark=1;
		}
	}
	else if (lx=="bjjb")
	{
		if (bjjbMark==0)
		{
			var sql="select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			bjjbMark=1;
		}
	}
	else if (lx=="xxlybm")
	{
		if (xxlybmMark==0)
		{
			var sql="select xxlybm,xxlymc from dm_xxlybm order by xxlybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			xxlybmMark=1;
		}
	}
	else if (lx=="fwlxbm")
	{
		if (fwlxbmMark==0)
		{
			var sql="select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			fwlxbmMark=1;
		}
	}
	else if (lx=="zxysbm")
	{
		if (zxysbmMark==0)
		{
			var sql="select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			zxysbmMark=1;
		}
	}
	else if (lx=="hxbm")
	{
		if (hxbmMark==0)
		{
			var sql="select hxbm,hxmc from dm_hxbm order by hxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			hxbmMark=1;
		}
	}
	else if (lx=="fgyqbm")
	{
		if (fgyqbmMark==0)
		{
			var sql="select fgflbm,fgflmc from dm_fgflbm order by fgflbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			fgyqbmMark=1;
		}
	}
	else if (lx=="sbyybm")
	{
		if (sbyybmMark==0)
		{
			var sql="select sbyybm,sbyymc from dm_sbyybm order by sbyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sbyybmMark=1;
		}
	}
	else if (lx=="khlxbm")
	{
		if (khlxbmMark==0)
		{
			var sql="select khlxbm,khlxmc from dm_khlxbm order by khlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			khlxbmMark=1;
		}
	}
	else if (lx=="ysrbm")
	{
		if (ysrbmMark==0)
		{
			sql="select ysrbm,ysrmc from dm_ysrbm order by ysrbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			ysrbmMark=1;
		}
		else{
			ysrbmMark=2;
		}
	}
	else if (lx=="nlqjbm")
	{
		if (nlqjbmMark==0)
		{
			sql="select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			nlqjbmMark=1;
		}
		else{
			nlqjbmMark=2;
		}
	}
	else if (lx=="zybm")
	{
		if (zybmMark==0)
		{
			sql="select zybm,zymc from dm_zybm order by zybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zybmMark=1;
		}
		else{
			zybmMark=2;
		}
	}
}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.zxdm,ajaxRetStr);
	}
	else if (fieldName=="sjsbh")
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
	else if (fieldName=="ywyssxz")
	{
		strToSelect(selectform.ywyssxz,ajaxRetStr);
	}
	else if (fieldName=="cxhdbm")
	{
		strToSelect(selectform.cxhdbm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_khlxbm,ajaxRetStr);
	}
	else if (fieldName=="bjjb")
	{
		strToSelect(selectform.bjjb,ajaxRetStr);
	}
	else if (fieldName=="xxlybm")
	{
		strToSelect(selectform.xxlybm,ajaxRetStr);
	}
	else if (fieldName=="fwlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_fwlxbm,ajaxRetStr);
	}
	else if (fieldName=="zxysbm")
	{
		strToSelect(selectform.crm_zxkhxx_zxysbm,ajaxRetStr);
	}
	else if (fieldName=="hxbm")
	{
		strToSelect(selectform.crm_zxkhxx_hxbm,ajaxRetStr);
	}
	else if (fieldName=="fgyqbm")
	{
		strToSelect(selectform.crm_zxkhxx_fgyqbm,ajaxRetStr);
	}
	else if (fieldName=="sbyybm")
	{
		strToSelect(selectform.crm_zxkhxx_sbyybm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_khlxbm,ajaxRetStr);
	}
	else if (fieldName=="ysrbm")
	{
		strToSelect(selectform.ysrbm,ajaxRetStr);
	}
	else if (fieldName=="nlqjbm")
	{
		strToSelect(selectform.nlqjbm,ajaxRetStr);
	}
	else if (fieldName=="zybm")
	{
		strToSelect(selectform.zybm,ajaxRetStr);
	}
	else if (fieldName=="zxdjbm")
	{
		strToSelect(selectform.crm_zxkhxx_zxdjbm,ajaxRetStr);
	}
	else if (fieldName=="cqbm")
	{
		strToSelect(selectform.cqbm,ajaxRetStr);
	}
	else if (fieldName=="rddqbm")
	{
		strToSelect(selectform.rddqbm,ajaxRetStr);
	}
	else if (fieldName=="hxwzbm")
	{
		strToSelect(selectform.hxwzbm,ajaxRetStr);
	}
}


function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.crm_zxkhxx_fwmj, "套内建筑面积"))) {
		return false;
	}
	if(!(isDatetime(FormName.qsjhtsj, "签设计合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.qsjhtsj2, "签设计合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jlfdjsj, "交量房订金时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jlfdjsj2, "交量房订金时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhddjsj, "交活动订金时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhddjsj2, "交活动订金时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsjfsj, "交设计费时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsjfsj2, "交设计费时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_zxhfsj, "最新回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq2, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_sbsj, "签单失败时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_sbsj2, "签单失败时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxdmfpsj, "店面分配时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxdmfpsj2, "店面分配时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsfpsj, "设计师分配时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsfpsj2, "设计师分配时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj, "计划交房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj2, "计划交房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "预计装修时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj2, "预计装修时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.jhctsj, "计划出平面图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhctsj2, "计划出平面图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcxgtsj, "计划出效果图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcxgtsj2, "计划出效果图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcsgtsj, "计划出施工图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcsgtsj2, "计划出施工图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhzbjsj, "计划做电子报价时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhzbjsj2, "计划做电子报价时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sczbjsj, "实际做电子报价时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sczbjsj2, "实际做电子报价时间"))) {
		return false;
	}


	if (lx=='cx')
	{
		FormName.action="Crm_zxkhxxCxList.jsp";
	}
	else if (lx=='tj')
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}
		FormName.action="Crm_zxkhxxTjList.jsp";
	}
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
