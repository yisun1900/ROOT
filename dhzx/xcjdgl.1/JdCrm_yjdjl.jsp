<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sqrq=null;
String sqr=null;
String sqrlxdh=null;
String sfxtp=null;
String jhjdrq=null;
String jhjdsj=null;
String sqsm=null;
String zcwcsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String zzqrjdrq=null;
String zzqrjdsj=null;
String fbr=null;
String fbsj=null;
String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));


String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String dmjl="";
String dmjldh="";
String xcjdbz="";
String sgdmc=null;
String zjxm=null;
String khqdzt="";
int sjhtje=0;
int tchtje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select sgdmc,crm_yjdjl.zjxm,khbh,sqrq,sqr,sqrlxdh,jhjdrq,jhjdsj,sqsm,lrr,lrsj,dwmc,zzqrjdrq,zzqrjdsj,fbr,fbsj ";
	ls_sql+=" from  crm_yjdjl,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_yjdjl.jdjlh='"+jdjlh+"' and crm_yjdjl.lrbm=sq_dwxx.dwbh and crm_yjdjl.sgd=sq_sgd.sgd(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zzqrjdrq=cf.fillNull(rs.getString("zzqrjdrq"));
		zzqrjdsj=cf.fillNull(rs.getString("zzqrjdsj"));
		fbr=cf.fillNull(rs.getString("fbr"));
		fbsj=cf.fillNull(rs.getString("fbsj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		sqr=cf.fillNull(rs.getString("sqr"));
		sqrlxdh=cf.fillNull(rs.getString("sqrlxdh"));
		jhjdrq=cf.fillNull(rs.getDate("jhjdrq"));
		jhjdsj=cf.fillNull(rs.getString("jhjdsj"));
		sqsm=cf.fillNull(rs.getString("sqsm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select khjl,crm_zxkhxx.ssfgs,khxm,fwdz,hth,sjs,crm_zxkhxx.zxdm,dwmc,xcjdbz,sjhtje,tchtje";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		fgsbh=cf.fillNull(rs.getString("ssfgs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		xcjdbz=cf.fillNull(rs.getString("xcjdbz"));
		sjhtje=rs.getInt("sjhtje");
		tchtje=rs.getInt("tchtje");
	}
	rs.close();
	ps.close();
	if(sjhtje==0 && tchtje!=0)
	{
	   khqdzt="已签套餐意向书";
	}
	else if(tchtje==0 &&sjhtje!=0)
	{
	   khqdzt="已签设计合同";
	}
    else if(tchtje==0 &&sjhtje==0) 
	 {
	   khqdzt="未签";
	}

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='店面经理' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>预交底录入</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
<div align="center">预交底录入</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">客户编号</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#0000FF">合同号</font> </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td><%=fwdz%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户经理</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">店长及电话</span></td>
    <td><%=dmjl%>（<%=dmjldh%>）</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">签单状态</span></td>
    <td><%=khqdzt%></td>
	<td align="right"><span class="STYLE2">联系电话</span></td>
    <td><input type="button" value="查看电话" onClick="window.open('/dhzx/dhzx/ViewZxDh.jsp?khbh=<%=khbh%>')"></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">申请日期</td>
    <td><%=sqrq%></td>
    <td align="right">申请人</td>
    <td><%=sqr%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">申请人联系电话</td>
    <td colspan="3"><%=sqrlxdh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">计划预交底日期</td>
    <td><%=jhjdrq%></td>
    <td align="right">计划预交底时间</td>
    <td><%=jhjdsj%> 时</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">申请说明</td>
    <td colspan="3"><%=sqsm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">录入人</td>
    <td><%=lrr%></td>
    <td align="right">录入时间</td>
    <td><%=lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">录入部门</td>
    <td><%=dwmc%> </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right">施工队</td>
    <td><%=sgdmc%></td>
    <td align="right">质检</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">最终确认预交底日期</td>
    <td><%=zzqrjdrq%></td>
    <td align="right">最终确认预交底时间</td>
    <td><%=zzqrjdsj%>      时</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">派单人</span></td>
    <td><%=fbr%></td>
    <td align="right"><span class="STYLE2">派单时间</span></td>
    <td><%=fbsj%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>预交底是否成功</td>
  <td><%
	cf.radioToken(out, "jdsfcg","Y+成功&N+否","Y");
%></td>
  <td align="right"><span class="STYLE1">*</span>实际预交底时间</td>
  <td><input type="text" name="sjjdsj" size="20" maxlength="10"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">实际交底情况</td>
  <td colspan="3">
    <textarea name="sjjdqk" cols="71" rows="3"></textarea>  </td>
  </tr>

<input type="hidden" name="jdjlh"  value="<%=jdjlh%>" >
    <input type="hidden" name="khbh" value="<%=khbh%>" readonly> 
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input name="button" type="button" onClick="f_do1(editform)"  value="预交底单">
	  <input name="wc" type="button" onClick="f_do(editform)"  value="完成" disabled>
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>


<%
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("请输入[预交底记录号]！");
		FormName.jdjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	!radioChecked(FormName.jdsfcg)) {
		alert("请选择[预交底是否成功]！");
		FormName.jdsfcg[0].focus();
		return false;
	}

	if(	javaTrim(FormName.sjjdsj)=="") {
		alert("请输入[实际预交底时间]！");
		FormName.sjjdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjdsj, "实际预交底时间"))) {
		return false;
	}

	FormName.target="";
	FormName.action="SaveJdCrm_yjdjl.jsp";
	FormName.submit();
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("请输入[预交底记录号]！");
		FormName.jdjlh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="Bj_khbjmxList3.jsp";
	FormName.submit();
	FormName.wc.disabled=false;
	return true;
}
//-->
</SCRIPT>
