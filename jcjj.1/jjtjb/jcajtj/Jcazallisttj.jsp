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
String dwbh=request.getParameter("dwbh");
String wheresql="";
String dwbhsql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}

String all=null;
String tslxbm=null;
String tslxmc=null;
String tsxlbm=null;
String tsxlmc=null;
String tsyymc=null;

String gysmc=null;
String tspp=null;

int[] mark={3,3,1,2,4};//������ʾ������
//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
int allwjjtssl=0;
int allyjjtssl=0;
int allwjjbxsl=0;
int allyjjbxsl=0;
int temp2=0;
int temp3=0;
int dltssl=0;
int temp1=0;
String bgcolor="#E8E8FF";

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
</CENTER>
<br>
    <div align="center"><b>����ʽ��Ʒ��װ����ͳ��</b><br> <b>(<%=sjfw%>--<%=sjfw2%>)(��װ����ɺ����)</b></div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
<tr bgcolor="#CCCCCC"  align="center">
 
  <td  width="7%">��</td>
  <td  width="7%">��</td>
  <td  width="7%">����</td>
  <td  width="7%">�Ѱ�װ����</td>
   <td  width="7%">ͳ��</td>

  
</tr>
<%
	Hashtable spanColHash=null;


	ls_sql="select nian,yue,lx,sl,xx from";
	ls_sql+="( ";
	
	ls_sql+=" SELECT TO_CHAR(sazrq,'YYYY') nian,TO_CHAR(sazrq,'MM') yue,'�Ҿ�' as lx,COUNT(*) sl,'<img src=\"/images/ColuGif.gif\" width='||count(*)/1000||' height=20>'||(count(*)) xx from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh  and jc_jjdd.clzt in('33','35')";
	ls_sql+=" and jc_jjdd.sazrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_jjdd.sazrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=wheresql;
	ls_sql+=" GROUP BY TO_CHAR(sazrq,'YYYY'),TO_CHAR(sazrq,'MM')";
	
	ls_sql+=" union all ";
	ls_sql+="SELECT TO_CHAR(sazrq,'YYYY') nian,TO_CHAR(sazrq,'MM') yue,'����' as lx,COUNT(*) sl,'<img src=\"/images/ColuGif.gif\" width='||count(*)/1000||' height=20>'||(count(*)) xx from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh  and jc_cgdd.clzt in('33','35') ";
	ls_sql+=" and jc_cgdd.sazrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_cgdd.sazrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ls_sql+=" GROUP BY TO_CHAR(sazrq,'YYYY'),TO_CHAR(sazrq,'MM') ";

	ls_sql+=" union all ";
	ls_sql+=" SELECT TO_CHAR(azjssj,'YYYY') nian,TO_CHAR(azjssj,'MM') yue,'ľ��' as lx,COUNT(*) sl,'<img src=\"/images/ColuGif.gif\" width='||count(*)/1000||' height=20>'||(count(*)) xx from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh  and jc_mmydd.clzt in('15','20') ";
	ls_sql+=" and jc_mmydd.azjssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_mmydd.azjssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=wheresql;
	ls_sql+=" GROUP BY TO_CHAR(azjssj,'YYYY'),TO_CHAR(azjssj,'MM')";
	
	ls_sql+=" ) ";
	ls_sql+=" order by nian,yue,lx";

	//out.print(ls_sql);
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[4]="align='left'";//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("nian","1");
	spanColHash.put("yue","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>

</table>


<br>
    <div align="center"><b>����ʽ��Ʒ��ǩ��ͬ����ͳ��</b><br> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
<tr bgcolor="#CCCCCC"  align="center">
 
  <td  width="7%">��</td>
  <td  width="7%">��</td>
  <td  width="7%">����</td>
  <td  width="7%">��ǩ��ͬ����</td>

  
</tr>
<%
	


	ls_sql="select nian,yue,lx,sl from";
	ls_sql+="( ";
	
	ls_sql+=" SELECT TO_CHAR(qhtsj,'YYYY') nian,TO_CHAR(qhtsj,'MM') yue,'�Ҿ�' as lx,COUNT(*) sl from jc_jjdd,crm_khxx where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.clzt!='99'";
	ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=wheresql;
	ls_sql+=" GROUP BY TO_CHAR(qhtsj,'YYYY'),TO_CHAR(qhtsj,'MM')";
	
	ls_sql+=" union all ";
	ls_sql+="SELECT TO_CHAR(qhtsj,'YYYY') nian,TO_CHAR(qhtsj,'MM') yue,'����' as lx,COUNT(*) sl from jc_cgdd,crm_khxx where jc_cgdd.khbh=crm_khxx.khbh and jc_cgdd.clzt!='99'";
	ls_sql+="  and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ls_sql+=" GROUP BY TO_CHAR(qhtsj,'YYYY'),TO_CHAR(qhtsj,'MM') ";
	
	ls_sql+=" union all ";
	ls_sql+=" SELECT TO_CHAR(htrq,'YYYY') nian,TO_CHAR(htrq,'MM') yue,'ľ��' as lx,COUNT(*) sl from jc_mmydd,crm_khxx where jc_mmydd.khbh=crm_khxx.khbh and jc_mmydd.clzt!='99'";
	ls_sql+="  and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=wheresql;
	ls_sql+=" GROUP BY TO_CHAR(htrq,'YYYY'),TO_CHAR(htrq,'MM')";
	
	ls_sql+=" ) ";
	ls_sql+=" order by nian,yue,lx";

	//out.print(ls_sql);
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[2]="align='center'";//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("nian","1");
	spanColHash.put("yue","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>

</table>



<br>
    <div align="center"><b>����ʽ��Ʒ����ͳ��</b><br> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
  <tr> 
    <td width="12%" > 
      <div align="center">����ʽ��Ʒ</div>
    </td>
    <td width="18%" > 
      <div align="center">�ۼƶ�����-��ȷ���˵�������</div>
    </td>
    <td width="19%" > 
      <div align="center">��ǩ��ͬ����</div>
    </td>
    <td width="20%" > 
      <div align="center">ռ�ۼƶ����ı���</div>
    </td>
    <td width="13%" > 
      <div align="center"><b>�ϼ�</b></div>
    </td>
  </tr>

<%
	int mmsl=0;
	int mmsl1=0;
	int mmsl2=0;
	int cgsl=0;
	int cgsl1=0;
	int cgsl2=0;
	int jjsl2=0;
	int jjsl=0;
	int jjsl1=0;
	int allsl=0;
	//�ۼƶ���������¼��ʱ��Ϊ׼
	ls_sql=" SELECT COUNT(*)  from jc_jjdd,crm_khxx where jc_jjdd.khbh=crm_khxx.khbh and  ";
	ls_sql+="  jc_jjdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')  ";
	//ls_sql+="and jc_jjdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	
	if (rs1.next())
	{
		mmsl=rs1.getInt(1);
	}
	ps1.close();
	rs1.close();
	//��ȷ���˵�����
	ls_sql=" SELECT COUNT(*)  from jc_jjdd,crm_khxx where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.clzt='99'";
	ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=wheresql;
	
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	
	if (rs1.next())
	{
		mmsl1=rs1.getInt(1);
	}
	ps1.close();
	rs1.close();
	//��ǩ��ͬ������
	ls_sql=" SELECT COUNT(*) from jc_jjdd,crm_khxx where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.clzt!='99' and   ";
	ls_sql+="  jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=wheresql;
	
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs1.next())
	{
		mmsl2=rs1.getInt(1);
	}
	ps1.close();
	rs1.close();

	ls_sql="SELECT COUNT(*) from jc_cgdd,crm_khxx where jc_cgdd.khbh=crm_khxx.khbh and   ";
	ls_sql+="  jc_cgdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	//ls_sql+="  and jc_cgdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs1.next())
	{
		cgsl=rs1.getInt(1);
	}
	ps1.close();
	rs1.close();

	ls_sql="SELECT COUNT(*) from jc_cgdd,crm_khxx where jc_cgdd.khbh=crm_khxx.khbh and jc_cgdd.clzt='99'  ";
	ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs1.next())
	{
		cgsl1=rs1.getInt(1);
	}
	ps1.close();
	rs1.close();

	ls_sql="SELECT COUNT(*) from jc_cgdd,crm_khxx where jc_cgdd.khbh=crm_khxx.khbh and jc_cgdd.clzt!='99' and   ";
	ls_sql+=" jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs1.next())
	{
		cgsl2=rs1.getInt(1);
	}
	ps1.close();
	rs1.close();

	ls_sql=" SELECT COUNT(*) from jc_mmydd,crm_khxx where jc_mmydd.khbh=crm_khxx.khbh and  ";
	ls_sql+=" jc_mmydd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')   ";
	//ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs1.next())
	{
		jjsl=rs1.getInt(1);
	}
	ps1.close();
	rs1.close();

	ls_sql=" SELECT COUNT(*) from jc_mmydd,crm_khxx where jc_mmydd.khbh=crm_khxx.khbh and jc_mmydd.clzt='99'";
	ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs1.next())
	{
		jjsl1=rs1.getInt(1);
	}
	ps1.close();
	rs1.close();


	ls_sql=" SELECT COUNT(*) from jc_mmydd,crm_khxx where jc_mmydd.khbh=crm_khxx.khbh and jc_mmydd.clzt!='99' and ";
	ls_sql+="  jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=wheresql;
	
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs1.next())
	{
		jjsl2=rs1.getInt(1);
	}
	ps1.close();
	rs1.close();

	if((mmsl-mmsl1)>0)
	{
		temp1=mmsl2*100/(mmsl-mmsl1);
	}
	else
	{
		temp1=0;
	}
	
	if((cgsl-cgsl1)>0)
	{
		temp2=cgsl2*100/(cgsl-cgsl1);
	}
	else
	{
		temp2=0;
	}

	if((jjsl-jjsl1)>0)
	{
		temp3=jjsl2*100/(jjsl-jjsl1);
	}
	else
	{
		temp3=0;
	}
	allsl=jjsl2+cgsl2+mmsl2;
%>

 <tr> 
	<td width="13%" > 
      <div align="center">�Ҿ�</b></div>
    </td>
    <td width="12%" > 
      <div align="center"><%=(mmsl-mmsl1)%></div>
    </td>
    <td width="18%" > 
      <div align="center"><%=mmsl2%></div>
    </td>
    <td width="19%" > 
      <div align="center"><%=temp1%>%</div>
    </td>
    <td width="20%" > 
      <div align="left"><img src="/images/ColuGif.gif" width=<%=temp1%>*100 height=20><%=temp1%>%</div>
    </td>
   
  </tr>
  <tr> 
	<td width="13%" > 
      <div align="center">����</b></div>
    </td>
    <td width="12%" > 
      <div align="center"><%=(cgsl-cgsl1)%></div>
    </td>
    <td width="18%" > 
      <div align="center"><%=cgsl2%></div>
    </td>
    <td width="19%" > 
      <div align="center"><%=temp2%>%</div>
    </td>
    <td width="20%" > 
      <div align="left"><img src="/images/ColuGif.gif" width=<%=temp2%>*100 height=20><%=temp2%>%</div>
    </td>
   
  </tr>
  <tr> 
	<td width="13%" > 
      <div align="center">ľ��</b></div>
    </td>
    <td width="12%" > 
      <div align="center"><%=(jjsl-jjsl1)%></div>
    </td>
    <td width="18%" > 
      <div align="center"><%=jjsl2%></div>
    </td>
    <td width="19%" > 
      <div align="center"><%=temp3%>%</div>
    </td>
    <td width="20%" > 
      <div align="left"><img src="/images/ColuGif.gif" width=<%=temp3%>*100 height=20><%=temp3%>%</div>
    </td>
    
  </tr>

  <tr> 
	<td width="13%" > 
      <div align="center">�ϼ�</b></div>
    </td>
    <td width="12%" > 
      &nbsp;
    </td>
    <td width="18%" align="center" > 
     <%=allsl%>
    </td>
    <td width="19%" > 
      &nbsp;
    </td>
    <td width="20%" > 
      <div align="left">&nbsp;</div>
    </td>
    
  </tr>
<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
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
