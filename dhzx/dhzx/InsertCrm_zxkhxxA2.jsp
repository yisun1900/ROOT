<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");

String ssfgs=request.getParameter("ssfgs");
String dwbh=request.getParameter("dwbh");
String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+ssfgs+"'");
String dhqh=cf.executeQuery("select dhqh from sq_dwxx where dwbh='"+ssfgs+"'");
if (dhqh==null || dhqh.equals(""))
{
	out.println("错误！无电话区号，请联系系统管理员");
	return;
}


%>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%" ><div align="center">
        <form method="post" action="SaveInsertCrm_zxkhxxA.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                <div align="right">客户所属分公司              </td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                <div align="right">咨询店面              </td>
              <td width="32%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (dwbh.equals(""))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' and dwlx='F2' order by dwbh",dwbh);
		}
		else{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh);
		}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">所属设计室</td>
              <td width="32%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeSjsbh(insertform)">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+dwbh+"' and dwlx in('F3') order by dwbh","");
%> 
                </select>              </td>
              <td width="18%" align="right">设计师</td>
              <td width="32%"><select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <%
	if (!zwbm.equals("04"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
	
	}
	else{
		out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
	}
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">店长</td>
              <td><select name="dianz" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and xzzwbm='设计部经理' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">小区类型</td>
              <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
              </select></td>
              <td align="right">客户资源性质</td>
              <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">客户经理</td>
              <td><select name="khjl" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <%
	if (!zwbm.equals("03"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm='03' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
	
	}
	else{
		out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
	}
%>
              </select></td>
              <td align="right">登记表编号</td>
              <td><input name="djbbh" type="text" value="" size="20" maxlength="20"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>客户姓名              </td>
              <td width="32%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50" onKeyUp="keyTo(xb[0])" >
                <input type="hidden" name="boloniKhbh" value="" size="15" maxlength="20" ></td>
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>性别              </td>
              <td width="32%"> 
                <input type="radio" name="xb"  value="M" onKeyUp="keyTo(lxfs)">
                男 
                <input type="radio" name="xb"  value="W" onKeyUp="keyTo(lxfs)">
                女 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000FF">联系方式</font></td>
              <td colspan="3"> 
                <input type="text" name="lxfs" value="" size="70" maxlength="100" readonly>
                <input type="hidden" name="khlxfs" value=""  >
                <input type="button" value="录入电话" onClick="if (javaTrim(khxm)=='') {alert('录入[客户姓名]');khxm.select();return false;};window.open('getLxfs.jsp?dhqh=<%=dhqh%>&khlxfs='+khlxfs.value+'&lxr='+khxm.value,'','height=400,width=800,top=200,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')""></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">电子邮件</td>
              <td colspan="3"> 
                <input type="text" name="email" value="" size="40" maxlength="50">
                <font color="#FF0000">(注意：有多个邮箱<font color="#0000FF">用英文逗号</font>分隔)</font>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>所属城区              </td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(xqbm)" onChange="cf_fwdz(insertform)">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>              </td>
              <td width="18%" align="right">街道</td>
              <td width="32%"><input name="jiedao" type="text"  onChange="cf_fwdz(insertform)" onKeyUp="keyTo(fwdz)" value="" size="20" maxlength="50"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>小区</td>
              <td>
			  <input type="text" name="xqbm" value="" size="20" maxlength="50"  onKeyUp="changheIn(insertform)"  onblur="cf_fwdz(insertform)"></td>
              <td align="right"><font color="#CC0000">*</font>楼号</td>
              <td><input type="text" name="louhao" value="" size="20" maxlength="50" onKeyUp="keyTo(fwdz)"  onChange="cf_fwdz(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">&nbsp;</td>
              <td colspan="3">
				<select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
				</select>
			  注意：<font color="#0000FF">房屋地址</font>（城区＋街道＋小区＋楼号）自动生成，不需录入</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">房屋地址</font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="" size="73" maxlength="100" onKeyUp="keyTo(fwlxbm)" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">有效通信地址</td>
              <td colspan="3"><input name="yxtxdz" type="text" value="" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>是否远程客户</td>
              <td>
			  <input type="radio" name="sfyckh"  value="Y"  >是
              <input type="radio" name="sfyckh"  value="N" >否			  </td>
              <td align="right"><font color="#CC0000">*</font>派单区域</td>
              <td><select name="pdqybm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
		cf.selectItem(out,"select pdqybm,pdqymc from dm_pdqybm where dqbm='"+dqbm+"' order by pdqybm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">参加公司促销活动</td>
              <td colspan="3"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:520PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx in('1','2') order by jc_cxhd.cxhdmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">参加小区促销活动</td>
              <td colspan="3"> 
                <select name="cxhdbmxq" style="FONT-SIZE:12PX;WIDTH:520PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx='3'  order by jc_cxhd.cxhdmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">参加展会促销活动</td>
              <td colspan="3"> 
                <select name="cxhdbmzh" style="FONT-SIZE:12PX;WIDTH:520PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx='4'  order by jc_cxhd.cxhdmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">所属行业</td>
              <td><select name="sshybm"  style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select sshybm,sshymc from dm_sshybm order by sshybm","");
%>
              </select></td>
              <td align="right">职业</td>
              <td><select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">购买意向</td>
              <td colspan="3"><input name="gmyx" type="text" value="设计施工、主材、家具、配饰" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">年龄区间</td>
              <td width="32%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");
%> 
                </select>              </td>
              <td width="18%" align="right">月收入</td>
              <td width="32%"><select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(fj)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">房屋类型</td>
              <td width="32%"><select name="fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(hxbm)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");
%>
              </select></td>
              <td width="18%" align="right">房价（元/m）</td>
              <td width="32%"> 
                <input type="text" name="fj" value="" size="20" maxlength="20" onKeyUp="keyTo(cqbm)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">计划交房时间</td>
              <td width="32%"><input type="text" name="jhjfsj" value="" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)"></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <div align="right">户型              </td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fwmj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                <div align="right"> <font color="#CC0000">*</font>套内建筑面积              </td>
              <td width="32%"> 
                <input type="text" name="fwmj" value="" size="20" maxlength="8" onKeyUp="keyTo(fgyqbm)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" rowspan="4" align="right">
			  <font color="#CC0000">*</font>信息来源<BR>
              <B><font color="#0000CC">(允许多选)</font></B>			  </td>
              <td width="32%" rowspan="4" bgcolor="#FFFFFF"> 
                <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(khlxbm)" size="7" multiple>
                  <%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
%> 
                </select></td>
              <td width="18%" align="right">风格要求</td>
              <td width="32%"> 
                <select name="fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(zxysbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">装修预算</td>
              <td width="32%"> 
                <select name="zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(yjzxsj)" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">预计装修时间</td>
              <td width="32%"> 
                <input type="text" name="yjzxsj" value="" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>关系客户</td>
              <td width="32%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(hdbz)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">信息来源说明</td>
              <td colspan="3"><input name="xxlysm" type="text" value="" size="73" maxlength="100"></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>回单标志</td>
              <td width="32%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(hdr)">
                  <option value=""></option>
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm","");
%>
                </select>              </td>
              <td width="18%" align="right">回单人</td>
              <td width="32%"> 
                <input type="text" name="hdr" value="" size="20" maxlength="20"  >              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">回单装修地址</td>
              <td colspan="3"> 
                <input type="text" name="cgdz" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>是否需回访              </td>
              <td width="32%"> 
                <input type="radio" name="sfxhf"  value="Y" >
                需回访 
                <input type="radio" name="sfxhf"  value="N" >
                不需回访 </td>
              <td width="18%" align="right"> 
                回访日期              </td>
              <td width="32%"> 
                <input type="text" name="hfrq" value="" size="20" maxlength="10" onKeyUp="keyGo(bz)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>有效信息标志</td>
              <td width="32%"> 
                <input type="radio" name="yzxxbz" value="Y" checked>
                有效信息</td>
              <td width="18%" align="right"><font color="#CC0000">*</font>家装标志</td>
              <td width="32%"> 
                <input type="radio" name="jzbz" value="1" checked>
                家装 
                <input type="radio" name="jzbz" value="2">
                公装 </td>
            </tr>
			 <tr bgcolor="#E8E8FF"> 
              <td align="right"><font color="#CC0000">*</font>量房标志</td>
              <td >
              <input type="radio" name="lfbz" value="N" >
                未量房
                <input type="radio" name="lfbz" value="Y">
               已量房</td>
              <td align="right">量房时间</td>
              <td > 
                <input type="text" name="lfsj" size="20" maxlength="20"  value="" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">车辆品牌</td>
              <td><input name="clpp" type="text" value="" size="20" maxlength="20" ></td>
              <td align="right">车牌号</td>
              <td><input type="text" name="cph" value="" size="20" maxlength="20" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">穿着描述</td>
              <td colspan="3"><input type="text" name="czms" value="" size="73" maxlength="50"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">功能要求</td>
              <td colspan="3"><textarea name="gnyq" cols="72" rows="3" ></textarea></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">婚姻情况</td>
              <td><input type="radio" name="hyzk" value="已婚">已婚
                <input type="radio" name="hyzk" value="未婚">未婚				</td>
              <td align="right">是否贷款装修</td>
              <td>
				  <input type="radio" name="sfdkzx" value="是">是
				  <input type="radio" name="sfdkzx" value="否">否				  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">孩子年龄</td>
              <td><input type="text" name="hznl" value="" size="20" maxlength="20" ></td>
              <td align="right">老人同住</td>
              <td>
				<input type="radio" name="lrtz" value="是">是
				  <input type="radio" name="lrtz" value="否">否				  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">预约量房时间</td>
              <td><input type="text" name="yylfsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">下次来访时间</td>
              <td><input type="text" name="xclfsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">计划出平面图时间</td>
              <td><input type="text" name="jhctsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">计划出效果图时间</td>
              <td><input type="text" name="jhcxgtsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">计划出施工图时间</td>
              <td><input type="text" name="jhcsgtsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">计划做电子报价时间</td>
              <td><input type="text" name="jhzbjsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">录入人</font></td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
              <td><select name="zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <div align="right">备注              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="71" rows="2" onKeyUp="keyTo(savebutton)"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
                <input type="button"  value="允许再次存盘" onClick="insertform.savebutton.disabled=false" >              </td>
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

var lx;
//当在下拉框外单击时，下拉框消失
document.onclick=function()
{
	insertform.valuelist.style.display='none';
}

//改变输入值
function changheIn(FormName)
{   

	if(event.keyCode==13)//回车
	{
		insertform.valuelist.style.display='none';
	}
	else if(event.keyCode==38)//上箭头
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
		mark="last";

		oldtext=FormName.xqbm.value;

		FormName.xqbm.value=FormName.valuelist.options[FormName.valuelist.length-1].text;
	}
	else if(event.keyCode==40)//下箭头
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[0].selected=true;
		mark="first";

		oldtext=FormName.xqbm.value;

		FormName.xqbm.value=FormName.valuelist.options[0].text;
	}
	else{//其它键
		if(FormName.xqbm.value=="") 
		{
			insertform.valuelist.style.display='none';
			return;
		}

		//获取型号列表
		var actionStr="/dhzx/scbkh/GetListByAjax.jsp?dqbm=<%=dqbm%>&invalue="+FormName.xqbm.value;

//		window.open(actionStr);
		lx="1";
		openAjax(actionStr);  
	}

}                                                                                                                                                       


function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		//去除前面的换行符
		while (true)
		{
			if (ajaxRetStr.substring(0,1)=="\r")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else if (ajaxRetStr.substring(0,1)=="\n")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else{
				break;
			}
		}

		//生成下拉框
		insertform.valuelist.length=0;

		if (ajaxRetStr!="")
		{
			insertform.valuelist.style.display='block';
			strToItem3(insertform.valuelist,ajaxRetStr);
		}
		else{
			insertform.valuelist.style.display='none';
		}
	}
	else if (lx=="2")
	{
		strToItem2(insertform.sjs,ajaxRetStr);
	}
}

//改变下拉框条目
function changeItem(FormName,field)
{
	if(event.keyCode==38)//上箭头
	{
		if (mark=="last")
		{
			mark="";
		}

		FormName.xqbm.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==0)
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.xqbm.value=oldtext;

				FormName.xqbm.focus();
			}
			else{
				mark="first";
			}
		}
	}
	else if(event.keyCode==40)//下箭头
	{
		if (mark=="first")
		{
			mark="";
		}

		FormName.xqbm.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==field.length-1)
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.xqbm.value=oldtext
				FormName.xqbm.focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)//回车
	{
		insertform.valuelist.style.display='none';
		FormName.xqbm.focus();
	}
}

//双击下拉框条目
function selectCk(FormName,field)
{
	insertform.valuelist.style.display='none';
	FormName.xqbm.value=field.options[field.selectedIndex].text;
	FormName.xqbm.focus();
}


function changeSjsbh(FormName)
{
	FormName.sjs.length=1;

	if (FormName.sjsbh.value=="")
	{
		return;
	}


	var sql;
	sql =" select yhmc";
	sql+=" from sq_yhxx ";
	sql+=" where sjsbh='"+FormName.sjsbh.value+"'";
	sql+=" and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') ";
	sql+=" ORDER BY yhmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	lx="2";
	openAjax(actionStr);

}


function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单;5：员工回单
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      

function cf_fwdz(FormName)
{  
	FormName.jiedao.value=strTrim(FormName.jiedao.value);
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.jiedao.value+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//参数FormName:Form的名称
{
	cf_fwdz(FormName);

	if(	javaTrim(FormName.pdqybm)=="") {
		alert("请输入[派单区域]！");
		FormName.pdqybm.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}

	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}
	if(!(isNumber(FormName.fj, "房价"))) {
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("请输入[所属区域]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("请输入[小区]！");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("请输入[楼号]！");
		FormName.louhao.focus();
		return false;
	}
		if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[建筑面积]！");
		FormName.fwmj.focus();
		return false;
	}
/*
*/
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj, "计划交房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "预计装修时间"))) {
		return false;
	}
	if(	!selectChecked(FormName.xxlybm)) {
		alert("请输入[信息来源]！");
		FormName.xxlybm.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "套内建筑面积"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq, "回访日期"))) {
		return false;
	}


	if(	!radioChecked(FormName.sfxhf)) {
		alert("请选择[是否需回访]！");
		FormName.sfxhf[0].focus();
		return false;
	}
	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.hfrq)=="") {
			alert("请选择[回访日期]！");
			FormName.hfrq.focus();
			return false;
		}
	}
	else{
		FormName.hfrq.value="";
	}

	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[关系客户]！");
		FormName.khlxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.hdbz)=="") {
		alert("请选择[回单标志]！");
		FormName.hdbz.focus();
		return false;
	}


	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		if(	javaTrim(FormName.cgdz)=="") {
			alert("请输入[回单装修地址]！");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("请输入[回单人]！");
			FormName.hdr.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.yzxxbz)=="") {
		alert("请输入[有效信息标志]！");
		FormName.yzxxbz.focus();
		return false;
	}
   if(	!radioChecked(FormName.lfbz)) {
		alert("请选择[量房标志]！");
		FormName.lfbz[0].focus();
		return false;
	}
	if (FormName.lfbz[1].checked)
	{
		if(	javaTrim(FormName.lfsj)=="") {
			alert("请输入[量房时间]！");
			FormName.lfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.lfsj, "量房时间"))) {
			return false;
		}
	}
	else{
		FormName.lfsj.value="";
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("请选择[家装标志]！");
		FormName.jzbz[0].focus();
		return false;
	}

	if(!(isDatetime(FormName.jhctsj, "计划出平面图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcxgtsj, "计划出效果图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcsgtsj, "计划出施工图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhzbjsj, "计划做电子报价时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yylfsj, "预约量房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xclfsj, "下次来访时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyckh)) {
		alert("请选择[是否远程客户 ]！");
		FormName.sfyckh[0].focus();
		return false;
	}

	FormName.submit();
	FormName.savebutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
