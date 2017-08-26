<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;
String shbz=cf.GB2Uni(request.getParameter("shbz"));
String zjxyysm=cf.GB2Uni(request.getParameter("zjxyysm"));
String shr=cf.GB2Uni(request.getParameter("shr"));
java.sql.Date shsj=null;
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����shsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	String getshbz="";
	String khbh=null;
	double zjxjme=10;
	double glfjmje=10;
	double sjjmje=10;

	double kqtk=10;
	ls_sql="select shbz,sfwc,khbh,zjxjme,glfjmje,sjjmje,kqtk";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getshbz=cf.fillNull(rs.getString("shbz"));
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
		zjxjme=rs.getDouble("zjxjme");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");

		kqtk=rs.getDouble("kqtk");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("N"))
	{
		out.println("���󣡵�����Ʒδ���");
		return;
	}
	if (!getshbz.equals("N"))//N��δ��ˣ�Y�����ͨ����S�����δͨ����M���������
	{
		out.println("���󣡲������");
		return;
	}

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

	String bjjb = null;
	ls_sql="select bjjb";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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



	conn.setAutoCommit(false);

	ls_sql="update crm_zjxdj set shbz=?,shr=?,shsj=?";//N��δ��ˣ�Y�����ͨ����S�����δͨ����M���������
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shbz);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.executeUpdate();
	ps.close();

	if (shbz.equals("Y"))//���ͨ����������Ϣ
	{
		//���µ�����Ʒ������Ϣ����������������������������������ʼ
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


		if (kzdzfs.equals("1"))//1������ë���ʣ�2�������ۿ�
		{
			if (zxmll<zdmll || zxmll>100)//����Ȩ��
			{
				conn.rollback();
				out.println("���󣡳����������ë����");
				return;
			}
		}


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
			
			ls_sql="select sum(tcbzjg),sum(tcmjzjje),sum(tczcsjcj),sum(tczccljj),sum(tcxsfzc),sum(tczcjm),sum(tcdpsj),sum(tcdpdlsf),sum(tcxpx)";
			ls_sql+=" ,sum(tcwsgzj),sum(tcwgccljj),sum(tcwzjzc),sum(tcsgze),sum(tcqtsf),sum(zctcje),sum(wntcje) ";
			ls_sql+=" from  crm_zjxtckhqye";
			ls_sql+=" where khbh='"+khbh+"'";
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
				zctcje=rs.getDouble(15);
				wntcje=rs.getDouble(16);
			}
			rs.close();
			ps.close();
			
			ls_sql=" update crm_tckhqye set tcbzjgzjx=?,tcmjzjjezjx=?,tczcsjcjzjx=?,tczccljjzjx=?,tcxsfzczjx=?,tczcjmzjx=?,tcdpsjzjx=?,tcdpdlsfzjx=?,tcxpxzjx=?,tcwsgzjzjx=?,tcwgccljjzjx=?,tcwzjzczjx=?,tcsgzezjx=?,tcqtsfzjx=?,zctcjezjx=?,wntcjezjx=? ";
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
			ps.setDouble(15,zctcje);
			ps.setDouble(16,wntcje);
			ps.executeUpdate();
			ps.close();

			//������Ʒ�ײ����Ķ����ֽ�
			zjx.ZjxTcDdfj(conn,khbh,zjxxh,yhmc,lrbm,"yz");
		}
		
		
		//���µ�����Ʒ������Ϣ�����������������������������������
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