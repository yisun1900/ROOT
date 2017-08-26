<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gcysbbh=null;
String gcysxmbm=null;
String gcysxmmc=null;
String ysxmflbm=null;
String dygcjdbm=null;
String sfsgjdb=null;
String jdbm=null;
String sfhf=null;
String hflxbm=null;
String yszxsl=null;
String byxsl=null;
String fbyxzxsl=null;
String ysbzsm=null;
String bz=null;
String yssx=null;
String xmlx=null;
double ljskbfb=0;
double ysjj=0;
double zgysjj=0;
String sfxzjg=null;


String wheregcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
String wheregcysxmbm=cf.GB2Uni(request.getParameter("gcysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfxzjg,ysjj,zgysjj,yssx,gcysbbh,gcysxmbm,gcysxmmc,ysxmflbm,dygcjdbm,sfsgjdb,jdbm,sfhf,hflxbm,ljskbfb,yszxsl,byxsl,fbyxzxsl,ysbzsm,bz,xmlx ";
	ls_sql+=" from  dm_heysxm";
	ls_sql+=" where  (gcysbbh='"+wheregcysbbh+"') and  (gcysxmbm='"+wheregcysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yssx=cf.fillNull(rs.getString("yssx"));
		gcysbbh=cf.fillNull(rs.getString("gcysbbh"));
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		ysxmflbm=cf.fillNull(rs.getString("ysxmflbm"));
		dygcjdbm=cf.fillNull(rs.getString("dygcjdbm"));
		sfsgjdb=cf.fillNull(rs.getString("sfsgjdb"));
		jdbm=cf.fillNull(rs.getString("jdbm"));
		sfhf=cf.fillNull(rs.getString("sfhf"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		yszxsl=cf.fillNull(rs.getString("yszxsl"));
		byxsl=cf.fillNull(rs.getString("byxsl"));
		fbyxzxsl=cf.fillNull(rs.getString("fbyxzxsl"));
		ysbzsm=cf.fillNull(rs.getString("ysbzsm"));
		bz=cf.fillNull(rs.getString("bz"));
		xmlx=cf.fillNull(rs.getString("xmlx"));
		sfxzjg=cf.fillNull(rs.getString("sfxzjg"));
		ljskbfb=rs.getDouble("ljskbfb");
		ysjj=rs.getDouble("ysjj");
		zgysjj=rs.getDouble("zgysjj");
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
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditDm_heysxm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>验收版本号</td> 
  <td width="32%"> 
    <select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh",gcysbbh);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>验收项目编码</td>
  <td><input type="text" name="gcysxmbm" size="20" maxlength="4"  value="<%=gcysxmbm%>" ></td>
  <td align="right"><span class="STYLE1">*</span>验收顺序</td>
  <td><input name="yssx" type="text"  value="<%=yssx%>" size="20" maxlength="4" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>验收项目名称</td> 
  <td colspan="3"> 
    <input type="text" name="gcysxmmc" size="73" maxlength="100"  value="<%=gcysxmmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>验收项目分类</td> 
  <td width="32%"><select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm where ysxmflbm='05'",ysxmflbm);
%>
  </select></td>
  <td align="right" width="18%">对应工程进度</td> 
  <td width="32%"><select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",dygcjdbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否关联施工进度表</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfsgjdb","Y+是&N+否",sfsgjdb);
%></td>
  <td align="right" width="18%">施工进度进度节点</td> 
  <td width="32%"><select name="jdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwbm,rwmc from gdm_rwbm  order by rwbm",jdbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否回访</td>
  <td><%
	cf.radioToken(out, "sfhf","Y+设置&N+否",sfhf);
%></td>
  <td align="right">回访类型</td>
  <td><select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm",hflxbm);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">验收子项数量</td> 
  <td width="32%"> 
    <input type="text" name="yszxsl" size="20" maxlength="8"  value="<%=yszxsl%>" >  </td>
  <td align="right" width="18%">必验项数量</td> 
  <td width="32%"> 
    <input type="text" name="byxsl" size="20" maxlength="8"  value="<%=byxsl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">非必验项最小数量</td> 
  <td width="32%"> 
    <input type="text" name="fbyxzxsl" size="20" maxlength="8"  value="<%=fbyxzxsl%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>累计家装收款百分比</td> 
  <td width="32%"><input type="text" name="ljskbfb" size="20" maxlength="9"  value="<%=ljskbfb%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>项目类型</td>
  <td><%
	cf.radioToken(out, "xmlx","1+验收项&2+状态项",xmlx);
%></td>
  <td align="right"><span class="STYLE1">*</span>是否选择甲供</td>
  <td><%
	cf.radioToken(out, "sfxzjg","Y+选择&N+否",sfxzjg);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>品管验收奖金</td>
  <td><input type="text" name="ysjj" size="20" maxlength="16"  value="<%=ysjj%>" ></td>
  <td align="right"><span class="STYLE1">*</span>主管验收奖金</td>
  <td><input type="text" name="zgysjj" size="20" maxlength="16"  value="<%=zgysjj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收标准说明</td>
  <td colspan="3"><textarea name="ysbzsm" cols="72" rows="9"><%=ysbzsm%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
  </tr>
<input type="hidden" name="wheregcysbbh"  value="<%=wheregcysbbh%>" >
<input type="hidden" name="wheregcysxmbm"  value="<%=wheregcysxmbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
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
	if(	javaTrim(FormName.gcysbbh)=="") {
		alert("请选择[验收版本号]！");
		FormName.gcysbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("请输入[验收项目编码]！");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yssx)=="") {
		alert("请输入[验收顺序]！");
		FormName.yssx.focus();
		return false;
	}
	if(!(isNumber(FormName.yssx, "yssx"))) {
		return false;
	}
	if(	javaTrim(FormName.gcysxmmc)=="") {
		alert("请输入[验收项目名称]！");
		FormName.gcysxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ysxmflbm)=="") {
		alert("请选择[验收项目分类]！");
		FormName.ysxmflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhf)) {
		alert("请选择[是否回访]！");
		FormName.sfhf[0].focus();
		return false;
	}

	if(!(isNumber(FormName.yszxsl, "验收子项数量"))) {
		return false;
	}
	if(!(isNumber(FormName.byxsl, "必验项数量"))) {
		return false;
	}
	if(!(isNumber(FormName.fbyxzxsl, "非必验项最小数量"))) {
		return false;
	}
	if(	!radioChecked(FormName.xmlx)) {
		alert("请选择[项目类型]！");
		FormName.xmlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxzjg)) {
		alert("请选择[是否选择甲供]！");
		FormName.sfxzjg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ljskbfb)=="") {
		alert("请选择[累计家装收款百分比]！");
		FormName.ljskbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.ljskbfb, "累计家装收款百分比"))) {
		return false;
	}

	if(	javaTrim(FormName.ysjj)=="") {
		alert("请选择[品管验收奖金]！");
		FormName.ysjj.focus();
		return false;
	}
	if(!(isFloat(FormName.ysjj, "品管验收奖金"))) {
		return false;
	}
	if(	javaTrim(FormName.zgysjj)=="") {
		alert("请选择[主管验收奖金]！");
		FormName.zgysjj.focus();
		return false;
	}
	if(!(isFloat(FormName.zgysjj, "主管验收奖金"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
