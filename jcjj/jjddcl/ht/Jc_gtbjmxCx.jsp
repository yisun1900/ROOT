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
String row = request.getParameter("row");//���
String bcpp = cf.unescape(request.getParameter("bcpp"));//���Ʒ��
String bchd = request.getParameter("bchd");//��ĺ��
if (bchd==null)
{
	return;
}

double dj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

try {
	conn=cf.getConnection();    //�õ�����

	if (bcpp!=null && bchd!=null)
	{
		ls_sql="select dj";
		ls_sql+=" from jc_jjbjbj";
		ls_sql+=" where  bclx='"+bcpp+"' and bchd="+bchd;
//		out.println(ls_sql);
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next()){  
			dj=rs.getDouble("dj");
		}
		rs.close();
		ps.close();
	}


	if (dj!=0)//���۲�Ϊ0
	{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.bzdj[<%=row%>].value="<%=cf.doubleTrimStr(dj,2)%>";
		parent.main.f_wdzje(parent.main.insertform,<%=row%>);
		//-->
		</SCRIPT>
		<%
	}
	else{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.bzdj.value="";
		parent.main.insertform.je.value="";
//		alert("���󣡼۸���Ϣ��������δ�鵽�۸���Ϣ");
		//-->
		</SCRIPT>
		<%
	}
}
catch(Exception e){
	out.print("��ѯʧ��,��������: " + e);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
}
%>

