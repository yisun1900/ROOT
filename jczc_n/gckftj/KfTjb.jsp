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
	String wheresql="";
	String wheresql1="";


	if (!(fgs.equals("")))
	{
		wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		wheresql1+=" and  (a.ssfgs='"+fgs+"')";
	}

	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�ͷ�ͳ��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="9%">�ֹ�˾</td>
          <td  width="6%">ǩԼ��</td>
          <td  width="10%">ǩԼ��</td>
          <td  width="8%">��Ͷ�ߴ���</td>
          <td  width="7%"><font color="#FF0000">ʩ��Ͷ��<font></td>
          <td  width="7%"><font color="#FF0000">���Ͷ��<font></td>
          <td  width="7%"><font color="#FF0000">����Ͷ��<font></td>
          <td  width="7%"><font color="#FF0000">����Ͷ��<font></td>
          <td  width="7%"><font color="#FF0000">����Ͷ��<font></td>
          <td  width="8%"><font color="#FF0000">��������<font></td>
          <td  width="8%">�ط�����</td>
        </tr>
<%
String fgsmc=null;	
String fgsbh=null;	
int qys=0;
double zqye=0;
int allqys=0;
double allzqye=0;
int tszs=0;
int alltszs=0;
int bxzs=0;
int allbxzs=0;
int sgtszs=0;//ʩ��Ͷ��
int allsgtszs=0;
int sjtszs=0;//���Ͷ��
int allsjtszs=0;
int zctszs=0;//����Ͷ��
int allzctszs=0;
int jltszs=0;//����Ͷ��
int alljltszs=0;
int qttszs=0;//����Ͷ��
int allqttszs=0;
int gchfs=0;//���̻ط�
int allgchfs=0;
int tshfs=0;//Ͷ�߻ط�
int alltshfs=0;
int hfzs=0;//�ط�����
int allhfzs=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();
	ls_sql=" SELECT fgs,fgsbh,sum(qys) qys,sum(zqye) zqye";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT sq_dwxx.dwmc fgs,crm_khxx.fgsbh fgsbh,count(*) qys,sum(qye) zqye";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by sq_dwxx.dwmc,crm_khxx.fgsbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc fgs,a.dwbh fgsbh,0 qys,0 zqye ";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" group by dwmc,dwbh ";
	
	ls_sql+=" )";
	ls_sql+=" group by fgs,fgsbh ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		fgsmc=rs.getString("fgs");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");	
//Ͷ������
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			tszs=rs1.getInt("tszs");
			alltszs+=tszs;//Ͷ������
		}
		rs1.close();
		ps1.close();


//��������
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='2'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bxzs=rs1.getInt("tszs");
			allbxzs+=bxzs;//��������
		}
		rs1.close();
		ps1.close();


//ʩ��Ͷ������
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm,dm_tsxlbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and  dm_tsxlbm.tsxlbm in ('1101','1102','1103','1104','1199','2101') and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			sgtszs=rs1.getInt("tszs");
			allsgtszs+=sgtszs;//ʩ��Ͷ������
		}
		rs1.close();
		ps1.close();

//���Ͷ������
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm,dm_tsxlbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and  dm_tsxlbm.tsxlbm='2201' and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			sjtszs=rs1.getInt("tszs");
			allsjtszs+=sjtszs;//���Ͷ������
		}
		rs1.close();
		ps1.close();


//����Ͷ������
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm,dm_tsxlbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and  dm_tsxlbm.tsxlbm in ('2301','2302','2303','2304') and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zctszs=rs1.getInt("tszs");
			allzctszs+=zctszs;//����Ͷ������
		}
		rs1.close();
		ps1.close();


//����Ͷ������
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm,dm_tsxlbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and  dm_tsxlbm.tsxlbm in ('2102','2103') and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			jltszs=rs1.getInt("tszs");
			alljltszs+=jltszs;//����Ͷ������
		}
		rs1.close();
		ps1.close();

//����Ͷ������
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm,dm_tsxlbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and  dm_tsxlbm.tsxlbm not in  ('2101','2102','2103','1101','1102','1103','1103','1199','2201','2301','2302','2303','2304') and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			qttszs=rs1.getInt("tszs");
			allqttszs+=qttszs;//����Ͷ������
		}
		rs1.close();
		ps1.close();


//���̻ط�����
		ls_sql="select count(*) hfzs";
		ls_sql+=" from crm_khxx,crm_hfjl";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			gchfs=rs1.getInt("hfzs");
			allgchfs+=gchfs;//���̻ط�����
		}
		rs1.close();
		ps1.close();

//Ͷ�߻ط�����
		ls_sql="select count(*) hfzs";
		ls_sql+=" from crm_khxx,crm_tshfjl";
		ls_sql+=" where crm_tshfjl.khbh=crm_khxx.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			tshfs=rs1.getInt("hfzs");
			alltshfs+=tshfs;//Ͷ�߻ط�����
		}
		rs1.close();
		ps1.close();

		hfzs=gchfs+tshfs;
		allhfzs+=hfzs;
		allqys+=qys;
		allzqye+=zqye;
%>
        <tr align="center" >
          <td><%=fgsmc%></td>
          <td><%=qys%></td>
          <td><%=cf.formatDouble((int)zqye)%></td>
          <td align="right"><%=tszs%></td>
          <td align="right"><%=sgtszs%></td>
          <td align="right"><%=sjtszs%></td>
          <td align="right"><%=zctszs%></td>
          <td align="right"><%=jltszs%></td>
          <td align="right"><%=qttszs%></td>
          <td align="right"><%=bxzs%></td>
          <td align="right"><%=hfzs%></td>
        </tr>
<%
	}
	ps.close();
	rs.close();

%>
        <tr align="center" >
          <td><font color=red><B>�ܼ�</B></font></td>
          <td><B><%=allqys%></B></td>
          <td><B><%=cf.formatDouble((int)allzqye)%></B></td>
          <td align="right"><B><%=alltszs%></B></td>
          <td align="right"><B><%=allsgtszs%></B></td>
          <td align="right"><B><%=allsjtszs%></B></td>
          <td align="right"><B><%=allzctszs%></B></td>
          <td align="right"><B><%=alljltszs%></B></td>
          <td align="right"><B><%=allqttszs%></B></td>
          <td align="right"><B><%=allbxzs%></B></td>
          <td align="right"><B><%=allhfzs%></B></td>
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
