<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<%

String khxm=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String zt=null;
String sbyybm=null;
String sbyysm=null;
String sbdjr=null;
String sbdjsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
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
String sfxhf=null;
String xchfsj=null;
String dqbm=null;

String scbkhbh=cf.GB2Uni(request.getParameter("scbkhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khxm,fwdz,lxfs,ywy,zt,sbyybm,sbyysm,sbdjr,sbdjsj,lrr,lrsj,lrbm,crm_scbkhxx.ssfgs,crm_scbkhxx.bz,cqmc,jiedao,xqbm,louhao,dwmc ywyssxz,xqlx,fwmj,hxmc,fj,khzyxz,yjzxsj,jzdsmc,sfxhf,xchfsj ";
	ls_sql+=" from  crm_scbkhxx,dm_hxbm,sq_dwxx,dm_cqbm";
	ls_sql+=" where  crm_scbkhxx.hxbm=dm_hxbm.hxbm(+) and scbkhbh='"+scbkhbh+"'";
	ls_sql+=" and crm_scbkhxx.ywyssxz=sq_dwxx.dwbh(+) and crm_scbkhxx.cqbm=dm_cqbm.cqbm(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		zt=cf.fillNull(rs.getString("zt"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sbyysm=cf.fillNull(rs.getString("sbyysm"));
		sbdjr=cf.fillNull(rs.getString("sbdjr"));
		sbdjsj=cf.fillNull(rs.getDate("sbdjsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		xchfsj=cf.fillNull(rs.getDate("xchfsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
<title>移交</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveYjCrm_scbkhxx.jsp" name="editform">
<div align="center">市场部客户－移交（市场部客户编号：<%=scbkhbh%>）</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">客户编号</td>
	<td  width="7%">客户姓名</td>
	<td  width="7%">移交人</td>
	<td  width="7%">移交时间</td>
	<td  width="11%">移交部门</td>
	<td  width="62%">移交说明</td>
</tr>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT scbkhbh,khxm,yjr,yjsj,dwmc,yjsm";
	ls_sql+=" FROM crm_scbkhyjjl,sq_dwxx";
    ls_sql+=" where crm_scbkhyjjl.yjbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and scbkhbh='"+scbkhbh+"'";
    ls_sql+=" order by yjsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%>
</table>
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
    <td><%=lxfs%></td>
    <td align="right"></td>
    <td></td>
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
    <td align="right"><span class="STYLE2">是否需回访</span></td>
    <td><%
	cf.radioToken(out,"Y+需要&N+否",sfxhf,true);
%>    </td>
    <td align="right"><span class="STYLE2">下次回访时间</span></td>
    <td><%=xchfsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">竞争对手名称</span></td>
    <td colspan="3"><%=jzdsmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">业务员</span></td>
    <td><%=ywy%>    </td>
    <td align="right"><span class="STYLE2">业务员所属小组</span></td>
    <td><%=ywyssxz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2 STYLE2">录入人</span></td>
    <td><%=lrr%></td>
    <td align="right"><span class="STYLE2">录入时间</span></td>
    <td><%=lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2 STYLE2">录入部门</span></td>
    <td>
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>    </td>
    <td align="right"><span class="STYLE2">所属分公司</span></td>
    <td>
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%>   </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">备注</span></td>
    <td colspan="3"><%=bz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#999999">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>状态</td> 
  <td width="32%"> 
   <INPUT name="zt" type="radio" value="3" checked>
   移交   </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>移交部门</td> 
  <td width="32%"> 
    <select name="yjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">移交说明</td>
  <td colspan="3"><textarea name="yjsm" cols="72" rows="3"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2"><span class="STYLE1">*</span>移交人</span></td> 
  <td width="32%"><input type="text" name="yjr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right" width="18%"><span class="STYLE2"><span class="STYLE1">*</span>移交时间</span></td> 
  <td width="32%"><input type="text" name="yjsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="scbkhbh"  value="<%=scbkhbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.yjbm)=="") {
		alert("请输入[移交部门]！");
		FormName.yjbm.focus();
		return false;
	}

	if(	javaTrim(FormName.yjr)=="") {
		alert("请输入[移交人]！");
		FormName.yjr.focus();
		return false;
	}
	if(	javaTrim(FormName.yjsj)=="") {
		alert("请输入[移交时间]！");
		FormName.yjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjsj, "移交时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
