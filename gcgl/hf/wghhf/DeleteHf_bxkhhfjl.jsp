<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] hfjlh = request.getParameterValues("hfjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;
String hflxbm="31";//11�����ڻطã�12�����Żطã�13������ط�;21�����Ͻ����طã�22�����ι��̻طã�23�����ڻطã�24���깤�طã�25�����лطã�26������طã�31���깤��ػ��ط�;41��Ͷ�߱��޻ط�

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<hfjlh.length ;i++ )
	{
		String getwtclzt="";
		String khbh="";
		ls_sql="select wtclzt,khbh";
		ls_sql+=" from hf_bxkhhfjl";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getwtclzt=cf.fillNull(rs.getString("wtclzt"));
			khbh=cf.fillNull(rs.getString("khbh"));
		}
		rs.close();
		ps.close();

		if (!getwtclzt.equals("") && !getwtclzt.equals("1"))
		{
			conn.rollback();
			out.println("�����ѿ�ʼ�������ٸı�״̬:"+hfjlh[i]);
			return;
		}

		String gethfjlh="";
		ls_sql="select hfjlh";
		ls_sql+=" from hf_bxkhhfjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ls_sql+=" order by hfjlh desc ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gethfjlh=cf.fillNull(rs.getString("hfjlh"));
		}
		rs.close();
		ps.close();

		if (!gethfjlh.equals(hfjlh[i]))
		{
			conn.rollback();
			out.println("����ֻ��ɾ�����µĻطü�¼��"+gethfjlh);
			return;
		}


		ls_sql="delete from hf_bxkhhfjl  ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from hf_bxhfwtbm ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_bxhfcljl ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

			
		ls_sql="delete from hf_bxkhhfjg ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_bxkhhfbmyyy ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_bxkhwtda ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_bxwtbcsm ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//N��δ������S��Ԥ������Y���طóɹ���X���ط�ʧ�ܣ�C��ʧ���Ѵ���W����Ŀ����
		ls_sql="update crm_khxx set wghhfcs=NVL(wghhfcs,0)-1";
		ls_sql+=" where khbh='"+khbh+"'";
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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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