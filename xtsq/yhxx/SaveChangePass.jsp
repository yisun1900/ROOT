<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010204")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%

String yhdlm=request.getParameter("yhdlm");
String oldpass=request.getParameter("oldpass");
String newyhdlm=request.getParameter("newyhdlm");
String newpass=request.getParameter("newpass");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String yhkl="";
int mark=0;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*) from sq_bkymm where yhkl='"+newpass+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("����ʧ�ܣ����õ����롾"+newpass+"������̫�򵥣�ϵͳ����ʹ�ã�");
		return;
	}

	if (!newyhdlm.equals(yhdlm))
	{
		ls_sql="select count(*) from sq_yhxx where yhdlm='"+newyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("����ʧ�ܣ����û���½����"+newyhdlm+"���ѱ�ʹ�ã�");
			return;
		}


		ls_sql="select count(*) from jxc_ppgysdzb where yhdlm='"+newyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("����ʧ�ܣ����û���½����"+newyhdlm+"���ѱ�ʹ�ã�");
			return;
		}
	}

	//������븴�ӳ̶�
	int dxzmMark=0;
	int xxzmMark=0;
	int szMark=0;
	byte[] strInt=newpass.getBytes();
	for (int i=0;i<strInt.length ;i++ )
	{
		int asci=strInt[i];
		if (asci>=65 && asci<=90)
		{
			dxzmMark=1;//��д��ĸ
		}
		if (asci>=97 && asci<=122)
		{
			xxzmMark=1;//Сд��ĸ
		}
		if (asci>=48 && asci<=57)
		{
			szMark=1;//����
		}
	}

	if ((dxzmMark+xxzmMark+szMark)<2)
	{
		out.println("����ʧ�ܣ������롻�����ǡ����֡��͡���ĸ�����ʹ�ã�");
		return;
	}

	mark=0;
	ls_sql="select yhkl from sq_yhxx where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		yhkl=rs.getString("yhkl");
		mark=1;
	}
	rs.close();
	ps.close();

	if (mark==0)
	{
		ls_sql="select yhkl from jxc_ppgysdzb where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			yhkl=rs.getString("yhkl");
			mark=2;
		}
		rs.close();
		ps.close();
	}

	if (mark==0)
	{
		out.println("����ʧ�ܣ������ڵ��û���½����");
		return;
	}

	if (yhkl.equals("111111"))
	{
	}
	else{
		oldpass=cf.makejm(oldpass);
	}

	if (!yhkl.equals(oldpass))
	{
		out.println("����ʧ�ܣ��ɿ������벻��ȷ��");
		return;
	}

	newpass=cf.makejm(newpass);

	conn.setAutoCommit(false);

	if (mark==1)
	{
		ls_sql="update sq_yhxx set yhdlm='"+newyhdlm+"',yhkl='"+newpass+"',mmxgsj=SYSDATE where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jxc_ppgysdzb set yhdlm='"+newyhdlm+"',yhkl='"+newpass+"',mmxgsj=SYSDATE where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update sq_yhssz set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_yhewqx set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update xz_ggdx set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update xz_ggckjl set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_lzyhssz set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_lzyhewqx set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	session.setAttribute("yhdlm",null);

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸Ŀ���ɹ��������µ�½ϵͳ");
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