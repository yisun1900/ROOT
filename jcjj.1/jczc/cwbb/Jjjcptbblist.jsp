<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String qyrq=null;
String wheresql="";
String xsfs=null;
String sjname="";
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
qyrq=request.getParameter("time1");
if (qyrq!=null)
{
	qyrq=qyrq.trim();
	if (!(qyrq.equals("")))	wheresql+="  and crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
}
String qyrq2=request.getParameter("time2");
if (qyrq2!=null)
{
	qyrq2=qyrq2.trim();
	if (!(qyrq2.equals("")))	wheresql+="  and crm_khxx.qyrq<=TO_DATE('"+qyrq2+"','YYYY-MM-DD')";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql="";

try {

	String nian="";
	String yue="";
	String oldyue="";
	String oldnian="";
	String sss="";
	String strnian="";
	int flag=1;
	int bz=1;//���Ƶõ���������ͳ�Ƶĺ���������ݵĸ�����ͳһ�����õ��ڱ�����
	double jzqye=0;//��װ���
	conn=cf.getConnection();
	ls_sql=" select nian,yue,sum(htje) htje from";
	ls_sql+="(";
	ls_sql+=" SELECT to_char(qyrq,'yyyy') nian,to_char(qyrq,'mm') yue,sum(jc_mmydd.zjhze) htje from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+="  group by to_char(qyrq,'yyyy'),to_char(qyrq,'mm')  ";
	ls_sql+=" union all ";
	ls_sql+=" SELECT to_char(qyrq,'yyyy') nian,to_char(qyrq,'mm') yue,sum(jc_cgdd.zjhze) htje from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+="  group by to_char(qyrq,'yyyy'),to_char(qyrq,'mm')  ";
	ls_sql+=" union all";

	ls_sql+=" SELECT to_char(qyrq,'yyyy') nian,to_char(qyrq,'mm') yue,sum(jc_jjdd.zjhze) htje from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+="  group by to_char(qyrq,'yyyy'),to_char(qyrq,'mm')  ";

	ls_sql+="union all ";
	ls_sql+="SELECT to_char(qyrq,'yyyy') nian,to_char(qyrq,'mm') yue,sum(hkze+NVL(zjhze,0)) htje from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by to_char(qyrq,'yyyy'),to_char(qyrq,'mm')  ";
	ls_sql+=") ";
	ls_sql+=" group by nian,yue";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		boolean ni=false;//����'#'�ָ��¼��
		nian=rs.getString("nian");
		yue=rs.getString("yue");
		jzqye=rs.getDouble(3);//��װ���
		
		//Լ������Ϊ����,�������ݷָ� '#',����Ϊ�ֽ��߽������ݷָ�','.  �Ե�һ����¼���д���.
		if(((!oldnian.equals(nian))&&(flag>1)))
		{
			oldnian=nian;
			bz=1;//���·���������(�м估ǰ�沿�ֵģ�
			//out.println(oldyue);
			if(Integer.parseInt(oldyue)<12)
			{
				//out.print("ddfdfdfddfd");
				for(int i=(Integer.parseInt(oldyue)+1);i<=12;i++)//���·���������(���沿�ֵģ�
				{
						sss=sss+",0";//add '0'
				}
			}
				
			sss=sss+"#"+jzqye;
			strnian=strnian+","+nian+"��";//��¼���������
			oldyue=yue;
			ni=true;
		}
		else
		{
			oldnian=nian;
			oldyue=yue;
			
		}
		
		if(flag==1)//�ڱ�,���Ƶ�һ�����ݵĴ���
		{
			if(bz==(Integer.parseInt(yue)))//��Ϊÿһ�����ݶ�Ҫ��ʱ��һһ��Ӧ,û�е�����,�������
			{
				
			}
			else
			{
				for(int x=bz;x<(Integer.parseInt(yue));x++)
				{
					sss=sss+"0,";
					bz++;
				}

			}
			sss=sss+jzqye;//�����װ���
			strnian=strnian+nian+"��";//��¼���������,��һ������
		}
		else
		{
			
			if(bz==(Integer.parseInt(yue)))
			{
				
			}
			else
			{
				
				for(int x=bz;x<(Integer.parseInt(yue));x++)//��Ϊÿһ�����ݶ�Ҫ��ʱ��һһ��Ӧ,û�е�����,�������
				{
					sss=sss+",0";
					bz++;
				}

			}
			if(!ni){
				sss=sss+","+jzqye;//�����װ���
			}
		}

		bz++;
		flag++;

	
	}
	rs.close();
	ps.close();
	if(sss.equals(""))
	{
		out.print("<BR><BR><center><b><font color=red>ϵͳ��ʾ�����ݿ�����û������!</b></FONT></center>");
		return;
	}
	//�����һ����¼���жϣ������Ƿ����������Ӧ
	if(Integer.parseInt(yue)<12)
	{
			//out.print("ddfdfdfddfd");
			for(int i=(Integer.parseInt(yue)+1);i<=12;i++)//���·���������(���沿�ֵģ�
			{
				sss=sss+",0";
			}
	}
//==================================================================================================================================
	%>
	<html>
	<head>
	<title>�� �� ͳ ��</title>
	</head>
	<body>
	<CENTER style='FONT-SIZE: 14px;border-collapse:collapse'>
  <B>�� �� �� ֵ ͳ ��</B><BR>
  (ͳ��ʱ�䣺<%=qyrq%>--<%=qyrq2%>)<BR>
</CENTER>

<%
	sjname="һ��,����,����,����,����,����,����,����,����,ʮ��,ʮһ��,ʮ����#"+sss+"#"+strnian;//�������͹��������ݴ�:sjname[0]:�·ݣ�sjname[sjname.length-1]:��
	double hj=0;
	String[] datastr=null;//��ȡ�ܵ����ݴ�
	String[] NinaStr=null;//��Ϊ��λ������
	String[] yueStr=null;//��Ϊ��λ����������
	String []tem2=null;//������ʱ����
	String []tem1=null;
	String []tem=null;
	datastr=sjname.split("#");//���ֳ�һ�������������
	yueStr=datastr[0].split(",");//�»��ֳ�һ��������
	NinaStr=datastr[datastr.length-1].split(",");

%>
<table width="100%" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999" style='FONT-SIZE: 12px;border-collapse:collapse'>
 <tr bgcolor="#CCCCCC" height="22"><td width="8%" align="center">&nbsp;</td>
<%
	for(int k=0;k<yueStr.length;k++)
	{
%>
<td  width="5%" align="center"><%=yueStr[k]%></td>
<%	
	}
%>
<td  width="5%" align="center">�ϼ�</td>
<%	
	for(int k=0;k<NinaStr.length;k++)//������������
	{	
		hj=0;
		tem=null;
		out.print("<tr><td width=\"5%\" align=\"center\">"+NinaStr[k]+"</td>");
		tem=datastr[k+1].split(",");
		for(int l=0;l<tem.length;l++)
		{
			out.print("<td width=\"5%\" align=\"center\">"+tem[l]+"</td>");//�������
			hj+=Double.parseDouble(tem[l]);//�ϼ�

		}
		out.print("<td width=\"5%\" align=\"center\" height=\"22\">"+hj+"</td>");
		out.print("</tr>");
	}
	
	for(int k=0;k<NinaStr.length-1;k++)//��������������
	{	
		hj=0;//����
		tem2=null;
		tem1=null;
		tem2=datastr[k+1].split(",");//�������ݵ�����
		tem1=datastr[k+2].split(",");
		out.print("<tr>");
		out.print("<td width=\"5%\" align=\"center\" >�������"+NinaStr[k+1]+"-"+NinaStr[k]+"</td>");
		for(int l=0;l<tem2.length;l++)
		{

			out.print("<td width=\"5%\" align=\"center\">"+(Double.parseDouble(tem1[l])-Double.parseDouble(tem2[l]))+"</td>");//��������������
			hj+=(int)(Double.parseDouble(tem1[l])-Double.parseDouble(tem2[l]));//�ϼ�

		}
		out.print("<td width=\"5%\" align=\"center\">"+hj+"</td>");
		out.print("</tr>");
	}
	for(int k=0;k<NinaStr.length-1;k++)//���������������
	{	
		hj=0;//����
		tem2=null;
		tem1=null;
		tem2=datastr[k+1].split(",");
		tem1=datastr[k+2].split(",");
		out.print("<tr>");
		out.print("<td width=\"5%\" align=\"center\" >��������"+NinaStr[k+1]+"/"+NinaStr[k]+"</td>");
		for(int l=0;l<tem2.length;l++)
		{
			if(Double.parseDouble(tem2[l])==0)//������ĸΪ������
			{
				out.print("<td width=\"5%\" align=\"center\">0%</td>");
			}
			else
			{
				out.print("<td width=\"5%\" align=\"center\">"+cf.formatDouble((Double.parseDouble(tem1[l])-Double.parseDouble(tem2[l]))*100/Double.parseDouble(tem2[l]))+"%</td>");//�����������
				hj+=((Double.parseDouble(tem1[l])-Double.parseDouble(tem2[l]))/Double.parseDouble(tem2[l]));//�ϼ�
			}
			
			

		}
		out.print("<td width=\"5%\" align=\"center\">"+cf.formatDouble(hj)+"</td>");
		out.print("</tr>");
	}
	tem2=null;//��չ�����ʱ����
	tem1=null;
	tem=null;
	datastr=null;
	NinaStr=null;
	yueStr=null;

	
}
//===================================================================================================
catch (Exception e) {
	out.print("Exception: " + e);
	//out.print(ls_sql);
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
</tr>
</table>
<br>

<div align="left" style='FONT-SIZE: 12px;border-collapse:collapse'>ע��ͳ��ʱ��Ϊ�ͻ���ǩԼʱ��</div>
</body>
</html>

