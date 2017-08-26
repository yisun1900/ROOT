<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] xmbh=request.getParameterValues("xmbh");
String[] xmmc=request.getParameterValues("xmmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] slstr=request.getParameterValues("sl");
String[] djstr=request.getParameterValues("dj");
String[] qyestr=request.getParameterValues("qye");
String[] cbdjstr=request.getParameterValues("cbdj");
String[] cbjestr=request.getParameterValues("cbje");
String[] mllstr=request.getParameterValues("mll");
String[] mlestr=request.getParameterValues("mle");
String[] jsblxsstr=request.getParameterValues("jsblxs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="delete from cw_deyjsmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xmbh.length ;i++ )
	{
		double sl=0;
		double qye=0;
		double cbdj=0;

		double jsblxs=0;

		double nbjsdj=0;
		double nbjsje=0;
		double gsmll=0;
		double gsmlr=0;

		try{
			jsblxs=java.lang.Double.parseDouble(jsblxsstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���Ŀ���Ϊ["+xmbh[i]+"]��[�������ϵ��]���벻��ȷ:"+jsblxsstr[i].trim());
			return;
		}

		if (jsblxs<=0 || jsblxs>100)
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���Ŀ���Ϊ["+xmbh[i]+"]��[�������ϵ��]���벻��ȷ:"+jsblxsstr[i].trim()+"��Ӧ��0��100֮��");
			return;
		}

		sl=java.lang.Double.parseDouble(slstr[i].trim());
		qye=java.lang.Double.parseDouble(qyestr[i].trim());
		cbdj=java.lang.Double.parseDouble(cbdjstr[i].trim());

		if (sl>0)
		{
			nbjsdj=cbdj*(1+jsblxs/100);//�ɱ�����*(1+�������ϵ��)
			nbjsdj=cf.doubleTrim(nbjsdj);

			nbjsje=nbjsdj*sl;//�ڲ����㵥��*��������
			nbjsje=cf.doubleTrim(nbjsje);

			gsmll=(qye-nbjsje)/qye*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
			gsmll=cf.doubleTrim(gsmll);

			gsmlr=qye-nbjsje;//��˾ë����*���ⱨ�۽��
			gsmlr=cf.doubleTrim(gsmlr);
		}

		ls_sql="insert into cw_deyjsmx (khbh,xh,xmbh,xmmc,jldwbm,sl,dwbjdj,dwbjje,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr)";
		ls_sql+=" values('"+khbh+"',"+(i+1)+",'"+xmbh[i]+"','"+cf.GB2Uni(xmmc[i])+"','"+jldwbm[i]+"',"+slstr[i]+","+djstr[i]+","+qyestr[i]+","+cbdjstr[i]+","+cbjestr[i]+","+mllstr[i]+","+mlestr[i]+","+jsblxs+","+nbjsdj+","+nbjsje+","+gsmll+","+gsmlr+") ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
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
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>