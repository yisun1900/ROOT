<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<jsp:useBean id='FSDX' scope='page' class='dxxt.FSDX'/><!-- ���ŷ��Ͱ� -->

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] ygbh=request.getParameterValues("ygbh");
String xxnr=cf.GB2Uni(request.getParameter("xxnr"));//���մ��ݹ����Ķ�������
String xxqz=cf.GB2Uni(request.getParameter("xxqz"));//���մ��ݹ����Ķ���ǰ׺
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
		ls_sql="select ygbh,yhmc||decode(xb,'M','����','W','Ůʿ') dxnr,dh jssj ";
		ls_sql+=" from sq_yhxx ";
		ls_sql+=" where  ygbh='"+ygbh[i]+"' and dh is not null ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			count++;
			if (xxqz.equals("Y"))//�Զ�ƥ��ͻ������Ա�
			{
				dxnr=rs.getString("dxnr")+","+xxnr;//��������
			}
			else {dxnr=xxnr;}
			jssj=rs.getString("jssj");
			dxcs=FSDX.jsdxfs(jssj,dxnr,yhmc);
			out.println("��<font color='blue'><b>"+count+"</b></font>����Ϣ:"+dxcs);
		}
		rs.close();
		ps.close();
	}
	out.print("<font color='blue' size='+3'><b>"+count+"����Ϣ�������!</b></font>");
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