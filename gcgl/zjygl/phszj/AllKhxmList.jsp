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
  <B><font size="2">设置工程担当和施工班组</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
  <table border="1" width="105%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"> 
      <td  width="4%" align="center">&nbsp;</td>
      <td  width="3%" align="center">序号</td>
      <td  width="6%" align="center">客户编号</td>
      <td  width="5%" align="center">姓名</td>
      <td  width="18%" align="center">房屋地址</td>
      <td  width="5%" align="center">设计师</td>
      <td  width="6%" align="center">工程担当</td>
      <td  width="5%" align="center">施工队</td>
      <td  width="6%" align="center">班长</td>
      <td  width="7%" align="center">签约日期</td>
      <td  width="7%" align="center">交底日期</td>
      <td  width="10%" align="center">签约店面</td>
    </tr>
    <%
String lrph = request.getParameter("lrph");

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
String xb=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgdmc=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String jyjdrq=null;
String bzdh=null;
String zjdh=null;
String dwmc=null;
String lrxh=null;
try {
	conn=cf.getConnection();

	count=0;
	int i=0;
	ls_sql="SELECT lrxh,crm_khxx.khbh,khxm,DECODE(xb,'M','男','W','女') as xb,fwdz,lxfs,qyrq,jyjdrq,a.dwmc dm,sjs,zjxm,sgdmc,sgd,sgbz ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,crm_lrphmx ";
	ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2')";
	ls_sql+=" and crm_khxx.khbh=crm_lrphmx.khbh and crm_lrphmx.lrph="+lrph;
	ls_sql+=" order by lrxh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		lrxh=cf.fillHtml(rs.getString("lrxh"));
		khbh=cf.fillHtml(rs.getString("khbh"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		xb=cf.fillHtml(rs.getString("xb"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		jyjdrq=cf.fillHtml(rs.getDate("jyjdrq"));
		dwmc=cf.fillHtml(rs.getString("dm"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		if (i%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}
		i++;
%> 
    <tr bgcolor="<%=bgcolor%>"> 
      <td align="center"> 
        <input name="khbhbox" type=checkbox value="<%=khbh%>">
        <input name="lrxh" type="hidden" value="<%=lrxh%>">
      </td>
      <td align="center"><%=lrxh%></td>
      <td align="center"> 
        <input size="7" maxlength="20" type="text" name="khbh" value="<%=khbh%>" readonly=true style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
      </td>
      <td align="center"><A HREF="ViewZjxmList.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
      <td align="center"><%=fwdz%></td>
      <td align="center"><%=sjs%></td>
      <td align="center"> 
        <input name="zjxm" type="text" value="<%=zjxm%>" maxlength="10" size="6"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sgbz[<%=row%>])">
      </td>
      <td align="center"><%=sgdmc%></td>
      <td align="center"> 
        <input name="sgbz" type="text" value="<%=sgbz%>" maxlength="10" size="6"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zjxm[<%=(row+1)%>])">
      </td>
      <td align="center"><%=qyrq%></td>
      <td align="center"><%=jyjdrq%></td>
      <td align="center"><%=dwmc%></td>
    </tr>
    <%
		count++;
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
      <td colspan="14" > 
        <input type=button value='全选' onclick="cf_checkAll(listform)">
        <input type=button value='删除' onclick="cf_delete(listform)">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type=button value='存盘' onclick="cf_submit(listform)" name="zjxm">
        &nbsp;&nbsp; 
        <input type="reset" value='重输' >
        <input type="hidden" name="lrph" value="<%=lrph%>">
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
function cf_delete(formName)
{
	var choo=0;
	if ( confirm("注意！删除后不可恢复，确实要删除数据吗?") )	{
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
			formName.action="DeleteKhxm.jsp";
			formName.submit();
			return true;
		}
	}
} 
function cf_submit(formName)
{
	formName.action="SaveAllKhxm.jsp";
	formName.submit();
	return true;
} 
//-->
</script>

