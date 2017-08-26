<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">设隐蔽工程回访日期</font></B>
</CENTER>
<form method="POST" name="listform" action="SaveYbhfKhxm.jsp" target="_blank">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"> 
	  <td  width="7%" align="center">客户编号</td>
	  <td  width="5%" align="center">姓名</td>
	  <td  width="20%" align="center">房屋地址</td>
	  <td  width="8%" align="center">工程进度</td>
	  <td  width="8%" align="center">实开工日期</td>
	  <td  width="8%" align="center">隐蔽工程验收</td>
	  <td  width="9%" align="center">隐蔽工程回访</td>
	  <td  width="9%" align="center">签约店面</td>
</tr>
<%
String yhjs=(String)session.getAttribute("yhjs");
String fgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");

	int row=0;
	String khxm=null;
	String hflxbm=null;
	String hfrq=null;
	String yhfrq=null;

	String khbh=null;
	String xb=null;
	String fwdz=null;
	String gcjdmc=null;
	String sybgcrq=null;
	String sjkgrq=null;
	String dwmc=null;

	String wheresql="";
	String lxfs=null;
	String szkghf=null;
	String gcjdbm=null;

	String sfsz=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT crm_khxx.khbh,khxm,DECODE(xb,'M','男','W','女') as xb,fwdz,crm_khxx.gcjdbm gcjdbm,gcjdmc,sybgcrq,sjkgrq,dwmc,hfrq,TRUNC(sybgcrq+1) yhfrq";
	ls_sql+=" FROM crm_khxx,sq_dwxx,dm_gcjdbm  ";
	ls_sql+=" where (crm_khxx.dwbh=sq_dwxx.dwbh(+) and zt='2' and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm)";
	ls_sql+=" and crm_khxx.sybhfbz='N'";

	if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	else if (yhjs.equals("F2"))
	{
		ls_sql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		khbh=cf.fillHtml(rs.getString("khbh"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		xb=cf.fillHtml(rs.getString("xb"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		gcjdbm=cf.fillHtml(rs.getString("gcjdbm"));
		gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));
		sybgcrq=cf.fillHtml(rs.getDate("sybgcrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		yhfrq=cf.fillNull(rs.getDate("yhfrq"));

		hfrq=yhfrq;

		if (!gcjdbm.equals("3"))
		{
			out.println("<BR>！！！警告，客户编号["+khbh+"]工程进度不正确");
//			return;
		}
		if (sybgcrq.equals("&nbsp;"))
		{
			out.println("<BR>！！！警告，客户编号["+khbh+"]隐蔽工程验收日期不存在");
//			return;
		}

		if (row%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}
%>
			
    <tr bgcolor="<%=bgcolor%>"> 
      <td align="center">
		<input size="7" maxlength="20" type="text" name="khbh" value="<%=khbh%>" readonly=true style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	  </td>
      <td align="center"><%=khxm%></td>
      <td align="center"><%=fwdz%></td>
      <td align="center"><%=gcjdmc%></td>
      <td align="center"><%=sjkgrq%></td>
      <td align="center"><%=sybgcrq%></td>
      <td align="center">
        <input name="hfrq" type="text" value="<%=hfrq%>" maxlength="10" size="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(hfrq[<%=(row+1)%>])">
	  </td>
      <td align="center"><%=dwmc%></td>
	</tr>
<%
		row++;
	}
	ps.close();
	rs.close();

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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

<tr bgcolor="#FFFFFF">
<td colspan="11" align="center"> 
<input type=button value='保存日期' onclick="cf_submit(listform)" name="hfrq">
</td>
</tr>
</table>
</form> 


</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function cf_submit(formName)
{
	formName.submit();
	return true;
} 
//-->
</script>

