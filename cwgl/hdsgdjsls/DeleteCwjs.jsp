<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] gdjsjlh = request.getParameterValues("gdjsjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String jsjd=null;
	String spjl=null;
	String fkbz=null;
	String khbh=null;
	String sgd=null;
	String khxm=null;
	String gdjsjd=null;


	conn.setAutoCommit(false);

	for (int i=0;i<gdjsjlh.length ;i++ )
	{
		ls_sql="select khbh,sgd,fkbz,jsjd";
		ls_sql+=" from  cw_gdjsjl";
		ls_sql+=" where gdjsjlh='"+gdjsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			sgd=rs.getString("sgd");
			fkbz=rs.getString("fkbz");
			jsjd=rs.getString("jsjd");
		}
		else{
			conn.rollback();
			out.println("���󣡽����¼��["+gdjsjlh[i]+"]������");
			return;
		}
		rs.close();
		ps.close();


		if (!jsjd.equals("3"))//1�����㲿���㣻2������������3���������
		{
			conn.rollback();
			out.println("���󣡲���δ���㣺"+gdjsjlh[i]);
			return;
		}


		//�����
		ls_sql="update cw_gdjkjl set gdjsjd='0',gdjsjlh=null";
		ls_sql+=" where  khbh='"+khbh+"' and  gdjsjlh='"+gdjsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����
		ls_sql=" update  kp_xjgdjl set jsbz='N',jsjlh=null";
		ls_sql+=" where jsjlh='"+gdjsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//��ά�޷�
		ls_sql=" update  crm_wxfmx set jsbz='N',jsjlh=null";
		ls_sql+=" where jsjlh='"+gdjsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���������¼
		ls_sql=" update  cw_kqtkjl set jsbz='N',jsjlh=null";
		ls_sql+=" where sgd='"+sgd+"' and jsjlh='"+gdjsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_gdjsjl set sj=0,clf=0,zgclf=0,jkje=0,glf=0,fakuan=0,kwxf=0,ksdf=0,kqtk=0,gdjskze=0,sqgz=0,cwjsr=null,cwjssj=null,cwjssm=null,jsjd='2' ";
		ls_sql+=" where  (gdjsjlh='"+gdjsjlh[i]+"' and jsjd='3')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>