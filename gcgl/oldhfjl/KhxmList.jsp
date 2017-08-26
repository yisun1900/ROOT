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
  <B><font size="3">客户姓名列表</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"> 
	  <td  width="3%" align="center">序号</td>
	  <td  width="7%" align="center">客户编号</td>
	  <td  width="6%" align="center">客户姓名</td>
	  <td  width="8%" align="center">联系方式</td>
	  <td  width="8%" align="center">开工日期</td>
	  <td  width="8%" align="center">竣工日期</td>
	  <td  width="7%" align="center">设计师</td>
	  <td  width="7%" align="center">工长</td>
	  <td  width="6%" align="center">工程担当</td>
	  <td  width="18%" align="center">房屋地址</td>
	  <td  width="7%" align="center">签约额</td>
</tr>
<%
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
String sjs=null;
String zjxm=null;
String hflxbm=null;
String hfrq=null;

String khbh=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjjgrq=null;
String dwmc=null;
String qye=null;
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
		ls_sql="SELECT qye,khbh,khxm,sjs,zjxm,zjxm,DECODE(xb,'M','男','W','女') as xb,fwdz,lxfs,sjkgrq,sjjgrq,sgdmc,sbrq ";
		ls_sql+=" FROM crm_khxx,sq_sgd  ";
		ls_sql+=" where (crm_khxx.sgd=sq_sgd.sgd(+) and zt='2')";
		ls_sql+=" and khxm='"+khxm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			qye=cf.fillHtml(rs.getString("qye"));
			khbh=cf.fillHtml(rs.getString("khbh"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			sjs=cf.fillHtml(rs.getString("sjs"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			xb=cf.fillHtml(rs.getString("xb"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			lxfs=cf.fillHtml(rs.getString("lxfs"));
			sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
			sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
			dwmc=cf.fillHtml(rs.getString("sgdmc"));

%>
			
    <tr bgcolor="<%=bgcolor%>"> 
      <td align="center"><%=(i+1)%></td>
      <td align="center">
	  <A HREF="InsertCrm_hfjl.jsp?khbh=<%=khbh%>" target="_blank"><%=khbh%></A>
	  </td>
      <td align="center"><%=khxm%></td>
      <td align="center"><%=lxfs%></td>
      <td align="center"><%=sjkgrq%></td>
      <td align="center"><%=sjjgrq%></td>
      <td align="center"><%=sjs%></td>
      <td align="center"><%=dwmc%></td>
      <td align="center"><%=zjxm%></td>
      <td align="center"><%=fwdz%></td>
      <td align="center"><%=qye%></td>
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
      <td align="center"><%=(i+1)%></td>
      <td align="center">&nbsp;</td>
      <td align="center"><%=khxm%></td>
      <td colspan="7" bgcolor="#CC0000">数据不存在</td>
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

</table>


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

