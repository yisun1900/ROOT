<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String khbh=null;
String rwbm=null;
String rwmc=null;
String rwflbm=null;
String zdjkrw=null;
String bjlb=null;
String sqtxnr=null;
String sqtxts=null;
String shtxnr=null;
String shtxts=null;
String sfyxhxgq=null;
String sfyxfc=null;
String sfxys=null;
String sfwlcb=null;
String zyrwbm=null;
String rwxh=null;
String zrr=null;
String jddf=null;
String jhkssj=null;
String jhjssj=null;
String jhgzr=null;
String jdsyts=null;
String sjkssj=null;
String sjjssj=null;
String sjgzr=null;
String ysr=null;
String yssj=null;
String ysjl=null;
String yssm=null;
String sfyq=null;
String yqts=null;
String yqzrf=null;
String sfybgd=null;
String zgfa=null;
String yjzgwcsj=null;
String zgsfwc=null;
String zgwcsj=null;
String sjzgqk=null;
String sfyfbd=null;
String fbsfwc=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String whererwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,rwbm,rwmc,rwflbm,zdjkrw,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,sfyxhxgq,sfyxfc,sfxys,sfwlcb,zyrwbm,rwxh,zrr,jddf,jhkssj,jhjssj,jhgzr,jdsyts,sjkssj,sjjssj,sjgzr,ysr,yssj,ysjl,yssm,sfyq,yqts,yqzrf,sfybgd,zgfa,yjzgwcsj,zgsfwc,zgwcsj,sjzgqk,sfyfbd,fbsfwc,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwflbm=cf.fillNull(rs.getString("rwflbm"));
		zdjkrw=cf.fillNull(rs.getString("zdjkrw"));
		bjlb=cf.fillNull(rs.getString("bjlb"));
		sqtxnr=cf.fillNull(rs.getString("sqtxnr"));
		sqtxts=cf.fillNull(rs.getString("sqtxts"));
		shtxnr=cf.fillNull(rs.getString("shtxnr"));
		shtxts=cf.fillNull(rs.getString("shtxts"));
		sfyxhxgq=cf.fillNull(rs.getString("sfyxhxgq"));
		sfyxfc=cf.fillNull(rs.getString("sfyxfc"));
		sfxys=cf.fillNull(rs.getString("sfxys"));
		sfwlcb=cf.fillNull(rs.getString("sfwlcb"));
		zyrwbm=cf.fillNull(rs.getString("zyrwbm"));
		rwxh=cf.fillNull(rs.getString("rwxh"));
		zrr=cf.fillNull(rs.getString("zrr"));
		jddf=cf.fillNull(rs.getString("jddf"));
		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
		jhgzr=cf.fillNull(rs.getString("jhgzr"));
		jdsyts=cf.fillNull(rs.getString("jdsyts"));
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
		sjgzr=cf.fillNull(rs.getString("sjgzr"));
		ysr=cf.fillNull(rs.getString("ysr"));
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysjl=cf.fillNull(rs.getString("ysjl"));
		yssm=cf.fillNull(rs.getString("yssm"));
		sfyq=cf.fillNull(rs.getString("sfyq"));
		yqts=cf.fillNull(rs.getString("yqts"));
		yqzrf=cf.fillNull(rs.getString("yqzrf"));
		sfybgd=cf.fillNull(rs.getString("sfybgd"));
		zgfa=cf.fillNull(rs.getString("zgfa"));
		yjzgwcsj=cf.fillNull(rs.getDate("yjzgwcsj"));
		zgsfwc=cf.fillNull(rs.getString("zgsfwc"));
		zgwcsj=cf.fillNull(rs.getDate("zgwcsj"));
		sjzgqk=cf.fillNull(rs.getString("sjzgqk"));
		sfyfbd=cf.fillNull(rs.getString("sfyfbd"));
		fbsfwc=cf.fillNull(rs.getString("fbsfwc"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
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
<form method="post" action="SaveEditCrm_xmrwgl.jsp" name="editform">
<div align="center">任务实际情况</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"><%=khbh%></td>
  <td align="right" width="15%">任务编码</td> 
  <td width="35%"><%=rwbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">任务名称</td> 
  <td width="35%"><%=rwmc%></td>
  <td align="right" width="15%">任务分类</td> 
  <td width="35%"> 
<%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm",rwflbm,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">重点监控任务</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"1+重点监控&2+非重点监控",zdjkrw,true);
%>  </td>
  <td align="right" width="15%">报警类别</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"1+事前报警&2+事后提醒&3+事前事后都提醒&9+一般记录",bjlb,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">事前提醒内容</td> 
  <td width="35%"><%=sqtxnr%></td>
  <td align="right" width="15%">事前提醒天数</td> 
  <td width="35%"><%=sqtxts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">事后提醒内容</td> 
  <td width="35%"><%=shtxnr%></td>
  <td align="right" width="15%">事后提醒天数</td> 
  <td width="35%"><%=shtxts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">是否影响后续工期</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"Y+是&N+否",sfyxhxgq,true);
%>  </td>
  <td align="right" width="15%">是否影响复尺</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"Y+是&N+否",sfyxfc,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">是否需验收</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"Y+是&N+否",sfxys,true);
%>  </td>
  <td align="right" width="15%">是否为里程碑</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"Y+是&N+否",sfwlcb,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">摘要任务</td> 
  <td width="35%"> 
<%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm",zyrwbm,true);
%>  </td>
  <td align="right" width="15%">任务序号</td> 
  <td width="35%"><%=rwxh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划开始时间</td>
  <td><%=jhkssj%></td>
  <td align="right">计划结束时间</td>
  <td><%=jhjssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划工作日</td>
  <td><%=jhgzr%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>责任人</td> 
  <td width="35%"> 
    <input type="text" name="zrr" size="20" maxlength="50"  value="<%=zrr%>" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>节点得分</td> 
  <td width="35%"> 
    <input type="text" name="jddf" size="20" maxlength="8"  value="<%=jddf%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>实际开始时间</td> 
  <td width="35%"> 
    <input type="text" name="sjkssj" size="20" maxlength="10"  value="<%=sjkssj%>" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>实际结束时间</td> 
  <td width="35%"> 
    <input type="text" name="sjjssj" size="20" maxlength="10"  value="<%=sjjssj%>" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>实际工作日</td> 
  <td width="35%"> 
    <input type="text" name="sjgzr" size="20" maxlength="8"  value="<%=sjgzr%>" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>节点顺延天数</td> 
  <td width="35%"><input type="text" name="jdsyts" size="20" maxlength="8"  value="<%=jdsyts%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收人</td>
  <td><input type="text" name="ysr" size="20" maxlength="20"  value="<%=ysr%>" ></td>
  <td align="right">验收时间</td>
  <td><input type="text" name="yssj" size="20" maxlength="10"  value="<%=yssj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">验收结论</td> 
  <td width="35%"><%
	cf.radioToken(out, "ysjl","Y+通过&N+未通过",ysjl);
%></td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">验收说明</td> 
  <td colspan="3"> 
    <textarea name="yssm" cols="71" rows="3"><%=yssm%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否延期</td>
  <td><%
	cf.radioToken(out, "sfyq","Y+是&N+否",sfyq);
%></td>
  <td align="right">延期天数</td>
  <td><input type="text" name="yqts" size="20" maxlength="8"  value="<%=yqts%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">延期责任方</td> 
  <td width="35%"><input type="text" name="yqzrf" size="20" maxlength="20"  value="<%=yqzrf%>" ></td>
  <td align="right" width="15%">是否有工期变更单</td> 
  <td width="35%"><%
	cf.radioToken(out, "sfybgd","Y+有&N+无",sfybgd);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">整改方案</td> 
  <td colspan="3"><textarea name="zgfa" cols="71" rows="3"><%=zgfa%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">预计整改完成时间</td> 
  <td width="35%"> 
    <input type="text" name="yjzgwcsj" size="20" maxlength="10"  value="<%=yjzgwcsj%>" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">整改是否完成</td> 
  <td width="35%"><%
	cf.radioToken(out, "zgsfwc","Y+完成&N+未完成",zgsfwc);
%></td>
  <td align="right" width="15%">实际整改完成时间</td> 
  <td width="35%"><input type="text" name="zgwcsj" size="20" maxlength="10"  value="<%=zgwcsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">实际整改情况</td>
  <td colspan="3"><textarea name="sjzgqk" cols="71" rows="3"><%=sjzgqk%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>是否有返补单</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "sfyfbd","Y+有&N+无",sfyfbd);
%>  </td>
  <td align="right" width="15%">返补是否完成</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "fbsfwc","Y+完成&N+否",fbsfwc);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>录入时间</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>录入部门</td>
  <td>
	<select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
	  <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
	</select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
		<input type="hidden" name="whererwbm"  value="<%=whererwbm%>" >
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
	if(	javaTrim(FormName.zrr)=="") {
		alert("请输入[责任人]！");
		FormName.zrr.focus();
		return false;
	}
	if(	javaTrim(FormName.jddf)=="") {
		alert("请输入[节点得分]！");
		FormName.jddf.focus();
		return false;
	}
	if(!(isNumber(FormName.jddf, "节点得分"))) {
		return false;
	}
	if(	javaTrim(FormName.jdsyts)=="") {
		alert("请输入[节点顺延天数]！");
		FormName.jdsyts.focus();
		return false;
	}
	if(!(isNumber(FormName.jdsyts, "节点顺延天数"))) {
		return false;
	}
	if(	javaTrim(FormName.sjkssj)=="") {
		alert("请输入[实际开始时间]！");
		FormName.sjkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjkssj, "实际开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjssj)=="") {
		alert("请输入[实际结束时间]！");
		FormName.sjjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjssj, "实际结束时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sjgzr)=="") {
		alert("请输入[实际工作日]！");
		FormName.sjgzr.focus();
		return false;
	}
	if(!(isNumber(FormName.sjgzr, "实际工作日"))) {
		return false;
	}
	if(!(isDatetime(FormName.yssj, "验收时间"))) {
		return false;
	}
	if(!(isNumber(FormName.yqts, "延期天数"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzgwcsj, "预计整改完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zgwcsj, "整改完成时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyq)) {
		alert("请选择[是否延期]！");
		FormName.sfyq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyfbd)) {
		alert("请选择[是否有返补单]！");
		FormName.sfyfbd[0].focus();
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
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
