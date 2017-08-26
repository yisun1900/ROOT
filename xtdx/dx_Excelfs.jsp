<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id='FSDX' scope='page' class='dxxt.FSDX'/><!-- 短信发送包 -->
<%@ include file="/getlogin.jsp" %>
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");

String[] xh=request.getParameterValues("xh");
String[] jssj=request.getParameterValues("jssj");//接收手机
String[] xxqz=request.getParameterValues("xxqz");//信息前缀  例如 张三先生
String[] xxnr=request.getParameterValues("xxnr");//信息内容
String dxnr=null;
String dxcs=null;
int count=0;
for (int i=0;i<xh.length ;i++ )
{
	count++;
	if (xxqz[i]!=null && xxqz[i]!="")
	{dxnr=cf.GB2Uni(xxqz[i])+","+cf.GB2Uni(xxnr[i]);}
	else {cf.GB2Uni(dxnr=xxnr[i]);}
//	out.print(jssj[i]+"--"+dxnr);
	dxcs=FSDX.jsdxfs(jssj[i],dxnr,yhdlm,"1");//调用发送短信函数
	//函数说明:jssj:接收号码,如果有多个用","隔开
	//dxnr:短信的内容
	//yhdlm:用户登录名
	//"1":固定数字,1:及时短信;0:定时短信
	out.println(dxcs);//将发送结果显示到页面上
}
out.print("<font color='blue' size='+3'><b>"+count+"条信息处理完成!</b></font>");
%>