<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpjlh=request.getParameter("kpjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();
	
	//��ʼ��
	dzpd.Dzpd dzpd=new dzpd.Dzpd();

	//���㣺�ɵ�������ʩ���ӵ���÷�(�����kp_pdkpdxdf)���������Զ�����ָ�ꡢ�˹�����ָ��
	// ϵͳ���飺ÿ��ʩ�����Ƿ����˹������÷֣���û��ϵͳ����ע�⣺����˾��ͬ
	dzpd.getyZKpdxdf(conn,kpjlh);

//���㣺ʩ���ӵ÷֡���������ֱ���Ӻ�ֱ���ӷֱ�����(kp_pdkpmx),��������������ʣ��󵥶����ʣ���е������ʣ��С���
	dzpd.getyZKppm(conn,kpjlh);

	//����:ʩ���Ӽ��𡢽ӵ�Ȩ�ء���С�����������ӵ���(kp_pdkpmx)��������*�������ӵ���ۼ��������䵥��
	//�ӵ�Ȩ�أ����ݡ�ʩ���Ӽ��𡿴ӡ��ɵ�������¼��kp_pdkpjl������ȡ�ã��ò������˹�����
	//��С�����������ݡ�ʩ���Ӽ��𡿴ӡ��ɵ�������¼��kp_pdkpjl������ȡ�ã��ò������˹�����

	dzpd.getyZPj(conn,kpjlh);

	
	//����ʵ��ǩԼ��
	//���ڴ�ǩԼ��
	//�����е�ǩԼ��
	//����С��ǩԼ��
	//����ʵ�ʴ󵥱���
	//����ʵ���е�����
	//����ʵ��С������

	//��ֱ�����ɴ󵥶�
	//��ֱ�������е���
	//��ֱ������С����

	//ֱ�����ɴ󵥶�
	//ֱ�������е���
	//ֱ������С����
	
	//��ֱ���ӿ��ɵ���=��ֱ�����ɵ���
	//ֱ���ӿ��ɵ���=ֱ�����ɵ���

	//����ʣ��󵥶����ʣ���е������ʣ��С��������ɵ������ܶ�����ɵ������󵥶�����ɵ������е�������ɵ�����С����
	
	dzpd.getyZJcsj(conn,kpjlh);


	/*����:�����ܷ֡�ÿ�ֽӵ�����۽ӵ���(kp_pdkpmx)
	���㣺�����ܷ֡�ÿ�ֽӵ���
		ĳʩ���ӿ����ܷ֣�A����ʩ���ӿ����÷֡���ʩ����Ȩ�ء���ʩ���Ӱ�����
		ʩ���ӿ����ܷ�֮�ͣ�B�����ƣ���ʩ���ӿ����ܷ֣�A����
		ÿ�ֽӵ��D�������ڿ��ɵ��ܶC����ʩ���ӿ����ܷ�֮�ͣ�B��
	���㣺���۽ӵ���
		ʩ�������۽ӵ��ܶE����ÿ�ֽӵ��D����ʩ���ӿ����ܷ֣�A��
	*/

	dzpd.getyZKpzf(conn,kpjlh);

	/*
	����:�ӵ��ܶʣ��ĵ�����������������ǰ��ʩ���ӣ�����������һ��ʩ���ӿ��ܽӵ���󵥶�����������һ��

	��������������۽ӵ��ܶ�>�ۼ������ӵ�����۽ӵ��ܶ�<=�ۼ������ӵ��ֱ���Ӻͷ�ֱ���ӷֱ����
	1�����ȼ��㣺���۽ӵ��ܶ�>�ۼ������ӵ�������
			  �ӵ��ܶ�ۼ������ӵ��ͬʱ���ܣ������۽ӵ��ܶ�>�ۼ������ӵ���������ġ�ʣ�൥�
	2�����㣺���۽ӵ��ܶ�<���ۼ������ӵ��������������������ӵ���������Ҫ�ѡ���1�ࡿ��ʣ�൥���з��䣬��������������ǰ��ʩ����
			  �ӵ��ܶ���۽ӵ��ܶʣ��ĵ�������ܳ������ۼ������ӵ��
	*/
	dzpd.getyZJdze(conn,kpjlh);



	//���㣺ʩ�������۴󵥽������е�������С�������۽Ӵ󵥶�=�ӵ��ܶ�(jdze)*�󵥱���(ddbl)



	//���㣺�󵥽��е���С�����
	//��������㲻��A���ӣ�����B���ӣ���������������ǰ��ʩ����
	//������㣬�󵥽��=���۴󵥽�ʣ�����B����
	//��ʣ����δ�����������������ǰ��ʩ���ӣ�����������һ��ʩ���ӿ��ܽӵĶ��Ǵ󵥣������������һ��
	
	//�����е�ʱ�����㣺�ɽ��е���
	//if ��Ƿ�󵥣���                                         then �ɽ��е���=���۽��е��Ƿ�󵥶���۽Ӵ󵥶�󵥽�
	//if ���󵥷������  and  �󵥽����۽��е��� >  �ӵ��ܶ then �ɽ��е���=�ӵ��ܶ�󵥽��
	//if ���󵥷������  and  �󵥽����۽��е��� <= �ӵ��ܶ then �ɽ��е���=���۽��е���
	dzpd.getyZDzxde(conn,kpjlh);


	//���ڽӵ��ܶ���ڴ󵥶�����е������С������ڽӵ��ܶ�=�ɽӵ��ܶ�+����ʣ�൥�ܶ�+�����ɵ������ܶ�
	ls_sql=" update kp_pdkpmx set bqjdze=jdze+sqsydze+sqpdbcze,bqdde=ddje+sqsydde+sqpdbcdde,bqzde=zdje+sqsyzde+sqpdbczde,bqxde=xdje+sqsyxde+sqpdbcxde";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ʣ�൥�ܶʣ��󵥽�ʣ���е���ʣ��С�����
	ls_sql=" update kp_pdkpmx set sydze=bqjdze,syddje=bqdde,syzdje=bqzde,syxdje=bqxde";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	

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
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL: " + ls_sql);
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