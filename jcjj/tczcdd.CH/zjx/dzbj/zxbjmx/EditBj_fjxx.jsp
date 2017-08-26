<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	font-weight: bold;
	font-family: "隶书";
}
-->
</style>
</head>


<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int row=0;

String xh=null;
String xmbh=null;
String wybh=null;
String xmmc=null;
String jldwmc=null;
String jgwzbm=null;
String jgwzmc=null;
double dj=0;
String bz=null;
String fjzcxq=null;

int fjsl=0;
double fjmj=0;
double fjg=0;
double zdyxmmj=0;
double zdybzmj=0;
int xuhao=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform" action="">
<input type="hidden" name="khbh" value="<%=khbh%>" >
<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
<center>
    <span class="STYLE2">维护房间信息</span>
    <BR>（<font color="#FF0000"><b><font size="2">如果【房间名称】或【房间顺序号】不合适，在这里进行修改</font></b></font>） 
  </center>
  <table border="1" cellspacing="0" cellpadding="1" width="130%" style='FONT-SIZE: 12px' >
    <tr bgcolor="#FFFFFF"> 
      <td colspan="10" > 
	  <input type=button value='全选' onClick="cf_checkAll(listform)" >
	  <input type=button value='删除被选房间' onClick="cf_delete(listform)" >
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type=button value='存盘' onClick="cf_submit(listform)" name="sl">
      <input type="reset" value='重输' name="reset" >      </td>
    </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="2%">&nbsp;</td>
	  <td  width="4%"><font color="#0000FF"><b>房间序号</b></font></td>
	  <td  width="9%">修改前房间名称</td>
      <td  width="10%" ><b><font color="#0000FF">修改后房间名称</font></b></td>
	  <td  width="5%"><font color="#0000FF"><b>房间面积（㎡）</b></font></td>
	  <td  width="5%"><font color="#0000FF"><b>房间高（米）</b></font></td>
	  <td  width="5%"><font color="#0000FF"><b>自定义木作面积（㎡）)</b></font></td>
	  <td  width="5%"><font color="#0000FF"><b>自定义壁纸面积（㎡）)</b></font></td>
      <td  width="36%" ><b><font color="#0000FF">房间主材需求</font></b></td>
      <td  width="19%" ><b><font color="#0000FF">备注</font></b></td>
    </tr>

<%
	ls_sql="SELECT jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,xuhao,bz,fjzcxq";
	ls_sql+=" FROM bj_fjxxh";
    ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
    ls_sql+=" order by xuhao";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		jgwzbm=rs.getString("jgwzbm");
		fjmj=rs.getDouble("fjmj");
		fjg=rs.getDouble("fjg");
		zdyxmmj=rs.getDouble("zdyxmmj");
		zdybzmj=rs.getDouble("zdybzmj");
		xuhao=rs.getInt("xuhao");
		bz=cf.fillNull(rs.getString("bz"));
		fjzcxq=cf.fillNull(rs.getString("fjzcxq"));

		if (row%2==0)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//输出每行数据
		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
	<td >
        <input name="xhbox" type="checkbox" value='<%=jgwzbm%>'>
      </td>
	<td>
		<input type="text" name="xuhao" size="3" maxlength="5" value="<%=xuhao%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xuhao[<%=(row+1)%>])" >
	</td>
	<td><%=jgwzbm%></td>
	<td align="left">
        <input name="oldjgwzbm" type="hidden" value='<%=jgwzbm%>'>
		<input type="text" name="jgwzbm" size="15" maxlength="50" value='<%=jgwzbm%>' style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jgwzbm[<%=(row+1)%>])" >
	</td>
	<td>
		<input type="text" name="fjmj" size="6" maxlength="8" value="<%=fjmj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(fjmj[<%=(row+1)%>])" >
	</td>
	<td>
		<input type="text" name="fjg" size="6" maxlength="8" value="<%=fjg%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(fjg[<%=(row+1)%>])" >
	</td>
	<td>
		<input type="text" name="zdyxmmj" size="6" maxlength="8" value="<%=zdyxmmj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zdyxmmj[<%=(row+1)%>])" >
	</td>
	<td>
		<input type="text" name="zdybzmj" size="6" maxlength="8" value="<%=zdybzmj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zdybzmj[<%=(row+1)%>])" >
	</td>
	<td align="left">
		<input type="text" name="fjzcxq" size="62" maxlength="300" value='<%=fjzcxq%>' style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(fjzcxq[<%=(row+1)%>])" >
	</td>
	<td align="left">
		<input type="text" name="bz" size="31" maxlength="200" value='<%=bz%>' style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[<%=(row+1)%>])" >
	</td>
  </tr>

	<%
		row++;
	}
	rs.close();
	ps.close();

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="9" > 
	  <input type=button value='全选' onClick="cf_checkAll(listform)" >
	  <input type=button value='删除被选房间' onClick="cf_delete(listform)" >
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type=button value='存盘' onClick="cf_submit(listform)" name="sl">
      <input type="reset" value='重输' name="reset" >      </td>
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
			formName.xhbox.checked =false
		}
		else{
			formName.xhbox.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				formName.xhbox[i].checked =false
			}
			else{
				formName.xhbox[i].checked =true
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
			if( formName.xhbox.checked ){
				choo=1;
			}
		} 
		else if (<%=row%>>1){ 
			for (i=0;i< <%=row%>;i++ ){
				if( formName.xhbox[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择所要操作的数据");
			return false;
		}
		else{
			formName.action="DeleteBj_fjxx.jsp";
			formName.submit();
			return true;
		}
	}
} 
function cf_submit(formName)
{
	formName.action="SaveEditBj_fjxx.jsp";
	formName.submit();
	return true;
} 
//-->
</script>

