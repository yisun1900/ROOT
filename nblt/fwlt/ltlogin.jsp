<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
//session.removeAttribute("yhdlm");//ɾ��
//session.removeAttribute("ygbh");//ɾ��

String yhdlm=request.getParameter("yhdlm").trim();
String ygbh=request.getParameter("ygbh").trim();

//session.setAttribute("yhdlm",yhdlm);
//session.setAttribute("ygbh",ygbh);
%>
<span id="ycp"></span>
<span id="sfyz">���Զ�ת����̳�����Ժ󡭡���������</span>
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
	ycp.innerHTML=mmkk+"��";}
}

//-->
</SCRIPT>

<%


String getsession=(String)session.getAttribute("yhdlm");
String getsessionbh=(String)session.getAttribute("ygbh");
if (getsession==null)
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��111".getBytes("8859_1")));
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
