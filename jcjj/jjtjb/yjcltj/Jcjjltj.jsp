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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>


<br>
    <div align="center"><b>�����Ľ�����Ʒ��ʵ�տ���ռ����</b><br> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
  <tr> 
    <td width="12%" > 
      <div align="center">�������</div>
    </td>
    <td width="18%" > 
      <div align="center">ʵ�տ�</div>
    </td>
    <td width="19%" > 
      <div align="center">��ռ����</div>
    </td>
    
  </tr>

<%
	double allssk=0;
	int mmsl1=0;
	int mmsl2=0;
	int cgsl=0;
	int cgsl1=0;
	int cgsl2=0;
	int jjsl2=0;
	int jjsl=0;
	int jjsl1=0;
	int allsl=0;
	double zcje=0;
	double allzcje=0;
	
	//�ۼƽ��������ʵ�տ�
	ls_sql="select (sum(hkze+zjhze)) from jc_zcdd,crm_khxx where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.lrsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_zcdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.zcdlbm='03'";
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	
	if (rs1.next())
	{
		allssk=rs1.getDouble(1);
	}
	ps1.close();
	rs1.close();

	if(allssk==0)
	{
		return;
	}
	//�������ĸ����Ʒ���з���ͳ��
	ls_sql="select gysmc,(sum(hkze+zjhze)) from jc_zcdd,crm_khxx,jdm_zcdlbm,sq_gysxx where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.zcdlbm=jdm_zcdlbm.zcdlbm  and jc_zcdd.ppbm=sq_gysxx.gysbh and jc_zcdd.zcdlbm='03' and jc_zcdd.lrsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_zcdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	
	ls_sql+=wheresql;
	ls_sql+=" group by gysmc";
	//out.print(ls_sql);
	
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	
	while (rs1.next())
	{
		String zcdlmc="";
		zcdlmc=rs1.getString("gysmc");
		zcje=rs1.getDouble(2);
		allzcje+=zcje;
	%>
	
	
	 <tr> 
	
    <td width="12%" > 
      <div align="center"><%=zcdlmc%></div>
    </td>
    <td width="18%" > 
      <div align="center"><%=zcje%></div>
    </td>
    <td width="19%" > 
      <div align="left"><img src="/images/ColuGif.gif" width=<%=zcje*100/allssk%>*100 height=20><%=cf.formatDouble(zcje*100/allssk)%>%</div>
    </td>
   
  </tr>
	<%	
	}
	ps1.close();
	rs1.close();
%>

<tr> 
	
    <td width="12%" > 
      <div align="center">�ϼ�</div>
    </td>
    <td width="18%" > 
      <div align="center"><%=cf.formatDouble(allzcje)%></div>
    </td>
    <td width="19%" > 
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
