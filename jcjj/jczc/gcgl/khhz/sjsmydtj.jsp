<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="page" class="ybl.common.PageObject"/>

<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
     	pageObj.setType("EXCEL",response);
	}
	String ls_sql=null;
	String tjrq=null;
	String tjrq2=null;


	tjrq=request.getParameter("tjrq");
	tjrq2=request.getParameter("tjrq2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
	String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");
	
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	if (hflxbm!=null)
	{
		if (!(hflxbm.equals("")))	wheresql+=" and crm_hfjl.hflxbm='"+hflxbm+"'";
	}

	int all=0;
	int sjfaall=0;
	int sjfa21=0;
	double sjfa21b=0;
	int sjfa22=0;
	double sjfa22b=0;
	int sjfa23=0;
	double sjfa23b=0;
	int hqfwall=0;
	int hqfw21=0;
	double hqfw21b=0;
	int hqfw22=0;
	double hqfw22b=0;
	int hqfw23=0;
	double hqfw23b=0;
	int jdqkall=0;
	int jdqk21=0;
	double jdqk21b=0;
	int jdqk22=0;
	double jdqk22b=0;
	int jdqk23=0;
	double jdqk23b=0;

	double	b21=0;
	double	b22=0;
	double	b23=0;

	String ls=null;

	//��Ч�ط���������������6��δ��ϵ�ϡ�7��δ����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	all=Integer.parseInt(ls);
	if (all==0)
	{
		out.println("�޻ط�����");
		return;
	}

//=============================���ʦ��Ʒ���==================================================
	//���ʦ��Ʒ����н�����ط�����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.sjfa=dm_hfjgbm.hfjgbm ";//���ʦ��Ʒ���
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	sjfaall=Integer.parseInt(ls);
	
	//���ʦ��Ʒ�����21������
	ls_sql =" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx ";
	ls_sql+=" where crm_hfjl.sjfa='21' ";//���ʦ��Ʒ�����21������
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	sjfa21=Integer.parseInt(ls);

	//���ʦ��Ʒ�����22��������
	ls_sql =" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.sjfa='22' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	sjfa22=Integer.parseInt(ls);

	//���ʦ��Ʒ�����23��������
	ls_sql =" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.sjfa='23' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	sjfa23=Integer.parseInt(ls);

//=============================���ʦ���ڷ���==================================================

	//���ʦ���ڷ����н�����ط�����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.hqfw=dm_hfjgbm.hfjgbm ";//���ʦ���ڷ���
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	hqfwall=Integer.parseInt(ls);
	
	//���ʦ���ڷ���21������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.hqfw='21' ";//���ʦ���ڷ���21������
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	hqfw21=Integer.parseInt(ls);


	//���ʦ���ڷ���22��������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.hqfw='22' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	hqfw22=Integer.parseInt(ls);

	//���ʦ���ڷ���23��������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.hqfw='23' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	hqfw23=Integer.parseInt(ls);


//=============================���ʦ�������==================================================

	//���ʦ��������н�����ط�����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.jdqk=dm_hfjgbm.hfjgbm ";//���ʦ�������
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	jdqkall=Integer.parseInt(ls);



	//���ʦ���������21������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.jdqk='21' ";//���ʦ���������21������
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	jdqk21=Integer.parseInt(ls);

	//���ʦ���������22��������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.jdqk='22' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	jdqk22=Integer.parseInt(ls);


	//���ʦ���������23��������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.jdqk='23' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	jdqk23=Integer.parseInt(ls);

//	sjfaall=0;
//	jdqkall=0;
//	hqfwall=0;

	if (sjfaall==0)
	{
		sjfa21b=0;
		sjfa22b=0;
		sjfa23b=0;
	}
	else{
		sjfa21b=cf.doubleTrim(100.0*sjfa21/sjfaall,2);
		sjfa22b=cf.doubleTrim(100.0*sjfa22/sjfaall,2);
		sjfa23b=cf.doubleTrim(100.0*sjfa23/sjfaall,2);
	}

	if (hqfwall==0)
	{
		hqfw21b=0;
		hqfw22b=0;
		hqfw23b=0;
	}
	else{
		hqfw21b=cf.doubleTrim(100.0*hqfw21/hqfwall,2);
		hqfw22b=cf.doubleTrim(100.0*hqfw22/hqfwall,2);
		hqfw23b=cf.doubleTrim(100.0*hqfw23/hqfwall,2);
	}

	if (jdqkall==0)
	{
		jdqk21b=0;
		jdqk22b=0;
		jdqk23b=0;
	}
	else{
		jdqk21b=cf.doubleTrim(100.0*jdqk21/jdqkall,2);
		jdqk22b=cf.doubleTrim(100.0*jdqk22/jdqkall,2);
		jdqk23b=cf.doubleTrim(100.0*jdqk23/jdqkall,2);
	}

	if ((sjfaall+hqfwall+jdqkall)==0)
	{
		b21=0;
		b22=0;
		b23=0;
	}
	else{
		b21=cf.doubleTrim(100.0*(sjfa21+hqfw21+jdqk21)/(sjfaall+hqfwall+jdqkall),2);
		b22=cf.doubleTrim(100.0*(sjfa22+hqfw22+jdqk22)/(sjfaall+hqfwall+jdqkall),2);
		b23=cf.doubleTrim(100.0*(sjfa23+hqfw23+jdqk23)/(sjfaall+hqfwall+jdqkall),2);
	}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>���ʦ<<%=hflxmc%>>�ط�ͳ�ƣ���Ч�طô�����<%=all%>��<BR>
  (<%=tjrq%>--<%=tjrq2%>)</B>
</CENTER>
      
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="20%">������Ŀ</td>
    <td  width="20%">�طý��</td>
    <td  width="15%">����</td>
    <td  width="30%">�ٷֱ� </td>
  </tr>
  <tr align="center"> 
    <td  rowspan="4">��Ʒ���</td>
    <td >����</td>
    <td  align="right"><%=sjfa21%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*sjfa21b%>" height="14">&nbsp;<%=sjfa21b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=sjfa22%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*sjfa22b%>" height="14">&nbsp;<%=sjfa22b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=sjfa23%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*sjfa23b%>" height="14">&nbsp;<%=sjfa23b%>%</td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>С ��</b></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=sjfaall%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>&nbsp;</b></td>
  </tr>
  <tr align="center"> 
    <td  rowspan="4">�������</td>
    <td >����</td>
    <td  align="right"><%=jdqk21%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*jdqk21b%>" height="14">&nbsp;<%=jdqk21b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=jdqk22%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*jdqk22b%>" height="14">&nbsp;<%=jdqk22b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=jdqk23%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*jdqk23b%>" height="14">&nbsp;<%=jdqk23b%>%</td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>С ��</b></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=jdqkall%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>&nbsp;</b></td>
  </tr>
  <tr align="center"> 
    <td rowspan="4" >���ڷ���</td>
    <td >����</td>
    <td  align="right"><%=hqfw21%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*hqfw21b%>" height="14">&nbsp;<%=hqfw21b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=hqfw22%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*hqfw22b%>" height="14">&nbsp;<%=hqfw22b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=hqfw23%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*hqfw23b%>" height="14">&nbsp;<%=hqfw23b%>%</td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>С ��</b></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=hqfwall%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>&nbsp;</b></td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" colspan="2" style='FONT-SIZE:17px'><B>�� ��</B></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=(sjfaall+hqfwall+jdqkall)%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><B>&nbsp;</B></td>
  </tr>
</table>

<P><div align="center">���ʦ�������ͳ�Ʊ�</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 16px'>
  <tr height="40"> 
    <td width="35%" align="right">����</td>
    <td width="65%"><img src="/images/ColuGif.gif" width="<%=4*b21%>" height="20">&nbsp;<%=b21%>%</td>
  </tr>
  <tr height="40"> 
    <td width="35%" align="right">������</td>
    <td width="65%"><img src="/images/ColuGif.gif" width="<%=4*b22%>" height="20">&nbsp;<%=b22%>%</td>
  </tr>
  <tr height="40"> 
    <td width="35%" align="right">������</td>
    <td width="65%"><img src="/images/ColuGif.gif" width="<%=4*b23%>" height="20">&nbsp;<%=b23%>%</td>
  </tr>
</table>

</body>
</html>

