<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String dqbm = request.getParameter("dqbm");


String[] xuhao =request.getParameterValues("xuhao");
String[] cldlbm =request.getParameterValues("cldlbm");
String[] clxlbm =request.getParameterValues("clxlbm");
String[] scsmc =request.getParameterValues("scsmc");
String[] ppmc =request.getParameterValues("ppmc");
String[] gysmc =request.getParameterValues("gysmc");
String[] cllbbm =request.getParameterValues("cllbbm");

//String[] clbm =request.getParameterValues("clbm");

String[] clmc =request.getParameterValues("clmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] clysbm =request.getParameterValues("clysbm");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] lsjstr =request.getParameterValues("lsj");
String[] xsjstr =request.getParameterValues("xsj");
String[] zdxsjstr =request.getParameterValues("zdxsj");
String[] yjjrjstr =request.getParameterValues("yjjrj");

String[] jsfs =request.getParameterValues("jsfs");
String[] cbjstr =request.getParameterValues("cbj");
String[] jsblstr =request.getParameterValues("jsbl");
String[] cxhdblstr =request.getParameterValues("cxhdbl");
String[] sfycx =request.getParameterValues("sfycx");
String[] cxkssjstr =request.getParameterValues("cxkssj");
String[] cxjzsjstr =request.getParameterValues("cxjzsj");
String[] cxjstr =request.getParameterValues("cxj");
String[] cxjsblstr =request.getParameterValues("cxjsbl");
String[] cxcbjstr =request.getParameterValues("cxcbj");
String[] lscxhdblstr =request.getParameterValues("lscxhdbl");


String[] sfbhpj =request.getParameterValues("sfbhpj");
String[] pjtsstr =request.getParameterValues("pjts");
String[] sfyh =request.getParameterValues("sfyh");

String[] cpjb =request.getParameterValues("cpjb");
String[] fgsx =request.getParameterValues("fgsx");
String[] cpsm =request.getParameterValues("cpsm");
String[] cd =request.getParameterValues("cd");
String[] sftjcp =request.getParameterValues("sftjcp");
String[] zp =request.getParameterValues("zp");
String[] bz =request.getParameterValues("bz");
String[] xsfs =request.getParameterValues("xsfs");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //�õ�����

	System.out.println("��ʼ�������ı��ۣ������ˣ�"+yhmc);


	//���ɲ��ϱ���
	String clbm=null;
	int count=0;
	sql="select NVL(max(SUBSTR(clbm,4,11)),0)";
	sql+=" from  jxc_clbm";
	sql+=" where cllb='0'";//0�����ģ�1������
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (i=0;i<xuhao.length ;i++ )
	{
		double lsj=0;
		double xsj=0;
		double cbj=0;
		double jsbl=0;
		double cxhdbl=0;
		java.sql.Date cxkssj=null;
		java.sql.Date cxjzsj=null;
		double cxj=0;
		double cxcbj=0;
		double lscxhdbl=0;
		int pjts=0;

		double zdxsj=0;
		double yjjrj=0;
		double cxjsbl=0;
		//�г����
		lsj=0;
		if (lsjstr[i]!=null && !lsjstr[i].equals(""))
		{
			lsj=Double.parseDouble(lsjstr[i]);
		}
		//���ۼ�
		xsj=0;
		if (xsjstr[i]!=null && !xsjstr[i].equals(""))
		{
			xsj=Double.parseDouble(xsjstr[i]);
		}
		//��������޼�
		if (zdxsjstr[i]!=null && !zdxsjstr[i].equals(""))
		{
			zdxsj=Double.parseDouble(zdxsjstr[i]);
		}
		//ҵ�������
		if (yjjrjstr[i]!=null && !yjjrjstr[i].equals(""))
		{
			yjjrj=Double.parseDouble(yjjrjstr[i]);
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
		//�����ڽ������
		if (cxjsblstr[i]!=null && !cxjsblstr[i].equals(""))
		{
			cxjsbl=Double.parseDouble(cxjsblstr[i]);
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


		count++;

		clbm="ZC1"+cf.addZero(count,10);

		sql ="insert into jxc_clbm (cldlbm,clxlbm,ppmc,cllbbm,clbm,clmc";
		sql+=" ,xh,gg,clysbm,jldwbm,cllb";
		sql+=" ,sfbhpj,pjts,cpjb,fgsx";
		sql+=" ,cpsm,cd,scsmc,zp,lrr,lrsj,lrbm,bz)";
		sql+=" values('"+cf.GB2Uni(cldlbm[i])+"','"+cf.GB2Uni(clxlbm[i])+"','"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(cllbbm[i])+"','"+clbm+"','"+cf.GB2Uni(clmc[i])+"'";
		sql+=" ,'"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"','"+cf.GB2Uni(clysbm[i])+"','"+cf.GB2Uni(jldwbm[i])+"','0'";
		sql+=" ,'"+sfbhpj[i]+"',"+pjts+",'"+cf.GB2Uni(cpjb[i])+"','"+cf.GB2Uni(fgsx[i])+"'";
		sql+=" ,'"+cf.GB2Uni(cpsm[i])+"','"+cf.GB2Uni(cd[i])+"','"+cf.GB2Uni(scsmc[i])+"','"+cf.GB2Uni(zp[i])+"','"+yhmc+"',SYSDATE,'"+lrbm+"','"+cf.GB2Uni(bz[i])+"'";
		sql+="  )";
//		out.println(sql);
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();


		sql ="insert into jxc_cljgb (clbm,dqbm,gysmc,lsj,xsj,cbj,jsbl,cxhdbl";
		sql+=" ,sfycx,cxkssj,cxjzsj";
		sql+=" ,cxj,cxcbj,lscxhdbl,sfyh,sftjcp";
		sql+=" ,lrr,lrsj,lrbm,ssfgs,dfgsjg,dgzjg,zxqdl,xsfs,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl,zdkcsl,zdkcje,jsfs,zdxsj,yjjrj,cxjsbl)";
		sql+=" values('"+clbm+"','"+dqbm+"','"+cf.GB2Uni(gysmc[i])+"',"+lsj+","+xsj+","+cbj+","+jsbl+","+cxhdbl;
		sql+=" ,'"+sfycx[i]+"',TO_DATE('"+cxkssjstr[i]+"','YYYY-MM-DD')"+",TO_DATE('"+cxjzsjstr[i]+"','YYYY-MM-DD')";
		sql+=" ,"+cxj+","+cxcbj+","+lscxhdbl+",'"+sfyh[i]+"','"+sftjcp[i]+"'";
		sql+=" ,'"+yhmc+"',SYSDATE,'"+lrbm+"','"+ssfgs+"',0,0,0,'"+xsfs[i]+"',0,0,0,0,0,0,0,'"+jsfs[i]+"',"+zdxsj+","+yjjrj+","+cxjsbl+"";
		sql+="  )";
//		out.println(sql);
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();



		if (i%200==0)
		{
			System.out.println(xuhao[i]);
		}
	}
	
	conn.commit();

	System.out.println("�������ı�����ɣ������ˣ�"+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[�����µ����ı���]�ɹ���");
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
