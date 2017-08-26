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
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
                <input type="button"  value="打印" onClick="f_do(selectform,'dy')" name="button" >
                <input type="reset"  value="重输">
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
              <td width="19%"> 
                <div align="right">性别</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "crm_khxx_xb","M+男&W+女","");
%> </td>
              <td width="17%"> 
                <div align="right">职业</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_zybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
                </select>
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
              <td width="17%" align="right">小区</td>
              <td width="33%"> 
                <select name="crm_khxx_xqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqbm,xqmc from dm_xqbm order by xqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="71" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
              <td width="17%"> 
                <div align="right">身份证号码</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sfzhm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">出生日期 从</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_khxx_csrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_csrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">房价 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fj" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_fj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF">客户类型</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="crm_khxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">信息来源</td>
              <td width="33%"> 
                <select name="crm_khxx_xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,crm_khxx_dwbh,<%=dwstr%>)">
                  <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}

%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%> 
                </select>
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
                <div align="right">工程担当</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">房屋面积</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fwmj" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">每平米均价</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_pmjj" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">工程签约额 从</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">集成家居签约额</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_jcjjqye" size="20" maxlength="17" >
              </td>
              <td width="17%"> 
                <div align="right">签约序号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyxh" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否有优惠</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "crm_khxx_sfyyh","Y+是&N+否","");
%> </td>
              <td width="17%"> 
                <div align="right">优惠原因</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_yhyy" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">折扣率（&gt;0且&lt;=10） 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_zkl" size="20" maxlength="9" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zkl2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">合同号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">附赠项目</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_fzxm" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否返券</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "crm_khxx_sffj","Y+是&N+否","");
%> </td>
              <td width="17%"> 
                <div align="right">是否已认证</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "crm_khxx_sfyrz","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">签约日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">应开工日期 从</div>
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
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">实际开工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">首款金额</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_skje" size="20" maxlength="17" >
              </td>
              <td width="17%"> 
                <div align="right">首款日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_skrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">中款金额</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_zkje" size="20" maxlength="17" >
              </td>
              <td width="17%"> 
                <div align="right">中期款应付日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zkrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">中期款实付日期</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjzkrq" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">付款进度</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_fkjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+未付款&1+付首款&2+付中款&3+付尾款","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">应竣工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">实际竣工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjjgrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjjgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">交合同日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_jhtrq" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jhtrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">保修截止时间 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_bxjzsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_bxjzsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">增项金额</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_zxje" size="20" maxlength="17" >
              </td>
              <td width="17%"> 
                <div align="right">减项金额</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jxje" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">尾款金额</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_wkje" size="20" maxlength="17" >
              </td>
              <td width="17%"> 
                <div align="right">水电结算金额</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sdjsje" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">结算金额 从</div>
              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="crm_khxx_jsje" size="20" maxlength="17" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jsje2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
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
                <div align="right">完工标志</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+已完工&N+未完工","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">指派施工队</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_zpsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">指派原因</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zpyy" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">派单处理状态</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+申请派单&2+派单&3+拒绝派单&4+接受派单&5+保持原派&6+同意改派","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">派单类型</td>
              <td width="31%"> 
                <select name="crm_khxx_pdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+正常派单&2+指定派单","");
%> 
                </select>
              </td>
              <td width="17%" align="right">派单奖励</td>
              <td width="33%"> 
                <select name="crm_khxx_jlbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+回单奖励&2+公司奖励","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">派单时间 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_pdsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_pdsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">派单人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_pdr" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">派单说明</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_pdsm" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">施工队</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">施工班组</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">最新回访记录号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hfjlh" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">最新回访时间</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zxhfsj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否需回访</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sfxhf" size="20" maxlength="1" >
              </td>
              <td width="17%"> 
                <div align="right">回访类型</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">回访日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hfrq" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hfrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">户型</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">材质</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">风格</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">装修价位</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">油色</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">面积</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">样板间标志</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_ybjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+是&N+否","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">样板间登记时间 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_ybjdjsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_ybjdjsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">样板间有效期 从</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_khxx_ybjyxq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_ybjyxq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">参观样板间编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_ybjbh" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">样板间是否属实</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_ybjss" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+未核实&Y+属实&N+不属实","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">回单标志</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">回单是否属实</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_hdsfss" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+未核实&Y+属实&N+不属实","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">参观地址</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_cgdz" size="20" maxlength="100" >
              </td>
              <td width="17%"> 
                <div align="right">回单设计师</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hdsjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">回单施工队</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_hdsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">回单班组</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hdsgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">退单标志</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"2+签约客户&3+退单客户","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">退单序号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_tdxh" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">投诉标志</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_tsbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+有投诉&N+无投诉","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">投诉记录号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_tsjlh" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">报修标志</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_bxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+有报修&N+无报修","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">报修记录号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_bxjlh" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" bgcolor="#FFFFCC" align="right">信息录入人</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_lrr" size="20" maxlength="20" >
              </td>
              <td width="17%">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_lrsj" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">咨询客户编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_zxkhbh" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">考评标志</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_kpbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"N+未考评&Y+已考评","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">回访冻结标志</td>
              <td width="31%"> 
                <select name="crm_khxx_hfdjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+未冻结&1+工程回访冻结&2+投诉报修回访冻结&3+全部冻结","");
%> 
                </select>
              </td>
              <td width="17%" align="right">冻结人</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_djr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">最新冻结编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_djbh" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">冻结原因</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_djyy" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">冻结时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_djsj" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_djsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">计划解冻时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_jhjdsj" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jhjdsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">实际解冻时间</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjjdsj" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">解冻人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jdr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_bz" size="71" value="">
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
                <input type="button"  value="打印" onClick="f_do(selectform,'dy')" name="button" >
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
	if(!(isDatetime(FormName.crm_khxx_csrq, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_csrq2, "出生日期"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fj, "房价"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fj2, "房价"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_qyxh, "签约序号"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fwmj, "房屋面积"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_pmjj, "每平米均价"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye, "工程签约额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye2, "工程签约额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_jcjjqye, "集成家居签约额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_zkl, "折扣率"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_zkl2, "折扣率"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq2, "实际开工日期"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_skje, "首款金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_skrq, "首款日期"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_zkje, "中款金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_zkrq, "中期款应付日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjzkrq, "中期款实付日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "应竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "应竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq, "实际竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq2, "实际竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jhtrq, "交合同日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jhtrq2, "交合同日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_bxjzsj, "保修截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_bxjzsj2, "保修截止时间"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_zxje, "增项金额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_jxje, "减项金额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_wkje, "尾款金额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_jsje, "结算金额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_jsje2, "结算金额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_sdjsje, "水电结算金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_pdsj, "派单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_pdsj2, "派单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_zxhfsj, "最新回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_hfrq, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_hfrq2, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_ybjyxq, "样板间有效期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_ybjyxq2, "样板间有效期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_ybjdjsj, "样板间登记时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_ybjdjsj2, "样板间登记时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_djsj, "冻结时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_djsj2, "冻结时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jhjdsj, "计划解冻时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jhjdsj2, "计划解冻时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjdsj, "实际解冻时间"))) {
		return false;
	}

	if (lx=='cx')
	{
		FormName.action="Crm_khxxCxList.jsp";
	}
	else if (lx=='dy'){
		FormName.action="Crm_khxxDyList.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
