<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>
<TITLE>呼叫中心</TITLE>
</HEAD>

<BODY> 

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");

String xh=request.getParameter("xh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String mac="";
String bjhm="";
String yhbm="";
String ssfgs="";
String ldzdly="";//来电自动录音
String qdzdly="";//去电自动录音

String ldhm="";
String khbh="";
String lywjml="";
String lywj="";


String	khxm="";
String	xb="";
String	fwdz="";
String	sjs="";
String	zjxm="";
String	sgdmc="";

String	tsjlh="";
String	tsbxsj="";
String	tsnr="";

try {
	conn=cf.getConnection();


	ls_sql="select mac,bjhm,yhbm,ssfgs,ldzdly,qdzdly";
	ls_sql+=" from  call_init";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mac=cf.fillNull(rs.getString("mac"));
		bjhm=cf.fillNull(rs.getString("bjhm"));
		yhbm=cf.fillNull(rs.getString("yhbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ldzdly=cf.fillNull(rs.getString("ldzdly"));
		qdzdly=cf.fillNull(rs.getString("qdzdly"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<div align="center">呼叫中心－－呼出kk</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td align="center">摘/挂机</td>
    <td height="52"><input type="button" value="摘机" name="zjBT" onClick="zjHMBT()">
        <input type="button" value="挂机" name="gjBT" onClick="gjHMBT()" disabled></td>
  </tr>
  <tr>
    <td width="15%" align="center">拨号</td>
    <td width="85%" height="52"> 呼叫号码：
      <input name="outnum" type="text" value="13601167422" size="20" maxlength="20">
        <input type="button" value="拨号" name="DialBT" onClick="DialNmb()" disabled>
        <input name="button" type="button" onClick="window.open('cxkh.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="查找客户" ></td>
  </tr>
</table>
  


<P><br>
</P>
</BODY>
</HTML>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">


//摘机
function zjHMBT()
{
	var callMark=parent.menu.callMark;

	if (callMark==0 || callMark==1 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		zjBT.disabled=true;

		parent.menu.zjHM();

		gjBT.disabled=false;
		DialBT.disabled=false;
	}
	else{
		alert("错误！未挂机，不能摘机");
		return;
	}
}

//挂机
function gjHMBT()
{
	var callMark=parent.menu.callMark;

	if (callMark==6 || callMark==13)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		gjBT.disabled=true;

		parent.menu.gjHM();

		zjBT.disabled=false;
	}
	else{
		alert("错误！不能挂机");
		return;
	}
}


//拨号
function DialNmb()
{
	var callMark=parent.menu.callMark;

	if (outnum.value=="")
	{
		alert("错误！请输入呼叫号码");
		outnum.select();
		return;
	}
	else{
		if (callMark!=6 )//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
		{
			alert("错误！未摘机");
			return;
		}

		DialBT.disabled=true;

		parent.menu.DialNmb(outnum.value);


	}

}




</SCRIPT>
