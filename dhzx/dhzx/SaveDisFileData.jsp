<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String[] drxh =request.getParameterValues("row");
String[] khxm =request.getParameterValues("khxm");
String[] xb =request.getParameterValues("xb");
String[] lxfs =request.getParameterValues("lxfs");
String[] qtdh =request.getParameterValues("qtdh");
String[] cqbm =request.getParameterValues("cqbm");
String[] xqbm =request.getParameterValues("xqbm");
String[] louhao =request.getParameterValues("louhao");
String[] fwdz =request.getParameterValues("fwdz");
String[] fwmjstr =request.getParameterValues("fwmj");

String[] xxlybm =request.getParameterValues("xxlybm");
String[] xxlysm =request.getParameterValues("xxlysm");
String[] sfxhf =request.getParameterValues("sfxhf");
String[] hfrqstr =request.getParameterValues("hfrq");
String[] jzbz =request.getParameterValues("jzbz");

String[] khjl =request.getParameterValues("khjl");
String[] clgw =request.getParameterValues("clgw");
String[] sjs =request.getParameterValues("sjs");
String[] ywy =request.getParameterValues("ywy");

String[] zxdm =request.getParameterValues("zxdm");
String[] fgsbh =request.getParameterValues("fgsbh");

String[] yjzxsjstr =request.getParameterValues("yjzxsj");

String[] jhctsjstr =request.getParameterValues("jhctsj");
String[] ctsjstr =request.getParameterValues("ctsj");
String[] jhcxgtsjstr =request.getParameterValues("jhcxgtsj");
String[] cxgtsjstr =request.getParameterValues("cxgtsj");
String[] jhcsgtsjstr =request.getParameterValues("jhcsgtsj");
String[] csgtsjstr =request.getParameterValues("csgtsj");
String[] jhzbjsjstr =request.getParameterValues("jhzbjsj");
String[] sczbjsjstr =request.getParameterValues("sczbjsj");
String[] khzyxz =request.getParameterValues("khzyxz");

String[] hth =request.getParameterValues("hth");
String[] sjf =request.getParameterValues("sjf");
String[] jsjfsjstr =request.getParameterValues("jsjfsj");
String[] lfdj =request.getParameterValues("lfdj");
String[] jlfdjsjstr =request.getParameterValues("jlfdjsj");


String[] lrr =request.getParameterValues("lrr");
String[] lrsjstr =request.getParameterValues("lrsj");
String[] zxdjbm =request.getParameterValues("zxdjbm");

String[] bz =request.getParameterValues("bz");

int fwmj=0;
java.sql.Date hfrq=null;
java.sql.Date yjzxsj=null;
java.sql.Date lrsj=null;

java.sql.Date ctsj=null;
java.sql.Date jhctsj=null;

java.sql.Date cxgtsj=null;
java.sql.Date jhcxgtsj=null;

java.sql.Date csgtsj=null;
java.sql.Date jhcsgtsj=null;

java.sql.Date sczbjsj=null;
java.sql.Date jhzbjsj=null;

java.sql.Date jsjfsj=null;
java.sql.Date jlfdjsj=null;

String ctbz=null;
String cxgtbz=null;
String csgtbz=null;
String sfzdzbj=null;
String sjfbz=null;
String lfdjbz=null;


//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //�õ�����

	String khbh="";
	 
	conn.setAutoCommit(false);

	int i=0;
	for (i=0;i<khxm.length ;i++ )
	{
		int count=0;


		//���ɡ��ͻ���š�������������������������������������ʼ
		int xh=0;
		ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
		ls_sql+=" from  crm_zxkhxx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xh=rs.getInt(1);
		}
		ps.close();
		rs.close();
		khbh=cf.addZero(xh,7);

		//�ͻ����
		while (true)
		{
			khbh=cf.addZero(xh,7);

			ls_sql="select count(*)";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count>0)
			{
				xh++;
			}
			else{
				break;
			}
		}
		//���ɡ��ͻ���š��������������������������������������������

		//��顺���ڽ���������Ƿ���ȷ
		if (fwmjstr[i]==null || fwmjstr[i].equals(""))
		{
			fwmj=0;
		}
		else{
			try{
				fwmj=(int)Double.parseDouble(fwmjstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"���������ڽ��������"+fwmjstr[i]+"�������������ͣ�");
				return;
			}
		}

		//��顺�ط����ڡ��Ƿ���ȷ
		if (hfrqstr[i]==null || hfrqstr[i].equals(""))
		{
			hfrq=null;
		}
		else{
			try{
				hfrq=java.sql.Date.valueOf(hfrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"�����󣡻ط����ڡ�"+hfrqstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}
		//��顺Ԥ��װ��ʱ�䡻�Ƿ���ȷ
		if (yjzxsjstr[i]==null || yjzxsjstr[i].equals(""))
		{
			yjzxsj=null;
		}
		else{
			try{
				yjzxsj=java.sql.Date.valueOf(yjzxsjstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"������Ԥ��װ��ʱ�䡺"+yjzxsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[�ƻ���ƽ��ͼʱ��]�Ƿ���ȷ
		if (jhctsjstr[i]==null || jhctsjstr[i].equals(""))
		{
		}
		else{
			try{
				jhctsj=java.sql.Date.valueOf(jhctsjstr[i].trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+drxh[i]+"�����󣡼ƻ���ƽ��ͼʱ�䡺"+jhctsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[ʵ��ƽ��ͼʱ��]�Ƿ���ȷ
		if (ctsjstr[i]==null || ctsjstr[i].equals(""))
		{
			ctbz="N";
		}
		else{
			ctbz="Y";
			try{
				ctsj=java.sql.Date.valueOf(ctsjstr[i].trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+drxh[i]+"������ʵ��ƽ��ͼʱ�䡺"+ctsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[�ƻ���Ч��ͼʱ��]�Ƿ���ȷ
		if (jhcxgtsjstr[i]==null || jhcxgtsjstr[i].equals(""))
		{
		}
		else{
			try{
				jhcxgtsj=java.sql.Date.valueOf(jhcxgtsjstr[i].trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+drxh[i]+"�����󣡼ƻ���Ч��ͼʱ�䡺"+jhcxgtsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[ʵ��Ч��ͼʱ��]�Ƿ���ȷ
		if (cxgtsjstr[i]==null || cxgtsjstr[i].equals(""))
		{
			cxgtbz="N";
		}
		else{
			cxgtbz="Y";
			try{
				cxgtsj=java.sql.Date.valueOf(cxgtsjstr[i].trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+drxh[i]+"������ʵ��Ч��ͼʱ�䡺"+cxgtsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}
		//���[�ƻ���ʩ��ͼʱ��]�Ƿ���ȷ
		if (jhcsgtsjstr[i]==null || jhcsgtsjstr[i].equals(""))
		{
		}
		else{
			try{
				jhcsgtsj=java.sql.Date.valueOf(jhcsgtsjstr[i].trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+drxh[i]+"�����󣡼ƻ���ʩ��ͼʱ�䡺"+jhcsgtsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[ʵ��ʩ��ͼʱ��]�Ƿ���ȷ
		if (csgtsjstr[i]==null || csgtsjstr[i].equals(""))
		{
			csgtbz="N";
		}
		else{
			csgtbz="Y";
			try{
				csgtsj=java.sql.Date.valueOf(csgtsjstr[i].trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+drxh[i]+"������ʵ��ʩ��ͼʱ�䡺"+csgtsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}
		//���[�ƻ������ӱ���ʱ��]�Ƿ���ȷ
		if (jhzbjsjstr[i]==null || jhzbjsjstr[i].equals(""))
		{
		}
		else{
			try{
				jhzbjsj=java.sql.Date.valueOf(jhzbjsjstr[i].trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+drxh[i]+"�����󣡼ƻ������ӱ���ʱ�䡺"+jhzbjsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[ʵ�����ӱ���ʱ��]�Ƿ���ȷ
		if (sczbjsjstr[i]==null || sczbjsjstr[i].equals(""))
		{
			sfzdzbj="N";
		}
		else{
			sfzdzbj="Y";
			try{
				sczbjsj=java.sql.Date.valueOf(sczbjsjstr[i].trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+drxh[i]+"������ʵ�����ӱ���ʱ�䡺"+sczbjsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//��顺ʵ�ʽ���Ʒ�ʱ�䡻�Ƿ���ȷ
		if (jsjfsjstr[i]==null || jsjfsjstr[i].equals(""))
		{
			sjfbz="N";
		}
		else{
			sjfbz="Y";
			try{
				jsjfsj=java.sql.Date.valueOf(jsjfsjstr[i].trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+drxh[i]+"������¼��ʱ�䡺"+jsjfsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//��顺ʵ�ʽ�����ʱ�䡻�Ƿ���ȷ
		if (jlfdjsjstr[i]==null || jlfdjsjstr[i].equals(""))
		{
			lfdjbz="N";
		}
		else{
			lfdjbz="Y";
			try{
				jlfdjsj=java.sql.Date.valueOf(jlfdjsjstr[i].trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+drxh[i]+"������¼��ʱ�䡺"+jlfdjsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}


		//��顺¼��ʱ�䡻�Ƿ���ȷ
		if (lrsjstr[i]==null || lrsjstr[i].equals(""))
		{
			out.print("<BR>��š�"+drxh[i]+"�����󣡡�¼��ʱ�䡻����Ϊ�գ�");
			return;
		}
		else{
			try{
				lrsj=java.sql.Date.valueOf(lrsjstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"������¼��ʱ�䡺"+lrsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
		ls_sql+=" values ( ?,?,'2')";//1��ǩԼ�ͻ���2����ѯ�ͻ�
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,xxlybm[i]);
		ps.executeUpdate();
		ps.close();

		String zxzt=null;
		if (!zxdm[i].equals(""))
		{
			zxzt="1";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
		}
		else{
			zxzt="0";
		}


		ls_sql="insert into crm_zxkhxx ( khbh,khxm,xb,lxfs,qtdh,cqbm,xqbm,louhao,fwdz,fwmj ";
		ls_sql+=" ,xxlysm,sfxhf,hfrq,jzbz,khjl,clgw,sjs,ywy,zxdm,ssfgs,yjzxsj ";
		ls_sql+=" ,lrr,lrsj,zxdjbm,bz,zxzt,jhctsj,ctsj,jhcxgtsj,cxgtsj,jhcsgtsj ";
		ls_sql+=" ,csgtsj,jhzbjsj,sczbjsj,khzyxz,ctbz,cxgtbz,csgtbz,sfzdzbj,hth,sjf,jsjfsj,lfdj,jlfdjsj,sjfbz,lfdjbz  ";
		ls_sql+=" ,khlxbm,hdbz,lfbz,shbz,sjsjsbz,qsjhtbz,ysshbz,yzxxbz,xcjdbz ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ";
		ls_sql+=" ,'04','1','N','N','0','N','N','Y','1' )";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,cf.GB2Uni(khxm[i]));
		ps.setString(3,xb[i]);
		ps.setString(4,cf.GB2Uni(lxfs[i]));
		ps.setString(5,cf.GB2Uni(qtdh[i]));
		ps.setString(6,cqbm[i]);
		ps.setString(7,cf.GB2Uni(xqbm[i]));
		ps.setString(8,cf.GB2Uni(louhao[i]));
		ps.setString(9,cf.GB2Uni(fwdz[i]));
		ps.setInt(10,fwmj);

		ps.setString(11,cf.GB2Uni(xxlysm[i]));
		ps.setString(12,sfxhf[i]);
		ps.setDate(13,hfrq);
		ps.setString(14,jzbz[i]);
		ps.setString(15,cf.GB2Uni(khjl[i]));
		ps.setString(16,cf.GB2Uni(clgw[i]));
		ps.setString(17,cf.GB2Uni(sjs[i]));
		ps.setString(18,cf.GB2Uni(ywy[i]));
		ps.setString(19,zxdm[i]);
		ps.setString(20,fgsbh[i]);
		ps.setDate(21,yjzxsj);

		ps.setString(22,cf.GB2Uni(lrr[i]));
		ps.setDate(23,lrsj);
		ps.setString(24,zxdjbm[i]);
		ps.setString(25,cf.GB2Uni(bz[i]));
		ps.setString(26,zxzt);	
		ps.setDate(27,jhctsj);
		ps.setDate(28,ctsj);
		ps.setDate(29,jhcxgtsj);
		ps.setDate(30,cxgtsj);
		ps.setDate(31,jhcsgtsj);

		ps.setDate(32,csgtsj);
		ps.setDate(33,jhzbjsj);
		ps.setDate(34,sczbjsj);
		ps.setString(35,cf.GB2Uni(khzyxz[i]));	
		ps.setString(36,ctbz);	
		ps.setString(37,cxgtbz);	
		ps.setString(38,csgtbz);	
		ps.setString(39,sfzdzbj);	
        ps.setString(40,cf.GB2Uni(hth[i]));	
		ps.setString(41,cf.GB2Uni(sjf[i]));
		ps.setDate(42,jsjfsj);
		ps.setString(43,cf.GB2Uni(lfdj[i]));
		ps.setDate(44,jlfdjsj);
		ps.setString(45,sjfbz);	
		ps.setString(46,lfdjbz);	

		ps.executeUpdate();
		ps.close();
		
	}
		

	conn.commit();

	out.print("<BR>���ݵ���ɹ����������¼����"+i);

 }
 catch(Exception e){
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
