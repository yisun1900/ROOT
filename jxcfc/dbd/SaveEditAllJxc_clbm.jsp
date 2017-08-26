<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String dbph=request.getParameter("dbph");
String[] clbm=request.getParameterValues("clbm");
String[] dbslStr=request.getParameterValues("dbsl");
String[] dbdjStr=request.getParameterValues("dbdj");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dbdzt="";
	ls_sql=" SELECT dbdzt ";
	ls_sql+=" FROM jxc_db ";
	ls_sql+=" where  dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dbdzt=cf.fillNull(rs.getString("dbdzt"));
	}
	rs.close();
	ps.close();

	//0��δ�ύ��1���ύ�ȴ���ˣ�2�����ͨ���ȴ����⣻3���ѳ���ȴ���⣻7�����δͨ����9��������
	if (!dbdzt.equals("0") )
	{
		out.print("���󣡵�����["+dbph+"]״̬����ȷ��ӦΪ��0��δ�ύ����");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ; i++)
	{
		double dbdj = Double.parseDouble(dbdjStr[i]);
		double dbsl = Double.parseDouble(dbslStr[i]);

		String xsfs="";
		double zcpzsl=0;
		double dhsl=0;
		ls_sql="select xsfs,zcpzsl,dhsl";
		ls_sql+=" from  jxc_cljgb";
		ls_sql+=" where jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xsfs=cf.fillNull(rs.getString("xsfs"));
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
		}
		rs.close();
		ps.close();

		if (xsfs.equals("2"))//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4���������
		{
			if (dbsl > (zcpzsl-dhsl))
			{
				conn.rollback();
				out.println("�����ֻ����ۣ�����������"+dbsl+"�����ܴ��ڡ��ɶ�������"+(zcpzsl-dhsl)+"�����ɶ�������������Ʒ��棭����");
				return;
			}
		}

		ls_sql="update jxc_dbmx set dbdj=?,dbsl=?,dbje=?*?,cbje=cbdj*?";
		ls_sql+=" where clbm='"+clbm[i]+"'  and dbph='"+dbph+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dbdj);
		ps.setDouble(2,dbsl);
		ps.setDouble(3,dbdj);
		ps.setDouble(4,dbsl);
		ps.setDouble(5,dbsl);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>