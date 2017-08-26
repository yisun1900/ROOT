<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String spjg=cf.GB2Uni(request.getParameter("spjg"));//1��ͬ�⣻2����ͬ��
String[] khbh = request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		String spbz=null;
		String zklx=null;
		String sqqtyhnr=null;
		String sfsqqtyh=null;
		double sqzkl=0;
		double sqzjxzkl=0;
		ls_sql="select spbz,zklx,sqqtyhnr,sfsqqtyh,sqzkl,sqzjxzkl";
		ls_sql+=" from  crm_dzyhsq";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			spbz=rs.getString("spbz");
			zklx=rs.getString("zklx");
			sqqtyhnr=cf.fillNull(rs.getString("sqqtyhnr"));
			sfsqqtyh=cf.fillNull(rs.getString("sfsqqtyh"));
			sqzkl=rs.getDouble("sqzkl");
			sqzjxzkl=rs.getDouble("sqzjxzkl");
		}
		rs.close();
		ps.close();

		if (spbz.equals("2"))//1��δ������2��������
		{
			conn.rollback();
			out.println("����������");
			return;
		}

		if (spjg.equals("1"))//1��ͬ�� 
		{
			ls_sql="update crm_dzyhsq set spbz='2',spr=?,spsj=TRUNC(SYSDATE),spjg=?,spsm=?,spzkl=sqzkl,spzjxzkl=sqzjxzkl,sfpzqtyh=sfsqqtyh,pzqtyhnr=sqqtyhnr";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yhmc);
			ps.setString(2,spjg);
			ps.setString(3,"��������");
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhxx set ";
			ls_sql+="  spzkl="+sqzkl;
			ls_sql+=" ,zjxzkl="+sqzjxzkl;
			ls_sql+=" ,sfpzqtyh='"+sfsqqtyh+"'";
			ls_sql+=" ,pzqtyhnr='"+sqqtyhnr+"'";
			ls_sql+=" ,zklx='"+zklx+"'";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="update bj_sfxmmx set dxzkl=? ";
			ls_sql+=" where  khbh='"+khbh[i]+"' and sflx!='8'";//3��˰�𣨰��ۿۼ����ۺ�˰����8��˰�𣨰����������ۺ�˰��
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sqzkl);
			ps.executeUpdate();
			ps.close();
		}
		else{// 2����ͬ��
			ls_sql="update crm_dzyhsq set spbz='2',spr=?,spsj=TRUNC(SYSDATE),spjg=?,spsm=?,spzkl=10,spzjxzkl=10,sfpzqtyh='N',pzqtyhnr=null ";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yhmc);
			ps.setString(2,spjg);
			ps.setString(3,"��������");
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhxx set spzkl=null,zjxzkl=null,sfpzqtyh=null,pzqtyhnr=null,zklx=null";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="update bj_sfxmmx set dxzkl=10 ";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}


		//��ʼ��
		dzbj.Dzbj dzbj=new dzbj.Dzbj();
		//���������շ���Ŀ�������շѰٷֱ�
		dzbj.updateSfxm(conn,khbh[i],"yz");
		//��ȡ���ӱ��۽��
		double dzbjze=dzbj.getAllBjje(conn,khbh[i],"yz");


		//�޸ģ����ӱ����ܶ�
		ls_sql="update crm_zxkhxx set dzbjze=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dzbjze);
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>