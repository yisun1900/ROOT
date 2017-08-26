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
  <B><font size="3">设置投诉报修回访时间</font></B>
</CENTER>
<form method="POST" name="listform" action="SaveKhxm.jsp" target="_blank">
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC" align="center"> 
	<td  width="4%">&nbsp;</td>
	<td  width="8%">受理序号</td>
	<td  width="6%">状态</td>
	<td  width="10%">回访日期</td>
	<td  width="7%">合同号</td>
	<td  width="6%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="6%">设计师</td>
	<td  width="6%">施工队</td>
	<td  width="6%">质检</td>
	<td  width="25%">投诉报修内容</td>
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

String tsjlh=null;
String hfsj=null;
String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sjs=null;
String dwmc=null;
String zjxm=null;
String tsnr=null;
String clzt=null;


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
		ls_sql="SELECT crm_tsjl.tsjlh,hfsj,crm_tsjl.khbh,hth,khxm,fwdz,sjs,sgdmc,zjxm,tsnr,DECODE(clzt,'0','非客服登记','1','客服受理','2','在处理','3','结案','9','不立案') clzt";
		ls_sql+=" FROM crm_tsjl,crm_khxx,sq_sgd";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) ";
//		ls_sql+=" and crm_tsjl.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.tslxbm=dm_tslxbm.tslxbm ";
		ls_sql+=" and khxm='"+khxm+"' and clzt not in('3','9')";

		if (yhjs.equals("F0") || yhjs.equals("F1"))
		{
			ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
		}
		else if (yhjs.equals("F2"))
		{
			ls_sql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
		}

		ls_sql+=" order by  crm_tsjl.khbh,tsjlh ";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			tsjlh=cf.fillHtml(rs.getString("tsjlh"));
			hfsj=cf.fillNull(rs.getDate("hfsj"));
			khbh=cf.fillHtml(rs.getString("khbh"));
			hth=cf.fillHtml(rs.getString("hth"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			sjs=cf.fillHtml(rs.getString("sjs"));
			dwmc=cf.fillHtml(rs.getString("sgdmc"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			tsnr=cf.fillHtml(rs.getString("tsnr"));
			clzt=cf.fillHtml(rs.getString("clzt"));

%>
			
    <tr bgcolor="<%=bgcolor%>"> 
      <td align="center"> 
        <input name="khbhbox" type=checkbox value="<%=tsjlh%>">
	  </td>
      <td align="center">
		<input size="9" maxlength="20" type="text" name="tsjlh" value="<%=tsjlh%>" readonly=true style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	  </td>
      <td align="center"><%=clzt%></td>
      <td align="center">
        <input name="hfsj" type="text" value="<%=hfsj%>" maxlength="10" size="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(hfsj[<%=row+1%>])">
	  </td>
      <td align="center"><%=hth%>
	  </td>
      <td align="center"><%=khxm%></td>
      <td align="center"><%=fwdz%></td>
      <td align="center"><%=sjs%></td>
      <td align="center"><%=dwmc%></td>
      <td align="center"><%=zjxm%></td>
      <td align="left"><%=tsnr%></td>
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

<tr bgcolor="#FFFFFF">
<td colspan="13" > 
<input type=button value='全选' onclick="cf_checkAll(listform)">
<input type=button value='存盘' onclick="cf_submit(listform)" name="hfsj">
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

