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
  <B><font size="3">设置回访日期</font></B>
</CENTER>
<form method="POST" name="listform" action="SaveKhxm.jsp" target="_blank">
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"> 
      <td  width="4%" align="center">&nbsp;</td>
	  <td  width="3%" align="center">序号</td>
	  <td  width="7%" align="center">客户编号</td>
	  <td  width="6%" align="center">姓名</td>
	  <td  width="9%" align="center">回访日期</td>
	  <td  width="9%" align="center">回访类型</td>
	  <td  width="22%" align="center">房屋地址</td>
	  <td  width="7%" align="center">工程进度</td>
	  <td  width="8%" align="center">签约日期</td>
	  <td  width="8%" align="center">实开工日期</td>
	  <td  width="11%" align="center">签约店面</td>
</tr>
<%
String yhjs=(String)session.getAttribute("yhjs");
String fgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");

String khxmlist[]=request.getParameterValues("khxmlist");
if (khxmlist==null)
{
	out.println("请输入客户姓名!");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor=null;

int pos=0;
int count=0;
int row=0;
String khxm=null;
String hflxbm=null;
String hfrq=null;

String khbh=null;
String xb=null;
String fwdz=null;
String gcjdbm=null;
String qyrq=null;
String dwmc=null;
try {
	conn=cf.getConnection();

	for (int i=0;i<khxmlist.length ;i++ )
	{
		khxm=cf.GB2Uni(khxmlist[i]);

		if (i%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}

		count=0;
		ls_sql="SELECT khbh,khxm,DECODE(xb,'M','男','W','女') as xb,fwdz,gcjdmc,qyrq,hfrq,hflxbm,dwmc ";
		ls_sql+=" FROM crm_khxx,sq_dwxx,dm_gcjdbm  ";
		ls_sql+=" where (crm_khxx.dwbh=sq_dwxx.dwbh(+) and zt='2' and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm)";
		ls_sql+=" and khxm='"+khxm+"'";

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
			gcjdbm=cf.fillHtml(rs.getString("gcjdmc"));
			qyrq=cf.fillHtml(rs.getDate("qyrq"));
			hfrq=cf.fillNull(rs.getDate("hfrq"));
			hflxbm=cf.fillNull(rs.getString("hflxbm"));
			dwmc=cf.fillHtml(rs.getString("dwmc"));

%>
			
    <tr bgcolor="<%=bgcolor%>"> 
      <td align="center"> 
        <input name="khbhbox" type=checkbox value="<%=khbh%>">
        <input name="xh" type="hidden" value="<%=(i+1)%>">
	  </td>
      <td align="center"><%=(i+1)%></td>
      <td align="center">
		<input size="7" maxlength="20" type="text" name="khbh" value="<%=khbh%>" readonly=true style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	  </td>
      <td align="center"><%=khxm%></td>
      <td align="center">
        <input name="hfrq" type="text" value="<%=hfrq%>" maxlength="10" size="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(hflxbm[<%=row%>])">
	  </td>
      <td align="center">
        <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:80PX" onKeyUp="keyGo(hfrq[<%=(row+1)%>])">
		  <option value=""></option>
<%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl in('2') order by hflxbm",hflxbm);
%> 
        </select>
	  </td>
      <td align="center"><%=fwdz%></td>
      <td align="center"><%=gcjdbm%></td>
      <td align="center"><%=qyrq%></td>
      <td align="center"><%=hfrq%></td>
      <td align="center"><%=dwmc%></td>
	</tr>
<%
			count++;
			row++;
		}
		ps.close();
		rs.close();

		if (count<1)//不存在
		{
%>
			
    <tr bgcolor="#CC0000"> 
      <td align="center">&nbsp;</td>
      <td align="center"><%=(i+1)%></td>
      <td align="center">&nbsp;</td>
      <td align="center"><%=khxm%></td>
      <td colspan="8" bgcolor="#CC0000">数据不存在</td>
	</tr>
<%
		}
	}
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
<td colspan="13" > 
<input type=button value='全选' onclick="cf_checkAll(listform)">
<input type=button value='存盘' onclick="cf_submit(listform)" name="hfrq">
</td>
</tr>
</table>
</form> 


</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

var mark=1;
function cf_checkAll(formName)//转换字符串
{
	var i = 0;
	if (<%=row%>==1){
		if (mark==0)
		{
			formName.khbhbox.checked =false
		}
		else{
			formName.khbhbox.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				formName.khbhbox[i].checked =false
			}
			else{
				formName.khbhbox[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}
function cf_submit(formName)
{
	var choo=0;
	if ( confirm("确实要继续吗?") )	{
		var i = 0;
		if (<%=row%>==1){
			if( formName.khbhbox.checked ){
				choo=1;
			}
		} 
		else if (<%=row%>>1){ 
			for (i=0;i< <%=row%>;i++ ){
				if( formName.khbhbox[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择所要操作的数据");
			return false;
		}
		else{
			formName.submit();
			return true;
		}
	}
} 
//-->
</script>

