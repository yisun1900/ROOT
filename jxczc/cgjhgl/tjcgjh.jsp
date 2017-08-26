<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	String jhdzt=null;
	String ssfgs=null;
	ls_sql=" SELECT jhdzt,ssfgs ";
	ls_sql+=" FROM jxc_clcgjh ";
    ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jhdzt=cf.fillNull(rs.getString("jhdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	if (!jhdzt.equals("0"))//0��δ�ύ��1���ȴ���ˣ�2�������ɣ�3���ѷֽ�ɶ�����5�����ڰ�����⣻9���ƻ����
	{
		out.print("���󣡲ɹ��ƻ�["+cgjhph+"]���ύ��");
		return;
	}

	//��ѯ��������
	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


	//����Ƿ�¼��������
	int count=0;
	ls_sql=" select count(*)";
	ls_sql+=" from jxc_cgjhmx ";
	ls_sql+=" where cgjhph='"+cgjhph+"' ";
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
		out.print("<BR>�ύʧ�ܣ�����û��¼�����ݣ������ύ������");
		return;
	}

	//���¼����������Ƿ�����

	String clbm=null;
	count=0;
	ls_sql=" select clbm ";
	ls_sql+=" from jxc_cgjhmx ";
	ls_sql+=" where cgjhph='"+cgjhph+"' and jhcgsl<=0 ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		count++;
		clbm=rs.getString("clbm");
		out.print("<BR>�ύʧ�ܣ�����["+clbm+"]�ƻ��ɹ�����С���㣬�����ύ��");
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		return;
	}


	//����Ƿ���ϰ�װ���
	double jhcgsl =0;
	double bzgg =0;
	ls_sql=" select jhcgsl,bzgg,jxc_clbm.clbm clbm ";
	ls_sql+=" from jxc_cgjhmx,jxc_clbm ";
	ls_sql+=" where cgjhph='"+cgjhph+"' ";
	ls_sql+=" and jxc_clbm.clbm=jxc_cgjhmx.clbm ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=rs.getString("clbm");
		jhcgsl=rs.getDouble("jhcgsl");
		bzgg=rs.getDouble("bzgg");

		if (bzgg<1)
		{
//			out.print("<BR>�ύʧ�ܣ�����["+clbm+"]��װ���["+bzgg+"]������ڵ���1������ϵ����Ա�޸ģ�");
//			return;
		}

		if (bzgg!=0)
		{
			if (jhcgsl<bzgg)
			{
				out.print("<BR>�ύʧ�ܣ�����["+clbm+"]�ƻ��ɹ�����["+jhcgsl+"]�������ڰ�װ���["+bzgg+"]��");
				return;
			}
			else if (jhcgsl%bzgg!=0)//A%B==0
			{
				out.print("<BR>�ύʧ�ܣ�����["+clbm+"]�ƻ��ɹ�����["+jhcgsl+"]�����ǰ�װ���["+bzgg+"]����������");
				return;
			}
		}
	}
	rs.close();
	ps.close();


	//����ɹ��ƻ����ܼ۸�
	double jhsl=0;
	double jhje=0;
	ls_sql=" select sum(jhcgsl),sum(jhcgje) ";
	ls_sql+=" from jxc_cgjhmx ";
	ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		jhsl=rs.getDouble(1);
		jhje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//�޸Ĳɹ��ƻ���״̬
	ls_sql="update jxc_clcgjh set jhdzt='1',jhsl="+jhsl+",jhje="+jhje;
	ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�ύ�ɹ�����ȴ����");
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