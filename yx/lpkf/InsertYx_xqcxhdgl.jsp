<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>


<%
String lrr=(String)session.getAttribute("yhmc");

String dqbm=null;
String xqmc=null;
String cqbm=null;
String dz=null;
String jw=null;
String xz=null;
String wyxs=null;
String zlhx=null;
String zlhxmj=null;
String lxsj=null;
String fyssj=null;
String jfhs=null;
String xqfzr=null;
String xqfzrdh=null;
String kfs=null;
String kfslxr=null;
String kfslxrzw=null;
String kfslxrdh=null;
String wygsmc=null;
String wydh=null;
String wylxr=null;
String wylxrzw=null;
String fgsbh=null;
String xqbh=cf.GB2Uni(request.getParameter("xqbh"));

String dwdz=null;
String dwdh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,xqmc,cqbm,dz,jw,xz,wyxs,zlhx,zlhxmj,lxsj,fyssj,jfhs,xqfzr,xqfzrdh,kfs,kfslxr,kfslxrzw,kfslxrdh,wygsmc,wydh,wylxr,wylxrzw,fgsbh ";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where  (xqbh='"+xqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xqmc=cf.fillNull(rs.getString("xqmc"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		dz=cf.fillNull(rs.getString("dz"));
		jw=cf.fillNull(rs.getString("jw"));
		xz=cf.fillNull(rs.getString("xz"));
		wyxs=cf.fillNull(rs.getString("wyxs"));
		zlhx=cf.fillNull(rs.getString("zlhx"));
		zlhxmj=cf.fillNull(rs.getString("zlhxmj"));
		lxsj=cf.fillNull(rs.getDate("lxsj"));
		fyssj=cf.fillNull(rs.getDate("fyssj"));
		jfhs=cf.fillNull(rs.getString("jfhs"));
		xqfzr=cf.fillNull(rs.getString("xqfzr"));
		xqfzrdh=cf.fillNull(rs.getString("xqfzrdh"));
		kfs=cf.fillNull(rs.getString("kfs"));
		kfslxr=cf.fillNull(rs.getString("kfslxr"));
		kfslxrzw=cf.fillNull(rs.getString("kfslxrzw"));
		kfslxrdh=cf.fillNull(rs.getString("kfslxrdh"));
		wygsmc=cf.fillNull(rs.getString("wygsmc"));
		wydh=cf.fillNull(rs.getString("wydh"));
		wylxr=cf.fillNull(rs.getString("wylxr"));
		wylxrzw=cf.fillNull(rs.getString("wylxrzw"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select dwdz,dwdh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwdz=cf.fillNull(rs.getString("dwdz"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
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

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertYx_xqcxhdgl.jsp" name="insertform" target="_blank">
<div align="center">录入活动申请</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">小区名称</td>
      <td width="31%"><%=xqmc%></td>
      <td align="right" width="20%">地址</td>
      <td width="30%"><%=dz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">开发商</td>
      <td width="31%"><%=kfs%></td>
      <td align="right" width="20%">电话</td>
      <td width="30%"><%=kfslxrdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">开发商联系人</td>
      <td width="31%"><%=kfslxr%> </td>
      <td align="right" width="20%">开发商联系人职务</td>
      <td width="30%"><%=kfslxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">物业公司名称</td>
      <td colspan="3"><%=wygsmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">物业联系人</td>
      <td width="31%"><%=wylxr%> </td>
      <td align="right" width="20%">物业联系人职务</td>
      <td width="30%"><%=wylxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">物业电话</td>
      <td width="31%"><%=wydh%> </td>
      <td align="right" width="20%">立项时间</td>
      <td width="30%"><%=lxsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">交钥匙时间</td>
      <td width="31%"><%=fyssj%> </td>
      <td align="right" width="20%">交房户数</td>
      <td width="30%"><%=jfhs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">主力户型</td>
      <td width="31%"><%=zlhx%> </td>
      <td align="right" width="20%">主力户型面积</td>
      <td width="30%"><%=zlhxmj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">物业形式</td>
      <td width="31%"><%=wyxs%> </td>
      <td align="right" width="20%">价位</td>
      <td width="30%"><%=jw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">小区负责人</td>
      <td width="31%"><%=xqfzr%> </td>
      <td align="right" width="20%">小区负责人电话</td>
      <td width="30%"><%=xqfzrdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">楼盘性质</td>
      <td width="31%"><%=xz%> </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">公司</td>
      <td width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
        </select>      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">地址</td>
      <td width="31%"><%=dwdz%></td>
      <td align="right" width="20%">电话</td>
      <td width="30%"><%=dwdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">小区<span class="STYLE1"><span class="STYLE2">开发立项</span></span>名称</td>
      <td colspan="3">
        <input type="text" name="xqhdmc" value="" size="74" maxlength="50" >
        <span class="STYLE1">活动</span> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">市场部负责人</td>
      <td width="31%"> 
        <input type="text" name="scbfzr" value="" size="20" maxlength="20" >      </td>
      <td align="right" width="20%">市场部负责人电话</td>
      <td width="30%"> 
        <input type="text" name="scbfzrdh" value="" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">市场部总人数</td>
      <td width="31%"> 
        <input type="text" name="scbzrs" value="" size="20" maxlength="8" >      </td>
      <td align="right" width="20%">市场部是否分组</td>
      <td width="30%"> 
        <select name="scbsffz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="N">未分组</option>
          <option value="Y">分组</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">高级家装顾问人数</td>
      <td width="31%"> 
        <input type="text" name="gjjzgwrs" value="" size="20" maxlength="8" >      </td>
      <td align="right" width="20%">人员异动率</td>
      <td width="30%"> 
        <input type="text" name="ryydl" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">计划开始时间</td>
      <td><input name="lhkssj" type="text" id="lhkssj" value="" size="20" maxlength="10" ></td>
      <td align="right">计划结束时间</td>
      <td><input name="jhjssj" type="text" id="jhjssj" value="" size="20" maxlength="10" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">申请立项次数</td>
      <td><input name="sqlxcs" type="text" id="sqlxcs" value="" size="20" maxlength="8" ></td>
      <td align="right">周期报告是否缺失</td>
      <td><input type="radio" name="bgsfqs" value="Y">
        是
        <input type="radio" name="bgsfqs" value="N">
        否 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">预计费用</td>
      <td width="31%"> 
        <input type="text" name="yjfy" value="" size="20" maxlength="16" >      </td>
      <td align="right" width="20%">预计产出</td>
      <td width="30%"> 
        <input type="text" name="yjcc" value="" size="20" maxlength="16" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">费用目的</td>
      <td colspan="3"><textarea name="fymd" cols="73" rows="2" id="fymd"></textarea></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">立项奖励处罚</td>
      <td colspan="3"><textarea name="lxjlcf" cols="73" rows="2" id="lxjlcf"></textarea></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF">
      <td align="right">分阶段考核周期</td>
      <td colspan="3"><textarea name="fjdkhzq" cols="73" rows="4" id="fjdkhzq"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">分阶段预计费用</td>
      <td colspan="3"><textarea name="fjdyjfy" cols="73" rows="4" id="fjdyjfy"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">分阶段预计产出</td>
      <td colspan="3"><textarea name="fjdyjcc" cols="73" rows="4" id="fjdyjcc"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">开发潜力</td>
      <td width="31%"> 
        <select name="kfql" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="A">A</option>
          <option value="B">B</option>
          <option value="C">C</option>
        </select>      </td>
      <td align="right" width="20%">开发形式</td>
      <td width="30%"> 
        <input type="text" name="kfxs" value="" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">开发目标</td>
      <td colspan="3"><textarea name="kfmb" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">开发描述</td>
      <td colspan="3"><textarea name="kfms" cols="73" rows="3" id="kfms"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">录入人</td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="20%">录入时间</td>
      <td width="30%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="xqbh"  value="<%=xqbh%>" >
        <input type="hidden" name="xqmc"  value="<%=xqmc%>" >
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.xqbh)=="") {
		alert("请输入[小区编号]！");
		FormName.xqbh.focus();
		return false;
	}
	if(!(isNumber(FormName.xqbh, "小区编号"))) {
		return false;
	}
	if(	javaTrim(FormName.xqhdmc)=="") {
		alert("请输入[小区活动名称]！");
		FormName.xqhdmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[公司编码]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请输入[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}
	if(!(isNumber(FormName.scbzrs, "市场部总人数"))) {
		return false;
	}
	if(!(isNumber(FormName.gjjzgwrs, "高级家装顾问人数"))) {
		return false;
	}
	if(!(isFloat(FormName.ryydl, "人员异动率"))) {
		return false;
	}
	if(!(isDatetime(FormName.lhkssj, "计划开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjssj, "计划结束时间"))) {
		return false;
	}
	if(!(isNumber(FormName.sqlxcs, "申请立项次数"))) {
		return false;
	}
	if(	javaTrim(FormName.yjfy)=="") {
		alert("请输入[预计费用]！");
		FormName.yjfy.focus();
		return false;
	}
	if(!(isNumber(FormName.yjfy, "预计费用"))) {
		return false;
	}
	if(	javaTrim(FormName.yjcc)=="") {
		alert("请输入[预计产出]！");
		FormName.yjcc.focus();
		return false;
	}
	if(!(isNumber(FormName.yjcc, "预计产出"))) {
		return false;
	}
	if(	javaTrim(FormName.kfmb)=="") {
		alert("请输入[开发目标]！");
		FormName.kfmb.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
