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


	String yy_rqsd_szs=null;
	String yy_rqsd_sze=null;
	String yy_rqsd_bzs=null;
	String yy_rqsd_bze=null;
	String zqs=request.getParameter("zqs");//������



	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String ls_sql=null;
	
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


<div align="center">��Ӫ�ؼ�ָ����ܱ�</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
	<tr>
	 <td width="11%" height="28" align="right">�������ڣ�</td>
	 <td width="20%"><%=yy_rqsd_szs%> �� <%=yy_rqsd_sze%></td>
	<td width="11%" align="right">�������ڣ�</td>
	 <td width="20%" ><%=yy_rqsd_bzs%> �� <%=yy_rqsd_bze%></td>
	 <td width="38%" >&nbsp;</td>
	
	  </tr>
</table>
<table width="150%" border="1"  cellpadding="0" cellspacing="0" style="FONT-SIZE:12">
	<tr bgcolor="#CCCCCC"  align="center">
	  <td width="138" rowspan=2 >�ֹ�˾</td>
	  <td  colspan=4 >Ŀ��ͻ�����</td>
	  <td colspan=4 >��ȡ��������</td>
	  <td colspan=4 >��Ʒ�</td>
	  <td colspan=4 >���̲�ֵ</td>
	  <td colspan=4 >���Ĳ�ֵ</td>
	 </tr>
	 <tr bgcolor="#CCCCCC" align="center">
	  <td  width="110" >���¼ƻ�</td>
	  <td  width="110" >�����ۼ�</td>
	  <td  width="110" >���´����</td>
	  <td  width="110" >����Ԥ��</td>
	  <td  width="110" >���¼ƻ�</td>
	  <td  width="110">�����ۼ�</td>
	  <td  width="110" >���´����</td>
	  <td  width="110">����Ԥ��</td>
	  <td  width="110" >���¼ƻ�</td>
	  <td  width="110" >�����ۼ�</td>
	  <td  width="110" >���´����</td>
	  <td  width="110" >����Ԥ��</td>
	  <td  width="110" >���¼ƻ�</td>
	  <td  width="110" >�����ۼ�</td>
	  <td  width="110" >���´����</td>
	  <td  width="110" >����Ԥ��</td>
	  <td  width="110" >���¼ƻ�</td>
	  <td  width="110" >�����ۼ�</td>
	  <td  width="110" >���´����</td>
	  <td  width="110" >����Ԥ��</td>
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


	int xjkh_bylj=0;//Ŀ��ͻ����������ۼ�
	int xjkh_bzyj=0;//Ŀ��ͻ���������Ԥ��
	int xjdj_bylj=0;//��ȡ�������ۼ�
	int xjdj_bzyj=0;//��ȡ������Ԥ��

	double xjyy_sjbsjf_bylj=0;//��Ʒѱ����ۼ�
	double xjyy_sjbsjf_bzyj=0;//��Ʒѱ���Ԥ��

	double xjyy_sjbgccz_bylj=0;//���̲�ֵ�����ۼ�
	double xjyy_sjbgccz_bzyj=0;//���̲�ֵ����Ԥ��

	double xjyy_jjbylj=0;//���ı����ۼ�
	double xjyy_jjbbzyj=0;//���ı���Ԥ��

	//Ŀ��ͻ�����-���´����	 
	double kh_bydcl=0;
	//����-���´����	 
	double dj_bydcl=0;
	//����-���´����	 
	double sjf_bydcl=0;
	//����-���´����	 
	double gc_bydcl=0;
	//����-���´����	 
	double zc_bydcl=0;

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

		int yy_scbkh_bylj=0;//Ŀ��ͻ����������ۼ�
		int yy_scbkh_bzyj=0;//Ŀ��ͻ���������Ԥ��
		int yy_scbdj_bylj=0;//��ȡ�������ۼ�
		int yy_scbdj_bzjh=0;//��ȡ������Ԥ��
		ls_sql="select sum(yy_scbkh_bylj),sum(yy_scbkh_bzyj),sum(yy_scbdj_bylj),sum(yy_scbdj_bzjh)";
		ls_sql+=" from yy_scb ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_scbkh_bylj=rs1.getInt(1);
			yy_scbkh_bzyj=rs1.getInt(2);
			yy_scbdj_bylj=rs1.getInt(3);
			yy_scbdj_bzjh=rs1.getInt(4);
		}
		rs1.close();
		ps1.close();

		int yy_wxbkh_bylj=0;//Ŀ��ͻ����������ۼ�
		int yy_wxbkh_bzyj=0;//Ŀ��ͻ���������Ԥ��
		int yy_wxbdj_bylj=0;//��ȡ�������ۼ�
		int yy_wxbdj_bzjh=0;//��ȡ������Ԥ��
		ls_sql="select sum(yy_wxbkh_bylj),sum(yy_wxbkh_bzyj),sum(yy_wxbdj_bylj),sum(yy_wxbdj_bzjh)";
		ls_sql+=" from yy_wxb ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_wxbkh_bylj=rs1.getInt(1);
			yy_wxbkh_bzyj=rs1.getInt(2);
			yy_wxbdj_bylj=rs1.getInt(3);
			yy_wxbdj_bzjh=rs1.getInt(4);
		}
		rs1.close();
		ps1.close();

		int yy_qtqdkh_bylj=0;//Ŀ��ͻ����������ۼ�
		int yy_qtqdkh_bzyj=0;//Ŀ��ͻ���������Ԥ��
		int yy_qtqddj_bylj=0;//��ȡ�������ۼ�
		int yy_qtqddj_bzyj=0;//��ȡ������Ԥ��
		ls_sql="select sum(yy_qtqdkh_bylj),sum(yy_qtqdkh_bzyj),sum(yy_qtqddj_bylj),sum(yy_qtqddj_bzyj)";
		ls_sql+=" from yy_qtqd ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_qtqdkh_bylj=rs1.getInt(1);
			yy_qtqdkh_bzyj=rs1.getInt(2);
			yy_qtqddj_bylj=rs1.getInt(3);
			yy_qtqddj_bzyj=rs1.getInt(4);
		}
		rs1.close();
		ps1.close();



		int kh_bylj=yy_scbkh_bylj+yy_wxbkh_bylj+yy_qtqdkh_bylj;//Ŀ��ͻ����������ۼ�
		int kh_bzyj=yy_scbkh_bzyj+yy_wxbkh_bzyj+yy_qtqdkh_bzyj;//Ŀ��ͻ���������Ԥ��
		int dj_bylj=yy_scbdj_bylj+yy_wxbdj_bylj+yy_qtqddj_bylj;//��ȡ�������ۼ�
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
		 
		double yy_sjbsjf_bylj=0;//��Ʒѱ����ۼ�
		double yy_sjbsjf_bzyj=0;//��Ʒѱ���Ԥ��

		double yy_sjbgccz_bylj=0;//���̲�ֵ�����ۼ�
		double yy_sjbgccz_bzyj=0;//���̲�ֵ����Ԥ��
	 	
		ls_sql="select sum(yy_sjbsjf_bylj),sum(yy_sjbsjf_bzyj),sum(yy_sjbgccz_bylj),sum(yy_sjbgccz_bzyj)";
		ls_sql+=" from yy_sjb";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'" ;
		ps1 =conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_sjbsjf_bylj=rs1.getDouble(1);
			yy_sjbsjf_bzyj=rs1.getDouble(2);
			yy_sjbgccz_bylj=rs1.getDouble(3);
			yy_sjbgccz_bzyj=rs1.getDouble(4);
		}
		rs1.close();
		ps1.close();


		double yy_jjbylj=0;//���ı����ۼ�
		double yy_jjbbzyj=0;//���ı���Ԥ��
		ls_sql="select sum(yy_jjbylj),sum(yy_jjbbzyj)";
		ls_sql+=" from yy_jjb";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'" ;
		ps1 =conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_jjbylj=rs1.getDouble(1);
			yy_jjbbzyj=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

 		//��Ʒ�-���´����	 
		if (yy_sjsjb_sjf!=0)
		{
			sjf_bydcl=cf.round(yy_sjbsjf_bylj*100.0/yy_sjsjb_sjf,2);
		}
		else{
			sjf_bydcl=0;
		}
		//����-���´����	 
		if (yy_sjsjb_gccz!=0)
		{
			gc_bydcl=cf.round(yy_sjbgccz_bylj*100.0/yy_sjsjb_gccz,2);
		}
		else{
			gc_bydcl=0;
		}
		//����-���´����	 
		if (yy_sjjjb_byjh!=0)
		{
			zc_bydcl=cf.round(yy_jjbylj*100.0/yy_sjjjb_byjh,2);
		}
		else{
			zc_bydcl=0;
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


		xjkh_bylj+=kh_bylj;//Ŀ��ͻ����������ۼ�
		xjkh_bzyj+=kh_bzyj;//Ŀ��ͻ���������Ԥ��
		xjdj_bylj+=dj_bylj;//��ȡ�������ۼ�
		xjdj_bzyj+=dj_bzyj;//��ȡ������Ԥ��

		xjyy_sjbsjf_bylj+=yy_sjbsjf_bylj;//��Ʒѱ����ۼ�
		xjyy_sjbsjf_bzyj+=yy_sjbsjf_bzyj;//��Ʒѱ���Ԥ��

		xjyy_sjbgccz_bylj+=yy_sjbgccz_bylj;//���̲�ֵ�����ۼ�
		xjyy_sjbgccz_bzyj+=yy_sjbgccz_bzyj;//���̲�ֵ����Ԥ��

		xjyy_jjbylj+=yy_jjbylj;//���ı����ۼ�
		xjyy_jjbbzyj+=yy_jjbbzyj;//���ı���Ԥ��
	     
   %>
  <tr align="center">
	<td ><%=dwmc%></td>

	<td ><%=yy_sjzky_mbkh %></td> 
	<td ><%=kh_bylj%></td>  
	<td ><%=kh_bydcl%>%</td>  
	<td ><%=kh_bzyj%></td>  

	<td ><%=yy_sjzky_sqdj%></td>  
	<td ><%=dj_bylj%></td>  
	<td ><%=dj_bydcl%>%</td>  
	<td ><%=dj_bzyj%></td>  

    <td ><%=yy_sjsjb_sjf%></td> 
	<td ><%=yy_sjbsjf_bylj%></td>  
	<td ><%=sjf_bydcl%>%</td>  
	<td ><%=yy_sjbsjf_bzyj%></td>  

	<td ><%=yy_sjsjb_gccz%></td>  
	<td ><%=yy_sjbgccz_bylj%></td>  
	<td ><%=gc_bydcl%>%</td>  
	<td ><%=yy_sjbgccz_bzyj%></td>  

	<td ><%=yy_sjjjb_byjh%></td>  
	<td ><%=yy_jjbylj%></td>  
	<td ><%=zc_bydcl%>%</td>  
	<td ><%=yy_jjbbzyj%></td>  
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

	//����-���´����	 
	if (xjyy_sjsjb_sjf!=0)
	{
		sjf_bydcl=cf.round(xjyy_sjbsjf_bylj*100.0/xjyy_sjsjb_sjf,2);
	}
	else{
		sjf_bydcl=0;
	}
	//����-���´����	 
	if (xjyy_sjsjb_gccz!=0)
	{
		gc_bydcl=cf.round(xjyy_sjbgccz_bylj*100.0/xjyy_sjsjb_gccz,2);
	}
	else{
		gc_bydcl=0;
	}
	//����-���´����	 
	if (xjyy_sjjjb_byjh!=0)
	{
		zc_bydcl=cf.round(xjyy_jjbylj*100.0/xjyy_sjjjb_byjh,2);
	}
	else{
		zc_bydcl=0;
	}
%>
  <tr align="center">
	<td >С ��</td>

	<td ><%=xjyy_sjzky_mbkh %></td> 
	<td ><%=xjkh_bylj%></td>  
	<td ><%=kh_bydcl%>%</td>  
	<td ><%=xjkh_bzyj%></td>  

	<td ><%=xjyy_sjzky_sqdj%></td>  
	<td ><%=xjdj_bylj%></td>  
	<td ><%=dj_bydcl%>%</td>  
	<td ><%=xjdj_bzyj%></td>  

    <td ><%=xjyy_sjsjb_sjf%></td> 
	<td ><%=xjyy_sjbsjf_bylj%></td>  
	<td ><%=sjf_bydcl%>%</td>  
	<td ><%=xjyy_sjbsjf_bzyj%></td>  

	<td ><%=xjyy_sjsjb_gccz%></td>  
	<td ><%=xjyy_sjbgccz_bylj%></td>  
	<td ><%=gc_bydcl%>%</td>  
	<td ><%=xjyy_sjbgccz_bzyj%></td>  

	<td ><%=xjyy_sjjjb_byjh%></td>  
	<td ><%=xjyy_jjbylj%></td>  
	<td ><%=zc_bydcl%>%</td>  
	<td ><%=xjyy_jjbbzyj%></td>  
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

</table>
</body>

</html>
