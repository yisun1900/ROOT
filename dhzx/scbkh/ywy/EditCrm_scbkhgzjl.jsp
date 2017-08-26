<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jlh=null;
String scbkhbh=null;
String gzsm=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String sfxhf=null;
String xchfsj=null;
String sckhyxbm=null;
String yyddsj=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String zt=null;
String sbyybm=null;
String sbyysm=null;
String sbdjr=null;
String sbdjsj=null;
String ssfgs=null;
String bz=null;
String cqbm=null;
String jiedao=null;
String xqbm=null;
String louhao=null;
String ywyssxz=null;
String xqlx=null;
String fwmj=null;
String hxbm=null;
String fj=null;
String khzyxz=null;
String yjzxsj=null;
String jzdsmc=null;
String dqbm=null;
String zjgzsj=null;

String wherejlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select jlh,scbkhbh,gzsm,lrr,lrsj,lrbm,sfxhf,xchfsj,sckhyxbm,yyddsj ";
	ls_sql+=" from  crm_scbkhgzjl";
	ls_sql+=" where  (jlh='"+wherejlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jlh=cf.fillNull(rs.getString("jlh"));
		scbkhbh=cf.fillNull(rs.getString("scbkhbh"));
		gzsm=cf.fillNull(rs.getString("gzsm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		xchfsj=cf.fillNull(rs.getDate("xchfsj"));
		sckhyxbm=cf.fillNull(rs.getString("sckhyxbm"));
		yyddsj=cf.fillNull(rs.getDate("yyddsj"));
	}
	rs.close();
	ps.close();


	ls_sql="select crm_scbkhxx.zjgzsj,khxm,fwdz,lxfs,ywy,zt,sbyybm,sbyysm,sbdjr,sbdjsj,crm_scbkhxx.ssfgs,crm_scbkhxx.bz,cqmc,jiedao,xqbm,louhao,dwmc ywyssxz,xqlx,fwmj,hxmc,fj,khzyxz,yjzxsj,jzdsmc  ";
	ls_sql+=" from  crm_scbkhxx,dm_hxbm,sq_dwxx,dm_cqbm";
	ls_sql+=" where  crm_scbkhxx.hxbm=dm_hxbm.hxbm(+) and scbkhbh='"+scbkhbh+"'";
	ls_sql+=" and crm_scbkhxx.ywyssxz=sq_dwxx.dwbh(+) and crm_scbkhxx.cqbm=dm_cqbm.cqbm(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjgzsj=cf.fillNull(rs.getDate("zjgzsj"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		zt=cf.fillNull(rs.getString("zt"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sbyysm=cf.fillNull(rs.getString("sbyysm"));
		sbdjr=cf.fillNull(rs.getString("sbdjr"));
		sbdjsj=cf.fillNull(rs.getDate("sbdjsj"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bz=cf.fillNull(rs.getString("bz"));
		cqbm=cf.fillNull(rs.getString("cqmc"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		xqlx=cf.fillNull(rs.getString("xqlx"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxbm=cf.fillNull(rs.getString("hxmc"));
		fj=cf.fillNull(rs.getString("fj"));
		khzyxz=cf.fillNull(rs.getString("khzyxz"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		jzdsmc=cf.fillNull(rs.getString("jzdsmc"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_scbkhgzjl.jsp" name="editform">
<div align="center">请修改信息（记录号：<%=jlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户姓名</span></td>
    <td><%=khxm%></td>
    <td align="right"><span class="STYLE2">状态</span></td>
    <td><%
	cf.radioToken(out, "1+跟踪&2+失败&3+移交&4+已接收&5+准备移交&6+准备失败&7+移交过期",zt,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">联系方式</span></td>
    <td colspan="3"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">所属城区</span></td>
    <td><%=cqbm%></td>
    <td align="right"><span class="STYLE2">街道</span></td>
    <td><%=jiedao%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">小区</span></td>
    <td><%=xqbm%></td>
    <td align="right"><span class="STYLE2">楼号</span></td>
    <td><%=louhao%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">房屋地址</span></td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">小区类型</span></td>
    <td><%=xqlx%></td>
    <td align="right"><span class="STYLE2">户型</span></td>
    <td><%=hxbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">建筑面积</span></td>
    <td><%=fwmj%></td>
    <td align="right"><span class="STYLE2">房价（元/m）</span></td>
    <td><%=fj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户资源性质</span></td>
    <td><%=khzyxz%></td>
    <td align="right"><span class="STYLE2">预计装修时间</span></td>
    <td><%=yjzxsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">竞争对手名称</span></td>
    <td colspan="3"><%=jzdsmc%></td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">业务员</span></td>
    <td><%=ywy%> </td>
    <td align="right"><span class="STYLE2">业务员所属小组</span></td>
    <td><%=ywyssxz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">最近跟踪时间</span></td>
    <td><%=zjgzsj%></td>
    <td align="right"><span class="STYLE2">所属分公司</span></td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">备注</span></td>
    <td colspan="3"><%=bz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#999999">&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>客户意向</td>
  <td><select name="sckhyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <OPTION  value=""></OPTION>
    <%
	cf.selectItem(out,"select sckhyxbm,sckhyxmc from dm_sckhyxbm order by sckhyxbm",sckhyxbm);
%>
  </select></td>
  <td align="right">预约客户到店时间</td>
  <td><input type="text" name="yyddsj" size="20" maxlength="10"  value="<%=yyddsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否需回访</td>
  <td><%
	cf.radioToken(out, "sfxhf","Y+需要&N+否",sfxhf);
%>  </td>
  <td align="right">下次回访时间</td>
  <td><input type="text" name="xchfsj" size="20" maxlength="10"  value="<%=xchfsj%>" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>跟踪说明</td> 
  <td colspan="3"> 
    <textarea name="gzsm" cols="72" rows="6"><%=gzsm%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td> 
  <td width="32%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="wherejlh"  value="<%=wherejlh%>" >
	    <input type="hidden" name="scbkhbh" value="<%=scbkhbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.scbkhbh)=="") {
		alert("请输入[市场部客户编号]！");
		FormName.scbkhbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sckhyxbm)=="") {
		alert("请输入[客户意向]！");
		FormName.sckhyxbm.focus();
		return false;
	}
	if(!(isDatetime(FormName.yyddsj, "预约客户到店时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxhf)) {
		alert("请选择[是否需回访]！");
		FormName.sfxhf[0].focus();
		return false;
	}
	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.xchfsj)=="") {
			alert("请输入[下次回访时间]！");
			FormName.xchfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.xchfsj, "下次回访时间"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.xchfsj)!="") {
			alert("不需输入[下次回访时间]！");
			FormName.xchfsj.select();
			return false;
		}
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
