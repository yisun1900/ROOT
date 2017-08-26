<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='FSDX' scope='page' class='dxxt.FSDX'/><!-- 短信发送包 -->
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String alljssj = request.getParameter("jssj");//接收传递过来的手机号码,多个号码用","分割
String dxnr=cf.GB2Uni(request.getParameter("dxnr"));//接收传递过来的短信内容
String dfsj=cf.GB2Uni(request.getParameter("dfsj"));//短信发送日期
String dfxs=cf.GB2Uni(request.getParameter("dfxs"));//短信发送时间
String dfdxtime=dfsj+" "+dfxs+":00:00";
String[] sjhm=alljssj.split(",");//将传递过来的参数分割成数组
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql="";
String ls_sql2="";
String dxcs="";
String jssj="";
String hflxbm="";
String xh=null;
int count=0;
//out.print(xxnr);

try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	for (int i=0;i<sjhm.length ;i++ )
	{
		jssj=sjhm[i];

		//将等待发送的短信写入数据库
		ls_sql2=" select lpad(NVL(max(xh)+1,1),11,0) xh ";
		ls_sql2+=" from dx_dfdx";
		ps2= conn.prepareStatement(ls_sql2);
		rs2 =ps2.executeQuery(ls_sql2);
		if (rs2.next())
		{
			xh=rs2.getString("xh");//序号
		}
		rs2.close();
		ps2.close();
		
		ls_sql2="insert into dx_dfdx (xh,jshm,jssj,fsr,sfyfs,dxnr) ";
		ls_sql2+=" values ( ?,?,SYSDATE,?,'N',?) ";
		ps2= conn.prepareStatement(ls_sql2);
		ps2.setString(1,xh);
		ps2.setString(2,jssj);
//			ps2.setDate(3,to_date(dfdxtime,'yyyy-MM-dd hh24:mi:ss'));
		ps2.setString(3,yhdlm);
		ps2.setString(4,dxnr);
		ps2.executeUpdate();
		ps2.close();

		ls_sql2="update dx_dfdx set jssj=to_date('"+dfdxtime+"','yyyy-MM-dd hh24:mi:ss') ";
		ls_sql2+=" where xh='"+xh+"' ";
		ps2= conn.prepareStatement(ls_sql2);
		ps2.executeUpdate();
		ps2.close();
//			out.print(ls_sql2+"Ok...<br>");

	}
//	out.print("<font color='blue' size='+3'><b>"+count+"条信息处理完成!</b></font>");
	conn.commit();
	out.print("保存成功!!!");
	}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>