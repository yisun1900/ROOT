<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
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

String px=request.getParameter("px");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;//���ڷֹ�˾��ʾ
ResultSet rs2=null;//���ڷֹ�˾��ʾ
String ls_sql=null;

String xxlybm=null;
String xxlymc=null;
int zxs=0;
int zxsbfb=0;


String fgsbh=null;
String fgsmc=null;
String oldfgs="";

int qys=0;
int qysbfb=0;

double qye=0;
int qyebfb=0;

double sjf=0;
int sjfbfb=0;

int allzxs=0;
int fgsallzxs=0;//�ֹ�˾������ѯ��
int allqys=0;
int fgsallqys=0;//�ֹ�˾ǩԼ����
double allqye=0;
double fgsallqye=0;//�ֹ�˾ǩԼ�ܶ�
double allsjf=0;
double fgsallsjf=0;//�ֹ�˾����Ʒ�

int qdcgl=0;

try {
	conn=cf.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�ͻ���Դ���� <BR>
  (ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center"> 
  <td  width="7%">�ֹ�˾</td>
  <td  width="7%">�ͻ���Դ</td>
  <td  width="6%">��ѯ��</td>
  <td  width="10%">��ѯ���ٷֱ�</td>
  <td  width="6%">ǩԼ��</td>
  <td  width="10%">ǩԼ���ٷֱ�</td>
  <td  width="8%">ǩԼ��</td>
  <td  width="10%">ǩԼ��ٷֱ�</td>
  <td  width="9%">��Ʒ�</td>
  <td  width="7%">��ƷѰٷֱ�</td>
  <td  width="12%">ǩ���ɹ���</td>
  <td  width="8%">ǩ������</td>
</tr>
<%

	
	//ȫ����ѯ��
	ls_sql="select count(*)";
	ls_sql+=" from crm_zxkhxx";
	ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allzxs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//ȫ��ǩԼ����ǩԼ��
	ls_sql="select count(*),sum(qye),sum(sjf)";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2'";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allqye=rs.getDouble(2);
		allsjf=rs.getDouble(3);
		//allfwmj=rs.getInt(4);
	}
	rs.close();
	ps.close();


	//��ȡʱ���
	int sjc=0;
	double pjts=0;//ƽ������
	double allpjts=0;//��ƽ������

	ls_sql="SELECT TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')-TO_DATE('"+sjfw+"','YYYY-MM-DD')+1";
	ls_sql+=" FROM dm_gcjdbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjc=rs.getInt(1);
	}
	rs.close();
	ps.close();


//�ֹ�˾	
	ls_sql=" SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  dwbh ='"+fgs+"'";
	}
	ls_sql+=" order by dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery(ls_sql);
	while (rs2.next())
	{
		fgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");	
	
		//��Ϣ��Դ
		ls_sql="select xxlybm,xxlymc";
		ls_sql+=" from dm_xxlybm";
		ls_sql+=" order by xxlybm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			xxlybm=rs1.getString("xxlybm");
			xxlymc=rs1.getString("xxlymc");

			zxs=0;
			zxsbfb=0;
			qys=0;
			qye=0;
			sjf=0;

			//�ֹ�˾ȫ����ѯ��
			ls_sql="select count(*)";
			ls_sql+=" from crm_zxkhxx";
			ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and crm_zxkhxx.ssfgs='"+fgsbh+"'";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
			}
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				fgsallzxs=rs.getInt(1);
			}
			rs.close();
			ps.close();

			//�ֹ�˾ȫ��ǩԼ����ǩԼ��
			ls_sql="select count(*),sum(qye),sum(sjf)";
			ls_sql+=" from crm_khxx";
			ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2'";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and crm_khxx.fgsbh='"+fgsbh+"'";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
			}
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				fgsallqys=rs.getInt(1);
				fgsallqye=rs.getDouble(2);
				fgsallsjf=rs.getDouble(3);
//				fgsallfwmj=rs.getInt(4);
			}
			rs.close();
			ps.close();

			//��ѯ��
			ls_sql="select count(*)";
			ls_sql+=" from crm_zxkhxx,crm_khxxly";
			ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_zxkhxx.khbh=crm_khxxly.khbh and crm_khxxly.khlx='2'";//1��ǩԼ�ͻ���2����ѯ�ͻ�
			ls_sql+=" and crm_khxxly.xxlybm='"+xxlybm+"' and crm_zxkhxx.ssfgs='"+fgsbh+"'" ;
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
			}
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				zxs=rs.getInt(1);
			}
			rs.close();
			ps.close();


	//		ls_sql="select count(*),sum(qye),TO_CHAR(ROUND(sum(qye)/count(*))),'<img src=\"/images/ColuGif.gif\" width='||sum(qye)*150/"+all+"||' height=14>'";

			//��ȡǩԼ��
			ls_sql="select count(*),sum(qye),sum(sjf)";
			ls_sql+=" from crm_khxx,crm_khxxly";
			ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2'";
			ls_sql+=" and crm_khxx.khbh=crm_khxxly.khbh and crm_khxxly.khlx='1'";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_khxxly.xxlybm='"+xxlybm+"' and crm_khxx.fgsbh='"+fgsbh+"'";

			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
			}
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				qys=rs.getInt(1);
				qye=rs.getDouble(2);
				sjf=rs.getDouble(3);
			}
			rs.close();
			ps.close();

			if (fgsallzxs!=0)
			{
				zxsbfb=zxs*100/fgsallzxs;
			}
			else{
				zxsbfb=0;
			}
			if (fgsallqys!=0)
			{
				qysbfb=qys*100/fgsallqys;
			}
			else{
				qysbfb=0;
			}
			if (fgsallqye!=0)
			{
				qyebfb=(int)(qye*100/fgsallqye);
			}
			else{
				qyebfb=0;
			}
			if (fgsallsjf!=0)
			{
				sjfbfb=(int)(sjf*100/fgsallsjf);
			}
			else{
				sjfbfb=0;
			}

			if (zxs!=0)
			{
				qdcgl=qys*100/zxs;
			}
			else{
				qdcgl=0;
			}

			//ƽ������
			if (qys!=0)
			{
				pjts=sjc*1.0/qys;
			}
			else{
				pjts=0;
			}
			
			
			if (fgsmc.equals(oldfgs))
			{
				fgsmc="<font color="+"#FF0000"+">ͬ��</font>";
			}
			else{
				oldfgs=fgsmc;
			}


		%>
		<tr align="center">
		  <td><%=fgsmc%></td>
		  <td><%=xxlymc%></td>
		  <td><%=zxs%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=zxsbfb%>" height="14"><%=zxsbfb%>%</td>
		  <td><%=qys%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=qysbfb%>" height="14"><%=qysbfb%>%</td>
		  <td align="right"><%=cf.formatDouble(qye)%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=qyebfb%>" height="14"><%=qyebfb%>%</td>
		  <td align="right"><%=cf.formatDouble(sjf)%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=sjfbfb%>" height="14"><%=sjfbfb%>%</td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=qdcgl%>" height="14"><%=qdcgl%>%</td>
		  <td ><%=cf.formatDouble(pjts)%>��</td>
		</tr>
		<%
	
		}
		rs1.close();
		ps1.close();
	}
	rs2.close();
	ps2.close();	


if (allzxs!=0)
{
	qdcgl=allqys*100/allzxs;
}
else{
	qdcgl=0;
}


//ƽ������
if (allqys!=0)
{
	allpjts=sjc*1.0/allqys;
}
else{
	allpjts=0;
}



%> 

<tr align="center"> 
  <td>����</td>
  <td>&nbsp;</td>
  <td><%=allzxs%></td>
  <td>&nbsp;</td>
  <td><%=allqys%></td>
  <td>&nbsp;</td>
  <td align="right"><%=cf.formatDouble(allqye)%></td>
  <td>&nbsp;</td>
  <td align="right"><%=cf.formatDouble(allsjf)%></td>
  <td>&nbsp;</td>
  <td align="left"><img src="/images/ColuGif.gif" width="<%=qdcgl%>" height="14"><%=qdcgl%>%</td>
  <td ><%=cf.formatDouble(allpjts)%>��</td>
</tr>
</table>

<P><b><font color="#0000CC">ע�⣺��ͳ�Ʊ�[��Ϣ��Դ]�Ƕ�ѡ�����[��ѯ���ٷֱ�][ǩԼ���ٷֱ�]���������Ǹ�����ĺͣ��ֹ�˾��������ٷֱȾ����ڸ÷ֹ�˾��ռ����</font></b>
</body>
</html>

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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
