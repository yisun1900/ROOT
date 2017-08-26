<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sgph=cf.GB2Uni(request.getParameter("sgph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String sgdzt=null;
	ls_sql=" SELECT sgdzt ";
	ls_sql+=" FROM jxc_clsgd ";
    ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdzt=cf.fillNull(rs.getString("sgdzt"));
	}
	rs.close();
	ps.close();

	if (!sgdzt.equals("0"))//0��δ�ύ��1�����ύ��2�����ͨ����5�����ֳ��⣻3���ѳ��⣻4�������
	{
		out.print("�����깺��["+sgph+"]���ύ");
		return;
	}

	//����Ƿ�¼��������
	int count=0;
	ls_sql=" select count(*)";
	ls_sql+=" from jxc_clsgmx ";
	ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count<=0)
	{
		out.print("����δ¼���깺��ϸ");
		return;
	}


	//����Ƿ���ϰ�װ���
	double sgsl=0;
	double bzgg=0;
	String clbm=null;
	ls_sql=" select jxc_clsgmx.clbm,jxc_clsgmx.sgsl,jxc_clbm.bzgg ";
	ls_sql+=" from jxc_clsgmx,jxc_clbm ";
	ls_sql+=" where sgph='"+sgph+"' ";
	ls_sql+=" and jxc_clbm.clbm=jxc_clsgmx.clbm ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=rs.getString("clbm");
		sgsl=rs.getDouble("sgsl");
		bzgg=rs.getDouble("bzgg");

		if (bzgg<1)
		{
			out.print("���󣡲���["+clbm+"]��װ���["+bzgg+"]������ڵ���1������ϵ����Ա�޸ģ�</font>");
			return;
		}
		if (sgsl<bzgg)
		{
			out.print("���󣡲���["+clbm+"]�깺����["+sgsl+"]�������ڰ�װ���["+bzgg+"]��");
			return;
		}
		else if (sgsl%bzgg!=0)
		{
			out.print("���󣡲���["+clbm+"]�깺����["+sgsl+"]�����ǰ�װ���["+bzgg+"]����������");
			return;
		}
		
	}
	rs.close();
	ps.close();


	double sgzsl=0;
	double sgzje=0;
	ls_sql=" SELECT sum(shsl),sum(shje)";
	ls_sql+=" FROM jxc_clsgmx ";
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgzsl=rs.getDouble(1);
		sgzje=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	//�޸�״̬
	ls_sql="update jxc_clsgd set sgdzt='1',sgzsl="+sgzsl+",sgzje="+sgzje;
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("�ύ�ɹ������ύ");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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