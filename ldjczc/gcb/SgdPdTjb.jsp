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

	String fgs=request.getParameter("fgs");

	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B> ʩ���ӽӵ�ͳ�ƣ�ȫ��
  <BR>(ǩ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>

<table border="1" width="110%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center"> 
  <td  width="4%" rowspan="2">����</td>
  <td  width="7%" rowspan="2">����/�೤</td>
  <td  width="7%" rowspan="2">�ӵ�����</td>
  <td  width="8%" rowspan="2">�˹����Ͻ��</td>
  <td  width="7%" rowspan="2">�ص�����</td>
  <td  width="8%" rowspan="2">�ص����</td>
  <td  width="7%" rowspan="2">������</td>
  <td colspan="4">����״̬</td>
  <td  width="7%" rowspan="2">ȫ��Ͷ��</td>
  <td  width="7%" rowspan="2">��������</td>
  <td  width="6%" rowspan="2">�����ȼ�</td>
  <td  width="6%" rowspan="2">��ϵ��</td>
  <td  width="5%" rowspan="2">�Ƿ�ͣ��</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center"> 
  <td  width="7%">Ԥ��������</td>
  <td  width="7%">Ԥ���׽��</td>
  <td  width="7%">��ʩ��</td>
  <td  width="7%">�к���</td>
  </tr>

<%
double maxje=0;

int allsl=0;
double allje=0;
int allgrsl=0;

		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();



	
	//0�������ɵ���1���ص�������2����˾������3�����ʦָ���ɵ���4���ͻ�ָ���ɵ�: 5+�󵥵�С��&6+С���ִ�&7+�������

	String sgd=null;
	String sgdmc=null;
	String tdbz=null;
	String sgdjbmc=null;
	int pm=0;
	double oldpm=0;
	int sl=0;
	int je=0;
	int grsl=0;
	int pjje=0;

	int allhdsl=0;
	int allhdje=0;



	int allgxhsl=0;
	int allyjdsl=0;
	double allyjdje=0;
	int allzsgsl=0;
	int allzhqsl=0;
	int alltssl=0;
	int allyqsl=0;


	int row=0;
	ls_sql="select sgd,sgdmc,grs,tdbz,sgdjbmc,sum(sl),sum(je)";
	ls_sql+=" from";
	ls_sql+=" (";

	ls_sql+=" select crm_khxx.sgd,sgdmc,sq_sgd.grs,DECODE(sq_sgd.tdbz,'Y','��ͣ��','N','����') tdbz,sgdjbmc,count(*) sl,sum(NVL(crm_khxx.zqgczjf,0)) je";
	ls_sql+=" from crm_khxx,sq_sgd,sq_sgdjbbm,bdm_bjjbbm";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd ";
	ls_sql+=" and sq_sgd.sgdjbbm=sq_sgdjbbm.sgdjbbm(+) ";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
	ls_sql+=" and bdm_bjjbbm.lx='1'";//1�����ײͣ�2���ײ�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";
	ls_sql+=" group by crm_khxx.sgd,sgdmc,sq_sgd.grs,sq_sgd.tdbz,sgdjbmc";

	ls_sql+=" union";

	ls_sql+=" select crm_khxx.sgd,sgdmc,sq_sgd.grs,DECODE(sq_sgd.tdbz,'Y','��ͣ��','N','����') tdbz,sgdjbmc,count(*) sl,sum(NVL(crm_tckhqye.tcsgze,0)) je";
	ls_sql+=" from crm_khxx,sq_sgd,sq_sgdjbbm,crm_tckhqye,bdm_bjjbbm";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd ";
	ls_sql+=" and sq_sgd.sgdjbbm=sq_sgdjbbm.sgdjbbm(+) ";
	ls_sql+=" and crm_khxx.khbh=crm_tckhqye.khbh ";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
	ls_sql+=" and bdm_bjjbbm.lx='2'";//1�����ײͣ�2���ײ�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";
	ls_sql+=" group by crm_khxx.sgd,sgdmc,sq_sgd.grs,sq_sgd.tdbz,sgdjbmc";

	ls_sql+=" union";

	ls_sql+=" select sgd,sgdmc,sq_sgd.grs,DECODE(sq_sgd.tdbz,'Y','��ͣ��','N','����') tdbz,sgdjbmc,0 sl,0 je";
	ls_sql+=" from sq_sgd,sq_sgdjbbm";
	ls_sql+=" where sq_sgd.sgdjbbm=sq_sgdjbbm.sgdjbbm(+) and cxbz='N'";
	ls_sql+=" and  ssfgs='"+fgs+"'";

	ls_sql+=" )";
	ls_sql+=" group by sgd,sgdmc,grs,tdbz,sgdjbmc";
	
	ls_sql+=" order by sum(je) desc";
//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sgd=rs.getString("sgd");
		sgdmc=rs.getString("sgdmc");
		grsl=rs.getInt("grs");
		tdbz=rs.getString("tdbz");
		sgdjbmc=rs.getString("sgdjbmc");
		sl=rs.getInt(6);
		je=rs.getInt(7);

		row++;

		allsl+=sl;
		allje+=je;
		allgrsl+=grsl;

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
		int hdsl=0;
		int hdje=0;
		ls_sql=" select sum(sl) sl,sum(je) je";
		ls_sql+=" from";
		ls_sql+=" (";

		ls_sql+=" select count(*) sl,sum(NVL(crm_khxx.zqgczjf,0)) je";
		ls_sql+=" from crm_khxx,bdm_bjjbbm";
		ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='1'";//1�����ײͣ�2���ײ�

		ls_sql+=" and crm_khxx.hdr='"+sgdmc+"'";
		ls_sql+=" and crm_khxx.hdbz='3'";
		//1���ǻص���2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص���5��Ա���ص�
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";

		ls_sql+=" union";

		ls_sql+=" select count(*) sl,sum(NVL(crm_tckhqye.tcsgze,0)) je";
		ls_sql+=" from crm_khxx,bdm_bjjbbm,crm_tckhqye";
		ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and crm_khxx.khbh=crm_tckhqye.khbh ";
		ls_sql+=" and bdm_bjjbbm.lx='2'";//1�����ײͣ�2���ײ�

		ls_sql+=" and crm_khxx.hdr='"+sgdmc+"'";
		ls_sql+=" and crm_khxx.hdbz='3'";
		//1���ǻص���2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص���5��Ա���ص�
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";
		
		ls_sql+=" )";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			hdsl=rs1.getInt("sl");
			hdje=rs1.getInt("je");
			allhdsl+=hdsl;
			allhdje+=hdje;
		}
		rs1.close();
		ps1.close();


		//��ϵ��
		int gxhsl=0;
		ls_sql=" select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.khlxbm!='04'";//��ͨ�ͻ�
		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";

		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gxhsl=rs1.getInt(1);
			allgxhsl+=gxhsl;
		}
		rs1.close();
		ps1.close();

		//Ԥ����
		int yjdsl=0;
		double yjdje=0;
		ls_sql=" select count(*),sum(dzbjze)";
		ls_sql+=" from crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxzt not in('2','3','4')";//0��δ������棻1: ������棻2: �ɵ����δͨ����3����ǩԼ��4���ɵ���5���ɵ����δͨ��
		ls_sql+=" and crm_zxkhxx.sgd='"+sgd+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yjdsl=rs1.getInt(1);
			yjdje=rs1.getInt(2);
			allyjdsl+=yjdsl;
			allyjdje+=yjdje;
		}
		rs1.close();
		ps1.close();

		//��ʩ��
		int zsgsl=0;
		ls_sql=" select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm not in('1','4','5')";//1��δ������2���ѿ�����3���������գ�4���깤��5���ͻ���᣻6�����ι������
		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";

		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zsgsl=rs1.getInt(1);
			allzsgsl+=zsgsl;
		}
		rs1.close();
		ps1.close();

		//�к���
		int zhqsl=0;
		ls_sql=" select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('3')";//1��δ������2���ѿ�����3���������գ�4���깤��5���ͻ���᣻6�����ι������
		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";

		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zhqsl=rs1.getInt(1);
			allzhqsl+=zhqsl;
		}
		rs1.close();
		ps1.close();

		//ȫ��Ͷ��
		int tssl=0;
		String year1=sjfw2.substring(0,4)+"-01-01";
		String year2=sjfw2;
		ls_sql=" select count(distinct crm_tsjl.tsjlh)";
		ls_sql+=" from crm_tsjl,crm_khxx,crm_tsbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_tsjl.tsbxsj>=TO_DATE('"+year1+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_tsjl.tsbxsj<=TO_DATE('"+year2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tsjl.clzt!='9'";//0��δ����1��������2���ڴ���3���᰸��9:������
		ls_sql+=" and crm_tsjl.lx='1'";//1��Ͷ�ߣ�2������ 
		ls_sql+=" and crm_tsbm.tslxbm='21'";//����Ͷ��
		ls_sql+=" and crm_tsbm.tsxlbm='2101'";//ʩ����

		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tssl=rs1.getInt(1);
			alltssl+=tssl;
		}
		rs1.close();
		ps1.close();

		//��������
		int yqsl=0;
		String mon1=sjfw2.substring(0,7)+"-01";
		String mon2=sjfw2;
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where crm_khxx.gcjdbm in('4','5')";
		ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+mon1+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_khxx.sjjgrq<=TO_DATE('"+mon2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and crm_khxx.jgrq+NVL(crm_khxx.hzts,0) < crm_khxx.sjjgrq";

		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yqsl=rs1.getInt(1);
			allyqsl+=yqsl;
		}
		rs1.close();
		ps1.close();

		if (row%2==0)
		{
			out.println("        <tr align=\"center\" bgcolor=\"#E8E8FF\">\r\n");
		}
		else{
			out.println("        <tr align=\"center\">\r\n");
		}

%>
          <td><%=pm%></td>
          <td><%=sgdmc%></td>
          <td align="right"><%=sl%></td>
          <td align="right"><A HREF="ViewSgdcz.jsp?sgd=<%=sgd%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=cf.formatDouble(je)%></A></td>
         <td align="right"><%=cf.formatDouble(hdsl)%></td>
         <td align="right"><%=cf.formatDouble(hdje)%></td>

          <td><%=grsl%></td>
          <td><A HREF="ViewSgdYjd.jsp?sgd=<%=sgd%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=yjdsl%></A></td>
         <td align="right"><%=cf.formatDouble(yjdje)%></td>
          <td><A HREF="ViewSgdZsg.jsp?sgd=<%=sgd%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=zsgsl%></A></td>
          <td><A HREF="ViewSgdZhq.jsp?sgd=<%=sgd%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=zhqsl%></A></td>
          <td><A HREF="ViewSgdTs.jsp?sgd=<%=sgd%>&sjfw=<%=year1%>&sjfw2=<%=year2%>" target="_blank"><%=tssl%></A></td>
          <td><A HREF="ViewSgdYq.jsp?sgd=<%=sgd%>&sjfw=<%=mon1%>&sjfw2=<%=mon2%>" target="_blank"><%=yqsl%></A></td>
          <td ><%=sgdjbmc%></td>
          <td ><%=gxhsl%></td>
          <td ><%=tdbz%></td>
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
	  <td colspan="2">�ϼ�</td>
	  <td align="right"><%=allsl%></td>
	  <td align="right"><%=cf.formatDouble(allje)%></td>
	  <td align="right"><%=allhdsl%></td>
	  <td align="right"><%=cf.formatDouble(allhdje)%></td>
	  <td><%=allgrsl%></td>
	  <td><%=allyjdsl%></td>
         <td align="right"><%=cf.formatDouble(allyjdje)%></td>
	  <td><%=allzsgsl%></td>
	  <td><%=allzhqsl%></td>
	  <td><%=alltssl%></td>
	  <td><%=allyqsl%></td>
	  <td>&nbsp;</td>
	  <td><%=allgxhsl%></td>
	  <td>&nbsp;</td>
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
