<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String zjxxh=request.getParameter("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	String khbh=null;
	double zjxjme=10;
	double glfjmje=10;
	double sjjmje=10;

	double kqtk=10;
	ls_sql="select sfwc,khbh,zjxjme,glfjmje,sjjmje,kqtk";
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

		kqtk=rs.getDouble("kqtk");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}


	String fgsbh=null;
	String bjjb = null;
	ls_sql="select fgsbh,bjjb";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		bjjb=rs.getString("bjjb");
	}
	rs.close();
	ps.close();

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();


	double jxglfbfb=0;
	ls_sql="select jxglfbfb";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jxglfbfb=rs.getDouble("jxglfbfb");//����۹���Ѱٷֱ�
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_khzctcmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and cpbm is null ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("���������ײ��ж�ѡһ��Ŀ��δѡ���ͺ�");
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
	dzbj.Zjx zjx=new dzbj.Zjx();


	double zxcbj=zjx.getCbj(conn,khbh,zjxxh,"yz");//�ɱ��ۣ�������ɱ��ۣ�������ɱ�������������ѡ�˰��
	double zxgcjcbj=zjx.getGcjcbj(conn,khbh,zjxxh,"yz");//���̻������ۣ�������̻������ۣ�������̻������ۣ�����������ѡ�˰��

	double zxhtjz=zjx.getHtjz(conn,khbh,zjxxh,"yz");//��ͬ��ֵ�����̷ѣ�����ҵ�������ѣ��������м���������;�ֵ�����ʹ���ȯ
	double zxsgcbj=zjx.getSgcbj(conn,khbh,zjxxh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��
	double zxmle=cf.round(zxhtjz-zxsgcbj,2);//ë����=��ͬ��ֵ��ʩ���ɱ���
	double zxmll=cf.round(zxmle/zxhtjz*100,2);//ë���ʣ�ë����º�ͬ��ֵ
	
	double wjryjje=0;//δ����ҵ����Ŀ
	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_sfxmmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and sfjrqye='2'";
	//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wjryjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	double yjjzcs=0;//ҵ����ֵ����
	double mll=0;//��ͬë����
	ls_sql="SELECT yjjzcs,mll";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjjzcs=rs.getDouble(1);
		mll=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	double zxyjjz=cf.round((zxmle-wjryjje)*100/yjjzcs,2);//ҵ����ֵ=ë����º��㾻ֵ����

	String kzdzfs="";
	double zdmll=0;
	double zdzkl=0;
	ls_sql="SELECT kzdzfs,zkl,zdmll";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kzdzfs=cf.fillNull(rs.getString("kzdzfs"));
		zdzkl=rs.getDouble("zkl");//����ۿ�
		zdmll=rs.getDouble("zdmll");//ǩ�����ë����
	}
	rs.close();
	ps.close();



	double tcbzjg=0;
	double tcmjzjje=0;
	double tczcsjcj=0;
	double tczccljj=0;
	double tcxsfzc=0;
	double tczcjm=0;
	double tcdpsj=0;
	double tcdpdlsf=0;
	double tcxpx=0;
	double tcwzjzc=0;
	double tcqtsf=0;
	double zctcje=0;
	double wntcje=0;
	double jytcje=0;
	double sctcje=0;
	double jktcje=0;

	if (lx.equals("2"))//1�����ײͣ�2���ײ�
	{
		dzbj.Tc tc=new dzbj.Tc();

		tcbzjg=tc.getBzjgH(conn,zjxxh,khbh,"yz");//��ȡ:�ײͱ�׼�۸�
		tcmjzjje=tc.getMjzjjeH(conn,zjxxh,khbh,"yz");//��ȡ:������ӽ��

		tczcsjcj=tc.getZcsjcjH(conn,zjxxh,khbh,"yz");//��ȡ:�����������

		tczccljj=tc.getZccljjH(conn,zjxxh,khbh,"yz");//��ȡ:���ĳ����Ӽ�
		tcxsfzc=tc.getXsfzcH(conn,zjxxh,khbh,"yz");//��ȡ:���շ�����
		tczcjm=tc.getZcjmH(conn,zjxxh,khbh,"yz");//��ȡ:���ļ���
		tcdpsj=tc.getDpsjH(conn,zjxxh,khbh,"yz");//��ȡ:��������
		tcdpdlsf=tc.getDpdlsfH(conn,zjxxh,khbh,"yz");//��ȡ:��������շ�
		tcxpx=tc.getXpxH(conn,zjxxh,khbh,"yz");//��ȡ:ѡ����
		tcwzjzc=tc.getZjzcH(conn,zjxxh,khbh,"yz");//��ȡ:�ײ�����������
		tcqtsf=tc.getTcqtsfH(conn,zjxxh,khbh,"yz");//��ȡ:�ײͣ������շ�

		zctcje=tc.getZctcjeH(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��
		wntcje=tc.getWntcjeH(conn,zjxxh,khbh,"yz");//��ȡ:��ů�ײͽ��
		jytcje=tc.getJytcjeH(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��
		sctcje=tc.getSctcjeH(conn,zjxxh,khbh,"yz");//��ȡ:ɫ���ײͽ��
		jktcje=tc.getJktcjeH(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��

		ls_sql=" update crm_tckhqyeh set tcbzjg=?,tcmjzjje=?,tczcsjcj=?,tczccljj=?,tcxsfzc=?,tczcjm=?,tcdpsj=?,tcdpdlsf=?,tcxpx=?,tcwzjzc=?,tcqtsf=?,zctcje=?,wntcje=?,jytcje=?,sctcje=?,jktcje=?";
		ls_sql+=" where  zjxxh='"+zjxxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,tcbzjg);
		ps.setDouble(2,tcmjzjje);
		ps.setDouble(3,tczcsjcj);
		ps.setDouble(4,tczccljj);
		ps.setDouble(5,tcxsfzc);
		ps.setDouble(6,tczcjm);
		ps.setDouble(7,tcdpsj);
		ps.setDouble(8,tcdpdlsf);
		ps.setDouble(9,tcxpx);
		ps.setDouble(10,tcwzjzc);
		ps.setDouble(11,tcqtsf);
		ps.setDouble(12,zctcje);
		ps.setDouble(13,wntcje);
		ps.setDouble(14,jytcje);
		ps.setDouble(15,sctcje);
		ps.setDouble(16,jktcje);
		ps.executeUpdate();
		ps.close();

		ls_sql=" update crm_tckhqye set zctcjezjx=?,wntcjezjx=?,jytcjezjx=?,sctcjezjx=?,jktcjezjx=? ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,zctcje);
		ps.setDouble(2,wntcje);
		ps.setDouble(3,jytcje);
		ps.setDouble(4,sctcje);
		ps.setDouble(5,jktcje);
		ps.executeUpdate();
		ps.close();

		
		tcbzjg=tc.getBzjgZjx(conn,zjxxh,khbh,"yz");//��ȡ:�ײͱ�׼�۸�
		tcmjzjje=tc.getMjzjjeZjx(conn,zjxxh,khbh,"yz");//��ȡ:������ӽ��
		tczcsjcj=tc.getZcsjcjZjx(conn,zjxxh,khbh,"yz");//��ȡ:�����������
		tczccljj=tc.getZccljjZjx(conn,zjxxh,khbh,"yz");//��ȡ:���ĳ����Ӽ�
		tcxsfzc=tc.getXsfzcZjx(conn,zjxxh,khbh,"yz");//��ȡ:���շ�����
		tczcjm=tc.getZcjmZjx(conn,zjxxh,khbh,"yz");//��ȡ:���ļ���
		tcdpsj=tc.getDpsjZjx(conn,zjxxh,khbh,"yz");//��ȡ:��������
		tcdpdlsf=tc.getDpdlsfZjx(conn,zjxxh,khbh,"yz");//��ȡ:��������շ�
		tcxpx=tc.getXpxZjx(conn,zjxxh,khbh,"yz");//��ȡ:ѡ����
		tcwzjzc=tc.getZjzcZjx(conn,zjxxh,khbh,"yz");//��ȡ:�ײ�����������
		tcqtsf=tc.getTcqtsfZjx(conn,zjxxh,khbh,"yz");//��ȡ:�ײͣ������շ�
		zctcje=tc.getZctcjeZjx(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��
		wntcje=tc.getWntcjeZjx(conn,zjxxh,khbh,"yz");//��ȡ:��ů�ײͽ��

		jytcje=tc.getJytcjeZjx(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��
		sctcje=tc.getSctcjeZjx(conn,zjxxh,khbh,"yz");//��ȡ:ɫ���ײͽ��
		jktcje=tc.getJktcjeZjx(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��

		ls_sql=" insert into crm_zjxtckhqye (zjxxh,khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje)  ";
		ls_sql+=" values ( ?,?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setDouble(3,tcbzjg);
		ps.setDouble(4,tcmjzjje);
		ps.setDouble(5,tczcsjcj);
		ps.setDouble(6,tczccljj);
		ps.setDouble(7,tcxsfzc);
		ps.setDouble(8,tczcjm);
		ps.setDouble(9,tcdpsj);
		ps.setDouble(10,tcdpdlsf);
		ps.setDouble(11,tcxpx);
		ps.setDouble(12,0);
		ps.setDouble(13,0);
		ps.setDouble(14,tcwzjzc);
		ps.setDouble(15,0);
		ps.setDouble(16,tcqtsf);
		ps.setDouble(17,zctcje);
		ps.setDouble(18,wntcje);
		ps.setDouble(19,jytcje);
		ps.setDouble(20,sctcje);
		ps.setDouble(21,jktcje);
		ps.executeUpdate();
		ps.close();
	}



	if (lx.equals("2"))//1�����ײͣ�2���ײ�
	{
		//�������ײ����Ķ����ֽ�
		zjx.ZjxTcDdfj(conn,khbh,zjxxh,yhmc,lrbm,"yz");
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