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

	conn.setAutoCommit(false);

	ls_sql="update crm_zjxdj set sfwc='Y'";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	
	//��ȡ���¹����ܼۣ���������������������������������ʼ

	//��ʼ��
	dzbj.Zjx zjx=new dzbj.Zjx();
	//���±����ۿ�
	zjx.updateZjxBjZkl(conn,khbh,zjxxh,"yz");
	//���������շ���Ŀ�������շѰٷֱ�
	zjx.updateZjxSfxm(conn,khbh,zjxxh,"yz");


	double gczxzq=zjx.getZqGcZx(conn,khbh,zjxxh,"yz");//���������ǰ
	double gczxzh=zjx.getZhGcZx(conn,khbh,zjxxh,"yz");//��������ۺ�

	double gcjxzq=zjx.getZqGcJx(conn,khbh,zjxxh,"yz");//���̼����ǰ
	double gcjxzh=zjx.getZhGcJx(conn,khbh,zjxxh,"yz");//���̼���ۺ�


	double zjje=zjx.getZqZjxGcf(conn,khbh,zjxxh,"yz");//�������̷ѣ���ǰ
	double jzjje=zjx.getZhZjxGcf(conn,khbh,zjxxh,"yz");//�������̷ѣ��ۺ�



	double zqsdlzjx=zjx.getZqSdlZjx(conn,khbh,zjxxh,"yz");//ˮ��·�������ǰ
	double zhsdlzjx=zjx.getZhSdlZjx(conn,khbh,zjxxh,"yz");//ˮ��·������ۺ�





	double zqqtsf=0;//����ҵ�������ѣ���ǰ
	double zhqtsf=0;//����ҵ�������ѣ��ۺ�
	String qtsfsm=null;//����ҵ����������Ŀ
	double zqwjrqyexm=0;//������ҵ�������ѣ���ǰ
	double zhwjrqyexm=0;//������ҵ�������ѣ��ۺ�
	String wjrqyexmsm=null;//������ҵ����������Ŀ

	zqqtsf=zjx.getZjxZqJrQtsf(conn,khbh,zjxxh,"yz");//����ҵ�������ѣ���ǰ��������˰�𡢹���ѡ���Ʒ�
	zhqtsf=zjx.getZjxZhJrQtsf(conn,khbh,zjxxh,"yz");//����ҵ�������ѣ��ۺ󣬲�����˰�𡢹���ѡ���Ʒ�
	qtsfsm=zjx.getZjxJrQtsfsm(conn,khbh,zjxxh,"yz");//����ҵ����������Ŀ��������˰�𡢹���ѡ���Ʒ�

	zqwjrqyexm=zjx.getZjxZqWjrJe(conn,khbh,zjxxh,"yz");//������ҵ�������ѣ���ǰ��������˰�𡢹���ѡ���Ʒ�
	zhwjrqyexm=zjx.getZjxZhWjrJe(conn,khbh,zjxxh,"yz");//������ҵ�������ѣ��ۺ󣬲�����˰�𡢹���ѡ���Ʒ�
	wjrqyexmsm=zjx.getZjxWjrJeMc(conn,khbh,zjxxh,"yz");//������ҵ����������Ŀ��������˰�𡢹���ѡ���Ʒ�

	double zqsjf=zjx.getZqZJxSjf(conn,khbh,zjxxh,"yz");//��Ʒѣ���ǰ
	double zhsjf=zjx.getZhZJxSjf(conn,khbh,zjxxh,"yz");//��Ʒѣ��ۺ�

	double zqguanlif=zjx.getZjxZqGlf(conn,khbh,zjxxh,"yz");//��ǰ-����������
	double zhguanlif=zjx.getZjxZhGlf(conn,khbh,zjxxh,"yz");//�ۺ�-����������

	double zqzjxsuijin=zjx.getZjxZqSuijin(conn,khbh,zjxxh,"yz");//��ǰ-������˰��
	double zjxsuijin=zjx.getZjxZhSuijin(conn,khbh,zjxxh,"yz");  //�ۺ�-������˰��

	double kglf=zjx.getKglf(conn,khbh,zjxxh,"yz");//����۹����=��ǰ���̼���Ǿ����*����۹���Ѱٷֱȣ�sq_dwxx���ã�
	double zjxrzf=zjx.getZjxRzf(conn,khbh,zjxxh,"yz");//��������֤��=�ۺ󹤳̼���Ǿ����*��֤�Ѱٷֱȣ�ǩ���Ǽ�¼�룩
	double zjxdjjje=zjx.getZjxDjjje(conn,khbh,zjxxh,"yz");//�������������ȯ����ǰ������*����ȯ�ٷֱȣ�ǩ���Ǽ�¼�룩



	double zqzjze=0;//�����ܶ��ǰ
	double zhzjze=0;//�����ܶ�ۺ�
	zqzjze= zjje+zqguanlif+zqzjxsuijin+zqsjf+zqqtsf+zqwjrqyexm+zjxrzf+zjxdjjje+kglf+kqtk;
	zhzjze=jzjje+zhguanlif+zjxsuijin+zhsjf  +zhqtsf+zhwjrqyexm+zjxrzf+zjxdjjje+kglf+kqtk;

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



	//���������
	ls_sql="update crm_zjxdj set zjje=?,jzjje=?,zqguanlif=?,zhguanlif=?,zqzjxsuijin=?,zjxsuijin=?,shbz='M'";//N��δ��ˣ�Y����ˣ�M���������
	ls_sql+=" ,gczxzq=?,gcjxzq=?,gczxzh=?,gcjxzh=?,kglf=?,zjxrzf=?,zjxdjjje=?";
	ls_sql+=" ,zqzjze=?,zhzjze=?  ,zqqtsf=?,zhqtsf=?,qtsfsm=?  ,zqwjrqyexm=?,zhwjrqyexm=?,wjrqyexmsm=?,zqsjf=?,zhsjf=?";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjje);
	ps.setDouble(2,jzjje);
	ps.setDouble(3,zqguanlif);
	ps.setDouble(4,zhguanlif);
	ps.setDouble(5,zqzjxsuijin);
	ps.setDouble(6,zjxsuijin);

	ps.setDouble(7,gczxzq);
	ps.setDouble(8,gcjxzq);
	ps.setDouble(9,gczxzh);
	ps.setDouble(10,gcjxzh);

	ps.setDouble(11,kglf);
	ps.setDouble(12,zjxrzf);
	ps.setDouble(13,zjxdjjje);

	ps.setDouble(14,zqzjze);
	ps.setDouble(15,zhzjze);

	ps.setDouble(16,zqqtsf);
	ps.setDouble(17,zhqtsf);
	ps.setString(18,qtsfsm);

	ps.setDouble(19,zqwjrqyexm);
	ps.setDouble(20,zhwjrqyexm);
	ps.setString(21,wjrqyexmsm);

	ps.setDouble(22,zqsjf);
	ps.setDouble(23,zhsjf);

	ps.executeUpdate();
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
	double tcwsgzj=0;
	double tcwgccljj=0;
	double tcwzjzc=0;
	double tcsgze=0;
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
		tcwsgzj=tc.getSgzjH(conn,zjxxh,khbh,"yz");//��ȡ:�ײ���ʩ�������
		tcwgccljj=tc.getGccljjH(conn,zjxxh,khbh,"yz");//��ȡ:���̳����Ӽ�
		tcwzjzc=tc.getZjzcH(conn,zjxxh,khbh,"yz");//��ȡ:�ײ�����������
		tcsgze=tc.getSgzeH(conn,zjxxh,khbh,"yz");//��ȡ:ʩ���ܶ�
		tcqtsf=tc.getTcqtsfH(conn,zjxxh,khbh,"yz");//��ȡ:�ײͣ������շ�

		zctcje=tc.getZctcjeH(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��
		wntcje=tc.getWntcjeH(conn,zjxxh,khbh,"yz");//��ȡ:��ů�ײͽ��
		jytcje=tc.getJytcjeH(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��
		sctcje=tc.getSctcjeH(conn,zjxxh,khbh,"yz");//��ȡ:ɫ���ײͽ��
		jktcje=tc.getJktcjeH(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��

		ls_sql=" update crm_tckhqyeh set tcbzjg=?,tcmjzjje=?,tczcsjcj=?,tczccljj=?,tcxsfzc=?,tczcjm=?,tcdpsj=?,tcdpdlsf=?,tcxpx=?,tcwsgzj=?,tcwgccljj=?,tcwzjzc=?,tcsgze=?,tcqtsf=?,zctcje=?,wntcje=?,jytcje=?,sctcje=?,jktcje=?";
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
		ps.setDouble(10,tcwsgzj);
		ps.setDouble(11,tcwgccljj);
		ps.setDouble(12,tcwzjzc);
		ps.setDouble(13,tcsgze);
		ps.setDouble(14,tcqtsf);
		ps.setDouble(15,zctcje);
		ps.setDouble(16,wntcje);
		ps.setDouble(17,jytcje);
		ps.setDouble(18,sctcje);
		ps.setDouble(19,jktcje);
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
		tcwsgzj=tc.getSgzjZjx(conn,zjxxh,khbh,"yz");//��ȡ:�ײ���ʩ�������
		tcwgccljj=tc.getGccljjZjx(conn,zjxxh,khbh,"yz");//��ȡ:���̳����Ӽ�
		tcwzjzc=tc.getZjzcZjx(conn,zjxxh,khbh,"yz");//��ȡ:�ײ�����������
		tcsgze=tc.getSgzeZjx(conn,zjxxh,khbh,"yz");//��ȡ:ʩ���ܶ�
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
		ps.setDouble(12,tcwsgzj);
		ps.setDouble(13,tcwgccljj);
		ps.setDouble(14,tcwzjzc);
		ps.setDouble(15,tcsgze);
		ps.setDouble(16,tcqtsf);
		ps.setDouble(17,zctcje);
		ps.setDouble(18,wntcje);
		ps.setDouble(19,jytcje);
		ps.setDouble(20,sctcje);
		ps.setDouble(21,jktcje);
		ps.executeUpdate();
		ps.close();
	}


	//���������������Ϣ����������������������������������ʼ
	double allzjxje=0;
	double alljzjje=0;
	double allzqzjxsuijin=0;
	double allzjxsuijin=0;
	double allzqguanlif=0;
	double allzhguanlif=0;
	double allkglf=0;
	double allkqtk=0;
	double allzjxrzf=0;
	double allzjxdjjje=0;

	double zqljzjx=0;
	double zhljzjx=0;
	double zqqtsfzjx=0;
	double zhqtsfzjx=0;
	double zqwjrzjx=0;
	double zhwjrzjx=0;
	double zqsjfzjx=0;
	double zhsjfzjx=0;
	
	ls_sql="select sum(zjje),sum(jzjje),sum(zqzjxsuijin),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk),sum(zjxrzf)";
	ls_sql+=" ,sum(zqzjze),sum(zhzjze),sum(zqqtsf),sum(zhqtsf),sum(zqwjrqyexm),sum(zhwjrqyexm),sum(zqsjf),sum(zhsjf),sum(zjxdjjje)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfwc='Y'";//N��δ��ɣ�Y�������
	ls_sql+=" and (shbz='Y' OR shbz='M') ";//N��δ��ˣ�Y�����ͨ����S�����δͨ����M��������� 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		alljzjje=rs.getDouble(2);
		allzqzjxsuijin=rs.getDouble(3);
		allzjxsuijin=rs.getDouble(4);
		allzqguanlif=rs.getDouble(5);
		allzhguanlif=rs.getDouble(6);
		allkglf=rs.getDouble(7);
		allkqtk=rs.getDouble(8);
		allzjxrzf=rs.getDouble(9);

		zqljzjx=rs.getDouble(10);
		zhljzjx=rs.getDouble(11);
		zqqtsfzjx=rs.getDouble(12);
		zhqtsfzjx=rs.getDouble(13);
		zqwjrzjx=rs.getDouble(14);
		zhwjrzjx=rs.getDouble(15);
	
		zqsjfzjx=rs.getDouble(16);
		zhsjfzjx=rs.getDouble(17);
		allzjxdjjje=rs.getDouble(18);
	
	}
	rs.close();
	ps.close();


	ls_sql="update crm_khxx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" ,zqljzjx=?,zhljzjx=?,zqqtsfzjx=?,zhqtsfzjx=?,zqwjrzjx=?,zhwjrzjx=?,zqsjfzjx=?,zhsjfzjx=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzqzjxsuijin);
	ps.setDouble(4,allzjxsuijin);
	ps.setDouble(5,allzqguanlif);
	ps.setDouble(6,allzhguanlif);
	ps.setDouble(7,allkglf);
	ps.setDouble(8,allkqtk);

	ps.setDouble(9,zqljzjx);
	ps.setDouble(10,zhljzjx);
	ps.setDouble(11,zqqtsfzjx);
	ps.setDouble(12,zhqtsfzjx);
	ps.setDouble(13,zqwjrzjx);
	ps.setDouble(14,zhwjrzjx);
	ps.setDouble(15,zqsjfzjx);
	ps.setDouble(16,zhsjfzjx);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khqye set zjxrzf=?,zjxdjjje=?,zxcbj=?,zxgcjcbj=?,zxsgcbj=?,zxhtjz=?,zxmle=?,zxmll=?,zxyjjz=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxrzf);
	ps.setDouble(2,allzjxdjjje);
	ps.setDouble(3,zxcbj);
	ps.setDouble(4,zxgcjcbj);
	ps.setDouble(5,zxsgcbj);
	ps.setDouble(6,zxhtjz);
	ps.setDouble(7,zxmle);
	ps.setDouble(8,zxmll);
	ps.setDouble(9,zxyjjz);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update cw_qmjzmx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzqzjxsuijin);
	ps.setDouble(4,allzjxsuijin);
	ps.setDouble(5,allzqguanlif);
	ps.setDouble(6,allzhguanlif);
	ps.setDouble(7,allkglf);
	ps.setDouble(8,allkqtk);
	ps.executeUpdate();
	ps.close();


	if (lx.equals("2"))//1�����ײͣ�2���ײ�
	{
		tcbzjg=0;
		tcmjzjje=0;
		tczcsjcj=0;
		tczccljj=0;
		tcxsfzc=0;

		tczcjm=0;
		tcdpsj=0;
		tcdpdlsf=0;
		tcxpx=0;
		tcwsgzj=0;
		tcwgccljj=0;
		tcwzjzc=0;
		tcsgze=0;
		tcqtsf=0;
		
		ls_sql="select sum(tcbzjg),sum(tcmjzjje),sum(tczcsjcj),sum(tczccljj),sum(tcxsfzc),sum(tczcjm),sum(tcdpsj),sum(tcdpdlsf),sum(tcxpx)";
		ls_sql+=" ,sum(tcwsgzj),sum(tcwgccljj),sum(tcwzjzc),sum(tcsgze),sum(tcqtsf) ";
		ls_sql+=" from  crm_zjxtckhqye,crm_zjxdj";
		ls_sql+=" where crm_zjxtckhqye.zjxxh=crm_zjxdj.zjxxh and crm_zjxtckhqye.khbh='"+khbh+"'";
		ls_sql+=" and crm_zjxdj.sfwc='Y'";//N��δ��ɣ�Y�������
		ls_sql+=" and (crm_zjxdj.shbz='Y' OR crm_zjxdj.shbz='M') ";//N��δ��ˣ�Y�����ͨ����S�����δͨ����M��������� 
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tcbzjg=rs.getDouble(1);
			tcmjzjje=rs.getDouble(2);
			tczcsjcj=rs.getDouble(3);
			tczccljj=rs.getDouble(4);
			tcxsfzc=rs.getDouble(5);
			tczcjm=rs.getDouble(6);
			tcdpsj=rs.getDouble(7);
			tcdpdlsf=rs.getDouble(8);
			tcxpx=rs.getDouble(9);

			tcwsgzj=rs.getDouble(10);
			tcwgccljj=rs.getDouble(11);
			tcwzjzc=rs.getDouble(12);
			tcsgze=rs.getDouble(13);
			tcqtsf=rs.getDouble(14);
		}
		rs.close();
		ps.close();
		
		ls_sql=" update crm_tckhqye set tcbzjgzjx=?,tcmjzjjezjx=?,tczcsjcjzjx=?,tczccljjzjx=?,tcxsfzczjx=?,tczcjmzjx=?,tcdpsjzjx=?,tcdpdlsfzjx=?,tcxpxzjx=?,tcwsgzjzjx=?,tcwgccljjzjx=?,tcwzjzczjx=?,tcsgzezjx=?,tcqtsfzjx=?";
		ls_sql+=" where khbh='"+khbh+"'";
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
		ps.setDouble(10,tcwsgzj);
		ps.setDouble(11,tcwgccljj);
		ps.setDouble(12,tcwzjzc);
		ps.setDouble(13,tcsgze);
		ps.setDouble(14,tcqtsf);
		ps.executeUpdate();
		ps.close();

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