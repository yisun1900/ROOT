<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String dwbh = request.getParameter("dwbh");


String[] xuhao =request.getParameterValues("xuhao");
String[] clbm =request.getParameterValues("clbm");
String[] xjgsxsjstr =request.getParameterValues("xjgsxsj");
String[] xcjstr =request.getParameterValues("xcj");
String[] xcjjsjstr =request.getParameterValues("xcjjsj");
String[] xfgsdjstr =request.getParameterValues("xfgsdj");
String[] xgdjstr =request.getParameterValues("xgdj");

String[] sfrk =request.getParameterValues("sfrk");
String[] ckmc =request.getParameterValues("ckmc");
String[] sfycx =request.getParameterValues("sfycx");
String[] cxkssjstr =request.getParameterValues("cxkssj");
String[] cxjzsjstr =request.getParameterValues("cxjzsj");
String[] cxcjstr =request.getParameterValues("cxcj");
String[] cxcjjsjstr =request.getParameterValues("cxcjjsj");

String[] cxfgsdjstr =request.getParameterValues("cxfgsdj");
String[] cxgdjstr =request.getParameterValues("cxgdj");

  
//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //�õ�����

	System.out.println("��ʼ���¸��ı��ۣ������ˣ�"+yhmc);


	conn.setAutoCommit(false);

	for (i=0;i<xuhao.length ;i++ )
	{
		java.sql.Date xjgsxsj=null;
		double xcj=0;
		double xcjjsj=0;
		double xfgsdj=0;
		double xgdj=0;

		java.sql.Date cxkssj=null;
		java.sql.Date cxjzsj =null;
		double cxcj=0;
		double cxcjjsj=0;
		double cxfgsdj=0;
		double cxgdj=0;

		//�¼۸���Чʱ��
		xjgsxsj=null;
		if (xjgsxsjstr[i]!=null && !xjgsxsjstr[i].equals(""))
		{
			xjgsxsj=java.sql.Date.valueOf(xjgsxsjstr[i]);
		}
		//�³���
		xcj=0;
		if (xcjstr[i]!=null && !xcjstr[i].equals(""))
		{
			xcj=Double.parseDouble(xcjstr[i]);
		}
		//���볧�ҽ����
		xcjjsj=0;
		if (xcjjsjstr[i]!=null && !xcjjsjstr[i].equals(""))
		{
			xcjjsj=Double.parseDouble(xcjjsjstr[i]);
		}
		//�·ֹ�˾���ϵ���
		xfgsdj=0;
		if (xfgsdjstr[i]!=null && !xfgsdjstr[i].equals(""))
		{
			xfgsdj=Double.parseDouble(xfgsdjstr[i]);
		}
		//�¹��Ӽ�
		xgdj=0;
		if (xgdjstr[i]!=null && !xgdjstr[i].equals(""))
		{
			xgdj=Double.parseDouble(xgdjstr[i]);
		}


		//������ʼʱ��
		cxkssj=null;
		if (cxkssjstr[i]!=null && !cxkssjstr[i].equals(""))
		{
			cxkssj=java.sql.Date.valueOf(cxkssjstr[i]);
		}
		//��������ʱ��
		cxjzsj=null;
		if (cxjzsjstr[i]!=null && !cxjzsjstr[i].equals(""))
		{
			cxjzsj=java.sql.Date.valueOf(cxjzsjstr[i]);
		}
		//�����ڳ���
		cxcj=0;
		if (cxcjstr[i]!=null && !cxcjstr[i].equals(""))
		{
			cxcj=Double.parseDouble(cxcjstr[i]);
		}
		//�������볧�ҽ����
		cxcjjsj=0;
		if (cxcjjsjstr[i]!=null && !cxcjjsjstr[i].equals(""))
		{
			cxcjjsj=Double.parseDouble(cxcjjsjstr[i]);
		}
		//�����ڷֹ�˾���ϵ���
		cxfgsdj=0;
		if (cxfgsdjstr[i]!=null && !cxfgsdjstr[i].equals(""))
		{
			cxfgsdj=Double.parseDouble(cxfgsdjstr[i]);
		}
		//�����ڹ��Ӽ�
		cxgdj=0;
		if (cxgdjstr[i]!=null && !cxgdjstr[i].equals(""))
		{
			cxgdj=Double.parseDouble(cxgdjstr[i]);
		}

		ls_sql=" update cl_jgmx set tzr='"+yhmc+"',tzsj=SYSDATE";
		ls_sql+=" ,xjgsxsj=?,xjgsfgx='1'";
		ls_sql+=" ,xcj=?,xcjjsj=?,xfgsdj=?,xgdj=?,sfrk=?,ckmc=?";
		ls_sql+=" ,xsfycx=?,xcxkssj=?,xcxjzsj=?,xcxcj=?,xcxcjjsj=?,xcxfgsdj=?,xcxgdj=?";
		ls_sql+=" where clbm='"+clbm[i]+"' and dwbh='"+dwbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,xjgsxsj);
		ps.setDouble(2,xcj);
		ps.setDouble(3,xcjjsj);
		ps.setDouble(4,xfgsdj);
		ps.setDouble(5,xgdj);
		ps.setString(6,sfrk[i]); 
		ps.setString(7,cf.GB2Uni(ckmc[i]));

		ps.setString(8,sfycx[i]);
		ps.setDate(9,cxkssj);
		ps.setDate(10,cxjzsj);
		ps.setDouble(11,cxcj);
		ps.setDouble(12,cxcjjsj);
		ps.setDouble(13,cxfgsdj);
		ps.setDouble(14,cxgdj);
		ps.executeUpdate();
		ps.close();


		if (i%200==0)
		{
			System.out.println(xuhao[i]);
		}
	}

	ls_sql=" update cl_jgmx set cj=xcj,cjjsj=xcjjsj,fgsdj=xfgsdj,gdj=xgdj,sfycx=xsfycx,cxkssj=xcxkssj,cxjzsj=xcxjzsj,cxcj=xcxcj,cxcjjsj=xcxcjjsj,cxfgsdj=xcxfgsdj,cxgdj=xcxgdj    ,xjgsfgx='2',xjgsxsj=null,xcj=null,xcjjsj=null,xfgsdj=null,xgdj=null,xsfycx=null,xcxkssj=null,xcxjzsj=null,xcxcj=null,xcxcjjsj=null,xcxfgsdj=null,xcxgdj=null";
	ls_sql+=" where dwbh='"+dwbh+"' and xjgsxsj<=SYSDATE";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	conn.commit();

	System.out.println("���¸��ı�����ɣ������ˣ�"+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[���¸��ı���]�ɹ���");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>������ţ�" + xuhao[i]);
	out.print("<P>����ʧ��,��������: " + e);
	out.print("<P>sql=" + ls_sql);
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
