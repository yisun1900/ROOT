<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String px=request.getParameter("px");

	String fgs=request.getParameter("fgs");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�೤�ӵ�ͳ�ƣ���ֱ��
  <BR>(�ɵ�ʱ�估�ص�ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td>
      <table border="1" width="105%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="4%">����</td>
          <td  width="8%">�೤</td>
          <td  width="6%">ʩ����</td>
          <td  width="6%">����</td>
          <td  width="6%">�ɵ�����</td>
          <td  width="10%">�����ɵ�</td>
          <td  width="8%">�ص����</td>
          <td  width="8%">�ص�����</td>
          <td  width="8%">��˾����</td>
          <td  width="8%">�������</td>
          <td  width="10%">�ɵ��ܽ��</td>
          <td  width="7%">ƽ������</td>
          <td  width="16%">�ɵ��ܽ��</td>
        </tr>
<%
double maxje=0;
String sgdmc=null;
String sgd=null;
String sgbz=null;
String sgdlx=null;

int allsl=0;
double allje=0;
int allbzsl=0;

		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();


	//��ȡ����ɵ���
	ls_sql="select max(sum(qye))";
	ls_sql+=" from crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.sgbz is not null  and sq_sgd.sgdlx='S0'";
	ls_sql+=" and pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" group by crm_khxx.sgd,crm_khxx.sgbz";

	String ls=cf.executeQuery(ls_sql);
	if (ls==null)
	{
		return;
	}
	else{
		maxje=Double.parseDouble(ls);
		if (maxje==0)
		{
			return;
		}
	}

	
	//0�������ɵ���1���ص�������2����˾������3�����ʦָ���ɵ���4���ͻ�ָ���ɵ�: 5+�󵥵�С��&6+С���ִ�&7+�������

	int pm=0;
	double oldpm=0;
	int sl=0;
	int je=0;
	int bzsl=0;
	int pjje=0;

	int hdsl=0;
	int hdje=0;
	int allhdsl=0;
	int allhdje=0;

	int hdjlsl=0;
	int hdjlje=0;
	int allhdjlsl=0;
	int allhdjlje=0;

	int gsjlsl=0;
	int gsjlje=0;
	int allgsjlsl=0;
	int allgsjlje=0;

	int tsqksl=0;
	int tsqkje=0;
	int alltsqksl=0;
	int alltsqkje=0;



	ls_sql="select sgd,sgdmc,DECODE(sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx,bzs,sgbz,sum(sl),sum(je)";
	ls_sql+=" from";
	ls_sql+=" (";

	ls_sql+=" select crm_khxx.sgd,sgdmc,sq_sgd.sgdlx,bzs,crm_khxx.sgbz,count(*) sl,sum(qye) je";
	ls_sql+=" from crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.sgbz is not null  and sq_sgd.sgdlx='S0'";
	ls_sql+=" and pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" group by crm_khxx.sgd,sgdmc,sq_sgd.sgdlx,bzs,crm_khxx.sgbz";

	ls_sql+=" union";

	ls_sql+=" select sq_sgd.sgd,sgdmc,sq_sgd.sgdlx,bzs,bzmc sgbz,0 sl,0 je";
	ls_sql+=" from sq_sgd,sq_bzxx";
	ls_sql+=" where sq_sgd.cxbz='N' and sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.sgdlx='S0'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  sq_sgd.ssfgs='"+fgs+"'";
	}

	ls_sql+=" )";
	ls_sql+=" group by sgd,sgdmc,sgdlx,bzs,sgbz";
	
	ls_sql+=" order by sum(je) desc";
//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sgd=rs.getString("sgd");
		sgdmc=rs.getString("sgdmc");
		sgdlx=rs.getString("sgdlx");
		bzsl=rs.getInt("bzs");
		sgbz=rs.getString("sgbz");
		sl=rs.getInt(6);
		je=rs.getInt(7);

		allsl+=sl;
		allje+=je;

		if (sl!=0)
		{
			pjje=(int)je/sl;
		}
		else{
			pjje=0;
		}


		if (oldpm!=je)
		{
			pm++;
			oldpm=je;
		}

		//�ص����
		ls_sql=" select count(*),sum(qye)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		ls_sql+=" and hdbz='6' and crm_khxx.hdr='"+sgbz+"' ";
		//1���ǻص���2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص���5��Ա���ص�;6���೤�ص�

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			hdsl=rs1.getInt(1);
			hdje=rs1.getInt(2);
			allhdsl+=hdsl;
			allhdje+=hdje;
		}
		rs1.close();
		ps1.close();

		//�ص�����
		ls_sql=" select count(*),sum(qye)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		ls_sql+=" and jlbz='1' and crm_khxx.sgd='"+sgd+"' and crm_khxx.sgbz='"+sgbz+"' ";
		//0�������ɵ���1���ص�������2����˾������3�����ʦָ���ɵ���4���ͻ�ָ���ɵ�: 5+�󵥵�С��&6+С���ִ�&7+�������

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			hdjlsl=rs1.getInt(1);
			hdjlje=rs1.getInt(2);
			allhdjlsl+=hdjlsl;
			allhdjlje+=hdjlje;
		}
		rs1.close();
		ps1.close();

		//��˾����
		ls_sql=" select count(*),sum(qye)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		ls_sql+=" and jlbz='2' and crm_khxx.sgd='"+sgd+"' and crm_khxx.sgbz='"+sgbz+"' ";
		//0�������ɵ���1���ص�������2����˾������3�����ʦָ���ɵ���4���ͻ�ָ���ɵ�: 5+�󵥵�С��&6+С���ִ�&7+�������

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			gsjlsl=rs1.getInt(1);
			gsjlje=rs1.getInt(2);
			allgsjlsl+=gsjlsl;
			allgsjlje+=gsjlje;
		}
		rs1.close();
		ps1.close();

		//�������
		ls_sql=" select count(*),sum(qye)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		ls_sql+=" and jlbz='7' and crm_khxx.sgd='"+sgd+"' and crm_khxx.sgbz='"+sgbz+"' ";
		//0�������ɵ���1���ص�������2����˾������3�����ʦָ���ɵ���4���ͻ�ָ���ɵ�: 5+�󵥵�С��&6+С���ִ�&7+�������

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			tsqksl=rs1.getInt(1);
			tsqkje=rs1.getInt(2);
			alltsqksl+=tsqksl;
			alltsqkje+=tsqkje;
		}
		rs1.close();
		ps1.close();



		if (pm%2==0)
		{
			out.println("        <tr align=\"center\" bgcolor=\"#E8E8FF\">\r\n");
		}
		else{
			out.println("        <tr align=\"center\">\r\n");
		}

%>
          <td><%=pm%></td>
          <td><%=sgbz%></td>
          <td><%=sgdmc%></td>
          <td><%=sgdlx%></td>
          <td align="right"><%=sl%></td>
          <td align="right"><%=cf.formatDouble(je-hdje-gsjlje-tsqkje)%></td>
          <td align="right"><%=cf.formatDouble(hdje)%></td>
          <td align="right"><%=cf.formatDouble(hdjlje)%></td>
          <td align="right"><%=cf.formatDouble(gsjlje)%></td>
          <td align="right"><%=cf.formatDouble(tsqkje)%></td>
          <td align="right"><%=cf.formatDouble(je)%></td>
          <td align="right"><%=cf.formatDouble(pjje)%></td>
          <td align="left"><A HREF="ViewSgbzcz.jsp?sgd=<%=sgd%>&sgbz=<%=sgbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=je*80/maxje%>" height="14"></A></td>
        </tr>
<%

	}
	ps.close();
	rs.close();

		

	if (allsl!=0)
	{
		pjje=(int)allje/allsl;
	}
	else{
		pjje=0;
	}

%>
        <tr align="center" >
          <td>�ϼ�</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td align="center"><%=allbzsl%></td>
          <td align="right"><%=allsl%></td>
          <td align="right"><%=cf.formatDouble(allje-allhdjlje-allgsjlje-alltsqkje)%></td>
          <td align="right"><%=cf.formatDouble(allhdje)%></td>
          <td align="right"><%=cf.formatDouble(allhdjlje)%></td>
          <td align="right"><%=cf.formatDouble(allgsjlje)%></td>
          <td align="right"><%=cf.formatDouble(alltsqkje)%></td>
          <td align="right"><%=cf.formatDouble(allje)%></td>
          <td align="right"><%=cf.formatDouble(pjje)%></td>
          <td align="left">&nbsp;</td>
        </tr>
<%

}
catch (Exception e) {
	conn.rollback();
	out.print("��������: " + e);
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
      </table>
    </td>
  </tr>
</table>
</body>
</html>
