<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");


String khbh=null;
String yssj=null;
String ysr=null;
String lrbm=null;
String lrr=null;
String lrsj=null;
String bz=null;
String yscsjlh=null;
String gcysxmmc=null;
String sjysjg=null;
String sgd=null;
String sjs=null;
String zjxm=null;
String clbz=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sgbz=null;

String ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select crm_heysjl.yssj,crm_heysjl.ysr,crm_heysjl.lrbm,crm_heysjl.lrr,crm_heysjl.lrsj,crm_heysjl.bz,crm_heysjl.khbh,crm_heysjl.sjs,crm_heysjl.zjxm,sgdmc,crm_heysjl.yscsjlh,crm_heysjl.gcysxmmc,DECODE(crm_heysjl.sjysjg,'0','合格','1','需整改') sjysjg,DECODE(crm_heysjl.clbz,'9','录入未完成','0','没问题','1','整改未接收','2','接收','3','已处理','4','已解决','5','验收通过','6','验收未通过') clbz";
	ls_sql+=" from  crm_heysjl,sq_sgd";
	ls_sql+=" where  crm_heysjl.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_heysjl.ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		yscsjlh=cf.fillNull(rs.getString("yscsjlh"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		sjysjg=cf.fillNull(rs.getString("sjysjg"));
		clbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
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
<title>修改备注</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="SaveEditCrm_heysjlBz.jsp" name="editform" >
<div align="center">修改备注(验收记录号:<%=ysjlh%>)</div>
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
    <td><%=sgd%></td>
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
    <td align="right">验收记录号</td>
    <td><%=ysjlh%></td>
    <td align="right">验收次数记录号</td>
    <td><%=yscsjlh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">验收人 </td>
    <td><%=ysr%> </td>
    <td align="right"> 验收时间 </td>
    <td><%=yssj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 验收项目 </td>
    <td><%=gcysxmmc%>    </td>
    <td align="right"> 验收结果 </td>
    <td><%=sjysjg%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 录入人 </td>
    <td><%=lrr%> </td>
    <td align="right"> 录入时间 </td>
    <td><%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">备注</td>
    <td colspan="3"> <textarea name="bz" cols="71" rows="4" ><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="ysjlh"  value="<%=ysjlh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
      <input name="ckxm" type="button"  onClick="window.open('ViewCrm_heysmxb.jsp?ysjlh=<%=ysjlh%>')"  value="查看项目" > 
	  <input name="cktp" type="button" id="cktp" onClick="window.open('ViewZp1.jsp?ysjlh=<%=ysjlh%>')"  value="查看图片" > 
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
	if(	javaTrim(FormName.bz)=="") {
		alert("请输入[备注]！");
		FormName.bz.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
