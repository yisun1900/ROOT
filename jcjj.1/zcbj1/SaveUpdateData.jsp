<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm=cf.GB2Uni(request.getParameter("dqbm"));


String[] xuhao =request.getParameterValues("xuhao");
String[] zcdlbm =request.getParameterValues("zcdlbm");
String[] zcxlbm =request.getParameterValues("zcxlbm");
String[] dwbh =request.getParameterValues("dwbh");
String[] ppmc =request.getParameterValues("ppmc");
String[] gys =request.getParameterValues("gys");
String[] zclbbm =request.getParameterValues("zclbbm");

String[] zcbm =request.getParameterValues("zcbm");

String[] zcmc =request.getParameterValues("zcmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] zcysbm =request.getParameterValues("zcysbm");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] lsjstr =request.getParameterValues("lsj");
String[] yhjstr =request.getParameterValues("yhj");

String[] cbjstr =request.getParameterValues("cbj");
String[] jsblstr =request.getParameterValues("jsbl");
String[] cxhdblstr =request.getParameterValues("cxhdbl");
String[] sfycx =request.getParameterValues("sfycx");
String[] cxkssjstr =request.getParameterValues("cxkssj");
String[] cxjzsjstr =request.getParameterValues("cxjzsj");
String[] cxjstr =request.getParameterValues("cxj");
String[] cxcbjstr =request.getParameterValues("cxcbj");
String[] lscxhdblstr =request.getParameterValues("lscxhdbl");


String[] sfbhpj =request.getParameterValues("sfbhpj");
String[] pjtsstr =request.getParameterValues("pjts");
String[] sfyh =request.getParameterValues("sfyh");

String[] cpjb =request.getParameterValues("cpjb");
String[] fgsx =request.getParameterValues("fgsx");
String[] cpsm =request.getParameterValues("cpsm");
String[] cd =request.getParameterValues("cd");
String[] zp =request.getParameterValues("zp");
String[] bz =request.getParameterValues("bz");
  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //�õ�����

	System.out.println("��ʼ�޸����ı��ۣ������ˣ�"+yhmc);

	conn.setAutoCommit(false);

	for (i=0;i<xuhao.length ;i++ )
	{
		int count=0;
		double lsj=0;
		double yhj=0;
		double cbj=0;
		double jsbl=0;
		double cxhdbl=0;
		java.sql.Date cxkssj=null;
		java.sql.Date cxjzsj=null;
		double cxj=0;
		double cxcbj=0;
		double lscxhdbl=0;
		int pjts=0;

		//�г����
		lsj=0;
		if (lsjstr[i]!=null && !lsjstr[i].equals(""))
		{
			lsj=Double.parseDouble(lsjstr[i]);
		}
		//�����޼�
		yhj=0;
		if (yhjstr[i]!=null && !yhjstr[i].equals(""))
		{
			yhj=Double.parseDouble(yhjstr[i]);
		}
		//�����
		cbj=0;
		if (cbjstr[i]!=null && !cbjstr[i].equals(""))
		{
			cbj=Double.parseDouble(cbjstr[i]);
		}
		//�������
		jsbl=0;
		if (jsblstr[i]!=null && !jsblstr[i].equals(""))
		{
			jsbl=Double.parseDouble(jsblstr[i]);
		}
		//��������
		cxhdbl=0;
		if (cxhdblstr[i]!=null && !cxhdblstr[i].equals(""))
		{
			cxhdbl=Double.parseDouble(cxhdblstr[i]);
		}
		//������
		cxj=0;
		if (cxjstr[i]!=null && !cxjstr[i].equals(""))
		{
			cxj=Double.parseDouble(cxjstr[i]);
		}
		//���������
		cxcbj=0;
		if (cxcbjstr[i]!=null && !cxcbjstr[i].equals(""))
		{
			cxcbj=Double.parseDouble(cxcbjstr[i]);
		}
		//�����ڼ�������
		lscxhdbl=0;
		if (lscxhdblstr[i]!=null && !lscxhdblstr[i].equals(""))
		{
			lscxhdbl=Double.parseDouble(lscxhdblstr[i]);
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
		//�������
		pjts=0;
		if (pjtsstr[i]!=null && !pjtsstr[i].equals(""))
		{
			pjts=Integer.parseInt(pjtsstr[i]);
		}



		sql ="update jc_zcjgb set zcdlbm='"+cf.GB2Uni(zcdlbm[i])+"',zcxlbm='"+cf.GB2Uni(zcxlbm[i])+"',dwbh='"+cf.GB2Uni(dwbh[i])+"',zclbbm='"+cf.GB2Uni(zclbbm[i])+"',zcmc='"+cf.GB2Uni(zcmc[i])+"'";
		sql+=" ,xh='"+cf.GB2Uni(xh[i])+"',gg='"+cf.GB2Uni(gg[i])+"',zcysbm='"+cf.GB2Uni(zcysbm[i])+"',jldwbm='"+cf.GB2Uni(jldwbm[i])+"',lsj="+lsj+",yhj="+yhj;
		sql+=" ,cbj="+cbj+",jsbl="+jsbl+",cxhdbl="+cxhdbl+",sfycx='"+sfycx[i]+"',cxkssj=TO_DATE('"+cxkssjstr[i]+"','YYYY-MM-DD'),cxjzsj=TO_DATE('"+cxjzsjstr[i]+"','YYYY-MM-DD')";
		sql+=" ,cxj="+cxj+",cxcbj="+cxcbj+",lscxhdbl="+lscxhdbl+",sfbhpj='"+sfbhpj[i]+"',pjts="+pjts+",sfyh='"+sfyh[i]+"',cpjb='"+cf.GB2Uni(cpjb[i])+"',fgsx='"+cf.GB2Uni(fgsx[i])+"'";
		sql+=" ,cpsm='"+cf.GB2Uni(cpsm[i])+"',cd='"+cf.GB2Uni(cd[i])+"',gys='"+cf.GB2Uni(gys[i])+"',ppmc='"+cf.GB2Uni(ppmc[i])+"',zp='"+cf.GB2Uni(zp[i])+"',lrr='"+yhmc+"',lrsj=SYSDATE,bz='"+cf.GB2Uni(bz[i])+"'";
		sql+=" where zcbm='"+zcbm[i]+"' and dqbm='"+dqbm+"'";
//		out.println(sql);
		ps= conn.prepareStatement(sql);
		
		if (ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�");
			return;
		}

		ps.close();


		if (i%200==0)
		{
			System.out.println(xuhao[i]);
		}

	}
	
	conn.commit();

	System.out.println("�޸����ı�����ɣ������ˣ�"+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("���³ɹ�");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>������ţ�" + xuhao[i]);
	out.print("<P>����ʧ��,��������: " + e);
	out.print("<P>sql=" + sql);
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
