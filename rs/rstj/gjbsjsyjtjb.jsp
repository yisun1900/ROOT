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

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
//String dwbh=request.getParameter("dwbh");

String wheresql="";
String wheresql1="";
String wheresql2="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	wheresql1+=" where ssdqbm=(select ssdqbm from sq_dwxx where dwbh='"+fgs+"')";
}



wheresql2+=" and cw_qmjzmx.jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql2+=" and cw_qmjzmx.jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

PreparedStatement ps1=null;//ty
ResultSet rs1=null;//ty
PreparedStatement ps2=null;//ty
ResultSet rs2=null;//ty
PreparedStatement ps3=null;//ty
ResultSet rs3=null;//ty

int i=0;

String ssdqmc=null;//����
String ssdqbm=null;
String fgsmc=null;//�ֹ�˾����
String fgsbh=null;

int fgscz=0;//�ֹ�˾��ֵ
int fgsssjf=0;//�ֹ�˾����Ʒ�
int sjss=0;//���ʦ��
int sjsjb=0;//���ʦ������
String sjsjbmc=null;//���ʦ��������
int jbsjss=0;//���𻮷ֺ�����ʦ��
int jbfgscz=0;//���𻮷ֺ�Ĳ�ֵ
int jbfgsssjf=0;//���𻮷ֺ����Ʒ�
double jbsjsszb=0;//���𻮷ֺ�����ʦ��ռ��
double jbfgsczzb=0;//���𻮷ֺ�Ĳ�ֵռ��
double jbfgsssjfzb=0;//���𻮷ֺ����Ʒ�ռ��

int fgsczxj=0;//�ֹ�˾��ֵС��
int fgsssjfxj=0;//�ֹ�˾����Ʒ�С��
int sjssxj=0;//���ʦ��С��
int jbsjssxj[]={0,0,0,0,0};//���𻮷ֺ�����ʦ��С�ƣ�������1��4���ֱ���ĸ������
int jbfgsczxj[]={0,0,0,0,0};//���𻮷ֺ�Ĳ�ֵС�ƣ�������1��4���ֱ���ĸ������
int jbfgsssjfxj[]={0,0,0,0,0};//���𻮷ֺ����Ʒ�С�ƣ�������1��4���ֱ���ĸ������
double jbsjssxjzb=0;//���𻮷ֺ�����ʦ��С��ռ��
double jbfgsczxjzb=0;//���𻮷ֺ�Ĳ�ֵС��ռ��
double jbfgsssjfxjzb=0;//���𻮷ֺ����Ʒ�С��ռ��

int fgsczzj=0;//�ֹ�˾��ֵ�ܼ�
int fgsssjfzj=0;//�ֹ�˾����Ʒ��ܼ�
int sjsszj=0;//���ʦ���ܼ�
int jbsjsszj[]={0,0,0,0,0};//���𻮷ֺ�����ʦ���ܼƣ�������1��4���ֱ���ĸ������
int jbfgsczzj[]={0,0,0,0,0};//���𻮷ֺ�Ĳ�ֵ�ܼƣ�������1��4���ֱ���ĸ������
int jbfgsssjfzj[]={0,0,0,0,0};//���𻮷ֺ����Ʒ��ܼƣ�������1��4���ֱ���ĸ������
double jbsjsszjzb=0;//���𻮷ֺ�����ʦ���ܼ�ռ��
double jbfgsczzjzb=0;//���𻮷ֺ�Ĳ�ֵ�ܼ�ռ��
double jbfgsssjfzjzb=0;//���𻮷ֺ����Ʒ��ܼ�ռ��

try {
	conn=cf.getConnection();
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>���������ʦҵ��ͳ��</B><BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>

<table border="1" width="350%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center" >
  <td  width="4%" rowspan="3">����</td>
  <td  width="4%" rowspan="3">�ֹ�˾</td>
  <td  width="5%" rowspan="3">�ֹ�˾��ֵ</td>
  <td  width="4%" rowspan="3">�ֹ�˾����Ʒ�</td>
  <td  width="3%" rowspan="3">���ʦ����</td>
  <td  width="80%" colspan="24">���ʦ����</td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center" >
<%
	ls_sql="SELECT sjsjb,sjsjbmc";
	ls_sql+=" FROM rs_sjsjb";
	ls_sql+=" order by sjsjb";
	ps=conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		sjsjb=rs.getInt(1);
		sjsjbmc=rs.getString(2);
		i++;
	%>
  <td colspan="6"><%=sjsjbmc%></td>
  <%
	}
	rs.close();
	ps.close();

	%>
</tr>
<tr bgcolor="#CCCCCC"  align="center" >
<%
	for(;i>0;i--)
	{
		%>
  <td style="word-break:break-all">����</td>
  <td style="word-break:break-all">����<br>ռ��</td>
  <td style="word-break:break-all">��ֵ</td>
  <td style="word-break:break-all">��ֵ<br>ռ��</td>
  <td style="word-break:break-all">��Ʒ�</td>
  <td style="word-break:break-all">��Ʒ�<br>ռ��</td>
 
<%
	}
	%>
</tr>
<%
	ls_sql=" SELECT ssdqbm,ssdqmc ";
	ls_sql+=" FROM sq_ssdqbm";
	ls_sql+=wheresql1;
	ls_sql+=" order by ssdqbm";
	ps=conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
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
		ps1=conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
	
		while (rs1.next())
		{
			fgsbh=rs1.getString("dwbh");
			fgsmc=rs1.getString("dwmc");

			ls_sql="SELECT sum(cw_qmjzmx.qye),sum(cw_qmjzmx.sjf)";
			ls_sql+=" FROM cw_qmjzmx";
			ls_sql+=" where cw_qmjzmx.fgsbh='"+fgsbh+"'";
			ls_sql+=" and cw_qmjzmx.zt!=3";
			ls_sql+=wheresql2;
			ps2=conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if (rs2.next())
			{
				fgscz=rs2.getInt(1);
				fgsssjf=rs2.getInt(2);
			}
			rs2.close();
			ps2.close();

			ls_sql="SELECT sum(cw_qmjzmx.qye),sum(cw_qmjzmx.sjf)";
			ls_sql+=" FROM cw_qmjzmx";
			ls_sql+=" where cw_qmjzmx.fgsbh='"+fgsbh+"'";
			ls_sql+=" and cw_qmjzmx.zt=3";
			ls_sql+=wheresql2;
			ps2=conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if (rs2.next())
			{
				fgscz-=rs2.getInt(1);
				fgsssjf-=rs2.getInt(2);
			}
			rs2.close();
			ps2.close();
			
			fgsczxj+=fgscz;
			fgsssjfxj+=fgsssjf;

			ls_sql="SELECT count(*)";
			ls_sql+=" FROM sq_yhxx";
			ls_sql+=" where sq_yhxx.sfzszg in('Y','N','D') and zwbm='04' and ssfgs='"+fgsbh+"'";//04�����ʦ
			ps2=conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if (rs2.next())
			{
				sjss=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			sjssxj+=sjss;
			%>
					</tr>
			<tr align="center" bgcolor="#FFFFFF">
				<td ><%=ssdqmc%></td>
				<td ><%=fgsmc%></td>
				<td ><%=fgscz%></td>
				<td ><%=fgsssjf%></td>
				<td ><%=sjss%></td>
		<%
			
			ls_sql="SELECT sjsjb,sjsjbmc";
			ls_sql+=" FROM rs_sjsjb";
			ls_sql+=" order by sjsjb";
			ps2=conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			while (rs2.next())
			{
				sjsjb=rs2.getInt(1);
				sjsjbmc=rs2.getString(2);

				ls_sql="SELECT sum(cw_qmjzmx.qye),sum(cw_qmjzmx.sjf)";
				ls_sql+=" FROM sq_yhxx,cw_qmjzmx";
				ls_sql+=" where sq_yhxx.sjsjb='"+sjsjb+"' and cw_qmjzmx.fgsbh='"+fgsbh+"'";
				ls_sql+=" and cw_qmjzmx.dwbh=sq_yhxx.dwbh";
				ls_sql+=" and cw_qmjzmx.sjs=sq_yhxx.yhmc";
				ls_sql+=" and cw_qmjzmx.zt!=3";
				ls_sql+=wheresql2;
				ps3=conn.prepareStatement(ls_sql);
				rs3=ps3.executeQuery();
				if (rs3.next())
				{
					jbfgscz=rs3.getInt(1);
					jbfgsssjf=rs3.getInt(2);
				}
				rs3.close();
				ps3.close();
				
				ls_sql="SELECT sum(cw_qmjzmx.qye),sum(cw_qmjzmx.sjf)";
				ls_sql+=" FROM sq_yhxx,cw_qmjzmx";
				ls_sql+=" where sq_yhxx.sjsjb='"+sjsjb+"' and cw_qmjzmx.fgsbh='"+fgsbh+"'";
				ls_sql+=" and cw_qmjzmx.dwbh=sq_yhxx.dwbh";
				ls_sql+=" and cw_qmjzmx.sjs=sq_yhxx.yhmc";
				ls_sql+=" and cw_qmjzmx.zt=3";
				ls_sql+=wheresql2;
				ps3=conn.prepareStatement(ls_sql);
				rs3=ps3.executeQuery();
				if (rs3.next())
				{
					jbfgscz-=rs3.getInt(1);
					jbfgsssjf-=rs3.getInt(2);
				}
				rs3.close();
				ps3.close();

				jbfgsczxj[i]+=jbfgscz;
				jbfgsssjfxj[i]+=jbfgsssjf;

				ls_sql="SELECT count(*)";
				ls_sql+=" FROM sq_yhxx";
				ls_sql+=" where sq_yhxx.sfzszg in('Y','N','D') and sjsjb='"+sjsjb+"' and zwbm='04' and ssfgs='"+fgsbh+"'";//04�����ʦ
				ps3=conn.prepareStatement(ls_sql);
				rs3=ps3.executeQuery();
				if(rs3.next())
				{
					jbsjss=rs3.getInt(1);
				}
				rs3.close();
				ps3.close();

				jbsjssxj[i]+=jbsjss;
				i++;

				if(sjss==0)
				jbsjsszb=0;
				else
				jbsjsszb=jbsjss*100.0/sjss;
				if(fgscz==0)
				jbfgsczzb=0;
				else
				jbfgsczzb=jbfgscz*100.0/fgscz;
				if(fgsssjf==0)
				jbfgsssjfzb=0;
				else
				jbfgsssjfzb=jbfgsssjf*100.0/fgsssjf;

	%>
				<td ><%=jbsjss%></td>
				<td ><%=cf.round(jbsjsszb,1)%>%</td>
				<td ><%=jbfgscz%></td>
				<td ><%=cf.round(jbfgsczzb,1)%>%</td>
				<td ><%=jbfgsssjf%></td>
				<td ><%=cf.round(jbfgsssjfzb,1)%>%</td>
			   
	<%
				
				
			}
			i=1;
%>
		</tr>
	<%
		}
			rs1.close();
			ps1.close();
			%>
			<tr align="center" bgcolor="#E8E8FF"> 
			  <td colspan="2" ><B>��<%=ssdqmc%>���ϼ�</B></td>	
			  <td ><%=fgsczxj%></td>
			  <td ><%=fgsssjfxj%></td>
			  <td ><%=sjssxj%></td>
			<%

			for(i=1;i<5;i++)
			{
				if(sjssxj==0)
				jbsjssxjzb=0;
				else
				jbsjssxjzb=jbsjssxj[i]*100.0/sjssxj;
				if(fgsczxj==0)
				jbfgsczxjzb=0;
				else
				jbfgsczxjzb=jbfgsczxj[i]*100.0/fgsczxj;
				if(fgsssjfxj==0)
				jbfgsssjfxjzb=0;
				else
				jbfgsssjfxjzb=jbfgsssjfxj[i]*100.0/fgsssjfxj;	

			%>
			  <td ><%=jbsjssxj[i]%></td>
			  <td ><%=cf.round(jbsjssxjzb,1)%>%</td>
			  <td ><%=jbfgsczxj[i]%></td>
			  <td ><%=cf.round(jbfgsczxjzb,1)%>%</td>
			  <td ><%=jbfgsssjfxj[i]%></td>
			  <td ><%=cf.round(jbfgsssjfxjzb,1)%>%</td>
			<%
			}
			fgsczzj+=fgsczxj;
			fgsssjfzj+=fgsssjfxj;
			sjsszj+=sjssxj;
			
			fgsczxj=0;//�ֹ�˾��ֵС��
			fgsssjfxj=0;//�ֹ�˾����Ʒ�С��
			sjssxj=0;//���ʦ��С��
			for(i=1;i<5;i++)
			{
				jbsjsszj[i]+=jbsjssxj[i];
				jbfgsczzj[i]+=jbfgsczxj[i];
				jbfgsssjfzj[i]+=jbfgsssjfxj[i];
				jbsjssxj[i]=0;
				jbfgsczxj[i]=0;
				jbfgsssjfxj[i]=0;	
			}
			i=1;
			jbsjssxjzb=0;//���𻮷ֺ�����ʦ��С��ռ��
			jbfgsczxjzb=0;//���𻮷ֺ�Ĳ�ֵС��ռ��
			jbfgsssjfxjzb=0;//���𻮷ֺ����Ʒ�С��ռ��
			%>
			</tr>
			<%
				
			
		 
	}
	rs.close();
	ps.close();
%>
			<tr align="center" bgcolor="#E8E8FF"> 
			  <td colspan="2" ><B>�ܼ�</B></td>	
			  <td ><%=fgsczzj%></td>
			  <td ><%=fgsssjfzj%></td>
			  <td ><%=sjsszj%></td>
			<%

			for(i=1;i<5;i++)
			{
				if(sjsszj==0)
				jbsjsszjzb=0;
				else
				jbsjsszjzb=jbsjsszj[i]*100.0/sjsszj;
				if(fgsczzj==0)
				jbfgsczzjzb=0;
				else
				jbfgsczzjzb=jbfgsczzj[i]*100.0/fgsczzj;
				if(fgsssjfzj==0)
				jbfgsssjfzjzb=0;
				else
				jbfgsssjfzjzb=jbfgsssjfzj[i]*100.0/fgsssjfzj;	

			%>
			  <td ><%=jbsjsszj[i]%></td>
			  <td ><%=cf.round(jbsjsszjzb,1)%>%</td>
			  <td ><%=jbfgsczzj[i]%></td>
			  <td ><%=cf.round(jbfgsczzjzb,1)%>%</td>
			  <td ><%=jbfgsssjfzj[i]%></td>
			  <td ><%=cf.round(jbfgsssjfzjzb,1)%>%</td>
			<%
			}
			%>
			</tr>
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close();
		if (conn != null) cf.close(conn); 
 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 

	}
}
%>