<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
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
		String psdzt=null;
		String fgsbh=null;
		String shjl=null;
		ls_sql=" SELECT psdzt,fgsbh,shjl ";
		ls_sql+=" FROM jxc_clpsd,crm_khxx ";
		ls_sql+=" where jxc_clpsd.khbh=crm_khxx.khbh and jxc_clpsd.psph='"+psph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			psdzt=cf.fillNull(rs.getString("psdzt"));
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
			shjl=cf.fillNull(rs.getString("shjl"));
		}
		else{
			rs.close();
			ps.close();

			conn.rollback();
			out.print("���󣡲��ϵ�["+psph[i]+"]������");
			return;
		}
		rs.close();
		ps.close();

		String dqbm=null;
		ls_sql=" SELECT dqbm";
		ls_sql+=" FROM sq_dwxx ";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dqbm=cf.fillNull(rs.getString("dqbm"));
		}
		rs.close();
		ps.close();

		if (!psdzt.equals("2") && !psdzt.equals("6") && !psdzt.equals("7"))//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
		{
			conn.rollback();
			out.print("���󣡲��ϵ�["+psph[i]+"]δ���");
			return;
		}

		ls_sql="update jxc_clpsd set psdzt='1',shjl=null,shr=null,shsj=null,shsm=null";
		ls_sql+=" where psph='"+psph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//�޸ģ����ϼ۸��jxc_cljgb��.��������
		if (shjl.equals("Y"))
		{
			String clbm=null;
			String clmc=null;
			String nbbm=null;
			String xsfs=null;
			double sqpssl=0;
			double pssl=0;
			ls_sql=" select clbm,clmc,nbbm,sqpssl,pssl,xsfs ";
			ls_sql+=" from jxc_clpsmx ";
			ls_sql+=" where psph='"+psph[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			while (rs.next())
			{
				clbm=cf.fillNull(rs.getString("clbm"));
				clmc=cf.fillNull(rs.getString("clmc"));
				nbbm=cf.fillNull(rs.getString("nbbm"));
				sqpssl=rs.getDouble("sqpssl");
				pssl=rs.getDouble("pssl");
				xsfs=cf.fillNull(rs.getString("xsfs"));

				if (!xsfs.equals("1"))//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4���������
				{
					ls_sql="update jxc_cljgb set dhsl=dhsl-"+pssl;
					ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
			}
			rs.close();
			ps.close();
		}
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