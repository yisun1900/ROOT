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

String fgs=request.getParameter("fgs");

String wheresql="";
String wheresql2="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	wheresql2+=" where ssdqbm=(select ssdqbm from sq_dwxx where dwbh='"+fgs+"')";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
try {
	conn=cf.getConnection();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>ҵ��Ա�����ʦ������ͳ�Ʊ�</B><BR>
</CENTER>
  <table width="800" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center" bgcolor="#CCCCCC">  
      <td  width="40">���</td>
      <td  width="60">����</td>
      <td  width="90">�ֹ�˾</td>
      <td  width="40">Ա������</td>
	  <td  width="40">ҵ��Ա</td>
	  <td  width="40">ҵ��Առ��</td>
      <td  width="40">���ʦ</td>
	  <td  width="40">���ʦռ��</td>
      <td  width="40">����</td>
	  <td  width="40">����ռ��</td>
      <td  width="40">����������Ա</td>
	  <td  width="40">����������Առ��</td>
  <%
	int i=1;

	String ssdqmc=null;//����
	String ssdqbm=null;
	String fgsmc=null;//�ֹ�˾����
    String fgsbh=null;

	int ygzs=0;//Ա������
	int ywys=0;//ҵ��Ա��
	int sjss=0;//���ʦ��
	int jls=0;//������
	int qtglys=0;//��������Ա��

    int ygzsxj=0;//Ա������С��
	int ywysxj=0;//ҵ��Ա��С��
	int sjssxj=0;//���ʦ��С��
	int jlsxj=0;//������С��
	int qtglysxj=0;//��������Ա��С��

	int ygzszj=0;//Ա�������ܼ�
	int ywyszj=0;//ҵ��Ա���ܼ�
	int sjsszj=0;//���ʦ���ܼ�
	int jlszj=0;//�������ܼ�
	int qtglyszj=0;//��������Ա���ܼ�

	double ywybfb=0;//ҵ��Առ��
	double sjsbfb=0;//���ʦռ��
	double jlbfb=0;//����ռ��
	double qtglybfb=0;//��������Առ��

	double ywybxjfb=0;//ҵ��ԱС��ռ��
	double sjsbxjfb=0;//���ʦС��ռ��
	double jlbxjfb=0;//����С��ռ��
	double qtglybxjfb=0;//��������ԱС��ռ��

	double ywybzjfb=0;//ҵ��Ա�ܼ�ռ��
	double sjsbzjfb=0;//���ʦ�ܼ�ռ��
	double jlbzjfb=0;//�����ܼ�ռ��
	double qtglybzjfb=0;//��������Ա�ܼ�ռ��
	%>
<%
	ls_sql=" SELECT ssdqbm,ssdqmc ";
	ls_sql+=" FROM sq_ssdqbm";
	ls_sql+=wheresql2;
	ls_sql+=" order by ssdqbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{		
		ssdqbm=rs.getString("ssdqbm");
		ssdqmc=rs.getString("ssdqmc");
		//�ֹ�˾
		
		ls_sql="SELECT dwbh,dwmc ";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where  dwlx='F0' and ssdqbm='"+ssdqbm+"' and cxbz='N'";
		ls_sql+=wheresql;
		ls_sql+=" order by dwbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
	
		while (rs1.next())
		{
			fgsbh=rs1.getString("dwbh");
			fgsmc=rs1.getString("dwmc");

			ls_sql="SELECT count(*)";
			ls_sql+=" FROM sq_yhxx";
			ls_sql+=" where sq_yhxx.sfzszg in('Y','N','D') and ssfgs='"+fgsbh+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				ygzs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();


			ygzsxj+=ygzs;

			ls_sql="SELECT count(*)";
			ls_sql+=" FROM sq_yhxx";
			ls_sql+=" where sq_yhxx.sfzszg in('Y','N','D') and zwbm='19' and ssfgs='"+fgsbh+"'";//19:ҵ��Ա
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				ywys=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			ywysxj+=ywys;
			
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM sq_yhxx";
			ls_sql+=" where sq_yhxx.sfzszg in('Y','N','D') and zwbm='04' and ssfgs='"+fgsbh+"'";//04�����ʦ
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				sjss=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			sjssxj+=sjss;

			ls_sql="SELECT count(*)";
			ls_sql+=" FROM sq_yhxx";
			ls_sql+=" where sq_yhxx.sfzszg in('Y','N','D') and zwbm='05' and ssfgs='"+fgsbh+"'";//05:�ʼ�
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				jls=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			jlsxj+=jls;

			qtglys=ygzs-ywys-sjss-jls;
	
			if (ygzs==0)
			{
				ywybfb=0;
				sjsbfb=0;
				jlbfb=0;
				qtglybfb=0;
			}
			else{
				ywybfb=ywys*100.0/ygzs;
				sjsbfb=sjss*100.0/ygzs;
			    jlbfb=jls*100.0/ygzs;
			    qtglybfb=qtglys*100.0/ygzs;
			}
	%>
		</tr>
		<tr align="center" bgcolor="#FFFFFF">
			<td rowspan=""><%=i++%></td>
			<td rowspan=""><%=ssdqmc%></td>
			<td ><%=fgsmc%></td>
			<td ><%=ygzs%></td>
			<td ><%=ywys%></td>
			<td ><%=cf.round(ywybfb,1)%>%</td>
			<td ><%=sjss%></td>
            <td ><%=cf.round(sjsbfb,1)%>%</td>
			<td ><%=jls%></td>
            <td ><%=cf.round(jlbfb,1)%>%</td>
			<td ><%=qtglys%></td>
			<td ><%=cf.round(qtglybfb,1)%>%</td>
		</tr>
	<%
		}
		rs1.close();
		ps1.close();

		qtglysxj=ygzsxj-ywysxj-sjssxj-jlsxj;
		if(ygzsxj==0)
		{
			ywybxjfb=0;
			sjsbxjfb=0;
			jlbxjfb=0;
			qtglybxjfb=0;
		}
		else{
			ywybxjfb=ywysxj*100.0/ygzsxj;
			sjsbxjfb=sjssxj*100.0/ygzsxj;
			jlbxjfb=jlsxj*100.0/ygzsxj;
			qtglybxjfb=qtglysxj*100.0/ygzsxj;
		}

		%>
		<tr align="center" bgcolor="#E8E8FF"> 
		  <td colspan="3" ><B>��<%=ssdqmc%>���ϼ�</B></td>
				
		  <td ><%=ygzsxj%></td>
		  <td ><%=ywysxj%></td>
		  <td ><%=cf.round(ywybxjfb,1)%>%</td>
		  <td ><%=sjssxj%></td>
		  <td ><%=cf.round(sjsbxjfb,1)%>%</td>
		  <td ><%=jlsxj%></td>
		  <td ><%=cf.round(jlbxjfb,1)%>%</td>
		  <td ><%=qtglysxj%></td> 
		  <td ><%=cf.round(qtglybxjfb,1)%>%</td>
		<%
		 ygzszj+=ygzsxj;
		 ywyszj+=ywysxj;
		 sjsszj+=sjssxj;
		 jlszj+=jlsxj;

		 ygzsxj=0;//Ա������С��
		 ywysxj=0;//ҵ��Ա��С��
		 sjssxj=0;//���ʦ��С��
		 jlsxj=0;//������С��
		 qtglysxj=0;//��������Ա��С��
		 ywybfb=0;//ҵ��Առ��
		 sjsbfb=0;//���ʦռ��
		 jlbfb=0;//����ռ��
		 qtglybfb=0;//��������Առ��
		 ywybxjfb=0;//ҵ��ԱС��ռ��
		 sjsbxjfb=0;//���ʦС��ռ��
		 jlbxjfb=0;//����С��ռ��
		 qtglybxjfb=0;//��������ԱС��ռ��
	}
	rs.close();
	ps.close();
		qtglyszj=ygzszj-ywyszj-sjsszj-jlszj;
		if(ygzszj==0)
		{
			ywybzjfb=0;
			sjsbzjfb=0;
			jlbzjfb=0;
			qtglybzjfb=0;
		}
		else{
			ywybzjfb=ywyszj*100.0/ygzszj;
			sjsbzjfb=sjsszj*100.0/ygzszj;
			jlbzjfb=jlszj*100.0/ygzszj;
			qtglybzjfb=qtglyszj*100.0/ygzszj;
		}
	%>
	
		<tr align="center" bgcolor="#E8E8FF"> 
		  <td colspan="3" ><B>�ܼ�</B></td>
				
		  <td ><%=ygzszj%></td>
		  <td ><%=ywyszj%></td>
		  <td ><%=cf.round(ywybzjfb,1)%>%</td>
		  <td ><%=sjsszj%></td>
		  <td ><%=cf.round(sjsbzjfb,1)%>%</td>
		  <td ><%=jlszj%></td>
		  <td ><%=cf.round(jlbzjfb,1)%>%</td>
		  <td ><%=qtglyszj%></td> 
		  <td ><%=cf.round(qtglybzjfb,1)%>%</td>
		<%



%>
</table>
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 

	}
}
%>

