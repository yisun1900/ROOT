<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
//session.removeAttribute("yhdlm");//删除
//session.removeAttribute("ygbh");//删除

String yhdlm=request.getParameter("yhdlm").trim();
String ygbh=request.getParameter("ygbh").trim();

//session.setAttribute("yhdlm",yhdlm);
//session.setAttribute("ygbh",ygbh);
%>
<span id="ycp"></span>
<span id="sfyz">后自动转入论坛，请稍后………………</span>
<SCRIPT language=javascript >
		<!--
var mmkk=6;

function showTime()
{
	mmkk--;
	if (mmkk==0)
	{
//		sfyz.innerHTML="";
//		ycp.innerHTML="<meta  http-equiv='refresh'  content='0;url=ktz.jsp'>";
		window.location.href="ktz.jsp?yhdlm="+yhdlm+"&ygbh="+ygbh";
//		window.open("ktz.jsp");
//		window.close();
	}
	else
	{setTimeout("showTime()", 1000);
	ycp.innerHTML=mmkk+"秒";}
}

//-->
</SCRIPT>

<%


String getsession=(String)session.getAttribute("yhdlm");
String getsessionbh=(String)session.getAttribute("ygbh");
if (getsession==null)
{
	out.print(new String("系统闲置时间过长，请重新登录！111".getBytes("8859_1")));
	return;
}
else
{
//	out.print(getsession);
	%>
	<SCRIPT language=javascript >
		<!--
		showTime();
		//-->
		</SCRIPT>
		<%

//	out.print(getsession+"-----"+getsessionbh);
//	response.sendRedirect("ktz.jsp");
}
%>
