<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh=request.getParameterValues("khbh");

String ls=null;
double yjjzcs=0;
ls=request.getParameter("yjjzcs");
try{
	if (!(ls.equals("")))  yjjzcs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yjjzcs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ҵ����ֵ����]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	//��ʼ��
	dzbj.Zjx zjx=new dzbj.Zjx();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		double yjjz=0;
		yjjz=dzbjje.getYjjz(conn,khbh[i],"yz");//��ȡҵ����ֵ
		yjjz=cf.round(yjjz*100/yjjzcs,2);//ҵ����ֵ=ë����º��㾻ֵ����

		String zjxxh="";
		ls_sql="SELECT zjxxh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxxh=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();
		

		double zxyjjz=0;

		if (zjxxh.equals(""))
		{
			zxyjjz=yjjz;
		}
		else{
			zxyjjz=zjx.getYjjz(conn,khbh[i],zjxxh,"yz");//ҵ����ֵ
			zxyjjz=cf.round(zxyjjz*100/yjjzcs,2);//ҵ����ֵ=ë����º��㾻ֵ����
		}
		
		
		ls_sql=" update crm_khqye set yjjzcs=?,yjjz=?,zxyjjz=? ";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps=conn.prepareStatement(ls_sql);
		ps.setDouble(1,yjjzcs);
		ps.setDouble(2,yjjz);
		ps.setDouble(3,zxyjjz);
		ps.executeUpdate();
		ps.close();
	}

	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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