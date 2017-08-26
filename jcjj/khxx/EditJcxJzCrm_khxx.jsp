<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhmc=(String)session.getAttribute("yhmc");
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String dqbm=(String)session.getAttribute("dqbm");
%>
<%
String khbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String khlxbm=null;
String csrq=null;
String zybm=null;
String bz=null;
String xmzy=null;
String ssfgs=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,xb,fwdz,cqbm,lxfs,khlxbm,csrq,zybm,bz,xmzy,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		csrq=cf.fillNull(rs.getDate("csrq"));
		zybm=cf.fillNull(rs.getString("zybm"));
		bz=cf.fillNull(rs.getString("bz"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));

	
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>集成转家装客户</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">集成客户--->家装客户</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>客户姓名</div>
              </td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>性别</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>联系方式</td>
              <td width="32%"> 
                <input type="text" name="lxfs" size="20" maxlength="50"  value="<%=lxfs%>" >
              </td>
              <td width="18%" align="right">希望参加促销活动</td>
              <td width="32%"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'(订金：'||dj||'￥)' c2 from jc_cxhd where jsbz='N' and fgsbh='"+ssfgs+"' order by cxhdbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">年龄区间</td>
              <td width="32%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">职业</td>
              <td width="32%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">月收入</td>
              <td width="32%"> 
                <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">房价（元/m）</td>
              <td width="32%"> 
                <input type="text" name="fj" value="" size="20" maxlength="20" onKeyUp="keyTo(cqbm)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>所属城区</td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_fwdz(editform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>小区/街道</td>
              <td width="32%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" onChange="cf_fwdz(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" height="2">楼号/门牌号</td>
              <td width="32%" height="2"> 
                <input type="text" name="louhao" value="" size="20" maxlength="50" onChange="cf_fwdz(editform)">
              </td>
              <td colspan="2" height="2">注意：<font color="#0000FF">房屋地址</font>（城区＋小区＋楼号）自动生成，不需录入</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000FF">房屋地址</font></div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="73" maxlength="100"  value="<%=fwdz%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">所属热点地区</td>
              <td width="32%"> 
                <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">所属环线位置</td>
              <td width="32%"> 
                <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(nlqjbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">房屋类型</div>
              </td>
              <td width="32%"> 
                <select name="fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">计划交房时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jhjfsj" value="" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">户型</div>
              </td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">套内建筑面积</div>
              </td>
              <td width="32%"> 
                <input type="text" name="fwmj" size="20" maxlength="8"  value="" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td rowspan="4" width="18%"> 
                <div align="right"><font color="#CC0000">*</font>信息来源</div>
              </td>
              <td rowspan="4" width="32%"> 
                <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="7" multiple>
                  <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khlx='2' and khbh='"+khbh+"'");
%> 
                </select>
              </td>
              <td width="18%" align="right">风格要求</td>
              <td width="32%"> 
                <select name="fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",khbh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">装修预算</td>
              <td width="32%"> 
                <select name="zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",khbh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">预计装修时间</td>
              <td width="32%"> 
                <input type="text" name="yjzxsj" value="" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>客户类型</td>
              <td width="32%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%"> 
                <div align="right">回单标志</div>
              </td>
              <td width="32%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(editform)">
                  <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">回单人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="hdr" value="" size="20" maxlength="20" onKeyUp="keyTo(yzxxbz)" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">回单装修地址</td>
              <td colspan="3"> 
                <input type="text" name="cgdz" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>是否需回访</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sfxhf","Y+需回访&N+不需回访","");
%> </td>
              <td width="18%"> 
                <div align="right">回访日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="hfrq" size="20" maxlength="10"  value="" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>家装标志</td>
              <td width="32%"><%
	cf.radioToken(out, "jzbz","1+家装&2+公装","");
%> </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>咨询店面</td>
              <td width="32%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">咨询登记部门</font></td>
              <td width="31%">
                <select name="zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">录入人</font></td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>
              </td>
              <td width="19%" align="right"><font color="#0000CC">录入时间</font></td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="2"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
                  <input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
                  <input type="button"  value="转家装" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>
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

function f_do(FormName,lx)//参数FormName:Form的名称
{
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
/*
*/
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isNumber(FormName.fj, "房价"))) {
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
		alert("请选择[客户类型]！");
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

	if(	!radioChecked(FormName.jzbz)) {
		alert("请选择[家装标志]！");
		FormName.jzbz[0].focus();
		return false;
	}

	if(	javaTrim(FormName.zxdm)=="") {
		alert("请输入[咨询店面]！");
		FormName.zxdm.focus();
		return false;
	}

	cf_fwdz(FormName);



	FormName.action="SaveEditJcxJzCrm_khxx.jsp";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
