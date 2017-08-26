<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>照片审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>


<%
String yhmc=(String)session.getAttribute("yhmc");

String xjzpmc=request.getParameter("xjzpmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;
String xjjlh=null;
String zpgjz=null;
String zpml=null;
String lx=null;
String zpsm=null;


String xjr=null;
String xjsj=null;
String xjlxbm=null;
String xjjgmc=null;
String bz=null;

String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String sgd=null;
String zjxm=null;

try 
{
	conn=cf.getConnection();

	ls_sql="SELECT xjjlh,zpgjz,lx,zpml,zpsm";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where  xjzpmc='"+xjzpmc+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjjlh=rs.getString("xjjlh");
		zpgjz=cf.fillNull(rs.getString(2));
		lx=cf.fillNull(rs.getString("lx"));
		zpml=cf.fillNull(rs.getString("zpml"));
		zpsm=cf.fillNull(rs.getString("zpsm"));

	}
	rs.close();
	ps.close();

	ls_sql="select khbh,dm_xjjgbm.xjjgmc,kp_xjgdjl.xjr,kp_xjgdjl.xjsj ,xjlxmc,kp_xjgdjl.bz";
	ls_sql+=" from  kp_xjgdjl,dm_xjjgbm,kp_xjlxbm";
	ls_sql+=" where kp_xjgdjl.xjjlh='"+xjjlh+"'";
	ls_sql+=" and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+)";
	ls_sql+=" and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		xjjgmc=cf.fillNull(rs.getString("xjjgmc"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xjlxbm=cf.fillNull(rs.getString("xjlxmc"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.zjxm ";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("上载照片失败，Exception:" + e);
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


<body bgcolor="#FFFFFF">
<CENTER><B>照片审核</B><BR><HR>
<form method="post" action="" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">客户姓名</td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right">合同号</td>
    <td width="32%"><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">房屋地址</td>
    <td><%=fwdz%></td>
    <td align="right">设计师 </td>
    <td><%=sjs%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      项目总监    </td>
    <td width="32%"> <%=sgd%> </td>
    <td width="18%" align="right"> 
      品管    </td>
    <td width="32%"> <%=zjxm%> </td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      检查类型    </td>
    <td width="32%"> <%=xjlxbm%> </td>
    <td width="18%" align="right"> 
      检查结果    </td>
    <td width="32%"><%=xjjgmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      检查人    </td>
    <td width="32%"> <%=xjr%> </td>
    <td width="18%" align="right"> 
      检查时间    </td>
    <td width="32%"> <%=xjsj%> </td>
  </tr>

		<tr bgcolor="#FFFFFF">
		  <td align="right">备注</td>
		  <td colspan="3"><%=bz%></td>
	  </tr>
		<tr bgcolor="#FFFFFF">
		  <td width="18%" align="right">文件名称</td>
		  <td width="32%"><%=xjzpmc%></td>
		  <td width="18%" align="right" >照片关键字</td>
	      <td width="32%" ><%=zpgjz%></td>
	  </tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right">照片说明</td>
		  <td colspan="3"><%=zpsm%></td>
      </tr>

		<tr bgcolor="#FFFFFF">
		  <td align="right"><span class="STYLE1">*</span>客户可看照片</td>
		  <td><%
	cf.radioToken(out, "kkzpbz","0+不可看&1+可看","");
%></td>
	      <td align="right" ><span class="STYLE1">*</span>是否合格</td>
	      <td ><%
	cf.radioToken(out, "zpshbz","Y+合格&B+不合格","");
%></td>
	  </tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right"  ><span class="STYLE1">*</span>审核人</td>
		  <td  ><input type="text" name="shr" size="20" maxlength="50"  value="<%=yhmc%>" readonly></td>
	      <td align="right" ><span class="STYLE1">*</span>审核时间</td>
	      <td ><input type="text" name="shsj" size="20" maxlength="10"  value="<%=cf.getDate()%>" readonly></td>
	  </tr>
		
		<tr bgcolor="#FFFFFF"> 
		  <td align="right"  >审核说明</td>
		  <td colspan="3"  > 
		  <textarea name="shsm" cols="71" rows="3"></textarea></td>
        </tr>
      <tr bgcolor="#FFFFFF">
	<td height="36" colspan="5" align="center" > 
		<input type="hidden" name="xjjlh" value="<%=xjjlh%>">
		<input type="hidden" name="xjzpmc" value="<%=xjzpmc%>">
		<input type=button value='存盘' onClick="f_xg(editform)">	</td>
	</tr>

	    <tr bgcolor="#FFFFFF">
	      <td height="36" colspan="5" align="center" ><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>"  ></td>
      </tr>
</table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_xg(FormName)
{

	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}

	if(	!radioChecked(FormName.kkzpbz)) {
		alert("请选择[客户可看照片]！");
		FormName.kkzpbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zpshbz)) {
		alert("请选择[是否合格]！");
		FormName.zpshbz[0].focus();
		return false;
	}
	if (FormName.zpshbz[1].checked)
	{
		if(	javaTrim(FormName.shsm)=="") {
			alert("请输入[审核说明]！");
			FormName.shsm.focus();
			return false;
		}

		if (FormName.kkzpbz[1].checked)
		{
			alert("错误！照片不合格客户不能看！");
			FormName.kkzpbz[0].focus();
			return false;
		}
	}

	FormName.action="SaveEditKp_xjgdjlzp.jsp";
	FormName.submit();
	return true;

} 
//-->
</script>