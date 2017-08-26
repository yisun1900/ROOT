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

%>
<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%" ><div align="center">
        <form method="post" action="SaveInsertCrm_zxkhxx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" bgcolor="#E8E8FF"> 
                <div align="right">客户所属分公司</div>              </td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right">咨询店面</div>              </td>
              <td width="32%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if ("".equals(dwbh))
		{
			out.println("<option value=\"\"></option>");
		}
		else{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh);
		}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">部门小组</td>
              <td width="32%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+dwbh+"' and dwlx in('F3') order by dwbh","");
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#0000CC">录入部门</font></td>
              <td width="32%"> 
                <select name="zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">设计师</td>
              <td width="32%"> 
                <select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <%
	if (!zwbm.equals("04"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm='04' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
	
	}
	else{
		out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
	}
%> 
                </select>              </td>
              <td width="18%" align="right">业务员</td>
              <td width="32%"> 
                <select name="ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <%
	if (!zwbm.equals("19"))
	{
		out.println("<option value=\"\"></option>");

		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' ";
		sql+=" and sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,"");

	}
	else{
		out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
			<td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>松下亿达客户编号</div>              </td>
              <td width="32%"> 
                <input type="text" name="boloniKhbh" value="" size="20" maxlength="50" onKeyUp="keyTo(xb[0])" >  
                <input type="button" value="查询获得" onclick="javascript:window.open('CxKhxx.jsp?khbh='+document.insertform.boloniKhbh.value)">            </td>
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>客户姓名</div>              </td>
              <td width="32%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50" onKeyUp="keyTo(xb[0])" >  
                           </td>
				</tr>
				<tr bgcolor="#FFFFFF" >
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>性别</div>              </td>
              <td width="32%" colspan="3"> 
                <input type="radio" name="xb"  value="M" onKeyUp="keyTo(lxfs)">
                男 
                <input type="radio" name="xb"  value="W" onKeyUp="keyTo(lxfs)">
                女 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">手机</td>
              <td colspan="3"> 
                <input type="text" name="lxfs" value="" size="40" maxlength="50" >
                <font color="#FF0000">用于接收短信，最好录一部,有多个电话<font color="#0000FF">用英文逗号</font>分隔</font>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">其它电话</td>
              <td colspan="3"> 
                <input type="text" name="qtdh" value="" size="40" maxlength="50">
                <font color="#FF0000">(注意：有多个电话<font color="#0000FF">用英文逗号</font>分隔)</font>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">电子邮件</td>
              <td colspan="3"> 
                <input type="text" name="email" value="" size="40" maxlength="50">
                <font color="#FF0000">(注意：有多个邮箱<font color="#0000FF">用英文逗号</font>分隔)</font>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>所属城区</div>              </td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(xqbm)" onChange="cf_fwdz(insertform)">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>小区</div>              </td>
              <td width="32%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" onKeyUp="keyTo(louhao)"  onChange="cf_fwdz(insertform)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>楼号</td>
              <td width="32%"> 
                <input type="text" name="louhao" value="" size="20" maxlength="50" onKeyUp="keyTo(fwdz)"  onChange="cf_fwdz(insertform)">              </td>
              <td colspan="2">注意：<font color="#0000FF">房屋地址</font>（城区＋小区＋楼号）自动生成，不需录入</td>
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
              <td width="18%" align="right">所属热点地区</td>
              <td width="32%"> 
                <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm","");
%> 
                </select>              </td>
              <td width="18%" align="right">所属环线位置</td>
              <td width="32%"> 
                <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(nlqjbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm","");
%> 
                </select>              </td>
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
              <td><select name="sshybm" id="sshybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
              <td align="right">样板间意向</td>
              <td colspan="3"><input name="ybjyx" type="text" value="" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">最中意的实体样板间</td>
              <td><select name="zzystybj" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select ybjbh,trim(ybjbh)||'('||mj||'m2)(￥'||zxzj||')' from ybj_stybjgl where lx='1' and clzt='1' order by ybjbh","");
%>
              </select></td>
              <td align="right">最中意的独立隔间</td>
              <td><select name="zzydlgj" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select ybjbh,trim(ybjbh)||'('||mj||'m2)(￥'||zxzj||')' from ybj_stybjgl where lx='2' and clzt='1' order by ybjbh","");
%>
              </select></td>
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
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">月收入</td>
              <td width="32%"> 
                <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");
%> 
                </select>              </td>
              <td width="18%" align="right">房价（元/m）</td>
              <td width="32%"> 
                <input type="text" name="fj" value="" size="20" maxlength="20" onKeyUp="keyTo(cqbm)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">房屋类型</div>              </td>
              <td width="32%"> 
                <select name="fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right">计划交房时间</div>              </td>
              <td width="32%"> 
                <input type="text" name="jhjfsj" value="" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">户型</div>              </td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fwmj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right">建筑面积</div>              </td>
              <td width="32%"> 
                <input type="text" name="fwmj" value="" size="20" maxlength="8" onKeyUp="keyTo(fgyqbm)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" rowspan="4" align="right">
			  <font color="#CC0000">*</font>信息来源<BR>
              <B><font color="#0000CC">(允许多选)</font></B>			  </td>
              <td rowspan="4" width="32%"> 
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
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>回单标志</td>
              <td width="32%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(hdr)">
                  <option value=""></option>
                  <option value="1">非回单</option>
                  <option value="3">施工队回单</option>
                  <option value="2">设计师回单</option>
                  <option value="4">老客户回单</option>
                  <option value="5">员工回单</option>
                  <option value="6">班长回单</option>
                  <option value="7">售楼处</option>
                  <option value="8">材料商</option>
                  <option value="9">其他</option>
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
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>是否需回访</div>              </td>
              <td width="32%"> 
                <input type="radio" name="sfxhf"  value="Y" >
                需回访 
                <input type="radio" name="sfxhf"  value="N" >
                不需回访 </td>
              <td width="18%"> 
                <div align="right">回访日期</div>              </td>
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
                <input type="radio" name="jzbz" value="1">
                家装 
                <input type="radio" name="jzbz" value="2">
                公装 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000FF">录入人</font></td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>              </td>
              <td width="18%" align="right"><font color="#0000CC">录入时间</font></td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">备注</div>              </td>
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
    </div></td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
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
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//参数FormName:Form的名称
{
	cf_fwdz(FormName);

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
	/*if( FormName.qtdh.value=="") {
		alert("请输入[其它电话]！");
		FormName.qtdh.focus();
		return false;
	}*/
	/*if(!(isMPhone(FormName.lxfs, "手机"))) {
		return false;
	}*/
	if(!(isPhone(FormName.qtdh, "其它电话"))) {
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
	if(!(isNumber(FormName.fwmj, "建筑面积"))) {
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

	if(	!radioChecked(FormName.jzbz)) {
		alert("请选择[家装标志]！");
		FormName.jzbz[0].focus();
		return false;
	}


	FormName.submit();
	FormName.savebutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
