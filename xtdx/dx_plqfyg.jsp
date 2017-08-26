<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<jsp:useBean id='FSDX' scope='page' class='dxxt.FSDX'/><!-- 短信发送包 -->

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] ygbh=request.getParameterValues("ygbh");
String xxnr=cf.GB2Uni(request.getParameter("xxnr"));//接收传递过来的短信内容
String xxqz=cf.GB2Uni(request.getParameter("xxqz"));//接收传递过来的短信前缀
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql="";
String dxcs="";
String dxnr="";
String jssj="";
String hflxbm="";
int count=0;
//out.print(xxnr);

try {
	conn=cf.getConnection();

	for (int i=0;i<ygbh.length ;i++ )
	{
		ls_sql="select ygbh,yhmc||decode(xb,'M','先生','W','女士') dxnr,dh jssj ";
		ls_sql+=" from sq_yhxx ";
		ls_sql+=" where  ygbh='"+ygbh[i]+"' and dh is not null ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			count++;
			if (xxqz.equals("Y"))//自动匹配客户姓名性别
			{
				dxnr=rs.getString("dxnr")+","+xxnr;//短信内容
			}
			else {dxnr=xxnr;}
			jssj=rs.getString("jssj");
			dxcs=FSDX.jsdxfs(jssj,dxnr,yhmc);
			out.println("第<font color='blue'><b>"+count+"</b></font>条信息:"+dxcs);
		}
		rs.close();
		ps.close();
	}
	out.print("<font color='blue' size='+3'><b>"+count+"条信息处理完成!</b></font>");
}
catch (Exception e) {
	out.print("Exception: " + e);
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