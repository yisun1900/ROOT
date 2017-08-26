<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String[] psph=request.getParameterValues("psph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<psph.length ;i++ )
	{
		String dqbm=null;
		String psdzt=null;
		String dybz=null;
		ls_sql=" SELECT sq_dwxx.dqbm,jxc_clpsd.psdzt,jxc_clpsd.dybz ";
		ls_sql+=" FROM jxc_clpsd,crm_khxx,sq_dwxx ";
		ls_sql+=" where jxc_clpsd.khbh=crm_khxx.khbh and crm_khxx.fgsbh=sq_dwxx.dwbh and jxc_clpsd.psph='"+psph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dqbm=cf.fillNull(rs.getString("dqbm"));
			psdzt=cf.fillNull(rs.getString("psdzt"));
			dybz=cf.fillNull(rs.getString("dybz"));
		}
		rs.close();
		ps.close();

		if (!psdzt.equals("2") && !psdzt.equals("1") && !psdzt.equals("6"))//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
		{
			conn.rollback();
			out.print("�������ϵ�["+psph[i]+"]״̬����ȷ");
			return;
		}

		if (dybz.equals("Y"))
		{
			if (!yhjs.equals("A0"))
			{
				conn.rollback();
				out.print("�������ϵ�["+psph[i]+"]�Ѵ�ӡ������ɾ��������ϵϵͳ����Աɾ��");
				return;
			}
		}

		ls_sql="update jxc_clpsd set psdzt='0'";
		ls_sql+=" where psph='"+psph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ύ�ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>