<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String qyrq=null;
String wheresql="";
String wheresql1="";
String xsfs=null;
String sjname="";
String Fnian1="";
String Fyue1="";
String Fnian2="";
String Fyue2="";
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
	if (!(qyrq.equals("")))
	{
		wheresql+="  and cw_khfkjl.sksj>=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
		wheresql1+="  and cw_khfkjl.sksj>=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
	}
}
String qyrq2=request.getParameter("time2");
if (qyrq2!=null)
{
	qyrq2=qyrq2.trim();
	if (!(qyrq2.equals("")))
	{
		wheresql+="  and cw_khfkjl.sksj<=TO_DATE('"+qyrq2+"','YYYY-MM-DD')";
		wheresql1+="  and cw_khfkjl.sksj<=TO_DATE('"+qyrq2+"','YYYY-MM-DD')";
	}
}
if (qyrq2!=null)
{
	Fnian1=qyrq2.substring(0,4);
	Fyue1=qyrq2.substring(5,7);

}
if (qyrq!=null)
{
	Fnian2=qyrq.substring(0,4);
	Fyue2=qyrq.substring(5,7);
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
	String yuesjStr="";
	int flag=1;
	int bz=1;//���Ƶõ���������ͳ�Ƶĺ���������ݵĸ�����ͳһ�����õ��ڱ�����
	double jzqye=0;//��װ���
	double Yuesj=0;
	conn=cf.getConnection();
	
	ls_sql+=" SELECT  nian,yue,sum(fkje) fkje from ";
	ls_sql+="(";
	ls_sql+=" SELECT to_char(sksj,'yyyy') nian,to_char(sksj,'mm') yue,sum(NVL(cw_khfkjl.fkje,0)) fkje from crm_khxx,cw_khfkjl where crm_khxx.khbh=cw_khfkjl.khbh ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and cw_khfkjl.fklxbm='22' ";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
	ls_sql+=" and cw_khfkjl.scbz='N' ";//N��δɾ����Y����ɾ��
	ls_sql+=wheresql;
	ls_sql+="  group by to_char(sksj,'yyyy'),to_char(sksj,'mm')";
	ls_sql+=" union all ";
	ls_sql+=" SELECT to_char(sksj,'yyyy') nian,to_char(sksj,'mm') yue,sum(0) fkje from cw_khfkjl where (1=1)";
	ls_sql+=wheresql1;
	ls_sql+="  group by to_char(sksj,'yyyy'),to_char(sksj,'mm')";
	ls_sql+=")";
	ls_sql+="  group by nian,yue";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		boolean ni=false;//����'#'�ָ��¼��
		nian=rs.getString("nian");
		yue=rs.getString("yue");
		jzqye=rs.getDouble(3);//��װ���

		ls_sql=" select sum(fkje) fkje from";
		ls_sql+="(";
		ls_sql+=" SELECT sum(NVL(cw_khfkjl.fkje,0)) fkje from crm_khxx,cw_khfkjl where crm_khxx.khbh=cw_khfkjl.khbh  ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and cw_khfkjl.fklxbm='21' ";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
		ls_sql+=" and cw_khfkjl.scbz='N' ";//N��δɾ����Y����ɾ��
		ls_sql+=" and  to_char(sksj,'yyyy')='"+nian+"' and to_char(sksj,'mm')='"+yue+"'";
		ls_sql+=wheresql;
		ls_sql+=" union all ";
		ls_sql+="SELECT sum(NVL(cw_khfkjl.fkje,0)) fkje from crm_khxx,cw_khfkjl where crm_khxx.khbh=cw_khfkjl.khbh ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and cw_khfkjl.fklxbm='22' ";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
		ls_sql+=" and cw_khfkjl.scbz='N' ";//N��δɾ����Y����ɾ��
		ls_sql+=wheresql;
		ls_sql+=" and  to_char(sksj,'yyyy')='"+nian+"' and to_char(sksj,'mm')='"+yue+"'";
		ls_sql+=" union all";

		ls_sql+=" SELECT sum(NVL(cw_khfkjl.fkje,0)) fkje from cw_khfkjl,crm_khxx where crm_khxx.khbh=cw_khfkjl.khbh ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and cw_khfkjl.fklxbm='23' ";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
		ls_sql+=" and cw_khfkjl.scbz='N' ";//N��δɾ����Y����ɾ��
		ls_sql+=wheresql;
		ls_sql+=" and  to_char(sksj,'yyyy')='"+nian+"' and to_char(sksj,'mm')='"+yue+"'";

		ls_sql+="union all ";

		ls_sql+="SELECT sum(NVL(cw_khfkjl.fkje,0)) fkje from cw_khfkjl,crm_khxx where crm_khxx.khbh=cw_khfkjl.khbh ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and cw_khfkjl.fklxbm='24' ";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
		ls_sql+=" and cw_khfkjl.scbz='N' ";//N��δɾ����Y����ɾ��
		ls_sql+=wheresql;
		ls_sql+=" and  to_char(sksj,'yyyy')='"+nian+"' and to_char(sksj,'mm')='"+yue+"'";
		ls_sql+=") ";
		//out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if(rs1.next())
		{
			Yuesj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
	
		//Լ������Ϊ����,�������ݷָ� '#',����Ϊ�ֽ��߽������ݷָ�','.  �Ե�һ����¼���д���.
		if(((!oldnian.equals(nian))&&(flag>1)))
		{
			oldnian=nian;
			bz=1;//���·���������(�м估ǰ�沿�ֵģ�
			//out.println(oldyue);
			if(Integer.parseInt(oldyue)<12)
			{
				for(int i=(Integer.parseInt(oldyue)+1);i<=12;i++)//���·���������(���沿�ֵģ�
				{
						sss=sss+",0.0";//add '0'
						yuesjStr=yuesjStr+",0.0";//��¼���µ�������

				}
			}
				
			sss=sss+"#"+jzqye;
			strnian=strnian+","+nian+"��";//��¼���������
			yuesjStr=yuesjStr+"#"+Yuesj;//��¼���µ�������
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
					sss=sss+"0.0,";
					yuesjStr=yuesjStr+"0.0,";//��¼���µ�������
					bz++;
				}

			}
			sss=sss+jzqye;//�����װ���
			strnian=strnian+nian+"��";//��¼���������,��һ������
			yuesjStr=yuesjStr+Yuesj;//��¼���µ�������,��һ������
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
					sss=sss+",0.0";
					yuesjStr=yuesjStr+",0.0";
					bz++;
				}

			}
			if(!ni)
			{

				sss=sss+","+jzqye;//�����װ���
				yuesjStr=yuesjStr+","+Yuesj;
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
				sss=sss+",0.0";
				yuesjStr=yuesjStr+",0.0";
			}
	}
	
	//out.print(sss+"#"+yuesjStr);
	//if(true)
		//return;
//==================================================================================================================================
	%>
	<html>
	<head>
	<title>�� �� ͳ ��</title>
	</head>
	<body>
	<CENTER style='FONT-SIZE: 14px;border-collapse:collapse'>
  <B>�� �� �� �� ʵ �� �� ͳ ��</B><BR>
  <div style='FONT-SIZE: 12px;border-collapse:collapse'><B>(ͳ��ʱ�䣺<%=qyrq%>--<%=qyrq2%>)</B></div>
</CENTER>

<%
	sjname="һ��,����,����,����,����,����,����,����,����,ʮ��,ʮһ��,ʮ����#"+sss+"#"+strnian;//�������͹��������ݴ�:sjname[0]:�·ݣ�sjname[sjname.length-1]:��
	double hj=0;
	double hj1=0;//�ҾӸ�������ܺ͵ĺϼ�
	String[] datastr=null;//��ȡ�ܵ����ݴ�
	String[] NinaStr=null;//��Ϊ��λ������
	String[] yueStr=null;//��Ϊ��λ����������
	String []tem2=null;//������ʱ����
	String []tem1=null;
	String []tem=null;
	datastr=sjname.split("#");//���ֳ�һ�������������
	yueStr=datastr[0].split(",");//�»��ֳ�һ��������
	NinaStr=datastr[datastr.length-1].split(",");
	tem1=yuesjStr.split("#");
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
		hj=0;//����
		tem=null;
		tem=datastr[k+1].split(",");
		tem2=tem1[k].split(",");//ÿ���µĺϼ�����
		out.print("<tr><td width=\"5%\" align=\"center\"><b>"+NinaStr[k]+"</b></td>");
		int clsc=1;
		for(int l=0;l<tem.length;l++)
		{
			if(((Integer.parseInt(Fnian1)==Integer.parseInt((NinaStr[k].substring(0,4))))&&(clsc>Integer.parseInt(Fyue1))))
			{
				out.print("<td width=\"5%\" align=\"center\">&nbsp;</td>");//�������
			
			}
			else if((Integer.parseInt(Fnian2)==Integer.parseInt((NinaStr[k].substring(0,4))))&&(clsc<Integer.parseInt(Fyue2)))
			{
				out.print("<td width=\"5%\" align=\"center\">&nbsp;</td>");//�������
			}
			else
			{
				out.print("<td width=\"5%\" align=\"center\">"+tem[l]+"</td>");//�������
				hj+=Double.parseDouble(tem[l]);//�ϼ�

			}
			clsc++;

		}
		out.print("<td width=\"5%\" align=\"center\" height=\"22\">"+hj+"</td>");
		out.print("</tr>");
		out.print("<tr><td width=\"5%\" align=\"center\">�Ҿ�</td>");
		hj1=0;//����
		clsc=1;
		for(int l=0;l<tem2.length;l++)//ÿ���µ��ܺͷ������
		{
			if(((Integer.parseInt(Fnian1)==Integer.parseInt((NinaStr[k].substring(0,4))))&&(clsc>Integer.parseInt(Fyue1))))
			{
				out.print("<td width=\"5%\" align=\"center\">&nbsp;</td>");//�������
			
			}
			else if((Integer.parseInt(Fnian2)==Integer.parseInt((NinaStr[k].substring(0,4))))&&(clsc<Integer.parseInt(Fyue2)))
			{
				out.print("<td width=\"5%\" align=\"center\">&nbsp;</td>");//�������
			}
			else
			{
				out.print("<td width=\"5%\" align=\"center\">"+tem2[l]+"</td>");//�������
				hj1+=Double.parseDouble(tem2[l]);//�ϼ�

			}
			clsc++;
			

		}
		out.print("<td width=\"5%\" align=\"center\" height=\"22\">"+hj1+"</td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td width=\"5%\" align=\"center\" >��Ŀ����</td>");
		clsc=1;
		for(int l=0;l<tem.length;l++)
		{
			if(((Integer.parseInt(Fnian1)==Integer.parseInt((NinaStr[k].substring(0,4))))&&(clsc>Integer.parseInt(Fyue1))))
			{
				out.print("<td width=\"5%\" align=\"center\">&nbsp;</td>");//�������
			
			}
			else if((Integer.parseInt(Fnian2)==Integer.parseInt((NinaStr[k].substring(0,4))))&&(clsc<Integer.parseInt(Fyue2)))
			{
				out.print("<td width=\"5%\" align=\"center\">&nbsp;</td>");//�������
			}
			else
			{
				if(Double.parseDouble(tem2[l])==0)//�����ĸΪ������
				{
					out.print("<td width=\"5%\" align=\"center\">0%</td>");
				}
				else
				{
					out.print("<td width=\"5%\" align=\"center\">"+cf.formatDouble((Double.parseDouble(tem[l])*100/Double.parseDouble(tem2[l])))+"%</td>");//��������ٷֱ�
				}
			}
			clsc++;		

		}
			if(hj1==0)//�����ĸΪ������
			{
				out.print("<td width=\"5%\" align=\"center\">0%</td>");
			}
			else
			{
				out.print("<td width=\"5%\" align=\"center\">"+cf.formatDouble((hj*100/hj1))+"%</td>");//ÿ���µĺϼ�����ռ�ҾӸ���ϼƵİٷֱ�
				out.print("</tr>");
			}
		
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
	out.print("Exception: " + e+ls_sql);
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

<div align="left" style='FONT-SIZE: 12px;border-collapse:collapse'>ע��ͳ��ʱ��Ϊ�տ�ʱ��,��Ŀ����=ľ�ŵ��¶�/���ɵ����ܶ�,�Ҿӣ����ɵ����ܶ�</div>
</body>
</html>


