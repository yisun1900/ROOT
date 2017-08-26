<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sgbz=null;
String sjs=null;
String sgdmc=null;
String zjxm=null;
String mbbm=null;

String rwmc=null;
String rwdx=null;
String yjhkssj=null;
String yjhjssj=null;
String yjhgzr=null;
String zxjhkssj=null;
String zxjhjssj=null;
String zxjhgzr=null;
String rwsfwc=null;
String rwsfwcmc=null;
String sjkssj=null;
String sjjssj=null;
String sjgzr=null;

String khbh=request.getParameter("khbh");
String rwbm=request.getParameter("rwbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sgdmc,sjs,zjxm,sgbz,mbbm";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		mbbm=cf.fillNull(rs.getString("mbbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select rwmc,DECODE(rwdx,'1','客户','2','施工队','3','供应商','4','设计师','5','质检') rwdx ";
	ls_sql+=" ,yjhkssj,yjhjssj,yjhgzr,zxjhkssj,zxjhjssj,zxjhgzr,rwsfwc,DECODE(rwsfwc,'Y','完成','N','否') rwsfwcmc";
	ls_sql+=" ,sjkssj,sjjssj,sjgzr";
	ls_sql+=" from  crm_khsgjhb,jdm_zcddzt a,jdm_zcddzt b,dm_gcysxm";
	ls_sql+=" where  crm_khsgjhb.clzt=a.clzt(+)";
	ls_sql+=" and  crm_khsgjhb.sjzcjd=b.clzt(+)";
	ls_sql+=" and  crm_khsgjhb.gcysxmbm=dm_gcysxm.gcysxmbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
	ls_sql+=" and rwbm='"+rwbm+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwdx=cf.fillNull(rs.getString("rwdx"));

		yjhkssj=cf.fillNull(rs.getDate("yjhkssj"));
		yjhjssj=cf.fillNull(rs.getDate("yjhjssj"));
		yjhgzr=cf.fillNull(rs.getString("yjhgzr"));
		zxjhkssj=cf.fillNull(rs.getDate("zxjhkssj"));
		zxjhjssj=cf.fillNull(rs.getDate("zxjhjssj"));
		zxjhgzr=cf.fillNull(rs.getString("zxjhgzr"));
		rwsfwc=cf.fillNull(rs.getString("rwsfwc"));
		rwsfwcmc=cf.fillNull(rs.getString("rwsfwcmc"));
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
		sjgzr=cf.fillNull(rs.getString("sjgzr"));
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
<title>实际跟踪</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditSjCrm_khsgjhb.jsp" name="editform" >
<div align="center">实际跟踪</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#000099">客户编号</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#000099">实开工日期</font> </td>
    <td width="32%"><%=sjkgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">客户姓名</font></td>
    <td><%=khxm%></td>
    <td align="right"><font color="#000099">联系方式</font></td>
    <td><input type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看电话" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">房屋地址</font></td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">设计师</font></td>
    <td><%=sjs%></td>
    <td align="right"><font color="#000099">施工队</font></td>
    <td><%=sgdmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">质检姓名</font></td>
    <td><%=zjxm%></td>
    <td align="right"><font color="#000099">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">任务编码</td>
    <td><%=rwbm%></td>
    <td align="right">任务名称</td>
    <td><%=rwmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">原计划开始时间</td>
    <td><%=yjhkssj%></td>
    <td align="right">原计划结束时间</td>
    <td><%=yjhjssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">原计划工作日</td>
    <td><%=yjhgzr%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">计划开始时间</td>
    <td><%=zxjhkssj%></td>
    <td align="right">计划结束时间</td>
    <td><%=zxjhjssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">计划工作日</td>
    <td><%=zxjhgzr%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#CC0000">*</font>实际开始时间</td>
    <td><input type="text" name="sjkssj" size="20" maxlength="10"  value="<%=sjkssj%>" onDblClick="JSCalendar(this)"></td>
    <td align="right"><font color="#CC0000">*</font>实际结束时间</td>
    <td><input type="text" name="sjjssj" size="20" maxlength="10"  value="<%=sjjssj%>" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#CC0000">*</font>实际工作日</td>
    <td><input type="text" name="sjgzr" size="20" maxlength="10"  value="<%=sjgzr%>" ></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	<input type="hidden" name="rwbm"  value="<%=rwbm%>" >
	<input type="button"  value="保存" onClick="f_do(editform)">
	<input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>

</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
