<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] drxh =request.getParameterValues("row");
String[] khxm =request.getParameterValues("khxm");
String[] hth =request.getParameterValues("hth");
String[] lxfs =request.getParameterValues("lxfs");
String[] qtdh =request.getParameterValues("qtdh");
String[] fwdz =request.getParameterValues("fwdz");
String[] khjl =request.getParameterValues("khjl");
String[] sjs =request.getParameterValues("sjs");
String[] zjxm =request.getParameterValues("zjxm");
String[] sgd =request.getParameterValues("sgd");
String[] sgdxm =request.getParameterValues("sgdxm");
String[] sgbz =request.getParameterValues("sgbz");
String[] mgfrz =request.getParameterValues("mgfrz");
String[] nwgfrz =request.getParameterValues("nwgfrz");
String[] sdgfrz =request.getParameterValues("sdgfrz");
String[] yqgfrz =request.getParameterValues("yqgfrz");
String[] wdzgcestr =request.getParameterValues("wdzgce");
String[] qyestr =request.getParameterValues("qye");
String[] qyrqstr =request.getParameterValues("qyrq");
String[] kgrqstr =request.getParameterValues("kgrq");
String[] jgrqstr =request.getParameterValues("jgrq");
String[] xxlybm =request.getParameterValues("xxlybm");
String[] xxlysm =request.getParameterValues("xxlysm");
String[] dwbh =request.getParameterValues("dwbh");
String[] fgsbh =request.getParameterValues("fgsbh");
String[] gcjdbm =request.getParameterValues("gcjdbm");
String[] bz =request.getParameterValues("bz");


String[] khlxbm =request.getParameterValues("khlxbm");
String[] hxbm =request.getParameterValues("hxbm");
String[] ysbm =request.getParameterValues("ysbm");
String[] fwmjstr =request.getParameterValues("fwmj");
String[] sfyyh =request.getParameterValues("sfyyh");
String[] yhyy =request.getParameterValues("yhyy");

String[] sjkgrqstr =request.getParameterValues("sjkgrq");
String[] sjjgrqstr =request.getParameterValues("sjjgrq");
String[] bxjzsjstr =request.getParameterValues("bxjzsj");
String[] kbxbz =request.getParameterValues("kbxbz");

int fwmj=0;
java.sql.Date sjkgrq=null;
java.sql.Date sjjgrq=null;
java.sql.Date bxjzsj=null;


double wdzgce=0;
double qye=0;
java.sql.Date qyrq=null;
java.sql.Date kgrq=null;
java.sql.Date jgrq=null;

  
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
		ls_sql=" select count(*)" ;
		ls_sql+=" from crm_khxx " ;
		ls_sql+=" where  hth='"+hth[i]+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		if (count>0)
		{
			conn.rollback();
			out.println("��š�"+drxh[i]+"�����󣡺�ͬ�š�"+hth[i]+"���Ѵ���");
			return;
		}
		


		//���ɡ��ͻ���š�������������������������������������ʼ
		int xh=0;
		ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
		ls_sql+=" from  crm_zxkhxx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//��顺�ͻ���š���crm_khxx���Ƿ����
		while (true)
		{
			khbh=cf.addZero(xh,7);

			ls_sql="select count(*)";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
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
				xh++;
			}
			else{
				break;
			}
		}
		//���ɡ��ͻ���š��������������������������������������������

		//��顺����ԭ���ۡ��Ƿ���ȷ
		if (wdzgcestr[i]==null || wdzgcestr[i].equals(""))
		{
			wdzgce=0;
		}
		else{
			try{
				wdzgce=Double.parseDouble(wdzgcestr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"�����󣡹���ԭ���ۡ�"+wdzgcestr[i]+"�������������ͣ�");
				return;
			}
		}

		//��顺����ǩԼ��Ƿ���ȷ
		if (qyestr[i]==null || qyestr[i].equals(""))
		{
			qye=0;
		}
		else{
			try{
				qye=Double.parseDouble(qyestr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"�����󣡹���ǩԼ�"+qyestr[i]+"�������������ͣ�");
				return;
			}
		}

		//��顺ǩԼ���ڡ��Ƿ���ȷ
		if (qyrqstr[i]==null || qyrqstr[i].equals(""))
		{
			qyrq=null;
		}
		else{
			try{
				qyrq=java.sql.Date.valueOf(qyrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"������ǩԼ���ڡ�"+qyrqstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}
		//��顺��ͬ�������ڡ��Ƿ���ȷ
		if (kgrqstr[i]==null || kgrqstr[i].equals(""))
		{
			kgrq=null;
		}
		else{
			try{
				kgrq=java.sql.Date.valueOf(kgrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"�����󣡺�ͬ�������ڡ�"+kgrqstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}
		//��顺��ͬ�������ڡ��Ƿ���ȷ
		if (jgrqstr[i]==null || jgrqstr[i].equals(""))
		{
			jgrq=null;
		}
		else{
			try{
				jgrq=java.sql.Date.valueOf(jgrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"�����󣡺�ͬ�������ڡ�"+jgrqstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//��顺����������Ƿ���ȷ
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
				out.print("<BR>��š�"+drxh[i]+"�����󣡷��������"+fwmjstr[i]+"�������������ͣ�");
				return;
			}
		}

		//��顺ʵ�ʿ������ڡ��Ƿ���ȷ
		if (sjkgrqstr[i]==null || sjkgrqstr[i].equals(""))
		{
			sjkgrq=null;
		}
		else{
			try{
				sjkgrq=java.sql.Date.valueOf(sjkgrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"������ʵ�ʿ������ڡ�"+sjkgrqstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//��顺ʵ�ʿ������ڡ��Ƿ���ȷ
		if (sjjgrqstr[i]==null || sjjgrqstr[i].equals(""))
		{
			sjjgrq=null;
		}
		else{
			try{
				sjjgrq=java.sql.Date.valueOf(sjjgrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"������ʵ�ʿ������ڡ�"+sjjgrqstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}
		//��顺���޽�ֹʱ�䡻�Ƿ���ȷ
		if (bxjzsjstr[i]==null || bxjzsjstr[i].equals(""))
		{
			bxjzsj=null;
		}
		else{
			try{
				bxjzsj=java.sql.Date.valueOf(bxjzsjstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"�����󣡱��޽�ֹʱ�䡺"+bxjzsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}
			

		String zxjwbm=null;
		ls_sql="select zxjwbm";
		ls_sql+=" from  dm_zxjwbm";
		ls_sql+=" where  qd<"+qye+" and "+qye+"<=zd";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zxjwbm=rs.getString("zxjwbm");
		}
		rs.close();
		ps.close();

		//��ĿרԱ
		String xmzy=null;
		ls_sql="select xmzy";
		ls_sql+=" from  sq_xmzy";
		ls_sql+=" where dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xmzy=rs.getString("xmzy");
		}
		rs.close();
		ps.close();

		if (!xxlybm[i].equals(""))
		{
			ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
			ls_sql+=" values ( ?,?,'1')";//1��ǩԼ�ͻ���2����ѯ�ͻ�
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,xxlybm[i]);
			ps.executeUpdate();
			ps.close();
		}

		double zkl=10;
		if (wdzgce==0)
		{
			zkl=10;
		}
		else{
			zkl=qye*10/wdzgce;
		}
	
		ls_sql="insert into crm_khxx (khbh,khxm,hth,lxfs,qtdh,fwdz,khjl,sjs,zjxm,sgd ";
		ls_sql+=" ,mgfrz,nwgfrz,sdgfrz,yqgfrz,wdzgce,qye,qyrq,kgrq,jgrq,gcjdbm ";
		ls_sql+=" ,zxjwbm,xmzy,xxlysm,khlxbm,hxbm,ysbm,fwmj,sfyyh,yhyy,sjkgrq ";
		ls_sql+=" ,sjjgrq,bxjzsj,kbxbz,zkl,zjxzkl,dwbh,fgsbh,bz,lrr,lrsj,sgbz,sgdxm";
		ls_sql+=" ,suijin,suijinbfb,sjf,glf,guanlif,zjxje,zhzjxje,zjxsuijin,cdzwjmje,kglf";
		ls_sql+=" ,kqtk,sfke,cwsfke,zjxwcbz,khjsbz,sffj,sfyrz,pdclzt,jjwjbz,sjssjfjsbz";
		ls_sql+=" ,jlbz,dalqbz,gdjsjd,sjsjsbz,ywyjsbz,zjjsbz,sfxhf,ybjbz,hdbz,zt ";
		ls_sql+=" ,tsbz,bxbz,kpbz,hfdjbz,htshbz,zqsuijin,zqzjxsuijin,fjtcbz,sjhtsjf)";
		ls_sql+=" values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,? ";
		ls_sql+=" ,?,?,?,?,?,?,?,?,?,TRUNC(SYSDATE),?,? ";
		ls_sql+=" ,0,0,0,0,0,0,0,0,0,0";
		ls_sql+=" ,0,0,0,'1','Y','N','N','2','Y','2'";
		ls_sql+=" ,'0','1','1','2','2','1','N','N','1','2' ";
		ls_sql+=" ,'N','N','Y','0','Y',0,0,'M',0) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,cf.GB2Uni(khxm[i]));
		ps.setString(3,cf.GB2Uni(hth[i]));
		ps.setString(4,cf.GB2Uni(lxfs[i]));
		ps.setString(5,cf.GB2Uni(qtdh[i]));
		ps.setString(6,cf.GB2Uni(fwdz[i]));
		ps.setString(7,cf.GB2Uni(khjl[i]));
		ps.setString(8,cf.GB2Uni(sjs[i]));
		ps.setString(9,cf.GB2Uni(zjxm[i]));
		ps.setString(10,sgd[i]);

		ps.setString(11,cf.GB2Uni(mgfrz[i]));
		ps.setString(12,cf.GB2Uni(nwgfrz[i]));
		ps.setString(13,cf.GB2Uni(sdgfrz[i]));
		ps.setString(14,cf.GB2Uni(yqgfrz[i]));
		ps.setDouble(15,wdzgce);
		ps.setDouble(16,qye);
		ps.setDate(17,qyrq);
		ps.setDate(18,kgrq);
		ps.setDate(19,jgrq);
		ps.setString(20,gcjdbm[i]);
		
		ps.setString(21,zxjwbm);
		ps.setString(22,xmzy);
		ps.setString(23,cf.GB2Uni(xxlysm[i]));	
		ps.setString(24,khlxbm[i]);	
		ps.setString(25,hxbm[i]);	
		ps.setString(26,ysbm[i]);	
		ps.setInt(27,fwmj);	
		ps.setString(28,sfyyh[i]);	
		ps.setString(29,cf.GB2Uni(yhyy[i]));	
		ps.setDate(30,sjkgrq);	

		ps.setDate(31,sjjgrq);	
		ps.setDate(32,bxjzsj);	
		ps.setString(33,kbxbz[i]);	
		ps.setDouble(34,zkl);
		ps.setDouble(35,zkl);
		ps.setString(36,dwbh[i]);
		ps.setString(37,fgsbh[i]);
		ps.setString(38,cf.GB2Uni(bz[i]));
		ps.setString(39,yhmc);	
		ps.setString(40,cf.GB2Uni(sgbz[i]));	
		ps.setString(41,cf.GB2Uni(sgdxm[i]));	
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