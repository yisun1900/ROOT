<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="page" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���̼���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
    String yhmc=(String)session.getAttribute("yhmc");
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
     	pageObj.setType("EXCEL",response);
	}
%>
<%
String tjrq=request.getParameter("tjrq");
String tjrq2=request.getParameter("tjrq2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
String wheresql1="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql1+=" and  (crm_zxkhxx.zxdm in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql1+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
}
String wheresql2="";
String dwbhsql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql2+=" and  (crm_tsbm.dwbh in(select dwbh from sq_dwxx where dwlx in('A1','F1','F2') and ssdw='"+fgs+"'))";
	if (!(fgs.equals("")))	dwbhsql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
	
%>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">
<b>�����ڴ�<%=fgs%>װ�ηֹ�˾</b><br>�ͻ����� 
ʱ�䣨<%=tjrq%>----<%=tjrq2%>�� ͳ���ˣ�<%=yhmc%>
</div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
  <tr> 
   <td width="3%" > 
      <div align="center"><b>��</b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>��</b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>���пͻ�</b></div>
    </td>
  <!--   <td width="3%" > 
      <div align="center"><b>����</b></div>
    </td> -->
    <td width="3%" > 
      <div align="center"><b>�����ͻ� </b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>������</b></div>

    </td>
	<td width="3%" > 
      <div align="center"><b>ǩ���ͻ�</b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>�ܵ���</b></div>

    </td>
	<td width="3%" > 
      <div align="center"><b>��ʩ����</b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>���׹���</b></div>

    </td>
	  </td>
	<td width="3%" > 
      <div align="center"><b>�������� </b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>��������</b></div>

    </td>
	<td width="3%" > 
      <div align="center"><b>��������</b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>�ۼƿ���</b></div>

    </td>
	<td width="3%" > 
      <div align="center"><b>���޿ͻ�</b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>����ͻ�</b></div>

    </td>
	  </td>
	<td width="3%" > 
      <div align="center"><b>δ����ͻ� </b></div>
    </td>
  <!--   <td width="3%" > 
      <div align="center"><b>��ʩ</b></div>

    </td>
	
    </td>
	<td width="3%" > 
      <div align="center"><b>����</b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>����ͻ�</b></div>

    </td>
	  </td>
	<td width="3%" > 
      <div align="center"><b>δ����ͻ� </b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>�ط�</b></div>

    </td>
	
    </td>
	<td width="3%" > 
      <div align="center"><b>���޿ͻ�</b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>����ͻ�</b></div>

    </td>
	  </td>
	<td width="3%" > 
      <div align="center"><b>δ����ͻ� </b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>�ط�</b></div>

    </td>
	
    </td>
	<td width="3%" > 
      <div align="center"><b>���޿ͻ�</b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>����ͻ�</b></div>

    </td>
	  </td>
	<td width="3%" > 
      <div align="center"><b>δ����ͻ� </b></div>
    </td>
    <td width="3%" > 
      <div align="center"><b>�ط�</b></div>

    </td> -->
  </tr>
  

<%

try {
	conn=cf.getConnection();

	String oldnian="";
	int alllfsl=0;
	int allwgkg=0;
	int allzqkg=0;
	int allggkg=0;
	int alljtgc=0;
	int allzsgs=0;
	int allqsl=0;
	double allfsl=0;
	int fsl=0;
	int row=0;
	String nian="";
	String yue="";
	ls_sql="select to_char(lrsj,'YYYY') nian,to_char(lrsj,'MM') yue,count(*)";
	ls_sql+=" from  crm_zxkhxx where ";
	ls_sql+=" lrsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and lrsj<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=wheresql1;
	ls_sql+=" GROUP BY to_char(lrsj,'YYYY'),to_char(lrsj,'MM')";
	ls_sql+=" order by to_char(lrsj,'YYYY'),to_char(lrsj,'MM')"; 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	
	while (rs.next())
	{
		
		nian=rs.getString("nian");
		yue=rs.getString("yue");
		fsl=rs.getInt(3);//���пͻ���
		int qsl=0;
		int zsgs=0;
		int jtgc=0;
		int ggkg=0;
		int zqkg=0;
		int wgkg=0;
		int ljwgkg=0;
		int blwgkg=0;
		int jswgkg=0;
		double lfsl=0;
		double lfl=0;
		double pdsl=0;
		double pdll=0;
		int wjswgkg=0;
		java.sql.Date te=null;

		ls_sql="select lrsj";
		ls_sql+=" from  crm_zxkhxx where ";
		ls_sql+="  to_char(lrsj,'YYYY')='"+nian+"' and to_char(lrsj,'MM')='"+yue+"'";
		ls_sql+=wheresql1;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if(rs1.next())
		{
			te=rs1.getDate("lrsj");//�����ͻ�
		}
		rs1.close();
		ps1.close();
		
		ls_sql="select count(*)";
		ls_sql+=" from  crm_zxkhxx where ";
		ls_sql+="  to_char(lrsj,'YYYY')='"+nian+"' and to_char(lrsj,'MM')='"+yue+"'";
		ls_sql+=" and lfbz='Y' ";//N��δ������Y��������
		ls_sql+=wheresql1;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if(rs1.next())
		{
			lfsl=rs1.getInt(1);//�����ͻ�
		}
		rs1.close();
		ps1.close();

		lfl=lfsl*100/fsl;//������
		allfsl+=lfsl;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_zxkhxx where ";
		ls_sql+=" to_char(lrsj,'YYYY')='"+nian+"' and to_char(lrsj,'MM')='"+yue+"'";
		ls_sql+=" and zxzt='3' ";//0����ѯ�Ǽǣ� 1:���ʦ��ѯ��2:�����˻ؿͻ���3����ǩԼ��4��ʧ�ܣ�
		ls_sql+=wheresql1;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if(rs1.next())
		{
			qsl=rs1.getInt(1);//ǩԼ�ͻ�
		}
		rs1.close();
		ps1.close();

		alllfsl+=fsl;//���пͻ���
		allqsl+=qsl;//ǩԼ�ͻ�

		ls_sql="select count(*)";
		ls_sql+=" from  crm_zxkhxx where ";
		ls_sql+=" to_char(lrsj,'YYYY')='"+nian+"' and to_char(lrsj,'MM')='"+yue+"'";
		ls_sql+=" and zxzt='4' ";//0����ѯ�Ǽǣ� 1:���ʦ��ѯ��2:�����˻ؿͻ���3����ǩԼ��4��ʧ�ܣ�
		ls_sql+=wheresql1;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if(rs1.next())
		{
			pdsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		pdll=pdsl*100/fsl;//�ܵ���
		
		//��ʩ����,�Ǹ��ݵ��µ��¿ͻ�ǩԼ�õ��ģ������ۼӵõ��ˡ�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and gcjdbm!='1' and gcjdbm!='5'";
		ls_sql+=" and TO_char(qyrq,'YYYY')='"+nian+"'";
		ls_sql+=" and TO_char(qyrq,'MM')='"+yue+"'";

		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			zsgs=rs1.getInt(1);
		}
		ps1.close();
		rs1.close();
		allzsgs+=zsgs;//��ʩ����
		//���׹���,�Ǹ��ݵ��µ��¿ͻ�ǩԼ�õ��ģ������ۼӵõ��ˡ�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and gcjdbm!='1' and gcjdbm!='5'";
		ls_sql+=" and TO_char(jyjdrq,'YYYY')='"+nian+"'";
		ls_sql+=" and TO_char(jyjdrq,'MM')='"+yue+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			jtgc=rs1.getInt(1);
		}
		ps1.close();
		rs1.close();
		alljtgc+=jtgc;//���׹���
		//��������,�Ǹ��ݵ��µ��¿ͻ�ǩԼ�õ��ģ������ۼӵõ��ˡ�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and gcjdbm='2' ";
		ls_sql+=" and TO_char(sjkgrq,'YYYY')='"+nian+"'";
		ls_sql+=" and TO_char(sjkgrq,'MM')='"+yue+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			ggkg=rs1.getInt(1);
		}
		ps1.close();
		rs1.close();
		allggkg+=ggkg;//��������
		//�������չ���,�Ǹ��ݵ��µ��¿ͻ�ǩԼ�õ��ģ������ۼӵõ��ˡ�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=" and TO_char(jhzqsj,'YYYY')='"+nian+"'";
		ls_sql+=" and TO_char(jhzqsj,'MM')='"+yue+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			zqkg=rs1.getInt(1);
		}
		ps1.close();
		rs1.close();
		allzqkg+=zqkg;//�������չ���,
		//�깤����,�Ǹ��ݵ��µ��¿ͻ�ǩԼ�õ��ģ������ۼӵõ��ˡ�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and gcjdbm='5'";
		ls_sql+=" and TO_char(szqsj,'YYYY')='"+nian+"'";
		ls_sql+=" and TO_char(szqsj,'MM')='"+yue+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			wgkg=rs1.getInt(1);
		}
		ps1.close();
		rs1.close();
		allwgkg+=wgkg;//�깤����
		//�깤����,�Ǹ��ݵ��µ��¿ͻ�ǩԼ�õ��ġ�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and gcjdbm='5'";
		ls_sql+=" and szqsj<=to_Date('"+te+"','YYYY-MM-DD')";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			ljwgkg=rs1.getInt(1);
		}
		ps1.close();
		rs1.close();

		//���޿ͻ�,�Ǹ��ݵ��µ��¿ͻ�ǩԼ�õ��ġ�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and kbxbz='Y'";
		ls_sql+=" and bxkssj<=to_Date('"+te+"','YYYY-MM-DD')";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			blwgkg=rs1.getInt(1);
		}
		ps1.close();
		rs1.close();
		//����ͻ�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and gdjsjd='1'";
		ls_sql+=" and qyrq<=to_Date('"+te+"','YYYY-MM-DD')";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			jswgkg=rs1.getInt(1);
		}
		ps1.close();
		rs1.close();

		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and gdjsjd='0'";
		ls_sql+=" and qyrq<=to_Date('"+te+"','YYYY-MM-DD')";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			wjswgkg=rs1.getInt(1);
		}
		ps1.close();
		rs1.close();

%> 
  <tr align="center" >
  <td><%=nian%></td>
    <td><%=yue%></td>
    <td><%=fsl%></td>
    <td><%=lfsl%></td>
    <td><%=cf.formatDouble(lfl)%>%</td>
    <td><%=qsl%></td>
    <td><%=cf.formatDouble(pdll)%>%</td>
    <td><%=zsgs%></td>
    <td ><%=jtgc%></td>
    <td ><%=ggkg%></td>
    <td ><%=zqkg%></td>
    <td ><%=wgkg%></td>
    <td ><%=ljwgkg%></td>
    <td><%=blwgkg%></td>
    <td ><%=jswgkg%></td>
	<td ><%=wjswgkg%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();
%>
 <tr align="center" >
  <td>�ϼ�</td>
    <td>&nbsp;</td>
    <td><%=alllfsl%></td>
    <td><%=allfsl%></td>
    <td>&nbsp;</td>
    <td><%=allqsl%></td>
    <td>&nbsp;</td>
    <td><%=allzsgs%></td>
    <td ><%=alljtgc%></td>
    <td ><%=allggkg%></td>
    <td ><%=allzqkg%></td>
    <td ><%=allwgkg%></td>
    <td ></td>
    <td></td>
    <td ></td>
	<td ></td>
  </tr>
</table>
<br>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td> 
      <div align="center"><b>�ͻ�Ͷ��</b> <b>(<%=tjrq%>--<%=tjrq2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
       <tr height="30"> 
		
		<td width="10%"> 
            <div align="center"><b>����</b></div>
          </td>
          <td width="10%"> 
            <div align="center"><b>Ͷ����</b></div>
          </td>
          <td width="10%"> 
            <div align="center"><b>����</b></div>
          </td>
          <td width="10%"> 
            <div align="center"><b>Ͷ����</b></div>
          </td>
		  <td width="10%"> 
            <div align="center"><b>���ʦ</b></div>
          </td>
          <td width="10%"> 
            <div align="center"><b>Ͷ����</b></div>
          </td>
		   <td width="10%"> 
            <div align="center"><b>�ϼ�</b></div>
          </td>
		  <td width="10%"> 
            <div align="center"><b>��Ͷ����</b></div>
          </td>
		  <td width="10%"> 
            <div align="center"><b>�ͻ�</b></div>
          </td>
		  <td width="10%"> 
            <div align="center"><b>ά����</b></div>
          </td>
        </tr>
<%
	int slsis=0;
	int slzjy=0;
	int slsgd=0;
	int bxalltssl=0;
	int khalltssl=0;
	int jjalltssl=0;
	double khl=0;
	double allsl=0;
	double sisl=0;
	double sgdl=0;
	double zjyl=0;
	double alltsl=0;
	row=0;
	//Ͷ������
	ls_sql="SELECT count(crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsxlbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsjl.lx='1'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql2;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();
	//��������
	ls_sql="SELECT count(crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsxlbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql2;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bxalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();
	
	//�ͻ�����,û�н���ʱ�����ƣ���Ϊ�������ʱ�����ƵĻ������޺Ϳͻ�����ͬһ����
	ls_sql="SELECT count(khbh) alltssl";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where zt='2' ";
	//ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();

	khl=bxalltssl*100/khalltssl;//�ͻ�ά����

	//�ʼ죬���ʦ��ʩ����Ͷ������
	ls_sql="SELECT count(crm_tsjl.tsjlh) tssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh  ";
	ls_sql+=" and crm_tsbm.tsxlbm in('2201','2101','2102')";//���ʦ
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql2;	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs.next())
	{
		allsl=rs.getInt(1);
	}
	ps.close();
	rs.close();
	alltsl=allsl*100/jjalltssl;//��Ͷ����
	ls_sql="SELECT count(crm_tsjl.tsjlh) tssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh  ";
	ls_sql+=" and crm_tsbm.tsxlbm ='2201'";//���ʦ
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql2;	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs.next())
	{
		slsis=rs.getInt(1);
	}
	ps.close();
	rs.close();

	sisl=slsis*100/allsl;//���ʦͶ����

	ls_sql="SELECT count(crm_tsjl.tsjlh) tssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh  ";
	ls_sql+=" and crm_tsbm.tsxlbm ='2102'";//�ʼ�Ա
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql2;	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs.next())
	{
		slzjy=rs.getInt(1);
	}
	ps.close();
	rs.close();
	zjyl=slzjy*100/allsl;//�ʼ�ԱͶ����
	ls_sql="SELECT count(crm_tsjl.tsjlh) tssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh  ";
	ls_sql+=" and crm_tsbm.tsxlbm ='2101'";//ʩ����
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql2;	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs.next())
	{
		slsgd=rs.getInt(1);
	}
	ps.close();
	rs.close();
	sgdl=slsgd*100/allsl;//ʩ����Ͷ����
%> 
	<tr height="30" > 
          
    <td width="10%" align="center"><%=slsgd%></td>
	<td width="10%" align="center"><%=cf.formatDouble(sgdl)%>%</td>
	<td width="10%" align="center"><%=slzjy%></td>
	<td width="10%" align="center"><%=cf.formatDouble(zjyl)%>%</td>
	<td width="10%" align="center"><%=slsis%></td>
	<td width="10%" align="center"><%=cf.formatDouble(sisl)%>%</td>
	<td width="10%" align="center"><%=allsl%></td>
     <td width="10%" align="center"><%=cf.formatDouble(alltsl)%>%</td>    
	 <td width="10%" align="center"><%=khalltssl%></td>
     <td width="10%" align="center"><%=cf.formatDouble(khl)%>%</td>    
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>
