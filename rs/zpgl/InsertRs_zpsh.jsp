<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zpsqbh_1=null;
String fgs=null;
String sqbm=null;
String zbzw=null;
String zprs=null;
String zpfy=null;
String zbly=null;
String zbqt=null;
String xwdgsj=null;
String xbyq=null;
String hyyq=null;
String nlyq=null;
String xl=null;
String zy=null;
String wy=null;
String jsjnl=null;
String gzjy=null;
String gx=null;
String jn=null;
String qt=null;
String rygznr=null;
String sqzt=null;
String lrr=null;
String lrsj=null;
String ssfgs=null;
String bz=null;
String shbh_1=null;
String shyj_1=null;
String shr_1=null;
String shsj_1=null;
String shjl_1=null;
String shhrs=null;
String ztbm=null;
String sjzprs=null;
String sjzpfy=null;
String sjkssj=null;
String sjjssj=null;
String sjzpsj=null;
String zpjglrr=null;
String zpjglsj=null;
String wherezpsqbh=null;
wherezpsqbh=cf.GB2Uni(request.getParameter("zpsqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select zpsqbh,a.dwmc fgs,b.dwmc sqbm,zbzw,zprs,zpfy,zbly,zbqt,xwdgsj,xbyq,hyyq,nlyq,xl,zy,wy,jsjnl,gzjy,gx,jn,qt,rygznr,rs_zpsq.sqzt sqzt,lrr,lrsj,c.dwmc ssfgs,rs_zpsq.bz,shbh,shyj,shr,shsj,DECODE(shjl,'0','取消申请','1','审核通过') shjl,shhrs,rs_ztbm.ztmc ztbm,sjzprs,sjzpfy,sjkssj,sjjssj,sjzpsj,zpjglrr,zpjglsj ";
	ls_sql+=" from  rs_zpsq,rs_ztbm,sq_dwxx a,sq_dwxx b,sq_dwxx c";
	ls_sql+=" where rs_zpsq.fgs=a.dwbh and rs_zpsq.sqbm=b.dwbh and rs_zpsq.ssfgs=c.dwbh and  (zpsqbh='"+wherezpsqbh+"') and rs_ztbm.ztbm=rs_zpsq.ztbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zpsqbh_1=cf.fillHtml(rs.getString("zpsqbh"));
		fgs=cf.fillHtml(rs.getString("fgs"));
		sqbm=cf.fillHtml(rs.getString("sqbm"));
		zbzw=cf.fillHtml(rs.getString("zbzw"));
		zprs=cf.fillHtml(rs.getString("zprs"));
		zpfy=cf.fillHtml(rs.getString("zpfy"));
		zbly=cf.fillHtml(rs.getString("zbly"));
		zbqt=cf.fillHtml(rs.getString("zbqt"));
		xwdgsj=cf.fillHtml(rs.getDate("xwdgsj"));
		xbyq=cf.fillHtml(rs.getString("xbyq"));
		hyyq=cf.fillHtml(rs.getString("hyyq"));
		nlyq=cf.fillHtml(rs.getString("nlyq"));
		xl=cf.fillHtml(rs.getString("xl"));
		zy=cf.fillHtml(rs.getString("zy"));
		wy=cf.fillHtml(rs.getString("wy"));
		jsjnl=cf.fillHtml(rs.getString("jsjnl"));
		gzjy=cf.fillHtml(rs.getString("gzjy"));
		gx=cf.fillHtml(rs.getString("gx"));
		jn=cf.fillHtml(rs.getString("jn"));
		qt=cf.fillHtml(rs.getString("qt"));
		rygznr=cf.fillHtml(rs.getString("rygznr"));
		sqzt=cf.fillHtml(rs.getString("sqzt"));
		lrr=cf.fillHtml(rs.getString("lrr"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		ssfgs=cf.fillHtml(rs.getString("ssfgs"));
		bz=cf.fillHtml(rs.getString("bz"));
		shbh_1=cf.fillHtml(rs.getString("shbh"));
		shyj_1=cf.fillHtml(rs.getString("shyj"));
		shr_1=cf.fillHtml(rs.getString("shr"));
		shsj_1=cf.fillHtml(rs.getDate("shsj"));
		shjl_1=cf.fillHtml(rs.getString("shjl"));
		shhrs=cf.fillHtml(rs.getString("shhrs"));
		ztbm=cf.fillHtml(rs.getString("ztbm"));
		sjzprs=cf.fillHtml(rs.getString("sjzprs"));
		sjzpfy=cf.fillHtml(rs.getString("sjzpfy"));
		sjkssj=cf.fillHtml(rs.getDate("sjkssj"));
		sjjssj=cf.fillHtml(rs.getDate("sjjssj"));
		sjzpsj=cf.fillHtml(rs.getString("sjzpsj"));
		zpjglrr=cf.fillHtml(rs.getString("zpjglrr"));
		zpjglsj=cf.fillHtml(rs.getDate("zpjglsj"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #000000;
	font-family: "仿宋_GB2312";
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="1" style="FONT-SIZE:14" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
  <tr bgcolor="#E0F5FF">
    <td align="right" width="10%" class="STYLE1"> 申请编号 </td>
    <td width="15%"><%=zpsqbh_1%> </td>
    <td align="right" width="10%" class="STYLE1"> 增补职务 </td>
    <td width="15%"><%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm",zbzw,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> 申请分公司 </td>
    <td width="15%"><%=fgs%> </td>
    <td align="right" width="10%" class="STYLE1"> 申请部门 </td>
    <td width="15%"><%=sqbm%> </td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" width="10%" class="STYLE1"> 增补员额 </td>
    <td width="15%"><%=zprs%> </td>
    <td align="right" width="10%" class="STYLE1"> 招聘费用 </td>
    <td width="15%"><%=zpfy%> </td>
    <td align="right" width="10%" class="STYLE1"> 增补理由 </td>
    <td width="15%"><%
	cf.selectToken(out,"0+其他&1+缺员补充&2+扩大编制&3+储备人力",zbly,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> 增补其他 </td>
    <td width="15%"><%=zbqt%> </td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" width="10%" class="STYLE1"> 希望到岗时间 </td>
    <td width="15%"><%=xwdgsj%> </td>
    <td align="right" width="10%" class="STYLE1"> 招聘申请状态 </td>
    <td width="15%"><%
	cf.selectToken(out,"01+等待审批&02+正在审批&03+审批取消&04+开始招聘&05+招聘结束",sqzt,true);
%>
    </td>
	    <td align="right" width="10%" class="STYLE1"> 审批状态 </td>
    <td width="15%"><%=ztbm%> </td>
	<td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr bgcolor="#DFE3E9">
    <td align="right" width="10%" class="STYLE1"> 性别要求 </td>
    <td width="15%"><%
	cf.selectToken(out,"0+不限&1+男&2+女",xbyq,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> 婚姻要求 </td>
    <td width="15%"><%
	cf.selectToken(out,"0+不限&1+已婚&2+未婚",hyyq,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> 年龄要求 </td>
    <td width="15%"><%=nlyq%> </td>
    <td align="right" width="10%" class="STYLE1"> 工作经验 </td>
    <td width="15%"><%=gzjy%> </td>
  </tr>
  <tr bgcolor="#DFE3E9">
    <td align="right" width="10%" class="STYLE1"> 学历要求 </td>
    <td width="15%"><%
	cf.selectToken(out,"0+高中&1+大专&2+大学&3+硕士",xl,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> 专业要求 </td>
    <td width="15%"><%=zy%> </td>
    <td align="right" width="10%" class="STYLE1"> 外语能力 </td>
    <td width="15%"><%=wy%> </td>
    <td align="right" width="10%" class="STYLE1"> 计算机能力 </td>
    <td width="15%"><%=jsjnl%> </td>
  </tr>
  <tr bgcolor="#DFE3E9">
    <td align="right" width="10%" class="STYLE1"> 个性要求 </td>
    <td width="15%"><%=gx%> </td>
    <td align="right" width="10%" class="STYLE1"> 技能要求 </td>
    <td width="15%"><%=jn%> </td>
    <td align="right" width="10%" class="STYLE1"> 其他要求 </td>
    <td width="15%"><%=qt%> </td>
    <td align="right" width="10%" class="STYLE1"> 工作职责</td>
    <td width="15%"><%=rygznr%> </td>
  </tr>
  <tr bgcolor="#CBE6E7">
    <td align="right" width="10%" class="STYLE1"> 录入人 </td>
    <td width="15%"><%=lrr%> </td>
    <td align="right" width="10%" class="STYLE1"> 录入时间 </td>
    <td width="15%"><%=lrsj%> </td>
    <td align="right" width="10%" class="STYLE1"> 录入人分公司 </td>
    <td width="15%"><%=ssfgs%> </td>
    <td align="right" width="10%" class="STYLE1"> 备注 </td>
    <td width="15%"><%=bz%> </td>
  </tr>
</table>



<%
String yhmc=(String)session.getAttribute("yhmc");
String zpsqbh=cf.GB2Uni(request.getParameter("zpsqbh"));
int shbh_int=0;
String shbh=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(shbh),0)";
	ls_sql+=" from  rs_zpsh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		shbh_int=rs.getInt(1)+1;
//		out.print(count);
	}
	rs.close();
	ps.close();

	shbh=cf.addZero(shbh_int,16);
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">序号</td>
	<td  width="12%">招聘计划编号</td>
	<td  width="18%">审批状态</td>
	<td  width="10%">审核结论</td>
	<td  width="18%">下一审批状态</td>
	<td  width="10%">审核人</td>
	<td  width="10%">审核时间</td>
	<td  width="16%">审核意见</td>
</tr>
<%
	int row=0;
	String ys=null;
	String shbh_v=null;
	String sqbh=null;
	String shjl=null;
	String shr=null;
	String shsj=null;
	String shyj=null;
	String yztbm=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT rs_zpsh.shbh shbh,rs_zpsh.zpsqbh zpsqbh,a.ztmc yztbm,rs_zpshbm.shjlmc shjl,rs_zpsh.shr shr,TO_CHAR(shsj,'YYYY-MM-DD') shsj,rs_zpsh.shyj shyj,b.ztmc ztbm ";
	ls_sql+=" FROM rs_zpsh,rs_zpshbm,rs_ztbm a, rs_ztbm b";
    ls_sql+=" where rs_zpsh.shjl=rs_zpshbm.shjl and a.ztbm=rs_zpsh.yztbm and b.ztbm=rs_zpsh.ztbm and rs_zpsh.zpsqbh='"+zpsqbh+"'";
	ls_sql+=" order by shbh";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
//		shbh_v=rs.getString("shbh");
		sqbh=rs.getString("zpsqbh");
		shjl=rs.getString("shjl");
		shr=rs.getString("shr");
		shsj=rs.getString("shsj");
		shyj=cf.fillHtml(rs.getString("shyj"));
		yztbm=rs.getString("yztbm");
		ztbm=rs.getString("ztbm");

		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}
%> 
  <tr align="center" bgcolor="<%=ys%>" bordercolor="#FFFFFF" bordercolorlight="#666666" >
    <td><%=row%></td>
    <td><%=sqbh%></td>
	<td><%=yztbm%></td>
    <td><%=shjl%></td>
	<td><%=ztbm%></td>
    <td><%=shr%></td>
    <td><%=shsj%></td>
    <td><%=shyj%></td>
  </tr>
  <%
		}
		rs.close();
		ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e+"<br>");
	out.print("<font color=red>请选择可审核状态!</font>");
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
</table>
<form method="post" action="SaveInsertRs_zpsh.jsp" name="insertform" target="_blank">
<div align="center">招聘申请审核</div>

<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">申请编号</font></td> 
  <td width="35%"> 
    <input type="text" name="zpsqbh" value="<%=zpsqbh%>" size="20" maxlength="10" readonly>
  </td>
  <td align="right" width="15%">审核结论</td> 
  <td width="35%"> 
    <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">审核通过</option>
    <option value="0">取消申请</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">下一审核状态</td> 
  <td width="35%"> 
    <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='01'  order by ztbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">审核后人数</td> 
  <td width="35%"> 
    <input type="text" name="shhrs" value="<%=zprs%>" size="20" maxlength="8">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">审核人</font></td> 
  <td width="35%"> 
    <input type="text" name="shr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
    <td align="right" width="15%"><font color="#0000FF">审核时间</font></td> 
  <td width="35%"> 
    <input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审核意见</td> 
  <td width="35%" colspan="3"> 
    <textarea name="shyj" cols="71" rows=""></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input name="shbh" type="hidden" value="<%=shbh%>" >
	<input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
	<input type="reset"  value="重输" name="reset">
      </td>
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
	if(	javaTrim(FormName.shjl)=="") {
		alert("请选择[审核结论]！");
		FormName.shjl.focus();
		return false;
	}
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请选择[下一审核状态]！");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shhrs)=="") {
		alert("请输入[审核后人数]！");
		FormName.shhrs.focus();
		return false;
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.shjl)=="0" && javaTrim(FormName.ztbm)!="0199") {
		alert("检查[审核结论]和[审核状态]逻辑关系是否正确！");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shjl)!="0" && javaTrim(FormName.ztbm)=="0199") {
		alert("检查[审核结论]和[审核状态]逻辑关系是否正确！");
		FormName.shjl.focus();
		return false;
	}
	FormName.submit();
	FormName.savebutton.disabled=true;
	window.close();
	return true;
}
//-->
</SCRIPT>
