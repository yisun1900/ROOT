<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date jjsj=null;
String jjsm=null;
String jjr=null;
ls=request.getParameter("jjsj");
try{
	if (!(ls.equals("")))  jjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jjsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
jjr=cf.GB2Uni(request.getParameter("jjr"));
jjsm=cf.GB2Uni(request.getParameter("jjsm"));
String cljg=request.getParameter("cljg");

String ysjlh=request.getParameter("ysjlh");
String zgcljlh=request.getParameter("zgcljlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclbz=null;
	ls_sql="select clbz";
	ls_sql+=" from crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();

	if (!getclbz.equals("2") && !getclbz.equals("3"))//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
	{
		out.println("����״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into crm_yszgcljl (zgcljlh,ysjlh,lx,cljg,clr,clsj,clsm)  ";
	ls_sql+=" values (?,?,?,?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,ysjlh);
	ps.setString(3,"���Ĵ���");
	ps.setString(4,cljg);
	ps.setString(5,jjr);
	ps.setString(6,jjsm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_heysjl set zgcljlh=?,jjsj=?,jjr=?,cljg=?,jjsm=?,clbz=?";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setDate(2,jjsj);
	ps.setString(3,jjr);
	ps.setString(4,cljg);
	ps.setString(5,jjsm);
	ps.setString(6,cljg);
	ps.executeUpdate();
	ps.close();

	rwjh.Rwjh rwjh=new rwjh.Rwjh();

	//��������״̬,update crm_khsgjhb set ysjg=?
	rwjh.updateYsxmZt(conn,ysjlh);
	
	conn.commit();

	if (cljg.equals("4"))//3���ڴ���4���ѽ��
	{
		//���Ͷ���
		ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
		String retStr=dxxt.yszgClwc(conn,ysjlh,jjr);//���÷��Ͷ��ź���
		if (retStr.equals(""))
		{
			out.println("���ŷ��ͳɹ�");
		}
		else{
			out.println(retStr);//�����ͽ����ʾ��ҳ����
		}
	}

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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>