<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%  
String ssfgs = request.getParameter("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String hfsjzdsz="0000";
	ls_sql="SELECT hfsjzdsz";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfsjzdsz=cf.fillNull(rs.getString("hfsjzdsz"));
	}
	else{
		out.println("���󣡵�λ��Ϣ���У�û�����ûطò���");
		return;
	}
	rs.close();
	ps.close();

	if (hfsjzdsz.length()!=4)
	{
		out.println("��λ��Ϣ���лطò������ò���ȷ��Ҫ��4λ��"+hfsjzdsz);
		return;
	}

	String onehf=hfsjzdsz.substring(0,1);
	String twohf=hfsjzdsz.substring(1,2);
	String threehf=hfsjzdsz.substring(2,3);
	String fourhf=hfsjzdsz.substring(3,4);

	String retStr="";
	retStr+="[value1]";

	if (onehf.equals("0"))
	{
		retStr+="%21+���Ͻ����ط�";
	}
	if (twohf.equals("0"))
	{
		retStr+="%22+���ι��̻ط�";
	}
	if (threehf.equals("0"))
	{
		retStr+="%23+���ڻط�";
	}
	if (fourhf.equals("0"))
	{
		retStr+="%24+�깤�ط�";
	}

	out.print(retStr);  

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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

