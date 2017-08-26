<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zklx=cf.GB2Uni(request.getParameter("zklx"));

String ls=null;
String spr=null;
java.sql.Date spsj=null;
String spjg=null;
String spsm=null;
double spzkl=0;
double spzjxzkl=0;
String sfpzqtyh=null;
String pzqtyhnr=null;
spr=cf.GB2Uni(request.getParameter("spr"));
ls=request.getParameter("spsj");
try{
	if (!(ls.equals("")))  spsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
spjg=cf.GB2Uni(request.getParameter("spjg"));
spsm=cf.GB2Uni(request.getParameter("spsm"));

ls=request.getParameter("spzkl");
try{
	if (!(ls.equals("")))  spzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�ۿ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("spzjxzkl");
try{
	if (!(ls.equals("")))  spzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spzjxzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ۿ���]����ת����������:"+e);
	return;
}


sfpzqtyh=cf.GB2Uni(request.getParameter("sfpzqtyh"));
pzqtyhnr=cf.GB2Uni(request.getParameter("pzqtyhnr"));


String[] sfxmbm =request.getParameterValues("sfxmbm");
String[] zdzkstr =request.getParameterValues("zdzk");
String[] spdxzklstr =request.getParameterValues("spdxzkl");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String spbz=null;
	ls_sql="select spbz";
	ls_sql+=" from  crm_dzyhsq";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		spbz=rs.getString("spbz");
	}
	rs.close();
	ps.close();
	if (spbz.equals("2"))//1��δ������2��������
	{
		out.println("����������");
		return;
	}


	conn.setAutoCommit(false);


	if (spjg.equals("1"))//1��ͬ�⣻2����ͬ��
	{
		ls_sql="update crm_dzyhsq set spbz=?,spr=?,spsj=?,spjg=?,spsm=?,spzkl=?,spzjxzkl=?,sfpzqtyh=?,pzqtyhnr=? ";
		ls_sql+=" where  (khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,"2");
		ps.setString(2,spr);
		ps.setDate(3,spsj);
		ps.setString(4,spjg);
		ps.setString(5,spsm);
		ps.setDouble(6,spzkl);
		ps.setDouble(7,spzjxzkl);
		ps.setString(8,sfpzqtyh);
		ps.setString(9,pzqtyhnr);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_zxkhxx set spzkl=?,zjxzkl=?,sfpzqtyh=?,pzqtyhnr=?,zklx=? ";
		ls_sql+=" where  (khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,spzkl);
		ps.setDouble(2,spzjxzkl);
		ps.setString(3,sfpzqtyh);
		ps.setString(4,pzqtyhnr);
		ps.setString(5,zklx);
		ps.executeUpdate();
		ps.close();
	}
	else{//2����ͬ��
		ls_sql="update crm_dzyhsq set spbz=?,spr=?,spsj=?,spjg=?,spsm=?,spzkl=?,spzjxzkl=?,sfpzqtyh=?,pzqtyhnr=? ";
		ls_sql+=" where  (khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,"2");
		ps.setString(2,spr);
		ps.setDate(3,spsj);
		ps.setString(4,spjg);
		ps.setString(5,spsm);
		ps.setDouble(6,10);
		ps.setDouble(7,10);
		ps.setString(8,"N");
		ps.setString(9,"");
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_zxkhxx set spzkl=null,zjxzkl=null,sfpzqtyh=null,pzqtyhnr=null,zklx=null ";
		ls_sql+=" where  (khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	if (sfxmbm!=null)
	{
		for (int i=0;i<sfxmbm.length ;i++ )
		{
			double zdzk=0;
			double spdxzkl=0;

			try{
				zdzk=Double.parseDouble(zdzkstr[i]);
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[��������ۿ�]����ת����������");
				return;
			}

			try{
				spdxzkl=Double.parseDouble(spdxzklstr[i]);
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[�����ۿ�]����ת����������");
				return;
			}

			if (spdxzkl<zdzk)
			{
				conn.rollback();
				out.println("���󣡡������ۿۡ�����С�ڡ���������ۿۡ�");
				return;
			}

			if (spdxzkl<0 || spdxzkl>10)
			{
				conn.rollback();
				out.println("���󣡡������ۿۡ�ֻ����0��10֮��");
				return;
			}

			if (spjg.equals("1"))//1��ͬ�⣻2����ͬ��
			{
				ls_sql="update crm_dxdzyh set spdxzkl=?";
				ls_sql+=" where khbh='"+khbh+"' and sfxmbm='"+sfxmbm[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,spdxzkl);
				ps.executeUpdate();
				ps.close();

				ls_sql="update bj_sfxmmx set dxzkl=? ";
				ls_sql+=" where  khbh='"+khbh+"' and  sfxmbm='"+sfxmbm[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,spdxzkl);
				ps.executeUpdate();
				ps.close();

				//��ʼ��
				dzbj.Dzbj dzbj=new dzbj.Dzbj();
				//���������շ���Ŀ�������շѰٷֱ�
				dzbj.updateSfxm(conn,khbh,"yz");
				//��ȡ���ӱ��۽��
				double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");


				//�޸ģ����ӱ����ܶ�
				ls_sql="update crm_zxkhxx set dzbjze=?";
				ls_sql+=" where  khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,dzbjze);
				ps.executeUpdate();
				ps.close();

		
			}
			else{//2����ͬ��
				ls_sql="update crm_dxdzyh set spdxzkl=?";
				ls_sql+=" where khbh='"+khbh+"' and sfxmbm='"+sfxmbm[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,10);
				ps.executeUpdate();
				ps.close();


				ls_sql="update bj_sfxmmx set dxzkl=10 ";
				ls_sql+=" where  khbh='"+khbh+"' and  sfxmbm='"+sfxmbm[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				//��ʼ��
				dzbj.Dzbj dzbj=new dzbj.Dzbj();
				//���������շ���Ŀ�������շѰٷֱ�
				dzbj.updateSfxm(conn,khbh,"yz");
				//��ȡ���ӱ��۽��
				double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");


				//�޸ģ����ӱ����ܶ�
				ls_sql="update crm_zxkhxx set dzbjze=?";
				ls_sql+=" where  khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,dzbjze);
				ps.executeUpdate();
				ps.close();
			}
		}
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
	out.print("<BR>����:" + e);
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