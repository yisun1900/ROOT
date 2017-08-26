<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010215")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%

String ygbh=request.getParameter("ygbh");
String kfgssq=request.getParameter("kfgssq");
String[] dwbh=request.getParameterValues("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	if (kfgssq.equals("3"))//3����Ȩ��������
	{
		if (dwbh.length>1)
		{
			out.println("������ѡ���ˡ���Ȩ�������桻����ʵ����Ȩ��["+dwbh.length+"]��");
			return;
		}

		String yhdwbh=null;
		String yhdwlx=null;
		String yhdwmc=null;
		ls_sql="select sq_yhxx.dwbh,sq_dwxx.dwlx,sq_dwxx.dwmc";
		ls_sql+=" from  sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhdwbh=rs.getString(1);
			yhdwlx=rs.getString(2);
			yhdwmc=rs.getString(3);
		}
		rs.close();
		ps.close();

		if (!dwbh[0].equals(yhdwbh) && yhdwlx.equals("F2"))
		{
			out.println("������ѡ���ˡ���Ȩ�������桻��ȷû��ѡ����û��������ţ�"+yhdwmc);
			return;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="delete from sq_sqfgs";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from sq_sqbm";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<dwbh.length ;i++ )
	{
		ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
		ls_sql+=" select dwbh,?,ssfgs";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ygbh);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update sq_yhxx set kfgssq='"+kfgssq+"'";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int fgssl=0;
	int dmsl=0;
	ls_sql="select count(distinct ssfgs),count(dwbh)";
	ls_sql+=" from  sq_sqbm";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgssl=rs.getInt(1);
		dmsl=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (kfgssq.equals("4") && fgssl>1)//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		conn.rollback();
		out.println("������ѡ���ˡ���Ȩĳһ�ֹ�˾������桻����ʵ����Ȩ��["+fgssl+"]���ֹ�˾�ĵ���");
		return;
	}
	else if (kfgssq.equals("4") && dmsl==1)
	{
		conn.rollback();
		out.println("������ѡ���ˡ���Ȩĳһ�ֹ�˾������桻����ʵ��ֻ��Ȩ��1������");
		return;
	}
	else if (kfgssq.equals("5") && fgssl==1)
	{
		conn.rollback();
		out.println("������ѡ���ˡ���Ȩ����ֹ�˾������桻����ʵ��ֻ��Ȩ��1���ֹ�˾�ĵ���");
		return;
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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>