<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
String dqbm=null;//����д����Ҫ�޸ĵĵ�������
String bjjbbm=null;//���ӱ��ۼ���A���м� B���и߼� C������ D����׼ E���߼�
dqbm=request.getParameter("bj_jzbjb_dqbm");
bjjbbm=request.getParameter("bjjbbm");

double xsjxbj=0;//��ֱ��ۻ�е����
double xsrgbj=0;//��ֱ����˹�����
double xsclbj=0;//��ֱ��۲��ϱ���
double xscfdzbj=0;//��ֱ����е��ܼ�
double xsdzbj=0;//���ӱ����еı���
double tzjxbj=0;//�������ֱ��ۻ�е����
double tzcfbj=0;//�������ֱ�������Ŀ���ۣ��ͻ�����=���ϱ��ۣ��˹����ۣ���е����

String dqmc=null;
String bjjbmc=null;
String xsfxmbh=null;
String xsxmbh=null;
//String xsdzbj=null;
int i=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


    //��ѯ��������
    ls_sql=" select dqmc ";
	ls_sql+=" from dm_dqbm ";
	ls_sql+=" where dqbm='"+dqbm+"'";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	if (rs1.next())
	{
		dqmc=rs1.getString("dqmc");
	}
	rs1.close();
	ps1.close();

	//��ѯ���ۼ�������
    ls_sql=" select bjjbmc ";
	ls_sql+=" from bdm_bjjbbm ";
	ls_sql+=" where bjjbbm='"+bjjbbm+"'";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	if (rs1.next())
	{
		bjjbmc=rs1.getString("bjjbmc");
	}
	rs1.close();
	ps1.close();


	conn.setAutoCommit(false);

	//�ڲ�ֱ���ͬһ����Ŀ������ҳ�������Ŀ��ţ�����Ŀ���
	String bjbbh=null;
	String dqbm=null;
	String bjjbbm=null;
	String fxmbh=null;
	String fxmmc=null;
	double clbj=0;
	double rgbj=0;
	double jxbj=0;
	double bj=0;
	ls_sql =" select bjbbh,dqbm,bjjbbm,xmbh,xmmc,clbj,rgbj,jxbj,bj";
	ls_sql+=" from bj_jzbjb";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' group by fxmbh ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xsfxmbh=rs.getString(1);
		xsxmbh=rs.getString(2);

		i++;
//      out.println(xsfxmbh);
//      out.println(xsxmbh);
		
		//��ѯ���ӱ��۱��еı���
		ls_sql=" select bj ";
		ls_sql+=" from bj_jzbjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xsfxmbh+"' ";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			xsdzbj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//��ѯ��ֱ��۱��еĻ�е���ۣ��˹����ۣ����ϱ���
	    ls_sql=" select jxbj,rgbj,clbj ";
		ls_sql+=" from bj_jzbjcfb   ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xsxmbh+"' ";
	//	out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			xsjxbj=rs1.getDouble("jxbj");
			xsrgbj=rs1.getDouble("rgbj");
			xsclbj=rs1.getDouble("clbj");
		}
		rs1.close();
		ps1.close();

		//��ѯ��ֱ��۱��еĸ���Ŀ��ŵ��ܼ۸�
		ls_sql=" select sum(jxbj+rgbj+clbj) ";
		ls_sql+=" from bj_jzbjcfb   ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and fxmbh='"+xsfxmbh+"' ";
	//	out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			xscfdzbj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
        
    	String s=cf.formatDouble(xsdzbj+xsjxbj-xscfdzbj);//������Ļ�е����=���ͻ����ۣ������е���ۣ�����3��ϼ�

        String y=cf.formatDouble(xsdzbj+xsjxbj-xscfdzbj+xsrgbj+xsclbj); //������Ŀͻ����ۣ��ͻ�����=���ϱ��ۣ��˹����ۣ���е����

//      tzjxbj=cf.formatDouble(s);
//		tzcfbj=cf.formatDouble(y);
//      tzjxbj=(xsdzbj+xsjxbj-xscfdzbj);//������Ļ�е����
//		tzcfbj=(xsdzbj+xsjxbj-xscfdzbj+xsrgbj+xsclbj); //������Ŀͻ����ۣ��ͻ�����=���ϱ��ۣ��˹����ۣ���е����
//      out.println(s);
//    	out.println(y);
//	    out.println(tzjxbj);
//      out.println(tzcfbj);

		//���²�ֵ��ӱ����л�е���ۺ�ͬһ����Ŀ?���е��ض���һ��??
		ls_sql=" update bj_jzbjcfb set jxbj="+s+",bj="+y+" ";
		ls_sql+=" where  dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xsxmbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		
		
		//���²�ֵ��ӱ�������Ŀ���ۣ��ͻ�����=���ϱ��ۣ��˹����ۣ���е���ۣ�
		ls_sql=" update bj_jzbjcfb set bj=(jxbj+clbj+rgbj) ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		out.print("<font color=blue>��ţ�["+i+"]������["+dqmc+"]���ۼ���["+bjjbmc+"]["+xsxmbh+"]&nbsp; ��ֵ��ӱ��۸��³ɹ���&nbsp;&nbsp;ԭ��е����="+xsjxbj+"&nbsp;&nbsp;�ֻ�е����="+s+"&nbsp;</font><br>");
	}
	rs.close();
	ps.close();


	out.print("<P>�������");

	conn.commit();
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
 

