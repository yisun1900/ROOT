<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>
<%

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cqbm=null;
String cgdz=null;
String yzxxbz=null;
String jzbz=null;

String sjs=null;

String nlqjbm=null;
String zybm=null;
String fj=null;
String yjzxsj=null;
String xqbm=null;
String ywy=null;
String ssfgs=null;

String jhjfsj=null;
String hdr=null;
String sjsbh=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;
String louhao=null;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select cxhdbmxq,cxhdbmzh,cxhdbm,louhao,ysrbm,rddqbm,hxwzbm,sjsbh,jzbz,jhjfsj,hdr,ssfgs,ywy,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,yzxxbz,nlqjbm,zybm,fj,yjzxsj,xqbm ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		jhjfsj=cf.fillNull(rs.getDate("jhjfsj"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		yzxxbz=cf.fillNull(rs.getString("yzxxbz"));

		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">活动变更（<font color="#CC0000">*</font>为必填字段）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditHdbgCrm_zxkhxx.jsp" name="editform" target="_blank">
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
              <td colspan="2"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right">希望参加公司促销活动</td>
              <td colspan="3">
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:520PX" onKeyUp="keyGo(yhyy)" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd where jc_cxhd.fgsbh='"+ssfgs+"' and jc_cxhd.hdlx in('1','2') order by jc_cxhd.jsbz,jc_cxhd.cxhdmc",cxhdbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">希望参加小区促销活动</td>
              <td colspan="3">
                <select name="cxhdbmxq" style="FONT-SIZE:12PX;WIDTH:520PX" onKeyUp="keyGo(yhyy)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd where jc_cxhd.fgsbh='"+ssfgs+"' and jc_cxhd.hdlx='3'  order by jc_cxhd.jsbz,jc_cxhd.cxhdmc",cxhdbmxq);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">参加展会促销活动</td>
              <td colspan="3">
                <select name="cxhdbmzh" style="FONT-SIZE:12PX;WIDTH:520PX" onKeyUp="keyGo(yhyy)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd where jc_cxhd.fgsbh='"+ssfgs+"' and jc_cxhd.hdlx='4'  order by jc_cxhd.jsbz,jc_cxhd.cxhdmc",cxhdbmzh);
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
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">职业</td>
              <td width="32%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
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
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">房价（元/m）</td>
              <td width="32%"> 
                <input type="text" name="fj" value="<%=fj%>" size="20" maxlength="20" onKeyUp="keyTo(cqbm)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>所属城区</td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_fwdz(editform)">
                  <option value=""></option>
                  <%
	//cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm);
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>小区/街道</td>
              <td width="32%"> 
                <input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onChange="cf_fwdz(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" height="2">楼号/门牌号</td>
              <td width="32%" height="2"> 
                <input type="text" name="louhao" value="<%=louhao%>" size="20" maxlength="50" onChange="cf_fwdz(editform)">
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
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm",rddqbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">所属环线位置</td>
              <td width="32%"> 
                <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(nlqjbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm",hxwzbm);
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
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">计划交房时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jhjfsj" value="<%=jhjfsj%>" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" >
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
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">套内建筑面积</div>
              </td>
              <td width="32%"> 
                <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td rowspan="4" width="18%"> 
                <div align="right"><font color="#CC0000">*</font>信息来源</div>
              </td>
              <td rowspan="4" width="32%"> 
                <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="7" multiple>
                  <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khlx='2' and khbh='"+wherekhbh+"'");
%> 
                </select>
              </td>
              <td width="18%" align="right">风格要求</td>
              <td width="32%"> 
                <select name="fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
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
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxysbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">预计装修时间</td>
              <td width="32%"> 
                <input type="text" name="yjzxsj" value="<%=yjzxsj%>" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>关系客户</td>
              <td width="32%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">业务员</td>
              <td width="32%"> <%
if (yhjs.equals("A0")||yhdlm.equals("wrui")||yhdlm.equals("wuxfeng"))
{
	%> 
                <select name="ywy" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(sfyyh[0])"  >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='19' order by yhmc",ywy);
%> 
                </select>
                <%
}
else{
	%> 
                <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" readonly>
                <%
}
%> </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
              <%
if (!dwlx.equals("F2"))
{
%> <%
}
%> 
            <tr bgcolor="#E8E8FF"> 
              <td width="18%"> 
                <div align="right">回单标志</div>
              </td>
              <td width="32%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(editform)">
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm",hdbz);
%>
                </select>
              </td>
              <td width="18%"> 
                <div align="right">回单人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20" onKeyUp="keyTo(yzxxbz)" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">回单装修地址</td>
              <td colspan="3"> 
                <input type="text" name="cgdz" value="<%=cgdz%>" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>是否需回访</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sfxhf","Y+需回访&N+不需回访",sfxhf);
%> </td>
              <td width="18%"> 
                <div align="right">回访日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="hfrq" size="20" maxlength="10"  value="<%=hfrq%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>有效信息标志</td>
              <td width="32%"> <%
	cf.radioToken(out, "yzxxbz","Y+有效信息&N+无效信息",yzxxbz);
%> </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>家装标志</td>
              <td width="32%"> <%
	cf.radioToken(out, "jzbz","1+家装&2+公装",jzbz);
%> </td>
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
                  <input type="button"  value="保存" onClick="f_do(editform)">
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

function f_do(FormName)//参数FormName:Form的名称
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

	if(	!radioChecked(FormName.yzxxbz)) {
		alert("请选择[有效信息标志]！");
		FormName.yzxxbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("请选择[家装标志]！");
		FormName.jzbz[0].focus();
		return false;
	}

	cf_fwdz(FormName);


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
