<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long jsjlh=0;
String gys=null;
double fkbl=0;
double fkje=0;
String fkr=null;
java.sql.Date fksj=null;
java.sql.Date lrsj=null;
String lrr=null;
String ssfgs=null;
String bz=null;
ls=request.getParameter("jsjlh");
try{
	if (!(ls.equals("")))  jsjlh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jsjlh������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����¼��]����ת����������:"+e);
	return;
}
gys=cf.GB2Uni(request.getParameter("gys"));
ls=request.getParameter("fkbl");
try{
	if (!(ls.equals("")))  fkbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fkbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fkje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
fkr=cf.GB2Uni(request.getParameter("fkr"));
ls=request.getParameter("fksj");
try{
	if (!(ls.equals("")))  fksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fksj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String getshbz="";
	double jsje=0;
	ls_sql =" select shbz,jsje";
	ls_sql+=" from jc_gysjs";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getshbz=cf.fillNull(rs.getString("shbz"));
		jsje=rs.getDouble("jsje");
	}
	rs.close();
	ps.close();

	if (!getshbz.equals("Y") && !getshbz.equals("S"))//N��δ��ˣ�Y����ˣ�S�����ָ��F���������
	{
		conn.rollback();
		out.println("<BR>���󣬽��㵥δ��˻��Ѹ������");
		return;
	}

	//��Ӧ�̽��㸶���¼
	int fkxh=0;
	ls_sql =" select NVL(max(fkxh),0)";
	ls_sql+=" from jc_gysjsfkjl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	fkxh++;

	ls_sql="insert into jc_gysjsfkjl ( fkxh,jsjlh,gys,fkbl,fkje,fkr,fksj,lrsj,lrr,ssfgs,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,fkxh);
	ps.setLong(2,jsjlh);
	ps.setString(3,gys);
	ps.setDouble(4,fkbl);
	ps.setDouble(5,fkje);
	ps.setString(6,fkr);
	ps.setDate(7,fksj);
	ps.setDate(8,lrsj);
	ps.setString(9,lrr);
	ps.setString(10,ssfgs);
	ps.setString(11,bz);
	ps.executeUpdate();
	ps.close();

	double ljfkbl=0;
	double ljfkje=0;
	ls_sql =" select sum(fkbl) fkbl,sum(fkje) fkje";
	ls_sql+=" from jc_gysjsfkjl";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ljfkbl=rs.getDouble("fkbl");
		ljfkje=rs.getDouble("fkje");
	}
	rs.close();
	ps.close();

	if (jsje!=0)
	{
		ljfkbl=cf.round(ljfkje*100/jsje,2);
	}
	else{
		ljfkbl=0;
	}

	String shbz="";//N��δ��ˣ�Y����ˣ�S�����ָ��F���������
	String sfjs="";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�S�����ָ���
	if (ljfkbl==0)
	{
		shbz="Y";
		sfjs="M";
	}
	else if (ljfkbl==100)
	{
		shbz="F";
		sfjs="F";
	}
	else if (ljfkbl>100)
	{
		conn.rollback();
		out.println("<BR>�����ۼƸ����������100����"+ljfkbl+"��");
		return;
	}
	else{
		shbz="S";
		sfjs="S";
	}

	ls_sql="update jc_gysjs set fksj=?,fkr=?,fkbl=?,fkje=?,shbz=?";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,fksj);
	ps.setString(2,fkr);
	ps.setDouble(3,ljfkbl);
	ps.setDouble(4,ljfkje);
	ps.setString(5,shbz);
	ps.executeUpdate();
	ps.close();

	String ddbh=null;
	ls_sql =" select ddbh";
	ls_sql+=" from jc_gysjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		ddbh=cf.fillNull(rs1.getString("ddbh"));


		if (ddbh.length()==9)
		{
			String getsfjs="";
			String clzt=null;
			String khbh=null;
			ls_sql =" select sfjs,clzt,khbh";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getsfjs=cf.fillNull(rs.getString("sfjs"));
				clzt=rs.getString("clzt");
				khbh=rs.getString("khbh");
			}
			rs.close();
			ps.close();

			if (!getsfjs.equals("M") && !getsfjs.equals("S"))
			{
				conn.rollback();
				out.println("<BR>���󣬶�����"+ddbh+"��δ��˻��Ѹ���");
				return;
			}

			ls_sql="update jc_zcdd set sfjs='"+sfjs+"' ";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�S�����ָ���
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
		else{
			String getsfjs="";
			String clzt=null;
			String khbh=null;
			ls_sql =" select sfjs,clzt,khbh";
			ls_sql+=" from jc_zczjx";
			ls_sql+=" where zjxbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getsfjs=cf.fillNull(rs.getString("sfjs"));
				clzt=rs.getString("clzt");
				khbh=rs.getString("khbh");
			}
			rs.close();
			ps.close();

			if (!getsfjs.equals("M") && !getsfjs.equals("S"))
			{
				conn.rollback();
				out.println("<BR>���������"+ddbh+"��δ��˻��Ѹ���");
				return;
			}

			ls_sql="update jc_zczjx set sfjs='"+sfjs+"' ";
			ls_sql+=" where zjxbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
	rs1.close();
	ps1.close();
	
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
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>