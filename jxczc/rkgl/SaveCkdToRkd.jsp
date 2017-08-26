<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String ckph=cf.GB2Uni(request.getParameter("ckph"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//�����ⵥ״̬
	String rkdzt=null;
	ls_sql="select rkdzt ";
	ls_sql+=" from  jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkdzt=rs.getString("rkdzt");
	}
	else{
		out.print("������ⵥ["+rkph+"]�����ڣ�");
		return;
	}
	rs.close();
	ps.close();

	if (!rkdzt.equals("0"))//0��δ�ύ��1���ȴ���ˣ�2���ȴ���⣻3������⣻4���ѽ��㣻6���ȴ��ܲ����
	{
		out.print("������ⵥ���ύ��������¼�����ݣ�");
		return;
	}

	//��鹩Ӧ�̶���״̬
	String ckdzt=null;
	ls_sql="select ckdzt ";
	ls_sql+=" from  jxc_ckd ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ckdzt=rs.getString("ckdzt");
	}
	else{
		out.print("���󣡹�Ӧ�̶�������["+ckph+"]�����ڣ�");
		return;
	}
	rs.close();
	ps.close();

	if (!ckdzt.equals("9"))//0:δ�ύ��8�����ܷ�����⣻9���ύ
	{
		out.print("���󣡽��ܷ�����⣡");
		return;
	}


	//��ѯ������Ʒ����
	int rkxh=0;
	ls_sql="select max(rkxh) ";
	ls_sql+=" from  jxc_rkmx";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//д�������ϸ
	ls_sql="insert into jxc_rkmx ( rkph,rkxh,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm ,rksl,rkj ,rkje,zcpsl,scrq,scph,hjbh,hwbh,ccpsl,wldssl,thpsl,bfpsl,ccpzkl,zcpfkcsl,ccpfkcsl,bfpfkcsl ) ";
	ls_sql+=" select              ?,?+rownum,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm ,cksl,ckdj,ckje,cksl ,?   ,?   ,?   ,?   ,0,0,0,0,10,0,0,0 ";
	ls_sql+=" from  jxc_ckmx";
	ls_sql+=" where ckph='"+ckph+"'";
	ls_sql+=" order by ckxh";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rkph);
	ps.setInt(2,rkxh);
	ps.setDate(3,null);
	ps.setString(4,"");
	ps.setString(5,"");
	ps.setString(6,"");
	ps.executeUpdate();
	ps.close();


	//���ⵥ
	ls_sql="update jxc_ckd set ckdzt='8'";//8�����ܷ������
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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