<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="xym" scope="page" class="jxc.xym.Xym"/>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String[] cldlbm =request.getParameterValues("cldlbm");
String[] clxlbm =request.getParameterValues("clxlbm");
String[] nbbm =request.getParameterValues("nbbm");
String[] clmc =request.getParameterValues("clmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] bzjldwbm =request.getParameterValues("bzjldwbm");
String[] bzgg =request.getParameterValues("bzgg");
String[] djzl =request.getParameterValues("djzl");
String[] clcd =request.getParameterValues("clcd");
String[] clkd =request.getParameterValues("clkd");
String[] clgd =request.getParameterValues("clgd");
String[] cgzq =request.getParameterValues("cgzq");
String[] bzq =request.getParameterValues("bzq");
String[] bztxq =request.getParameterValues("bztxq");
String[] ppmc =request.getParameterValues("ppmc");
String[] cglb =request.getParameterValues("cglb");
String[] bz =request.getParameterValues("bz");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
try {
	conn=cf.getConnection();    //�õ�����


	//���ϵͳ��ʼ������
	String nbbmsfwy=null;
	sql=" select nbbmsfwy " ;
	sql+=" from jxc_xtcsh " ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		nbbmsfwy=cf.fillNull(rs.getString("nbbmsfwy"));
	}
	else
	{
		rs.close();
		ps.close();
		out.println("<BR>��������������û�ж�ϵͳ���г�ʼ�������ȳ�ʼ��ϵͳ��");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


	//���ɲ��ϱ���
	int count=0;
	sql="select NVL(max(SUBSTR(clbm,3,11)),0)";
	sql+=" from  jxc_clbm";
	sql+=" where cllb='1'";//0�����ģ�1������
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	for (int i=0;i<nbbm.length ;i++ )
	{
		//��ѯ�ڲ�����
		if (nbbmsfwy.equals("Y"))//Y��Ψһ��N����Ψһ��M��������
		{
			if (nbbm[i].equals(""))
			{
				out.println("<BR>��������[�ڲ�����]����Ϊ��");
				return;
			}

			sql=" select nbbm " ;
			sql+=" from jxc_clbm " ;
			sql+=" where nbbm='"+nbbm[i]+"' and cllb='1'" ;//0�����ģ�1������
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				out.println("<BR>����������[�ڲ�����"+nbbm[i]+"]�Ѿ�����");
				rs.close();
				ps.close();
				return;
			}
			rs.close();
			ps.close();
		}
		else if (nbbmsfwy.equals("N"))//Y��Ψһ��N����Ψһ��M��������
		{
			if (nbbm[i].equals(""))
			{
				out.println("<BR>��������[�ڲ�����]����Ϊ��");
				return;
			}
		}

		count++;
		String clbm="FC"+cf.addZero(count,11);

		String zp=clbm+".jpg";

		String cllb="1";//0�����ģ�1������
		String scsmc="1";

		sql ="insert into jxc_clbm (clbm,nbbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,xh,gg ";
		sql+=" ,jldwbm,bzjldwbm,bzgg,cglb,cgzq,djzl,bzq,bztxq,clcd,clkd   ,clgd,zp,lrr,lrsj,lrbm,bz)";
		sql+=" values('"+clbm+"','"+nbbm[i]+"','"+cf.GB2Uni(clmc[i])+"','"+cllb+"','"+cf.GB2Uni(cldlbm[i])+"','"+cf.GB2Uni(clxlbm[i])+"','"+scsmc+"','"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"'";
		sql+=" ,'"+cf.GB2Uni(jldwbm[i])+"','"+cf.GB2Uni(bzjldwbm[i])+"','"+bzgg[i]+"','"+cglb[i]+"','"+cgzq[i]+"','"+djzl[i]+"','"+bzq[i]+"','"+bztxq[i]+"','"+clcd[i]+"','"+clkd[i]+"'";
		sql+=" ,'"+clgd[i]+"','"+zp+"','"+yhmc+"',TRUNC(SYSDATE),'"+lrbm+"','"+cf.GB2Uni(bz[i])+"')";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("����ɹ�");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
