<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,java.net.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	String zcdlmc=request.getParameter("dlmc");//���մӱ�����dlmc
	zcdlmc=URLDecoder.decode(zcdlmc,"UTF-8");//����dlmc


	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");


	String fgs=request.getParameter("fgs");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>����С������ͳ��
  <BR>(ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="5%">���</td>
          <td  width="6%">����С��</td>
          <td  width="8%">��������</td>
          <td  width="6%">��ͬ�ܶ�</td>
          <td  width="5%">��ռ����</td>
          <td  width="8%">����ʵ���տ�</td>
          <td  width="8%">�����������</td>
          <td  width="5%">ռȫ�����ı���</td>
          <td  width="20%">ǩԼ��ٷֱ�ͼ</td>
        </tr>
<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String zcxlmc=null;
String xlmc=null;
int row=0;
int numdl=0;
double wdzje=0;
double hkze=0;
double htcxhdje=0;

double xjwdzje=0;
double xjhkze=0;

double allwdzje=0;
double allhkze=0;
double allhtcxhdje=0;

double qyebfb=0;//δ���۰ٷֱ�
double sxebfb=0;//ռȫ�����İٷֱ�

double allzcqye=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*) ";
	ls_sql+=" FROM jdm_zcxlbm ";
	ls_sql+=" where zcdlmc='"+zcdlmc+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		numdl=rs.getInt(1);
	}
	rs.close();
	ps.close();
//����������ǩԼ��
	ls_sql="select sum(jc_zcdd.wdzje) wdzje";
	ls_sql+=" from jc_zcdd,crm_khxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	if (rs.next())
	{
	allzcqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(jc_zcdd.wdzje) wdzje,sum(jc_zcdd.hkze) hkze,sum(jc_zcdd.htcxhdje) htcxhdje";
	ls_sql+=" from jc_zcdd,crm_khxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.fgsbh='"+fgs+"' and jc_zcdd.zcdlbm='"+zcdlmc+"'";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps1 = conn.prepareStatement(ls_sql);
	rs1 = ps1.executeQuery();
	if (rs1.next())
	{
	xjwdzje=rs1.getDouble(1);
	xjhkze=rs1.getDouble(2);
	}
	rs1.close();
	ps1.close();


	ls_sql="SELECT zcxlmc ";
	ls_sql+=" FROM jdm_zcxlbm";
	ls_sql+=" where zcdlmc='"+zcdlmc+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		zcxlmc=rs.getString("zcxlmc");

		ls_sql="select sum(jc_zcdd.wdzje) wdzje,sum(jc_zcdd.hkze) hkze,sum(jc_zcdd.htcxhdje) htcxhdje";
		ls_sql+=" from jc_zcdd,crm_khxx";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.fgsbh='"+fgs+"' and jc_zcdd.zcxlbm='"+zcxlmc+"' and jc_zcdd.zcdlbm='"+zcdlmc+"'";
		ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
		wdzje=rs1.getDouble(1);
		hkze=rs1.getDouble(2);
		htcxhdje=rs1.getDouble(3);
		}
		rs1.close();
		ps1.close();

		if (xjwdzje==0)
		{
			qyebfb=0;
		}
		else{
			qyebfb=wdzje*100/xjwdzje;
		}

		if (allzcqye==0)
		{
			sxebfb=0;
		}
		else{
			sxebfb=wdzje*100/allzcqye;
		}
		
		allwdzje+=wdzje;
		allhkze+=hkze;
		allhtcxhdje+=htcxhdje;

		row++;
		xlmc=URLEncoder.encode(zcxlmc,"UTF-8");//��zcxlmc���봫��zcpptjb.jsp

%>
		<tr align="center">
          <td><%=row%></td>
          <td><%=zcxlmc%></td>
		  <%if(row%numdl==1)
		  {%>
          <td rowSpan="<%=numdl%>"><%=zcdlmc%></td>
		  <%}%>
          <td align="right"><%=cf.formatDouble((int)wdzje)%></td>
          <td align="right"><%=cf.round(qyebfb,1)%>%</td>
          <td align="right"><%=cf.formatDouble((int)hkze)%></td>
          <td align="right"><%=cf.formatDouble((int)htcxhdje)%></td>
          <td align="right"><%=cf.round(sxebfb,1)%>%</td>
          <td align="right"><%=cf.round(qyebfb,1)%>%<A HREF="zcpptjb.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgs%>&xlmc=<%=xlmc%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=qyebfb*1.8%>" height="14"></A></td>
        </tr>
<%
	}
	ps.close();
	rs.close();

%>
		<tr align="center">
          <td colSpan=2><B>�ܼ�</B></td>
          <td>&nbsp;</td>
          <td align="right"><B><font color=red><%=cf.formatDouble((int)allwdzje)%></font></B></td>
          <td align="right">&nbsp;</td>
          <td align="right"><B><font color=red><%=cf.formatDouble((int)allhkze)%></font></B></td>
          <td align="right"><B><font color=red><%=cf.formatDouble((int)allhtcxhdje)%></font></B></td>
          <td align="right">&nbsp;</td>
          <td align="right">&nbsp;</td>
        </tr>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
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
      </table>
</body>
</html>
