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
String[] cqbm =request.getParameterValues("cqbm");
String[] xqbm =request.getParameterValues("xqbm");
String[] louhao =request.getParameterValues("louhao");
String[] fwdz =request.getParameterValues("fwdz");
String[] fwmjstr =request.getParameterValues("fwmj");

String[] xxlybm =request.getParameterValues("xxlybm");
String[] xxlysm =request.getParameterValues("xxlysm");
String[] sfxhf =request.getParameterValues("sfxhf");
String[] xchfsjstr =request.getParameterValues("xchfsj");
String[] jzbz =request.getParameterValues("jzbz");

String[] khjl =request.getParameterValues("khjl");
String[] sjs =request.getParameterValues("sjs");
String[] ywy =request.getParameterValues("ywy");
String[] ywyssxz =request.getParameterValues("ywyssxz");
String[] ywybm =request.getParameterValues("ywybm");

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


String[] bz =request.getParameterValues("bz");

int fwmj=0;
java.sql.Date xchfsj=null;
java.sql.Date yjzxsj=null;

java.sql.Date ctsj=null;
java.sql.Date jhctsj=null;

java.sql.Date cxgtsj=null;
java.sql.Date jhcxgtsj=null;

java.sql.Date csgtsj=null;
java.sql.Date jhcsgtsj=null;

java.sql.Date sczbjsj=null;
java.sql.Date jhzbjsj=null;

String ctbz=null;
String cxgtbz=null;
String csgtbz=null;
String sfzdzbj=null;

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //�õ�����

	String scbkhbh="";
	 
	conn.setAutoCommit(false);

	int i=0;
	for (i=0;i<khxm.length ;i++ )
	{
		int count=0;


		//���ɡ��ͻ���š�������������������������������������ʼ
		int xh=0;
		ls_sql="select NVL(max(TO_NUMBER(scbkhbh))+1,1)";
		ls_sql+=" from  crm_scbkhxx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xh=rs.getInt(1);
		}
		ps.close();
		rs.close();
		scbkhbh=cf.addZero(xh,7);

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
		if (xchfsjstr[i]==null || xchfsjstr[i].equals(""))
		{
			xchfsj=null;
		}
		else{
			try{
				xchfsj=java.sql.Date.valueOf(xchfsjstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>��š�"+drxh[i]+"�����󣡻ط����ڡ�"+xchfsjstr[i]+"�������������͸�ʽ��YYYY-MM-DD����");
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


		String zt="1";

		String sfxxq=null;//�Ƿ���С�� Y���ǣ�N����

		String dqbm=null;

		count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM yx_lsdcb ";
		ls_sql+=" where dqbm='"+dqbm+"' and xqmc='"+cf.GB2Uni(xqbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{   
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			sfxxq="Y";
		}
		else{
			sfxxq="N";
		}

		ls_sql="insert into crm_scbkhxx ( scbkhbh,khxm,lxfs,cqbm,xqbm,louhao,fwdz,fwmj,sfxhf,xchfsj ";
		ls_sql+=" ,ywy,ywybm,ywyssxz,ssfgs,yjzxsj,lrr,lrsj,lrbm,bz,zt,khzyxz,sfxxq) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,SYSDATE,?,?,?,?,? )";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,scbkhbh);
		ps.setString(2,cf.GB2Uni(khxm[i]));
		ps.setString(3,cf.GB2Uni(lxfs[i]));
		ps.setString(4,cqbm[i]);
		ps.setString(5,cf.GB2Uni(xqbm[i]));
		ps.setString(6,cf.GB2Uni(louhao[i]));
		ps.setString(7,cf.GB2Uni(fwdz[i]));
		ps.setInt(8,fwmj);
		ps.setString(9,sfxhf[i]);
		ps.setDate(10,xchfsj);

		ps.setString(11,cf.GB2Uni(ywy[i]));
		ps.setString(12,ywybm[i]);
		ps.setString(13,ywyssxz[i]);
		ps.setString(14,fgsbh[i]);
		ps.setDate(15,yjzxsj);
		ps.setString(16,yhmc);
		ps.setString(17,lrbm);
		ps.setString(18,cf.GB2Uni(bz[i]));
		ps.setString(19,zt);	
		ps.setString(20,cf.GB2Uni(khzyxz[i]));	
		ps.setString(21,sfxxq);	

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
