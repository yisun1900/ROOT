<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ysshjl=request.getParameter("ysshjl");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khbh=null;
String khxm=null;
String shxmbm=null;
String shxmmc=null;
String shxmdlmc=null;
String shxmxlmc=null;
double kf=0;
String bz=null;

String bgcolor="#FFFFFF"  ;
int row=0;
try {
	conn=cf.getConnection();

	ls_sql="select khbh";
	ls_sql+=" from  bj_ysshjl";
	ls_sql+=" where  ysshjl='"+ysshjl+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();

	ls_sql="select khxm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
	}
	rs.close();
	ps.close();
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">Ԥ�������ϸ���ͻ�������<%=khxm%>��</font></B>
</CENTER>
<form method="POST" name="listform" action="SaveInsertBj_ysshmx.jsp">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#FFFFFF">
	<td colspan="8" align="center"> 
	<input type="hidden" name="ysshjl"  value="<%=ysshjl%>" >
	<input type="button" value='������˽��' onclick="f_do(listform)">
	</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">ѡ�񲻺ϸ���</td>
	<td  width="6%">��Ŀ����</td>
	<td  width="7%">���ϸ���</td>
	<td  width="25%">�����Ŀ</td>
	<td  width="6%">����۷�</td>
	<td  width="9%">��ĿС��</td>
	<td  width="9%">��Ŀ����</td>
	<td  width="33%">��ע</td>
</tr>
<%

	ls_sql="SELECT dm_ysshxmbm.shxmbm,dm_ysshxmbm.shxmmc,dm_ysshxmdlbm.shxmdlmc,dm_ysshxmxlbm.shxmxlmc,dm_ysshxmbm.kf,dm_ysshxmbm.bz";
	ls_sql+=" FROM dm_ysshxmxlbm,dm_ysshxmdlbm,dm_ysshxmbm  ";
    ls_sql+=" where dm_ysshxmbm.shxmxlbm=dm_ysshxmxlbm.shxmxlbm";
    ls_sql+=" and dm_ysshxmbm.shxmdlbm=dm_ysshxmdlbm.shxmdlbm ";
    ls_sql+=" order by dm_ysshxmbm.shxmdlbm,dm_ysshxmbm.shxmxlbm,dm_ysshxmbm.shxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		shxmbm=cf.fillNull(rs.getString("shxmbm"));
		shxmmc=cf.fillNull(rs.getString("shxmmc"));
		shxmdlmc=cf.fillNull(rs.getString("shxmdlmc"));
		shxmxlmc=cf.fillNull(rs.getString("shxmxlmc"));
		kf=rs.getDouble("kf");
		bz=cf.fillNull(rs.getString("bz"));


		String bhgsl="";

		ls_sql="select bhgsl";
		ls_sql+=" from  bj_ysshmx";
		ls_sql+=" where  ysshjl='"+ysshjl+"' and shxmbm='"+shxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			bhgsl=rs1.getString(1);
		}
		rs1.close();
		ps1.close();


		if (row%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td>
			<input name="shxmbmch" type="checkbox" value="<%=row%>" onclick="f_check(this,bhgsl<%=row%>)" <% if (!bhgsl.equals("")) out.print("checked"); %>>
			<input name="shxmbm" type="hidden" value="<%=shxmbm%>">
			</td>
			<td><%=shxmbm%></td>
			<td>
			<select name="bhgsl<%=row%>" style="FONT-SIZE:12PX;WIDTH:52PX">
			  <option value=""></option>
			  <option value="1">1��</option>
			  <option value="2">2��</option>
			  <option value="3">3��</option>
			  <option value="4">4��</option>
			  <option value="5">5��</option>
			  <option value="6">6��</option>
			  <option value="7">7��</option>
			  <option value="8">8��</option>
			  <option value="9">9��</option>
			  <option value="10">10��</option>
			</select>
			</td>
			<td align="left"><%=shxmmc%></td>
			<td><%=kf%></td>
			<td><%=shxmxlmc%></td>
			<td><%=shxmdlmc%></td>
			<td align="left"><%=bz%></td>
		</tr>
		<%

		if (!bhgsl.equals(""))
		{
			%>
			<script  LANGUAGE="javascript">
			<!--
				listform.bhgsl<%=row%>.value=<%=bhgsl%>;
			//-->
			</script>
			<%
		}

		row++;
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<tr bgcolor="#FFFFFF">
	<td colspan="8" align="center"> 
	<input type="button" value='������˽��' onclick="f_do(listform)">
	</td>
</tr>
</table>
</form> 
</html>

<script  LANGUAGE="javascript">
<!--
function f_check(fie1,fie2)
{
	if (fie1.checked)
	{
		fie2.value="1";
	}
	else{
		fie2.value="";
	}
} 
function f_do(formName)
{
	var choo=0;

	var i = 0;
	if (<%=row%>==1){
		if( formName.shxmbmch.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i <<%=row%>;i++ ){
			if( formName.shxmbmch[i].checked ){
				choo=1;
			}
		} 
	} 
	if (choo == 0){
		if (!confirm("��δѡ���κΡ����ϸ���Ŀ����ȷʵҪ������?") )	
		{
			return false;
		}
	}

	formName.submit();
	return true;

} 
//-->
</script>
