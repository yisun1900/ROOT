<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}



	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String ls_sql=null;

	
	
	String yy_rqsd_szs=null;
	String yy_rqsd_sze=null;
	String yy_rqsd_bzs=null;
	String yy_rqsd_bze=null;
	String zqs=request.getParameter("zqs");//������
	try
	{
		conn=cf.getConnection();

		ls_sql="SELECT yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
		ls_sql+=" FROM yy_rqsd ";
		ls_sql+=" where zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			yy_rqsd_szs=cf.fillNull(rs.getDate("yy_rqsd_szs"));
			yy_rqsd_sze=cf.fillNull(rs.getDate("yy_rqsd_sze"));
			yy_rqsd_bzs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
			yy_rqsd_bze=cf.fillNull(rs.getDate("yy_rqsd_bze"));
		}
		rs.close();
		ps.close();
%>

<body>

<div align="center">�ܿ�Դ����</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr>
 <td width="11%" height="28" align="right">�������ڣ�</td>
 <td width="20%"><%=yy_rqsd_szs%> �� <%=yy_rqsd_sze%></td>
<td width="11%" align="right">�������ڣ�</td>
 <td width="20%" ><%=yy_rqsd_bzs%> �� <%=yy_rqsd_bze%></td>
 <td width="38%" >&nbsp;</td>

  </tr>
</table>
<table width="100%" height="144" border="1"  cellpadding="0" cellspacing="0" style="FONT-SIZE:12">
	  <tr height=28  align="center" bgcolor="#CCCCCC"  >
	  <td width="66" rowspan=2 align="center">�ֹ�˾</td>
	  <td height="22" colspan=7 align="center">Ŀ��ͻ�����</td>
	  <td colspan=8 align="center">��ȡ��������</td>
	  </tr>
	  <tr bgcolor="#CCCCCC"   align="center">
	  <td  width="60"  >���¼ƻ�</td>
	  <td  width="60"  >���¼ƻ�<br>(����Ҫ��)</td>
	  <td  width="60" >�����ۼ�</td>
	  <td  width="60" >���´����</td>
	  <td  width="60" >���ܼƻ�</td>
	  <td  width="60" >�������</td>
	  <td  width="60" >����Ԥ��</td>
	  <td  width="60"  >���¼ƻ�</td>
	  <td  width="60"  >���¼ƻ�<br>(����Ҫ��)</td>
	  <td  width="60" >�����ۼ�</td>
	  <td  width="60" >���´����</td>
	  <td  width="60" >���¶���ɹ���</td>
	  <td  width="60" >���ܼƻ�</td>
	  <td  width="60" >�������</td>
	  <td  width="60" >����Ԥ��</td>
	 </tr>
 <%
	int xjyy_sjzky_mbkh=0;//�ܿ�ԴĿ��ͻ��������¼ƻ�
	int xjyy_sjzky_sqdj=0;//�ܿ�Դ��ȡ�����������¼ƻ�

	double xjyy_sjsjb_sjf=0;//��Ʋ���Ʒѱ��¼ƻ�
	double xjyy_sjsjb_tqsjf=0;//��Ʋ�ȥ��ͬ���¶���Ʒ�
	double xjyy_sjsjb_gccz=0;//��Ʋ����̲�ֵ���¼ƻ�
	double xjyy_sjsjb_tqgccz=0;//��Ʋ�ȥ��ͬ���¶ȹ��̲�ֵ
	double xjyy_sjjjb_byjh=0;//�ҾӲ����Ĳ�ֵ���¼ƻ�
	double xjyy_sjjjb_qntq=0;//�ҾӲ�ȥ��ͬ���¶����Ĳ�ֵ

	int xjyy_sjscb_mbkh=0;//�г���Ŀ��ͻ��������¼ƻ�
	int xjyy_sjwxb_mbkh=0;//�г�����ȡ�����������¼ƻ�
	int xjyy_sjqtqd_mbkh=0;//������Ŀ��ͻ��������¼ƻ�
	int xjyy_sjscb_sqdj=0;//��������ȡ�����������¼ƻ�
	int xjyy_sjwxb_sqdj=0;//��������Ŀ��ͻ��������¼ƻ�
	int xjyy_sjqtqd_sqdj=0;//����������ȡ�����������¼ƻ�


	int xjkh_byjh=0;//Ŀ��ͻ��������¼ƻ�
	int xjkh_bylj=0;//Ŀ��ͻ����������ۼ�
	int xjkh_szjh=0;//Ŀ��ͻ��������ܼƻ�
	int xjkh_szwc=0;//Ŀ��ͻ������������
	int xjkh_bzyj=0;//Ŀ��ͻ���������Ԥ��

	int xjdj_byjh=0;//��ȡ�����¼ƻ�
	int xjdj_bylj=0;//��ȡ�������ۼ�
	int xjdj_szjh=0;//��ȡ�������ܼƻ�
	int xjdj_szwc=0;//��ȡ�����������
	int xjdj_bzyj=0;//��ȡ������Ԥ��


	//Ŀ��ͻ�����-���´����	 
	double kh_bydcl=0;
	//����-���´����	 
	double dj_bydcl=0;
	//���¶���ɹ���
	double djcgl=0;

	String dwmc=null;
	String dwbh=null;
    ls_sql="select dwbh,dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
    ls_sql+=" order by dwbh";
    ps = conn.prepareStatement(ls_sql);
    rs =ps.executeQuery();
	while(rs.next())
	{
		dwbh=rs.getString("dwbh");	
		dwmc=rs.getString("dwmc");	

		int yy_sjzky_mbkh=0;//�ܿ�ԴĿ��ͻ��������¼ƻ�
		int yy_sjzky_sqdj=0;//�ܿ�Դ��ȡ�����������¼ƻ�

		double yy_sjsjb_sjf=0;//��Ʋ���Ʒѱ��¼ƻ�
		double yy_sjsjb_tqsjf=0;//��Ʋ�ȥ��ͬ���¶���Ʒ�
		double yy_sjsjb_gccz=0;//��Ʋ����̲�ֵ���¼ƻ�
		double yy_sjsjb_tqgccz=0;//��Ʋ�ȥ��ͬ���¶ȹ��̲�ֵ
		double yy_sjjjb_byjh=0;//�ҾӲ����Ĳ�ֵ���¼ƻ�
		double yy_sjjjb_qntq=0;//�ҾӲ�ȥ��ͬ���¶����Ĳ�ֵ

		int yy_sjscb_mbkh=0;//�г���Ŀ��ͻ��������¼ƻ�
		int yy_sjwxb_mbkh=0;//�г�����ȡ�����������¼ƻ�
		int yy_sjqtqd_mbkh=0;//������Ŀ��ͻ��������¼ƻ�
		int yy_sjscb_sqdj=0;//��������ȡ�����������¼ƻ�
		int yy_sjwxb_sqdj=0;//��������Ŀ��ͻ��������¼ƻ�
		int yy_sjqtqd_sqdj=0;//����������ȡ�����������¼ƻ�

		ls_sql="select yy_sjzky_mbkh,yy_sjzky_sqdj,yy_sjsjb_sjf,yy_sjsjb_tqsjf,yy_sjsjb_gccz,yy_sjsjb_tqgccz,yy_sjjjb_byjh,yy_sjjjb_qntq,yy_sjscb_mbkh,yy_sjwxb_mbkh,yy_sjqtqd_mbkh,yy_sjscb_sqdj,yy_sjwxb_sqdj,yy_sjqtqd_sqdj,yy_sj_lrsj,lrr ";
		ls_sql+=" from  yy_sj";
		ls_sql+=" where zqs="+zqs+" and yy_sj_fgs='"+dwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yy_sjzky_mbkh=rs1.getInt("yy_sjzky_mbkh");
			yy_sjzky_sqdj=rs1.getInt("yy_sjzky_sqdj");

			yy_sjsjb_sjf=rs1.getDouble("yy_sjsjb_sjf");
			yy_sjsjb_tqsjf=rs1.getDouble("yy_sjsjb_tqsjf");
			yy_sjsjb_gccz=rs1.getDouble("yy_sjsjb_gccz");
			yy_sjsjb_tqgccz=rs1.getDouble("yy_sjsjb_tqgccz");
			yy_sjjjb_byjh=rs1.getDouble("yy_sjjjb_byjh");
			yy_sjjjb_qntq=rs1.getDouble("yy_sjjjb_qntq");

			yy_sjscb_mbkh=rs1.getInt("yy_sjscb_mbkh");
			yy_sjwxb_mbkh=rs1.getInt("yy_sjwxb_mbkh");
			yy_sjqtqd_mbkh=rs1.getInt("yy_sjqtqd_mbkh");
			yy_sjscb_sqdj=rs1.getInt("yy_sjscb_sqdj");
			yy_sjwxb_sqdj=rs1.getInt("yy_sjwxb_sqdj");
			yy_sjqtqd_sqdj=rs1.getInt("yy_sjqtqd_sqdj");
		}
		rs1.close();
		ps1.close();
	  
		int yy_scbkh_byjh=0;//Ŀ��ͻ��������¼ƻ�
		int yy_scbkh_bylj=0;//Ŀ��ͻ����������ۼ�
		int yy_scbkh_szjh=0;//Ŀ��ͻ��������ܼƻ�
		int yy_scbkh_szwc=0;//Ŀ��ͻ������������
		int yy_scbkh_bzyj=0;//Ŀ��ͻ���������Ԥ��

		int yy_scbdj_byjh=0;//��ȡ�����¼ƻ�
		int yy_scbdj_bylj=0;//��ȡ�������ۼ�
		int yy_scbdj_szjh=0;//��ȡ�������ܼƻ�
		int yy_scbdj_szwc=0;//��ȡ�����������
		int yy_scbdj_bzjh=0;//��ȡ������Ԥ��
		ls_sql="select sum(yy_scbkh_byjh),sum(yy_scbkh_bylj),sum(yy_scbkh_szjh),sum(yy_scbkh_szwc),sum(yy_scbkh_bzyj) ";
		ls_sql+="     ,sum(yy_scbdj_byjh),sum(yy_scbdj_bylj),sum(yy_scbdj_szjh),sum(yy_scbdj_szwc),sum(yy_scbdj_bzjh)";
		ls_sql+=" from yy_scb ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_scbkh_byjh=rs1.getInt(1);
			yy_scbkh_bylj=rs1.getInt(2);
			yy_scbkh_szjh=rs1.getInt(3);
			yy_scbkh_szwc=rs1.getInt(4);
			yy_scbkh_bzyj=rs1.getInt(5);

			yy_scbdj_byjh=rs1.getInt(6);
			yy_scbdj_bylj=rs1.getInt(7);
			yy_scbdj_szjh=rs1.getInt(8);
			yy_scbdj_szwc=rs1.getInt(9);
			yy_scbdj_bzjh=rs1.getInt(10);
		}
		rs1.close();
		ps1.close();
	  
		int yy_wxbkh_byjh=0;//Ŀ��ͻ��������¼ƻ�
		int yy_wxbkh_bylj=0;//Ŀ��ͻ����������ۼ�
		int yy_wxbkh_szjh=0;//Ŀ��ͻ��������ܼƻ�
		int yy_wxbkh_szwc=0;//Ŀ��ͻ������������
		int yy_wxbkh_bzyj=0;//Ŀ��ͻ���������Ԥ��

		int yy_wxbdj_byjh=0;//��ȡ�����¼ƻ�
		int yy_wxbdj_bylj=0;//��ȡ�������ۼ�
		int yy_wxbdj_szjh=0;//��ȡ�������ܼƻ�
		int yy_wxbdj_szwc=0;//��ȡ�����������
		int yy_wxbdj_bzjh=0;//��ȡ������Ԥ��
		ls_sql="select sum(yy_wxbkh_byjh),sum(yy_wxbkh_bylj),sum(yy_wxbkh_szjh),sum(yy_wxbkh_szwc),sum(yy_wxbkh_bzyj) ";
		ls_sql+="     ,sum(yy_wxbdj_byjh),sum(yy_wxbdj_bylj),sum(yy_wxbdj_szjh),sum(yy_wxbdj_szwc),sum(yy_wxbdj_bzjh)";
		ls_sql+=" from yy_wxb ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_wxbkh_byjh=rs1.getInt(1);
			yy_wxbkh_bylj=rs1.getInt(2);
			yy_wxbkh_szjh=rs1.getInt(3);
			yy_wxbkh_szwc=rs1.getInt(4);
			yy_wxbkh_bzyj=rs1.getInt(5);

			yy_wxbdj_byjh=rs1.getInt(6);
			yy_wxbdj_bylj=rs1.getInt(7);
			yy_wxbdj_szjh=rs1.getInt(8);
			yy_wxbdj_szwc=rs1.getInt(9);
			yy_wxbdj_bzjh=rs1.getInt(10);
		}
		rs1.close();
		ps1.close();
	  
		int yy_qtqdkh_byjh=0;//Ŀ��ͻ��������¼ƻ�
		int yy_qtqdkh_bylj=0;//Ŀ��ͻ����������ۼ�
		int yy_qtqdkh_szjh=0;//Ŀ��ͻ��������ܼƻ�
		int yy_qtqdkh_szwc=0;//Ŀ��ͻ������������
		int yy_qtqdkh_bzyj=0;//Ŀ��ͻ���������Ԥ��

		int yy_qtqddj_byjh=0;//��ȡ�����¼ƻ�
		int yy_qtqddj_bylj=0;//��ȡ�������ۼ�
		int yy_qtqddj_szjh=0;//��ȡ�������ܼƻ�
		int yy_qtqddj_szwc=0;//��ȡ�����������
		int yy_qtqddj_bzyj=0;//��ȡ������Ԥ��
		ls_sql="select sum(yy_qtqdkh_byjh),sum(yy_qtqdkh_bylj),sum(yy_qtqdkh_szjh),sum(yy_qtqdkh_szwc),sum(yy_qtqdkh_bzyj) ";
		ls_sql+="     ,sum(yy_qtqddj_byjh),sum(yy_qtqddj_bylj),sum(yy_qtqddj_szjh),sum(yy_qtqddj_szwc),sum(yy_qtqddj_bzyj)";
		ls_sql+=" from yy_qtqd ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_qtqdkh_byjh=rs1.getInt(1);
			yy_qtqdkh_bylj=rs1.getInt(2);
			yy_qtqdkh_szjh=rs1.getInt(3);
			yy_qtqdkh_szwc=rs1.getInt(4);
			yy_qtqdkh_bzyj=rs1.getInt(5);

			yy_qtqddj_byjh=rs1.getInt(6);
			yy_qtqddj_bylj=rs1.getInt(7);
			yy_qtqddj_szjh=rs1.getInt(8);
			yy_qtqddj_szwc=rs1.getInt(9);
			yy_qtqddj_bzyj=rs1.getInt(10);
		}
		rs1.close();
		ps1.close();



		int kh_byjh=yy_scbkh_byjh+yy_wxbkh_byjh+yy_qtqdkh_byjh;//Ŀ��ͻ��������¼ƻ�
		int kh_bylj=yy_scbkh_bylj+yy_wxbkh_bylj+yy_qtqdkh_bylj;//Ŀ��ͻ����������ۼ�
		int kh_szjh=yy_scbkh_szjh+yy_wxbkh_szjh+yy_qtqdkh_szjh;//Ŀ��ͻ��������ܼƻ�
		int kh_szwc=yy_scbkh_szwc+yy_wxbkh_szwc+yy_qtqdkh_szwc;//Ŀ��ͻ������������
		int kh_bzyj=yy_scbkh_bzyj+yy_wxbkh_bzyj+yy_qtqdkh_bzyj;//Ŀ��ͻ���������Ԥ��

		int dj_byjh=yy_scbdj_byjh+yy_wxbdj_byjh+yy_qtqddj_byjh;//��ȡ�����¼ƻ�
		int dj_bylj=yy_scbdj_bylj+yy_wxbdj_bylj+yy_qtqddj_bylj;//��ȡ�������ۼ�
		int dj_szjh=yy_scbdj_szjh+yy_wxbdj_szjh+yy_qtqddj_szjh;//��ȡ�������ܼƻ�
		int dj_szwc=yy_scbdj_szwc+yy_wxbdj_szwc+yy_qtqddj_szwc;//��ȡ�����������
		int dj_bzyj=yy_scbdj_bzjh+yy_wxbdj_bzjh+yy_qtqddj_bzyj;//��ȡ������Ԥ��
	
		//Ŀ��ͻ�����-���´����	 
		if (yy_sjzky_mbkh!=0)
		{
			kh_bydcl=cf.round(kh_bylj*100.0/yy_sjzky_mbkh,2);
		}
		else{
			kh_bydcl=0;
		}

		//����-���´����	 
		if (yy_sjzky_sqdj!=0)
		{
			dj_bydcl=cf.round(dj_bylj*100.0/yy_sjzky_sqdj,2);
		}
		else{
			dj_bydcl=0;
		}

		//���¶���ɹ���
		if (kh_bylj!=0)
		{
			djcgl=cf.round(dj_bylj*100.0/kh_bylj,2);
		}
		else{
			djcgl=0;
		}
	
		xjyy_sjzky_mbkh+=yy_sjzky_mbkh;//�ܿ�ԴĿ��ͻ��������¼ƻ�
		xjyy_sjzky_sqdj+=yy_sjzky_sqdj;//�ܿ�Դ��ȡ�����������¼ƻ�

		xjyy_sjsjb_sjf+=yy_sjsjb_sjf;//��Ʋ���Ʒѱ��¼ƻ�
		xjyy_sjsjb_tqsjf+=yy_sjsjb_tqsjf;//��Ʋ�ȥ��ͬ���¶���Ʒ�
		xjyy_sjsjb_gccz+=yy_sjsjb_gccz;//��Ʋ����̲�ֵ���¼ƻ�
		xjyy_sjsjb_tqgccz+=yy_sjsjb_tqgccz;//��Ʋ�ȥ��ͬ���¶ȹ��̲�ֵ
		xjyy_sjjjb_byjh+=yy_sjjjb_byjh;//�ҾӲ����Ĳ�ֵ���¼ƻ�
		xjyy_sjjjb_qntq+=yy_sjjjb_qntq;//�ҾӲ�ȥ��ͬ���¶����Ĳ�ֵ

		xjyy_sjscb_mbkh+=yy_sjscb_mbkh;//�г���Ŀ��ͻ��������¼ƻ�
		xjyy_sjwxb_mbkh+=yy_sjwxb_mbkh;//�г�����ȡ�����������¼ƻ�
		xjyy_sjqtqd_mbkh+=yy_sjqtqd_mbkh;//������Ŀ��ͻ��������¼ƻ�
		xjyy_sjscb_sqdj+=yy_sjscb_sqdj;//��������ȡ�����������¼ƻ�
		xjyy_sjwxb_sqdj+=yy_sjwxb_sqdj;//��������Ŀ��ͻ��������¼ƻ�
		xjyy_sjqtqd_sqdj+=yy_sjqtqd_sqdj;//����������ȡ�����������¼ƻ�


		xjkh_byjh+=kh_byjh;//Ŀ��ͻ��������¼ƻ�
		xjkh_bylj+=kh_bylj;//Ŀ��ͻ����������ۼ�
		xjkh_szjh+=kh_szjh;//Ŀ��ͻ��������ܼƻ�
		xjkh_szwc+=kh_szwc;//Ŀ��ͻ������������
		xjkh_bzyj+=kh_bzyj;//Ŀ��ͻ���������Ԥ��

		xjdj_byjh+=dj_byjh;//��ȡ�����¼ƻ�
		xjdj_bylj+=dj_bylj;//��ȡ�������ۼ�
		xjdj_szjh+=dj_szjh;//��ȡ�������ܼƻ�
		xjdj_szwc+=dj_szwc;//��ȡ�����������
		xjdj_bzyj+=dj_bzyj;//��ȡ������Ԥ��

   %>
  <tr align="center">
	<td ><%=dwmc%></td>

	<td ><%=kh_byjh%></td> 
	<td ><%=yy_sjzky_mbkh %></td> 
	<td ><%=kh_bylj%></td>  
	<td ><%=kh_bydcl%>%</td>  
	<td ><%=kh_szjh%></td>  
	<td ><%=kh_szwc%></td>  
	<td ><%=kh_bzyj%></td>  

	<td ><%=dj_byjh%></td>  
	<td ><%=yy_sjzky_sqdj%></td>  
	<td ><%=dj_bylj%></td>  
	<td ><%=dj_bydcl%>%</td>  
	<td ><%=djcgl%>%</td>  
	<td ><%=dj_szjh%></td>  
	<td ><%=dj_szwc%></td>  
	<td ><%=dj_bzyj%></td>  
</tr> 
<%		 
	  }
	   rs.close();
	   ps.close();

	//Ŀ��ͻ�����-���´����	 
	if (xjyy_sjzky_mbkh!=0)
	{
		kh_bydcl=cf.round(xjkh_bylj*100.0/xjyy_sjzky_mbkh,2);
	}
	else{
		kh_bydcl=0;
	}

	//����-���´����	 
	if (xjyy_sjzky_sqdj!=0)
	{
		dj_bydcl=cf.round(xjdj_bylj*100.0/xjyy_sjzky_sqdj,2);
	}
	else{
		dj_bydcl=0;
	}
	   
	//���¶���ɹ���
	if (xjkh_bylj!=0)
	{
		djcgl=cf.round(xjdj_bylj*100.0/xjkh_bylj,2);
	}
	else{
		djcgl=0;
	}
%>
  <tr align="center">
	<td >С ��</td>

	<td ><%=xjkh_byjh%></td> 
	<td ><%=xjyy_sjzky_mbkh %></td> 
	<td ><%=xjkh_bylj%></td>  
	<td ><%=kh_bydcl%>%</td>  
	<td ><%=xjkh_szjh%></td>  
	<td ><%=xjkh_szwc%></td>  
	<td ><%=xjkh_bzyj%></td>  

	<td ><%=xjdj_byjh%></td>  
	<td ><%=xjyy_sjzky_sqdj%></td>  
	<td ><%=xjdj_bylj%></td>  
	<td ><%=dj_bydcl%>%</td>  
	<td ><%=djcgl%>%</td>  
	<td ><%=xjdj_szjh%></td>  
	<td ><%=xjdj_szwc%></td>  
	<td ><%=xjdj_bzyj%></td>  
</tr> 

<%	
	  
}
  
catch (Exception e) {
	out.print("Exception: " + e);
	out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
</tr> 
</table>
</body>

</html>
