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
  <B><font size="3">客户列表</font></B>
</CENTER>
<form method="POST" name="listform" action="KhxmGchfList.jsp" >
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"> 
      <td  width="4%" align="center">&nbsp;</td>
	  <td  width="3%" align="center">序号</td>
	  <td  width="6%" align="center">姓名</td>
	  <td  width="22%" align="center">房屋地址</td>
	  <td  width="6%" align="center">设计师</td>
	  <td  width="6%" align="center">工程担当</td>
	  <td  width="6%" align="center">施工队</td>
	  <td  width="7%" align="center">工程进度</td>
	  <td  width="8%" align="center">合同开工日期</td>
	  <td  width="8%" align="center">合同竣工日期</td>
	  <td  width="8%" align="center">签约日期</td>
	  <td  width="11%" align="center">签约店面</td>
</tr>
<%
String yhjs=(String)session.getAttribute("yhjs");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String hflxbm=request.getParameter("hflxbm");

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

String khbh=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String gcjdbm=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String dm=null;
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
		ls_sql="SELECT khbh,khxm,fwdz,sjs,zjxm,sgdmc sgd,gcjdmc,qyrq,kgrq,jgrq,a.dwmc dm";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm  ";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2' and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm";
		ls_sql+=" and khxm='"+khxm+"'";

		if (!(fgs.equals("")))
		{
			ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (!(dwbh.equals("")))
		{
			ls_sql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
		}

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			khbh=cf.fillHtml(rs.getString("khbh"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			sjs=cf.fillHtml(rs.getString("sjs"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			sgd=cf.fillHtml(rs.getString("sgd"));
			gcjdbm=cf.fillHtml(rs.getString("gcjdmc"));
			qyrq=cf.fillHtml(rs.getDate("qyrq"));
			kgrq=cf.fillHtml(rs.getDate("kgrq"));
			jgrq=cf.fillHtml(rs.getDate("jgrq"));
			dm=cf.fillHtml(rs.getString("dm"));

			%>
			<tr bgcolor="<%=bgcolor%>"> 
			  <td align="center">
				<input name="khbh" type="checkbox" value="<%=khbh%>">
			  </td>
			  <td align="center"><%=(i+1)%>
			  </td>
			  <td align="center"><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			  <td align="center"><%=fwdz%></td>
			  <td align="center"><%=sjs%></td>
			  <td align="center"><%=zjxm%></td>
			  <td align="center"><%=sgd%></td>
			  <td align="center"><%=gcjdbm%></td>
			  <td align="center"><%=kgrq%></td>
			  <td align="center"><%=jgrq%></td>
			  <td align="center"><%=qyrq%></td>
			  <td align="center"><%=dm%></td>
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
		<input name="hflxbm" type="hidden" value="<%=hflxbm%>">
		<input type=button value='全选' onclick="cf_checkAll(listform)">
		<input type=button value='查看回访记录' onclick="cf_submit(listform)" name="hfrq">
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
			formName.khbh.checked =false
		}
		else{
			formName.khbh.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				formName.khbh[i].checked =false
			}
			else{
				formName.khbh[i].checked =true
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

	var i = 0;
	if (<%=row%>==1){
		if( formName.khbh.checked ){
			choo=1;
		}
	} 
	else if (<%=row%>>1){ 
		for (i=0;i< <%=row%>;i++ ){
			if( formName.khbh[i].checked ){
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
//-->
</script>

