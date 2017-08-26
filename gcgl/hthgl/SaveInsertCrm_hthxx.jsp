<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
int sqsl=0;
String hth=null;
String dwbh=null;
String sqr=null;
java.sql.Date sqsj=null;

ls=request.getParameter("sqsl");
try{
	if (!(ls.equals("")))  sqsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ����������]����ת����������:"+e);
	return;
}

dwbh=cf.GB2Uni(request.getParameter("dwbh"));
sqr=cf.GB2Uni(request.getParameter("sqr"));
ls=request.getParameter("sqsj");
try{
	if (!(ls.equals("")))  sqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}

if (sqsl>10)
{
	out.println("<BR>������һ���������10����ͬ��");
	return;
}
String hthqz=cf.GB2Uni(request.getParameter("hthqz"));
String zdhth=cf.GB2Uni(request.getParameter("hth"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		out.println("���󣡿ͻ���Ų�����");
		return;
	}

	String zxdm=null;
	ls_sql="select zxdm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zxdm=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (!dwbh.equals(zxdm))
	{
		out.println("���󣡿ͻ���Ų��Ǹõ�ͻ�:"+zxdm);
		return;
	}

	conn.setAutoCommit(false);

	if (!zdhth.equals(""))//ָ����ͬ��
	{
		String gethth="";
		ls_sql="select hth";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gethth=cf.fillNull(rs.getString("hth"));
		}
		rs.close();
		ps.close();

		if (!gethth.equals("") && !gethth.equals(zdhth))
		{
			conn.rollback();
			out.println("���󣡿ͻ�������к�ͬ��:"+gethth);
			return;
		}

		gethth="";
		ls_sql="select hth";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gethth=cf.fillNull(rs.getString("hth"));
		}
		rs.close();
		ps.close();

		if (!gethth.equals("") && !gethth.equals(zdhth))
		{
			conn.rollback();
			out.println("���󣡿ͻ�������к�ͬ��:"+gethth);
			return;
		}

		ls_sql="insert into crm_hthxx ( hth,dwbh,sqr,sqsj,khbh,sybz ) ";
		ls_sql+=" values ( ?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zdhth);
		ps.setString(2,dwbh);
		ps.setString(3,sqr);
		ps.setDate(4,sqsj);
		ps.setString(5,khbh);
		ps.setString(6,"N");
		ps.executeUpdate();
		ps.close();

		out.println("<BR>���ɺ�ͬ�ţ�"+zdhth);
	}
	else{
		count=0;
		String year=hthqz+cf.today("YY")+cf.today("MM");

		int hthqzl=year.length();

		ls_sql="select NVL(max(TO_NUMBER(substr(hth,"+(hthqzl+1)+",3))),0)";
		ls_sql+=" from  crm_hthxx";
		ls_sql+=" where substr(hth,1,"+hthqzl+")='"+year+"'";
		ls_sql+=" and length(hth)="+(hthqzl+3);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		count++;

		for (int i=0;i<sqsl ;i++ )
		{
			hth=year+cf.addZero(count+i,3);

			String gethth="";
			ls_sql="select hth";
			ls_sql+=" from  crm_zxkhxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				gethth=cf.fillNull(rs.getString("hth"));
			}
			rs.close();
			ps.close();

			if (!gethth.equals("") && !gethth.equals(hth))
			{
				conn.rollback();
				out.println("���󣡿ͻ�������к�ͬ��:"+gethth);
				return;
			}

			gethth="";
			ls_sql="select hth";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				gethth=cf.fillNull(rs.getString("hth"));
			}
			rs.close();
			ps.close();

			if (!gethth.equals("") && !gethth.equals(hth))
			{
				conn.rollback();
				out.println("���󣡿ͻ�������к�ͬ��:"+gethth);
				return;
			}

			ls_sql="insert into crm_hthxx ( hth,dwbh,sqr,sqsj,khbh,sybz ) ";
			ls_sql+=" values ( ?,?,?,?,?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hth);
			ps.setString(2,dwbh);
			ps.setString(3,sqr);
			ps.setDate(4,sqsj);
			ps.setString(5,khbh);
			ps.setString(6,"N");
			ps.executeUpdate();
			ps.close();

			out.println("<BR>���ɺ�ͬ�ţ�"+hth);
		}
	}

	conn.commit();

}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
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