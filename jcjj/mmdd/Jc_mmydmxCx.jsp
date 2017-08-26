<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jcjj" scope="page" class="jcjj.Jcjj"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<%  
String mmdglxbm = request.getParameter("mmdglxbm");//木门订购类型编码
String mlx = request.getParameter("mlx");//1：普通门；2：子母门；3：对开门；4：推拉门 
String mmxh = request.getParameter("mmxh");//木门型号
String ysbm = request.getParameter("ysbm");//油色编码
String mdk = request.getParameter("mdk");//门洞宽
String mdg = request.getParameter("mdg");//门洞高
String qh = request.getParameter("qh");//墙厚
String dbh = request.getParameter("dbh");//地板厚
String tjx = request.getParameter("tjx");//踢脚线/平台上口
String ctbs = request.getParameter("ctbs");//门套/窗套边数
String dsk = request.getParameter("dsk");//单双口

double dj=0;

if (mmdglxbm==null)
{
	return ;
}

try {

	dj=jcjj.yzMmbj(mmdglxbm,mlx,mmxh,ysbm,mdk,mdg,qh,dbh,tjx,ctbs,dsk);

	if (dj!=0)//单价不为0
	{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.dj.value="<%=cf.doubleTrimStr(dj,2)%>";
		//-->
		</SCRIPT>
		<%
	}
	else{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.dj.value="";
//		alert("错误！价格信息不完整，未查到价格信息");
		//-->
		</SCRIPT>
		<%
	}
}
catch(Exception e){
	out.print("发生意外: " + e);
}
%>


