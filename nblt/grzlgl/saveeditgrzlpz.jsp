<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
String yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
String ls=null;
String ltnc=cf.GB2Uni(request.getParameter("ltnc"));
String lttx=cf.GB2Uni(request.getParameter("lttx"));
String grsm=cf.GB2Uni(request.getParameter("grsm"));
int ftsl=0;
int htsl=0;
int ltid=0;
int zlsl=0;
int nmzlsl=0;
String nmltnc="�����û�";
String nmlttx="019";
String nmgrsm="�����û�";
int nmltid=1;
ls=cf.GB2Uni(request.getParameter("ltid"));
try
	{
		ltid=Integer.parseInt(ls);//����������Ϊ�����ʼ����1
	}
	catch(Exception e)
	{
		out.print("��̳ID����");
		return;
	}
ls=cf.GB2Uni(request.getParameter("ftsl"));
try
	{
		ftsl=Integer.parseInt(ls);//����������Ϊ�����ʼ����1
	}
	catch(Exception e)
	{
		out.print("������������");
		return;
	}
ls=cf.GB2Uni(request.getParameter("htsl"));
try
	{
		htsl=Integer.parseInt(ls);//����������Ϊ�����ʼ����1
	}
	catch(Exception e)
	{
		out.print("������������");
		return;
	}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);
	//��ѯ�����û��Ƿ񱻳�ʼ��
	ls_sql="select count(*) zlsl ";
	ls_sql+=" from  nblt_grzl";
	ls_sql+=" where  (ltid=1) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nmzlsl=rs.getInt("zlsl");
	}
	rs.close();
	ps.close();
	if (nmzlsl>0)
	{}
	else
	{
		ls_sql="insert into nblt_grzl ( ltid,ltnc,lttx,ftsl,htsl,grsm ) ";
		ls_sql+=" values ( ?,?,?,0,0,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,nmltid);
		ps.setString(2,nmltnc);
		ps.setString(3,nmlttx);
		ps.setString(4,nmgrsm);
		if (ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�");
		}
	}
	//��ѯ�Ƿ��Ѿ��޸Ĺ���̳����
	ls_sql="select count(*) zlsl ";
	ls_sql+=" from  nblt_grzl";
	ls_sql+=" where  (ltid="+ltid+") ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zlsl=rs.getInt("zlsl");
	}
	rs.close();
	ps.close();
	if (zlsl>0)
	{
		ls_sql="update nblt_grzl set ltnc=?,lttx=?,ftsl=?,htsl=?,grsm=? ";
		ls_sql+=" where  (ltid='"+ltid+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ltnc);
		ps.setString(2,lttx);
		ps.setInt(3,ftsl);
		ps.setInt(4,htsl);
		ps.setString(5,grsm);
		if (ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�");
		}
	}
	else
	{
		ls_sql="insert into nblt_grzl ( ltid,ltnc,lttx,ftsl,htsl,grsm ) ";
		ls_sql+=" values ( ?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,ltid);
		ps.setString(2,ltnc);
		ps.setString(3,lttx);
		ps.setInt(4,ftsl);
		ps.setInt(5,htsl);
		ps.setString(6,grsm);
		if (ps.executeUpdate()!=1)
		{
			out.println("<BR>����ʧ�ܣ�");
		}
	}
	conn.commit();
	%>
		<SCRIPT language=javascript >
		<!--
		alert("�༭�������ϳɹ���");
		window.location.href="/nblt/grzlgl/spdk.jsp";
		window.close();
		//-->
		</SCRIPT>
<!-- 		<br><a href="/nblt/grzlgl/spdk.jsp">������ĵ������û���Զ���ת���������</a>
 -->		<%
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>