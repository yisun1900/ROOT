<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwbh=null;
String dwmc=null;
String dwjc=null;
String ssdw=null;
String dwlx=null;
String dwdz=null;
String dwfzr=null;
String dwdh=null;
String dwcz=null;
String email=null;
String dqbm=null;
String bz=null;
String wheredwbh=null;
wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select dwbh,dwmc,dwjc,ssdw,dwlx,dwdz,dwfzr,dwdh,dwcz,email,bz,dqbm ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where (1=1) and  (dwbh='"+wheredwbh+"')  ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwjc=cf.fillNull(rs.getString("dwjc"));
		ssdw=cf.fillNull(rs.getString("ssdw"));
		dwlx=cf.fillNull(rs.getString("dwlx"));
		dwdz=cf.fillNull(rs.getString("dwdz"));
		dwfzr=cf.fillNull(rs.getString("dwfzr"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		email=cf.fillNull(rs.getString("email"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();



		int count=0;

		int curNian=0;
		int curYue=0;
		int curRi=0;
		int curHH=0;

		
		//��ȡ�涨��ת����
		String jzyf=null;//��ת�·�:1����ת���£�2����ת����
		int gdjzrq=0;//��ת����
		int drjs=0;//���ռ�ʱ

		String jzrqstr=null;
		ls_sql="select jzyf,gdjzrq,drjs,TO_CHAR(SYSDATE,'YYYY') nian,TO_CHAR(SYSDATE,'MM') yue,TO_CHAR(SYSDATE,'DD') ri,TO_CHAR(SYSDATE,'HH24') hh";
		ls_sql+="  from sq_dwxx";  
		ls_sql+="  where dwlx='A0' ";  
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			jzyf=cf.fillNull(rs.getString("jzyf"));//��ת�·� 
			gdjzrq=rs.getInt("gdjzrq");//��ת���� 
			drjs=rs.getInt("drjs");//���ռ�ʱ 

			curNian=rs.getInt("nian");//��ǰ�� 
			curYue=rs.getInt("yue");//��ǰ�·� 
			curRi=rs.getInt("ri");//��ǰ���� 
			curHH=rs.getInt("hh");//��ǰСʱ 
		} 
		rs.close();
		ps.close();

		if (jzyf.equals("1"))//1����ת���£�2����ת����
		{
			if (curRi>gdjzrq)
			{
			}
			else if (curRi==gdjzrq)
			{
				if (curHH>=drjs)
				{
				}
				else{
					curYue=curYue-1;
				}
			}
			else if (curRi<gdjzrq)
			{
				curYue=curYue-1;
			}
		}
		else if (jzyf.equals("2"))//1����ת���£�2����ת����
		{
			if (curYue==1)
			{
				curNian=curNian-1;
			}

			if (curRi>gdjzrq)
			{
				curYue=curYue-1;
			}
			else if (curRi==gdjzrq)
			{
				if (curHH>=drjs)
				{
					curYue=curYue-1;
				}
				else{
					curYue=curYue-2;
				}
			}
			else if (curRi<gdjzrq)
			{
				curYue=curYue-2;
			}
		}
		else{
			throw new Exception("��λ��Ϣ���С���ת�·ݡ����ò���ȷ");
		}

		jzrqstr=cf.lastDay(curNian,curYue); 


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">�鿴��Ϣ </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">��λ���</div>
    </td>
    <td width="35%"> <%=dwbh%> </td>
    <td width="15%"> 
      <div align="right">��λ����</div>
    </td>
    <td width="35%"><%
	cf.selectToken(out,"A0+�ܲ�&A1+�ܲ�������&F0+�ֹ�˾&F1+�ֹ�˾������&F2+����&J0+������",dwlx,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">��λ����</td>
    <td width="35%"><%=dwmc%></td>
    <td width="15%" align="right">��λ���</td>
    <td width="35%"><%=dwjc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">�ϼ���λ</div>
    </td>
    <td width="35%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw,true);
%> </td>
    <td width="15%"> 
      <div align="right">��������</div>
    </td>
    <td width="35%"><%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">��λ��ַ</td>
    <td colspan="3"><%=dwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">��λ������</div>
    </td>
    <td width="35%"> <%=dwfzr%> </td>
    <td width="15%"> 
      <div align="right">��λ�绰</div>
    </td>
    <td width="35%"> <%=dwdh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">��λ����</div>
    </td>
    <td width="35%"> <%=dwcz%> </td>
    <td width="15%"> 
      <div align="right">��λEMail</div>
    </td>
    <td width="35%"> <%=email%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">��ע</div>
    </td>
    <td colspan="3"> <%=bz%> </td>
  </tr>
</table>
</body>
</html>
