<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;


	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

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
	int fwszall=0;
	int fwsz21=0;
	double fwsz21b=0;
	int fwsz22=0;
	double fwsz22b=0;
	int fwsz23=0;
	double fwsz23b=0;
	int sgzlall=0;
	int sgzl21=0;
	double sgzl21b=0;
	int sgzl22=0;
	double sgzl22b=0;
	int sgzl23=0;
	double sgzl23b=0;
	int grszall=0;
	int grsz21=0;
	double grsz21b=0;
	int grsz22=0;
	double grsz22b=0;
	int grsz23=0;
	double grsz23b=0;

	double	b21=0;
	double	b22=0;
	double	b23=0;

	String ls=null;

	//��Ч�ط���������������6��δ��ϵ�ϡ�7��δ����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
//	out.println(ls_sql);
	ls=cf.executeQuery(ls_sql);
	all=Integer.parseInt(ls);
	if (all==0)
	{
		out.println("�޻ط�����");
		return;
	}

//=============================ʩ���ӷ���̬��==================================================
	//ʩ���ӷ���̬���н�����ط�����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.fwsz=dm_hfjgbm.hfjgbm ";//ʩ���ӷ���̬��
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	fwszall=Integer.parseInt(ls);
	
	//ʩ���ӷ���̬�ȣ�21������
	ls_sql =" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx ";
	ls_sql+=" where crm_hfjl.fwsz='21' ";//ʩ���ӷ���̬�ȣ�21������
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	fwsz21=Integer.parseInt(ls);

	//ʩ���ӷ���̬�ȣ�22��������
	ls_sql =" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.fwsz='22' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	fwsz22=Integer.parseInt(ls);

	//ʩ���ӷ���̬�ȣ�23��������
	ls_sql =" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.fwsz='23' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	fwsz23=Integer.parseInt(ls);

//=============================ʩ���ӹ�������==================================================

	//ʩ���ӹ��������н�����ط�����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.grsz=dm_hfjgbm.hfjgbm ";//ʩ���ӹ�������
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	grszall=Integer.parseInt(ls);
	
	//ʩ���ӹ������ʣ�21������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.grsz='21' ";//ʩ���ӹ������ʣ�21������
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	grsz21=Integer.parseInt(ls);


	//ʩ���ӹ������ʣ�22��������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.grsz='22' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	grsz22=Integer.parseInt(ls);

	//ʩ���ӹ������ʣ�23��������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.grsz='23' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	grsz23=Integer.parseInt(ls);


//=============================ʩ����ʩ������==================================================

	//ʩ����ʩ�������н�����ط�����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.sgzl=dm_hfjgbm.hfjgbm ";//ʩ����ʩ������
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	sgzlall=Integer.parseInt(ls);



	//ʩ����ʩ��������21������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.sgzl='21' ";//ʩ����ʩ��������21������
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	sgzl21=Integer.parseInt(ls);

	//ʩ����ʩ��������22��������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.sgzl='22' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	sgzl22=Integer.parseInt(ls);


	//ʩ����ʩ��������23��������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.sgzl='23' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	sgzl23=Integer.parseInt(ls);

//	fwszall=0;
//	sgzlall=0;
//	grszall=0;

	if (fwszall==0)
	{
		fwsz21b=0;
		fwsz22b=0;
		fwsz23b=0;
	}
	else{
		fwsz21b=cf.doubleTrim(100.0*fwsz21/fwszall,2);
		fwsz22b=cf.doubleTrim(100.0*fwsz22/fwszall,2);
		fwsz23b=cf.doubleTrim(100.0*fwsz23/fwszall,2);
	}

	if (grszall==0)
	{
		grsz21b=0;
		grsz22b=0;
		grsz23b=0;
	}
	else{
		grsz21b=cf.doubleTrim(100.0*grsz21/grszall,2);
		grsz22b=cf.doubleTrim(100.0*grsz22/grszall,2);
		grsz23b=cf.doubleTrim(100.0*grsz23/grszall,2);
	}

	if (sgzlall==0)
	{
		sgzl21b=0;
		sgzl22b=0;
		sgzl23b=0;
	}
	else{
		sgzl21b=cf.doubleTrim(100.0*sgzl21/sgzlall,2);
		sgzl22b=cf.doubleTrim(100.0*sgzl22/sgzlall,2);
		sgzl23b=cf.doubleTrim(100.0*sgzl23/sgzlall,2);
	}

	if ((fwszall+grszall+sgzlall)==0)
	{
		b21=0;
		b22=0;
		b23=0;
	}
	else{
		b21=cf.doubleTrim(100.0*(fwsz21+grsz21+sgzl21)/(fwszall+grszall+sgzlall),2);
		b22=cf.doubleTrim(100.0*(fwsz22+grsz22+sgzl22)/(fwszall+grszall+sgzlall),2);
		b23=cf.doubleTrim(100.0*(fwsz23+grsz23+sgzl23)/(fwszall+grszall+sgzlall),2);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>ʩ����<<%=hflxmc%>>�ط�ͳ�ƣ���Ч�طô�����<%=all%>��<BR>
  (<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
      
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="20%">������Ŀ</td>
    <td  width="20%">�طý��</td>
    <td  width="15%">����</td>
    <td  width="30%">�ٷֱ� </td>
  </tr>
  <tr align="center"> 
    <td  rowspan="4">ʩ���ӷ���̬��</td>
    <td >����</td>
    <td  align="right"><%=fwsz21%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*fwsz21b%>" height="14">&nbsp;<%=fwsz21b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=fwsz22%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*fwsz22b%>" height="14">&nbsp;<%=fwsz22b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=fwsz23%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*fwsz23b%>" height="14">&nbsp;<%=fwsz23b%>%</td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>С ��</b></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=fwszall%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>&nbsp;</b></td>
  </tr>
  <tr align="center"> 
    <td  rowspan="4">ʩ����ʩ������</td>
    <td >����</td>
    <td  align="right"><%=sgzl21%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*sgzl21b%>" height="14">&nbsp;<%=sgzl21b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=sgzl22%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*sgzl22b%>" height="14">&nbsp;<%=sgzl22b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=sgzl23%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*sgzl23b%>" height="14">&nbsp;<%=sgzl23b%>%</td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>С ��</b></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=sgzlall%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>&nbsp;</b></td>
  </tr>
  <tr align="center"> 
    <td rowspan="4" >ʩ���ӹ�������</td>
    <td >����</td>
    <td  align="right"><%=grsz21%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*grsz21b%>" height="14">&nbsp;<%=grsz21b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=grsz22%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*grsz22b%>" height="14">&nbsp;<%=grsz22b%>%</td>
  </tr>
  <tr align="center"> 
    <td >������</td>
    <td  align="right"><%=grsz23%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*grsz23b%>" height="14">&nbsp;<%=grsz23b%>%</td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>С ��</b></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=grszall%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>&nbsp;</b></td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" colspan="2" style='FONT-SIZE:17px'><B>�� ��</B></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=(fwszall+grszall+sgzlall)%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><B>&nbsp;</B></td>
  </tr>
</table>

<P>
<div align="center">ʩ�����������ͳ�Ʊ�</div>
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
