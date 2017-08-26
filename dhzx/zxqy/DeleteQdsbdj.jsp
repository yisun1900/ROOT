<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String khfwjlh=cf.GB2Uni(request.getParameter("khfwjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String khbh=null;
String xzxzt=null;
String zxzt=null;
String sfxhf=null;
java.sql.Date hfrq=null;
String zxdm=null;
String sjs=null;
String sbyybm=null;
String ysbyybm=null;

String nowzxzt=null;
String nowsfxhf=null;
java.sql.Date nowhfrq=null;
String nowzxdm=null;
String nowsjs=null;
String nowsbyybm=null;

try {
	conn=cf.getConnection();

	String maxdjbh=null;
	String ykhfwjlh=null;
	ls_sql="select khbh,xzxzt,yzxzt,ysfxhf,yhfrq,yzxdm,ysjs,sbyybm,ysbyybm,khfwjlh,ykhfwjlh";
	ls_sql+=" from  crm_zxkhfwjl";
	ls_sql+=" where khfwjlh='"+khfwjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		xzxzt=cf.fillNull(rs.getString("xzxzt"));
		zxzt=cf.fillNull(rs.getString("yzxzt"));
		sfxhf=cf.fillNull(rs.getString("ysfxhf"));
		hfrq=rs.getDate("yhfrq");
		zxdm=cf.fillNull(rs.getString("yzxdm"));
		sjs=cf.fillNull(rs.getString("ysjs"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		ysbyybm=cf.fillNull(rs.getString("ysbyybm"));
		maxdjbh=cf.fillNull(rs.getString("khfwjlh"));
		ykhfwjlh=cf.fillNull(rs.getString("ykhfwjlh"));
	}
	else{
		out.println("���󣡲���ʧ�ܣ������ڵĵǼǱ��");
		return;
	}
	rs.close();
	ps.close();

	if (!khfwjlh.equals(maxdjbh))
	{
		out.println("����ֻ��ɾ�����µĵǼǱ��"+maxdjbh);
		return;
	}

	String sjsjdjlh=null;
	String dmjdjlh=null;
	ls_sql="select zxzt,sfxhf,hfrq,zxdm,sjs,sbyybm,sjsjdjlh,dmjdjlh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nowzxzt=cf.fillNull(rs.getString("zxzt"));
		nowsfxhf=cf.fillNull(rs.getString("sfxhf"));
		nowhfrq=rs.getDate("hfrq");
		nowzxdm=cf.fillNull(rs.getString("zxdm"));
		nowsjs=cf.fillNull(rs.getString("sjs"));
		nowsbyybm=cf.fillNull(rs.getString("sbyybm"));
		sjsjdjlh=rs.getString("sjsjdjlh");
		dmjdjlh=rs.getString("dmjdjlh");
	}
	else{
		out.println("���󣡲����ڵĿͻ����");
		return;
	}
	rs.close();
	ps.close();

	if (!xzxzt.equals(nowzxzt))
	{
		out.println("���󣡲���ʧ�ܣ�[��ѯ״̬]�Ѹı�");
		return;
	}


	conn.setAutoCommit(false);


	//��ԭ�����ʦ�ӵ���¼
	ls_sql="update crm_sjsjdjl set zxzt=?,sbyybm=null,sbyyxs=null,jssj=null,jslrr=null";//zxzt,0����ѯ�Ǽǣ� 1:���ʦ��ѯ��2:���ʦ�ύ�ɵ���3����ǩԼ��4��ʧ��
	ls_sql+=" where  (sjsjdjlh='"+sjsjdjlh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxzt);
	ps.executeUpdate();
	ps.close();

	//��ԭ������ӵ���¼
	ls_sql="update crm_dmjdjl set zxzt=?,sbyybm=null,sbyyxs=null,jssj=null,jslrr=null";//zxzt,0����ѯ�Ǽǣ� 1:���ʦ��ѯ��2:���ʦ�ύ�ɵ���3����ǩԼ��4��ʧ��
	ls_sql+=" where  (dmjdjlh='"+dmjdjlh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxzt);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set zxzt=?,sbyybm=?,sbkhlx=null,sbyyxs=null,sbsj=null,khfwjlh=?";//zxzt,0����ѯ�Ǽǣ� 1:���ʦ��ѯ��2:���ʦ�ύ�ɵ���3����ǩԼ��4��ʧ��
	ls_sql+=" where  (khbh='"+khbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxzt);
	ps.setString(2,ysbyybm);
	ps.setString(3,ykhfwjlh);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from crm_zxkhfwjl ";
	ls_sql+=" where  (khfwjlh='"+khfwjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	


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
	out.print("Exception: " + ls_sql);
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