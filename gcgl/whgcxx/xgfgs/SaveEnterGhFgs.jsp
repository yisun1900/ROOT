<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String xtrzip=request.getRemoteHost();

String newssfgs=cf.GB2Uni(request.getParameter("newssfgs"));
String oldssfgs=cf.GB2Uni(request.getParameter("oldssfgs"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String newdqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+newssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		newdqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


///////////////////////////////////////	


	//�޸ģ��ͻ�������Ŀ��ϸ
	ls_sql="update bj_bjxmmx set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ���������ϸ
	ls_sql="update bj_gclmx set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ��ͻ����Ϸ�����
	ls_sql="update bj_khglfxb set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ���ʱ����--��Ŀ��ϸ
	ls_sql="update bj_mbbjxmmx set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ���ʱ����--���Ϸ�����
	ls_sql="update bj_mbglfxb set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ���ʱ����--��������ϸ
	ls_sql="update bj_mbgclmx set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ��ͻ�������Ŀ��ϸ
	ls_sql="update bj_bjxmmxq set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ���������ϸ
	ls_sql="update bj_gclmxq set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ��ͻ����Ϸ�����
	ls_sql="update bj_khglfxbq set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ��ͻ�������Ŀ��ϸ
	ls_sql="update bj_bjxmmxh set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ���������ϸ
	ls_sql="update bj_gclmxh set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//�޸ģ��ͻ����Ϸ�����
	ls_sql="update bj_khglfxbh set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	

	//�޸ģ���ѯ�ͻ���Ϣ��crm_zxkhxx��
	ls_sql="update crm_zxkhxx set ssfgs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();


	//�޸ģ���ѯ�ͻ������¼��crm_zxkhfwjl��
	ls_sql="update crm_zxkhfwjl set ssfgs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ�����ӵ���¼��crm_dmjdjl��
	ls_sql="update crm_dmjdjl set ssfgs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ����ʦ�ӵ���¼��crm_sjsjdjl��
	ls_sql="update crm_sjsjdjl set ssfgs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ���ѯ�طü�¼��crm_zxhfjl��
	ls_sql="update crm_zxhfjl set ssfgs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();


	//�޸ģ��ͻ���Ϣ��crm_khxx��
	ls_sql="update crm_khxx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();




	//�޸ģ��ͻ������¼��cw_khfkjl��
	ls_sql="update cw_khfkjl set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();





	//�޸ģ����ɶ�����jc_jcdd��
	ls_sql="update jc_jcdd set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ����Ķ�����jc_zcdd��
	ls_sql="update jc_zcdd set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ����Ķ�����ϸ��jc_zcddmx��
	ls_sql="update jc_zcddmx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ����������jc_zczjx��
	ls_sql="update jc_zczjx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ����������jc_zczjx��
	ls_sql="update jc_zczjx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ�ľ��Ԥ������jc_mmydd��
	ls_sql="update jc_mmydd set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ�ľ�������jc_mmzjx��
	ls_sql="update jc_mmzjx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ��Ҿ߶�����jc_jjdd��
	ls_sql="update jc_jjdd set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ��Ҿ������jc_jjzjx��
	ls_sql="update jc_jjzjx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ����񶩵���jc_cgdd��
	ls_sql="update jc_cgdd set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ����������jc_cgzjx��
	ls_sql="update jc_cgzjx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//�޸ģ����������jc_cgzjx��
	ls_sql="update cw_qmjzmx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�����ֹ�˾�ɹ���");
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






