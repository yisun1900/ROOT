<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");
String lfjlh=request.getParameter("lfjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
String lflxbm=null;
String smmb=null;
java.util.Date jhsmsj=null;
String jhsmry=null;

String sjsmsj=null;
String sjsmry=null;
String lfjg=null;
String lfjgsm=null;
String cfwsjcs=null;
String bzsm=null;


String khxm=null;
String khbh=null;
try {
	conn=cf.getConnection();


	ls_sql="select lfjlh,crm_lfjl.khbh,khxm,lflxbm,smmb,jhsmsj,jhsmry,sjsmsj,sjsmry,lfjg,lfjgsm,cfwsjcs,bzsm";
	ls_sql+=" from  crm_lfjl,crm_zxkhxx ";
	ls_sql+=" where lfjlh='"+lfjlh+"' ";
	ls_sql+=" and  crm_lfjl.khbh=crm_zxkhxx.khbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lflxbm=rs.getString("lflxbm");
		smmb=rs.getString("smmb");
		jhsmsj=rs.getDate("jhsmsj");
		jhsmry=rs.getString("jhsmry");
		khxm=rs.getString("khxm");
		khbh=rs.getString("khbh");
		sjsmsj=cf.fillNull(rs.getDate("sjsmsj"));
		sjsmry=cf.fillNull(rs.getString("sjsmry"));
		lfjg=cf.fillNull(rs.getString("lfjg"));
		lfjgsm=cf.fillNull(rs.getString("lfjgsm"));
		cfwsjcs=cf.fillNull(rs.getString("cfwsjcs"));
		bzsm=cf.fillNull(rs.getString("bzsm"));
	}
	ps.close();
	rs.close();

%>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
	font-family: "宋体";
}
-->
</style>
<body>
<form name="editform" action="SaveXgLfCrm_lfjl.jsp" method="post" target="_blank">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td height="20" colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">实际量房－修改</div></td>
  </tr>
  <tr>
   
 
    <td height=25 align="right" bgcolor="#FFFFFF">客户编号</td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="18%" align="right" bgcolor="#FFFFFF">客户姓名       </td>
    <td width="32%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr>
    <td width="18%" height="20" align="right" bgcolor="#FFFFFF">量房类型       </td>
    <td width="32%" bgcolor="#FFFFFF"> <%
		cf.selectItem(out,"select lflxbm,lflxmc from dm_lflxbm where lflxbm='"+lflxbm+"'","");
	  %> </td>

    <td align="right" bgcolor="#FFFFFF">计划上门时间</td>
    <td bgcolor="#FFFFFF"><%=jhsmsj%>
	<input type="hidden" name="jhsmsj" value="<%=jhsmsj%>">	</td>
   </tr>
   <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">计划上门人员</td>
    <td bgcolor="#FFFFFF" colspan=3><%=jhsmry%></td>
  </tr>
 
  <tr height="25">
	 <td width="18%" height="20" align="right" bgcolor="#FFFFFF">上门目标</td>
    <td bgcolor="#FFFFFF" colspan=3> <%=smmb%></td> 
	</tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>实际上门时间</td>
    <td bgcolor="#FFFFFF"><input name="sjsmsj" type="text" onDblClick="JSCalendar(this)" value="<%=sjsmsj%>" size="20" maxlength="10"/></td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>实际上门人员</td>
    <td colspan="3" bgcolor="#FFFFFF">
      <input name="sjsmry" type="text" size="71" value="<%=sjsmry%>">    </td>
    </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>上门结果 </td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="lfjgsm" cols="70"  rows="6"><%=lfjgsm%></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>厨房卫生间参数</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="cfwsjcs" cols="70"  rows="6"><%=cfwsjcs%></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">备注说明</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="bzsm" cols="70"  rows="3"><%=bzsm%></textarea></td>
  </tr>
  
	
    <td colspan="4" align="center"> 
       
		<input type="button" name="tj" value="存盘" onClick="f_do(editform)"/>
		<input type="button" name="sczp" value="上传照片" onClick="sc()" />
		<input type="button" name="ckzp" value="查看照片" onClick="ck()" />
	  <input type="hidden" name="lfjlh" value="<%=lfjlh%>" />      </td>
    </tr>
</table>
</form>
</body>
</html>
<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
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

function f_do(FormName)//参数FormName:Form的名称
{
	//alert("9"+javaTrim(FormName.sjsmry)+"2");
	if(javaTrim(FormName.sjsmry)=="")
	{
	alert("实际上门人员不能为空");
	return flase();
	}
	
	if(javaTrim(FormName.lfjgsm)=="")
	{
	alert("上门结果不能为空");
	return flase();
	}
	if(javaTrim(FormName.cfwsjcs)=="")
	{
	alert("厨房卫生间参数不能为空");
	return flase();
	}
	/*if(javaTrim(FormName.bzsm)=="")
	{
	alert("备注说明不能为空");
	return flase();
	}*/
	if(javaTrim(FormName.sjsmsj)=="")
	{
	alert("实际上门时间不能为空");
	return flase();
	}
	if(!(isDatetime(FormName.sjsmsj, "录入时间"))) {
		return false;
	}
	if(javaTrim(FormName.sjsmsj)<javaTrim(FormName.jhsmsj))
	{
		alert("实际上门时间不能早于计划上门时间");
		return false;
	}
	FormName.sczp.disabled=false;
	FormName.tj.disabled=false;
	FormName.submit();
	return true;
	
}

function sc()
{
	var lfjlh=editform.lfjlh.value
	window.open("loadPhoto.jsp?lfjlh="+lfjlh);
}

function ck()
{
	var lfjlh=editform.lfjlh.value
	window.open("viewPhoto.jsp?lfjlh="+lfjlh);
}

</SCRIPT>





