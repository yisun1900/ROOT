<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">结案登记</font></B>
</CENTER>
<form method="POST" name="listform" action="SaveJaKhxm.jsp" target="_blank">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="4%">&nbsp;</td>
	<td  width="6%">序号</td>
	<td  width="10%">记录号</td>
	<td  width="10%">姓名</td>
	<td  width="20%">房屋地址</td>
	<td  width="10%">投诉报修大类</td>
	<td  width="14%">投诉报修小类</td>
	<td  width="12%">客服受理时间</td>
	<td  width="8%">结案时间</td>
	<td  width="8%">客户满意度</td>
	<td  width="8%">解决问题及时性</td>
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
String jasj=null;

String tsjlh=null;
String fwdz=null;
String tslxmc=null;
String slfsmc=null;
String dwmc=null;
String tsyymc=null;
String slsj=null;
String clzt=null;
String zzjgmc=null;

try {
	conn=cf.getConnection();

	for (int i=0;i<khxmlist.length ;i++ )
	{
		khxmlist[i]=cf.GB2Uni(khxmlist[i],"8859_1");
		pos=khxmlist[i].indexOf(':');
		khxm=khxmlist[i].substring(0,pos);
		jasj=khxmlist[i].substring(pos+1);

		if (i%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}

		count=0;

		ls_sql="SELECT tsjlh,khxm,fwdz,tslxmc,tsyymc,slsj,DECODE(clzt,1,'受理投诉',2,'处理投诉',3,'结案') clzt,zzjgmc  ";
		ls_sql+=" FROM crm_tsjl,dm_zzjgbm,dm_tslxbm,dm_tsyybm  ";
		ls_sql+=" where crm_tsjl.zzjgbm=dm_zzjgbm.zzjgbm(+) and crm_tsjl.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.tslxbm=dm_tslxbm.tslxbm";
		ls_sql+=" and khxm='"+khxm+"' and clzt!='3'";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			tsjlh=cf.fillHtml(rs.getString("tsjlh"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			tslxmc=cf.fillHtml(rs.getString("tslxmc"));
			tsyymc=cf.fillHtml(rs.getString("tsyymc"));
			slsj=cf.fillHtml(rs.getDate("slsj"));
			clzt=cf.fillHtml(rs.getString("clzt"));
			zzjgmc=cf.fillHtml(rs.getString("zzjgmc"));

%>
			
    <tr bgcolor="<%=bgcolor%>"> 
      <td align="center"> 
        <input name="tsjlhbox" type=checkbox value="<%=tsjlh%>">
        <input name="xh" type="hidden" value="<%=(i+1)%>">
	  </td>
      <td align="center"><%=(i+1)%></td>
      <td align="center">
		<input size="9" maxlength="20" type="text" name="tsjlh" value="<%=tsjlh%>" readonly=true style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	  </td>
      <td align="center"><%=khxm%></td>
      <td align="center"><%=fwdz%></td>
      <td align="center"><%=tslxmc%></td>
      <td align="center"><%=tsyymc%></td>
      <td align="center"><%=slsj%></td>
      <td align="center">
        <input name="jasj" type="text" value="<%=jasj%>" maxlength="10" size="10"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jasj[<%=(row+1)%>])">
	  </td>
      <td align="center">
		<select name="zzjgbm" style="FONT-SIZE:12PX;WIDTH:60PX">
		  <option value=""></option>
<%
		cf.selectItem(out,"select zzjgbm,zzjgmc from dm_zzjgbm order by zzjgbm","");
%> 
		</select>
	  
	  </td>
      <td align="center">
		<select name="jsxbm" style="FONT-SIZE:12PX;WIDTH:100PX">
		  <option value=""></option>
<%
	cf.selectItem(out,"select jsxbm,jsxmc from dm_jsxbm order by jsxbm","");
%> 
		</select>
	  
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
<td colspan="11" > 
<input type=button value='全选' onclick="cf_checkAll(listform)">
<input type=button value='存盘' onclick="cf_submit(listform)" name="jasj">
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
			formName.tsjlhbox.checked =false
		}
		else{
			formName.tsjlhbox.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				formName.tsjlhbox[i].checked =false
			}
			else{
				formName.tsjlhbox[i].checked =true
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
			if( formName.tsjlhbox.checked ){
				choo=1;
			}
		} 
		else if (<%=row%>>1){ 
			for (i=0;i< <%=row%>;i++ ){
				if( formName.tsjlhbox[i].checked ){
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

