<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String jsr=null;
java.sql.Date jssj=null;
String jssm=cf.GB2Uni(request.getParameter("jsyj"));

jsr=cf.GB2Uni(request.getParameter("jsr"));
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}

String zgcljlh=request.getParameter("zgcljlh");
String zgjlh=request.getParameter("zgjlh");
String xjjlh=request.getParameter("xjjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getwtclbz=null;
	ls_sql="select wtclbz";
	ls_sql+=" from kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getwtclbz=cf.fillNull(rs.getString("wtclbz"));
	}
	rs.close();
	ps.close();

	if (getwtclbz.equals("Y"))//B�������ģ�N������δ���գ�C���ڴ���Y���ѽ��
	{
		out.println("���������ѽ��");
		return;
	}

	String getclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from kp_zggdmx";
	ls_sql+=" where zgjlh='"+zgjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!getclzt.equals("1") && !getclzt.equals("6"))//1:δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
	{
		out.println("���������ѽ���");
		return;
	}

	
	conn.setAutoCommit(false);

	ls_sql="insert into kp_zgclgdmx (zgcljlh,zgjlh,xjjlh,lx,cljg,clr,clsj,clsm)  ";
	ls_sql+=" values (?,?,?,?,?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,zgjlh);
	ps.setString(3,xjjlh);
	ps.setString(4,"����");
	ps.setString(5,"");
	ps.setString(6,jsr);
	ps.setString(7,jssm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update kp_zggdmx set clzt='2',zgcljlh=?,jsr=?,jssj=SYSDATE,jssm=?  ";//1:δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
	ls_sql+=" where zgjlh='"+zgjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,jsr);
	ps.setString(3,jssm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update kp_xjgdjl set wtclbz='C'";//B�������ģ�N������δ���գ�C���ڴ���Y���ѽ��
	ls_sql+=" where xjjlh='"+xjjlh+"' ";
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