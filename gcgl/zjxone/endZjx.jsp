<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zjxwcbz=null;
	double yqgcze=0;//����ǰ���̷��ܶ�
	double yglf=0;//����ǰ������ܶ�
	double ysuijin=0;//����ǰ˰���ܶ�

	String sfwc="";
	String khbh=null;
	double zjxjme=10;
	double glfjmje=10;
	double sjjmje=10;
	double zjxzkl=10;
	double cxhdzjxzkl=10;
	double glfzkl=10;
	double cxhdglfzkl=10;
	ls_sql="select sfwc,khbh,zjxjme,glfjmje,sjjmje,zjxzkl,cxhdzjxzkl,glfzkl,cxhdglfzkl,yqgcze,yglf,ysuijin,zjxwcbz";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
		zjxjme=rs.getDouble("zjxjme");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		zjxzkl=rs.getDouble("zjxzkl");
		cxhdzjxzkl=rs.getDouble("cxhdzjxzkl");
		glfzkl=rs.getDouble("glfzkl");
		cxhdglfzkl=rs.getDouble("cxhdglfzkl");
		yqgcze=rs.getDouble("yqgcze");
		yglf=rs.getDouble("yglf");
		ysuijin=rs.getDouble("ysuijin");
		zjxwcbz=rs.getString("zjxwcbz");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}



	conn.setAutoCommit(false);

	ls_sql="update crm_zjxdj set sfwc='Y'";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	
	//��ȡ���¹����ܼۣ���������������������������������ʼ

	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateZjxSfxm(conn,khbh,zjxxh,"hmy");



	double gcze=dzbj.getZjxHBjje(conn,khbh,zjxxh,"hmy");//�������󡻵��ӱ��۽��
	double glfze=dzbj.getZjxHZqGlfJe(conn,khbh,zjxxh,"hmy");//����������ǰ������ѽ�
	double sjze=dzbj.getZjxHZhSuijinJe(conn,khbh,zjxxh,"hmy");//����������ǰ��˰���

	//��ȡ���ӱ��۽��
	double zjje=0;//��ǰ-���������
	double zqguanlif=0;//��ǰ-����������
	double zjxsuijin=0;//�ۺ�-������˰��

	double jzjje=0;//�ۺ�-���������
	double zhguanlif=0;//�ۺ�-����������

	zjje=gcze-yqgcze;//��ǰ-���������
	zqguanlif=glfze-yglf;//��ǰ-������˰��
	zjxsuijin=sjze-ysuijin-sjjmje;//��ǰ-����������

	jzjje=zjje*zjxzkl/10*cxhdzjxzkl/10-zjxjme;//�ۺ󹤳̷�
	zhguanlif=zqguanlif*glfzkl/10*cxhdglfzkl/10-glfjmje;//�ۺ�����


	//���������
	ls_sql="update crm_zjxdj set zjje=?,jzjje=?,zjxsuijin=?,zqguanlif=?,zhguanlif=?";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjje);
	ps.setDouble(2,jzjje);
	ps.setDouble(3,zjxsuijin);
	ps.setDouble(4,zqguanlif);
	ps.setDouble(5,zhguanlif);
	ps.executeUpdate();
	ps.close();


	//���������������Ϣ����������������������������������ʼ
	double allzjxje=0;
	double alljzjje=0;
	double allzjxsuijin=0;
	double allzqguanlif=0;
	double allzhguanlif=0;
	double allkglf=0;
	double allkqtk=0;

	ls_sql="select sum(zjje),sum(jzjje),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		alljzjje=rs.getDouble(2);
		allzjxsuijin=rs.getDouble(3);
		allzqguanlif=rs.getDouble(4);
		allzhguanlif=rs.getDouble(5);
		allkglf=rs.getDouble(6);
		allkqtk=rs.getDouble(7);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_khxx set zjxje=?,zhzjxje=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzjxsuijin);
	ps.setDouble(4,allzqguanlif);
	ps.setDouble(5,allzhguanlif);
	ps.setDouble(6,allkglf);
	ps.setDouble(7,allkqtk);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update cw_qmjzmx set zjxje=?,zhzjxje=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzjxsuijin);
	ps.setDouble(4,allzqguanlif);
	ps.setDouble(5,allzhguanlif);
	ps.setDouble(6,allkglf);
	ps.setDouble(7,allkqtk);
	ps.executeUpdate();
	ps.close();
	//���������������Ϣ�����������������������������������

	
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