<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>


<%
String yhjs=(String)session.getAttribute("yhjs");

ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String lrfgs=request.getParameter("fgs");
String lrdwbh=request.getParameter("dwbh");


		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


String dwmc=null;
String dwbh=null;
String sjs=null;

try {
	conn=cf.getConnection();

%>
<CENTER >
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>


<CENTER >
  <B>���ʦ�ֵ�����</B> 
</CENTER>

  <table border="1" width="160%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>

<%
if (yhjs.equals("A0"))
{
	%>
    <tr align="center">
      <td width="4%">���</td>
      <td width="10%">����</td>
      <td width="6%">���ʦ</td>
      <td width="6%">����ʵ����Ʒ�</td>
      <td width="8%">�����ۼ�ǩԼ��</td>
      <td width="6%">�����ɵ�-�ڷ�����</td>
      <td width="6%">�����ɵ�-�߶˿ͻ�</td>
      <td width="6%">�����ɵ���</td>
      <td width="6%">�����ɵ�-�ֵ���</td>
      <td width="6%">�����ɵ�-��Ч����</td>
      <td width="6%">�����ɵ�-��������</td>
      <td width="6%">�����ɵ�-����Ʒѵ���</td>
      <td width="6%">�ۼ�-������������</td>
      <td width="6%">�ۼ�-��ɷ�������</td>
      <td width="6%">�����ɵ�-ǩ������</td>
      <td width="6%">�����ɵ�-ǩ��ʧ�ܵ���</td>
    </tr>
	<%
}
else{
	%>
    <tr align="center">
      <td width="4%">���</td>
      <td width="10%">����</td>
      <td width="6%">�������ʦ</td>
      <td width="6%">��Ʒ�</td>
      <td width="8%">���̺�ͬ���</td>
      <td width="6%">�ڷ�����</td>
      <td width="6%">�߶˿ͻ�</td>
      <td width="6%">�ɵ���</td>
      <td width="6%">�ֵ���</td>
      <td width="6%">��Ч����</td>
      <td width="6%">��������</td>
      <td width="6%">����Ʒѵ���</td>
      <td width="6%">������������</td>
      <td width="6%">��ɷ�������</td>
      <td width="6%">ǩ������</td>
      <td width="6%">ǩ��ʧ�ܵ���</td>
    </tr>
	<%

	
	}

	int allsjf=0;
	int allqye=0;
	int allqfdl=0;
	int allgdkhs=0;
	int allpdl=0;
	int allcdl=0;
	int allwxdl=0;
	int alllfdl=0;
	int allsjfdl=0;
	int allzfasl=0;
	int allwcfasl=0;
	int allqys=0;
	int allqdsbsl=0;

	int row=0;
	ls_sql=" SELECT dwmc,sq_yhxx.dwbh,yhmc";
	ls_sql+=" FROM sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh(+) and sq_yhxx.sfzszg in('N','Y')  and zwbm='04'";
	if (!lrfgs.equals(""))
	{
		ls_sql+=" and  sq_yhxx.ssfgs ='"+lrfgs+"'";
	}
	if (!lrdwbh.equals(""))
	{
		ls_sql+=" and  sq_yhxx.dwbh ='"+lrdwbh+"'";
	}
	ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,sq_yhxx.yhmc";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwmc=rs.getString("dwmc");
		dwbh=rs.getString("dwbh");
		sjs=rs.getString("yhmc");


		//��Ʒ�
		int sjf=0;
		ls_sql=" SELECT sum(sjf)";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and  crm_zxkhxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_zxkhxx.sjfbz='Y'";
		ls_sql+=" and crm_zxkhxx.jsjfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jsjfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjf=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//���̺�ͬ���
		int qye=0;
		ls_sql=" SELECT sum(qye) qye";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.dwbh='"+dwbh+"' and  crm_khxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qye=rs1.getInt("qye");
		}
		rs1.close();
		ps1.close();


		//�ڷ�����
		int qfdl=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and  crm_zxkhxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_zxkhxx.sjsfpsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.sjsfpsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.fwlxbm='1'";//1���ڷ�
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qfdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//�߶˿ͻ�
		int gdkhs=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and  crm_zxkhxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_zxkhxx.sjsfpsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.sjsfpsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.khlxbm='00'";//00���߶˿ͻ�
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gdkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		//�ɵ���
		int pdl=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and  crm_zxkhxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_zxkhxx.sjsfpsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.sjsfpsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			pdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		

		
		//��Ч����
		int wxdl=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and  crm_zxkhxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_zxkhxx.sjsfpsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.sjsfpsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='N'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wxdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		
		//��������
		int lfdl=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and  crm_zxkhxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_zxkhxx.sjsfpsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.sjsfpsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.lfbz='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			lfdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		//����Ʒѵ���
		int sjfdl=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and  crm_zxkhxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_zxkhxx.sjsfpsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.sjsfpsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.sjfbz='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjfdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		

		
		//��ɷ�������
		int wcfasl=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and  crm_zxkhxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_zxkhxx.zxzt in('1','5')";//0��δ������棻1: ������棻2: �ɵ����δͨ����3����ǩԼ��4���ɵ���5���ɵ����δͨ��
		ls_sql+=" and crm_zxkhxx.lfbz='Y'";
		ls_sql+=" and crm_zxkhxx.ctbz='Y'";
		ls_sql+=" and crm_zxkhxx.sfzdzbj='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wcfasl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		
		//ǩ������
		int qys=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and  crm_zxkhxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_zxkhxx.sjsfpsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.sjsfpsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.zxzt in('3')";//0��δ������棻1: ������棻2: �ɵ����δͨ����3����ǩԼ��4���ɵ���5���ɵ����δͨ��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qys=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		
		//ǩ��ʧ�ܵ���
		int qdsbsl=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and  crm_zxkhxx.sjs='"+sjs+"'";
		ls_sql+=" and crm_zxkhxx.sjsfpsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.sjsfpsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.zxzt in('2','4')";//0��δ������棻1: ������棻2: �ɵ����δͨ����3����ǩԼ��4���ɵ���5���ɵ����δͨ��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qdsbsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		int cdl=pdl-wxdl-qys-qdsbsl;
		
		//������������
		int zfasl=lfdl-qys-qdsbsl;

		allsjf+=sjf;
		allqye+=qye;
		allqfdl+=qfdl;
		allgdkhs+=gdkhs;
		allpdl+=pdl;
		allcdl+=cdl;
		allwxdl+=wxdl;
		alllfdl+=lfdl;
		allsjfdl+=sjfdl;
		allzfasl+=zfasl;
		allwcfasl+=wcfasl;
		allqys+=qys;
		allqdsbsl+=qdsbsl;


		row++;


		%>
		<tr  align="center">
		  <td><%=row%></td>
		  <td><%=dwmc%></td>
		  <td><%=sjs%></td>
		  <td><%=sjf%></td>
		  <td><%=qye%></td>
		  <td><%=qfdl%></td>
		  <td><%=gdkhs%></td>
		  <td><%=pdl%></td>
		  <td><%=cdl%></td>
		  <td><%=wxdl%></td>
		  <td><%=lfdl%></td>
		  <td><%=sjfdl%></td>
		  <td><%=zfasl%></td>
		  <td><%=wcfasl%></td>

		  <td><%=qys%></td>
		  <td><%=qdsbsl%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();
%>

	<tr  align="center">
	  <td colspan="3">С ��</td>
	  <td><%=allsjf%></td>
	  <td><%=allqye%></td>
	  <td><%=allqfdl%></td>
	  <td><%=allgdkhs%></td>
	  <td><%=allpdl%></td>
	  <td><%=allcdl%></td>
	  <td><%=allwxdl%></td>
	  <td><%=alllfdl%></td>
	  <td><%=allsjfdl%></td>
	  <td><%=allzfasl%></td>
	  <td><%=allwcfasl%></td>

	  <td><%=allqys%></td>
	  <td><%=allqdsbsl%></td>
	</tr>
</table>




<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
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


</body>
</html>