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
  <B><font size="3">停工管理</font></B>
</CENTER>
<form method="POST" name="listform" action="SaveKhxm.jsp" target="_blank">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"> 
      <td  width="2%" align="center">&nbsp;</td>
	  <td  width="3%" align="center">序号</td>
	  <td  width="7%" align="center">合同号</td>
	  <td  width="5%" align="center">姓名</td>
	  <td  width="5%" align="center">设计师</td>
	  <td  width="5%" align="center">工程担当</td>
	  <td  width="5%" align="center">施工队</td>
	  <td  width="20%" align="center">房屋地址</td>
	  <td  width="9%" align="center">签约店面</td>
	  <td  width="8%" align="center">合同完工时间</td>
	  <td  width="7%" align="center">目前进度</td>
	  <td  width="9%" align="center">停工开始时间 </td>
</tr>
<%
String yhjs=(String)session.getAttribute("yhjs");
String fgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");

String xz=request.getParameter("xz");
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
String hth=null;
String sjjgrq=null;

String qyrq=null;
String khbh=null;
String xb=null;
String fwdz=null;
String zjxm=null;
String sjs=null;
String sgd=null;
String lxfs=null;
String gcjdmc=null;
String szqsj=null;
String jgrq=null;
String dwmc=null;
try {
	conn=cf.getConnection();

	for (int i=0;i<khxmlist.length ;i++ )
	{
		khxmlist[i]=cf.GB2Uni(khxmlist[i],"8859_1");
		pos=khxmlist[i].indexOf(':');
		khxm=khxmlist[i].substring(0,pos);
		sjjgrq=khxmlist[i].substring(pos+1);

		if (i%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}

		count=0;
		ls_sql="SELECT jgrq,qyrq,hth,sjs,zjxm,sgd,lxfs,khbh,khxm,DECODE(xb,'M','男','W','女') as xb,fwdz,gcjdmc,szqsj,a.dwmc sbdm,sgdmc sgdm ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm  ";
		ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2' and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+))";
//		ls_sql+=" and crm_khxx.gcjdbm!='5'";
		if (xz.equals("xzkhxm"))
		{
			ls_sql+=" and khxm='"+khxm+"'";
		}
		else{
			ls_sql+=" and hth='"+khxm+"'";
		}
		if (yhjs.equals("F0") || yhjs.equals("F1"))
		{
			ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
		}
		else if (yhjs.equals("F2"))
		{
			ls_sql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
		}
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			jgrq=cf.fillHtml(rs.getDate("jgrq"));
			qyrq=cf.fillHtml(rs.getDate("qyrq"));
			hth=cf.fillHtml(rs.getString("hth"));
			sjs=cf.fillHtml(rs.getString("sjs"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			sgd=cf.fillHtml(rs.getString("sgdm"));
			lxfs=cf.fillHtml(rs.getString("lxfs"));
			khbh=cf.fillHtml(rs.getString("khbh"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			xb=cf.fillHtml(rs.getString("xb"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));
			szqsj=cf.fillHtml(rs.getDate("szqsj"));
			dwmc=cf.fillHtml(rs.getString("sbdm"));

%>
			
    <tr bgcolor="<%=bgcolor%>"> 
      <td align="center"> 
        <input name="khbhbox" type=checkbox value="<%=khbh%>">
        <input name="xh" type="hidden" value="<%=(i+1)%>">
	  </td>
      <td align="center"><%=(i+1)%></td>
      <td align="center">
		<%=hth%>
		<input type="hidden" name="khbh" value="<%=khbh%>" >
	  </td>
      <td align="center"><%=khxm%></td>
      <td align="center"><%=sjs%></td>
      <td align="center"><%=zjxm%></td>
      <td align="center"><%=sgd%></td>
      <td align="center"><%=fwdz%></td>
      <td align="center"><%=dwmc%></td>
      <td align="center"><%=jgrq%></td>
      <td align="center"><%=gcjdmc%></td>
      <td align="center">
        <input name="sjjgrq" type="text" value="<%=sjjgrq%>" maxlength="10" size="10"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sjjgrq[<%=(row+1)%>])">
	  </td>
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
      <td align="center" colspan="2"><%=khxm%></td>
      <td colspan="9" bgcolor="#CC0000">数据不存在</td>
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
<input type=button value='存盘' onclick="cf_submit(listform)" name="sjjgrq">
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

