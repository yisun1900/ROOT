<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">请填写批准金额</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"> 
	<!-- <td  width="12%">&nbsp;</td> -->
	<td  width="6%" align="center">申请序号</td>
	<td  width="7%" align="center">申请日期</td>
	<td  width="5%" align="center">申请人</td>
	<td  width="9%" align="center">费用名称</td>
	<td  width="9%" align="center">所需金额</td>
	<td  width="11%" align="center">批准金额</td>
	
	<td  width="7%" align="center">单位名称</td>
	<td  width="18%" align="center">备注</td>
</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor=null;
String sfsh=null;
sfsh=request.getParameter("SFSH");
int pos=0;
int count=0;
int row=0;
String sqxh=null;
String sqrq=null;
String sqr=null;
String fymc=null;
String sxje=null;
String bz=null;
String dwmc=null;
String pzje=null;
String wheresql="where (1=1)";
String xz_bgfysbb_sqrq=null;
xz_bgfysbb_sqrq=request.getParameter("xz_bgfysbb_sqrq");
if (xz_bgfysbb_sqrq!=null)
{
	xz_bgfysbb_sqrq=xz_bgfysbb_sqrq.trim();
	if (!(xz_bgfysbb_sqrq.equals("")))	wheresql+="  and (xz_bgfysbb.sqrq>=TO_DATE('"+xz_bgfysbb_sqrq+"','YYYY/MM/DD'))";
}
xz_bgfysbb_sqrq=request.getParameter("xz_bgfysbb_sqrq2");
if (xz_bgfysbb_sqrq!=null)
{
	xz_bgfysbb_sqrq=xz_bgfysbb_sqrq.trim();
	if (!(xz_bgfysbb_sqrq.equals("")))	wheresql+="  and (xz_bgfysbb.sqrq<=TO_DATE('"+xz_bgfysbb_sqrq+"','YYYY/MM/DD'))";
}
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="  and ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}

try {
	conn=cf.getConnection();
	count=0;
	int i=0;
	ls_sql="SELECT xz_bgfysbb.sqxh as sqxh,xz_bgfysbb.sqrq as sqrq,xz_bgfysbb.sqr as sqr,xz_bgfysbb.fymc as fymc,xz_bgfysbb.sxje as sxje,xz_bgfysbb.pzje as pzje,xz_bgfysbb.bz as bz,sq_dwxx.dwmc as dwmc  ";
	ls_sql+=" FROM sq_dwxx,xz_bgfysbb  ";
	if (sfsh.equals("Y"))
	{
	 wheresql+=" and xz_bgfysbb.dwbh=sq_dwxx.dwbh and xz_bgfysbb.pzje is not null  ";
	}
	else
	{ 
	wheresql+=" and xz_bgfysbb.dwbh=sq_dwxx.dwbh and xz_bgfysbb.pzje is  null  ";
	}
    ls_sql+=wheresql;
    ls_sql+="  order by sq_dwxx.dwmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{

		sqxh=cf.fillHtml(rs.getString("sqxh"));
		sqr=cf.fillHtml(rs.getString("sqr"));
		fymc=cf.fillHtml(rs.getString("fymc"));
		sxje=cf.fillNull(rs.getString("sxje"));
		pzje=cf.fillNull(rs.getString("pzje"));
		bz=cf.fillHtml(rs.getString("bz"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));


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
        <input name="sqxh" type="tex"t value="<%=sqxh%>" size="6"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:dotted;border-color: #FFFFFF" readonly>
       
	  </td>
	 <!--  <td align="center"><%=sqxh%></td> -->
	  <td align="center"><%=sqrq%></td>
      <td align="center"><%=sqr%></td>
      
      <td align="center"><%=fymc%></td>
      <td align="center"><%=sxje%></td>
      <td align="center">
        <input name="pzje" type="text" value="<%=pzje%>" maxlength="10" size="10"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(pzje[<%=(row+1)%>])">
	  </td>
      
      
      <td align="center"><%=dwmc%></td>
	  <td align="center"><%=bz%></td>
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
      <p align="center"> 
	  <!-- <input type=button value='全选' onclick="cf_checkAll(listform)"> -->
		  <input type=button value='保存' onclick="cf_submit(listform)" name="sjkgrq">
          &nbsp;&nbsp; 
		  <input type="reset" value='重输' >
          <input type="hidden" name="lrph" value=""> 
      </p>
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
			formName.sqxhbox.checked =false
		}
		else{
			formName.sqxhbox.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				formName.sqxhbox[i].checked =false
			}
			else{
				formName.sqxhbox[i].checked =true
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
	formName.action="SaveShjg2.jsp";
	formName.submit();
	return true;
} 
//-->
</script>



