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
		String ysfxhf=null;
		java.sql.Date yhfrq=null;
		String yhflxbm=null;
		String hfszjlh=null;
		ls_sql="select wtclzt,khbh,ysfxhf,yhfrq,yhflxbm,hfszjlh";
		ls_sql+=" from hf_zsghfjl";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getwtclzt=cf.fillNull(rs.getString("wtclzt"));
			khbh=cf.fillNull(rs.getString("khbh"));
			ysfxhf=rs.getString("ysfxhf");
			yhfrq=rs.getDate("yhfrq");
			yhflxbm=rs.getString("yhflxbm");
			hfszjlh=rs.getString("hfszjlh");
		}
		rs.close();
		ps.close();

		if (!getwtclzt.equals("") && !getwtclzt.equals("1"))
		{
			conn.rollback();
			out.println("�����ѿ�ʼ�������ٸı�״̬:"+hfjlh[i]);
			return;
		}


		String gethfszjlh="";
		ls_sql="select hfszjlh";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gethfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		}
		rs.close();
		ps.close();

		String gethfjlh="";
		ls_sql="select hfjlh";
		ls_sql+=" from hf_zsghfjl";
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


		ls_sql="delete from hf_zsghfjl  ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from hf_zsghfwtbm ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_zsghfcljl ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

			
		ls_sql="delete from hf_zsghfjg ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_zsghfbmyyy ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_zsgwtda ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_zsgwtbcsm ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (hfszjlh!=null && !hfszjlh.equals(""))//ԭ�������˻ط���Ϣ
		{
			if (gethfszjlh.equals(hfszjlh))//�ɱ������õĿͻ��ط���Ϣ��������������
			{
				ls_sql="update crm_khxx set sfxhf=?,hfrq=?,hflxbm=? where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,ysfxhf);
				ps.setDate(2,yhfrq);
				ps.setString(3,yhflxbm);
				ps.executeUpdate();
				ps.close();
			}

			ls_sql="delete from hf_hfszjl ";
			ls_sql+=" where hfszjlh='"+hfszjlh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
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