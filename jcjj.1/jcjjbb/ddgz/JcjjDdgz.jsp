<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ɼҾӶ�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhdlm=(String)session.getAttribute("yhdlm");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	
	String zdyhbz=cf.executeQuery("select zdyhbz from sq_yhxx where yhdlm='"+yhdlm+"'");//Y���ص��û���N�����ص��û�
	String xmzymc="";
	String wheresql1="";
	String wheresql2="";
	String wheresql3="";
	String wheresql4="";
	if (zdyhbz.equals("Y"))
	{
		xmzymc="ȫ����ĿרԱ";
	}
	else 
	{
		xmzymc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"'");
		wheresql1+=" and jc_mmydd.xmzy='"+xmzymc+"'";
		wheresql2+=" and jc_cgdd.xmzy='"+xmzymc+"'";
		wheresql3+=" and jc_jjdd.xmzy='"+xmzymc+"'";
		wheresql4+=" and jc_zcdd.xmzy='"+xmzymc+"'";
	}

%>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int mmhtyq=0;
int mmccyq=0;
int mmrkyq=0;
int mmazyq=0;

int cghtyq=0;
int cgccyq=0;
int cgfcyq=0;
int cgrkyq=0;
int cgazyq=0;

int jjhtyq=0;
int jjccyq=0;
int jjfcyq=0;
int jjrkyq=0;
int jjazyq=0;

int zcccyq=0;
int zcaztx=0;
int zcazyq=0;

int mmqxdds=0;
int cgqxdds=0;
int jjqxdds=0;
int zcqxdds=0;

try {
	conn=cf.getConnection();
/*****************************��ȡ��������***********************************/
//��ľ��ȡ��������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd ";
	ls_sql+=" where clzt='99' ";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmqxdds=rs.getInt(1);
	}
	ps.close();
	rs.close();
//�����ȡ��������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd ";
	ls_sql+=" where clzt='99' ";
	ls_sql+=wheresql2;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgqxdds=rs.getInt(1);
	}
	ps.close();
	rs.close();
//��Ҿ�ȡ��������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd ";
	ls_sql+=" where clzt='99' ";
	ls_sql+=wheresql3;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjqxdds=rs.getInt(1);
	}
	ps.close();
	rs.close();
//������ȡ��������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd ";
	ls_sql+=" where clzt='99' ";
	ls_sql+=wheresql4;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcqxdds=rs.getInt(1);
	}
	ps.close();
	rs.close();


/*******************************ǩ��ͬ����*********************************/
	//ľ��ǩ��ͬ����
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd,crm_khxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and jgrq-SYSDATE<30";
	ls_sql+=wheresql1;
	ls_sql+=" and clzt<'04'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmhtyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//����ǩ��ͬ����
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd,crm_khxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and jgrq-SYSDATE<25";
	ls_sql+=wheresql2;
	ls_sql+=" and clzt<'13'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cghtyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//�Ҿ�ǩ��ͬ����
	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd,crm_khxx";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jgrq-SYSDATE<25";
	ls_sql+=wheresql3;
	ls_sql+=" and clzt<'13'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjhtyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

/*******************************��������*********************************/
	//ľ�ų�������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where jhccsj<SYSDATE";
	ls_sql+=wheresql1;
	ls_sql+=" and clzt<'03'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmccyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//�����������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where jhccsj<SYSDATE";
	ls_sql+=wheresql2;
	ls_sql+=" and clzt<'07'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgccyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//�Ҿ߳�������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where jhccsj<SYSDATE";
	ls_sql+=wheresql3;
	ls_sql+=" and clzt<'07'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjccyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//���Ĳ�������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where (jhclsj<SYSDATE or tzclsj is not null)";
	ls_sql+=wheresql4;
	ls_sql+=" and xclbz in('2','3')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcccyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

/*******************************��������*********************************/
	//���񸴲�����
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where jhfcsj<SYSDATE";
	ls_sql+=wheresql2;
	ls_sql+=" and clzt<'11'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgfcyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

/*******************************�������*********************************/
	//ľ���������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd,crm_khxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and jgrq-SYSDATE<10";
	ls_sql+=wheresql1;
	ls_sql+=" and clzt<'05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmrkyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//�����������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd,crm_khxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and jgrq-SYSDATE<8";
	ls_sql+=wheresql2;
	ls_sql+=" and clzt<'25'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgrkyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//�Ҿ��������
	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd,crm_khxx";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jgrq-SYSDATE<8";
	ls_sql+=wheresql3;
	ls_sql+=" and clzt<'25'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjrkyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

/*******************************��װ/�ͻ�����*********************************/
	//ľ�Ű�װ����
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where jhazsj<SYSDATE";
	ls_sql+=wheresql1;
	ls_sql+=" and clzt<'11'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmazyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//����װ����
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where jhazrq<SYSDATE";
	ls_sql+=wheresql2;
	ls_sql+=" and clzt<'31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgazyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//�Ҿ߰�װ����
	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where jhazrq<SYSDATE";
	ls_sql+=wheresql3;
	ls_sql+=" and clzt<'31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjazyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//�����ͻ�����
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where (htshsj<SYSDATE+2)";
	ls_sql+=wheresql4;
	ls_sql+=" and clzt<'03'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcaztx=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//�����ͻ�����
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where (htshsj<SYSDATE or tzshsj is not null)";
	ls_sql+=wheresql4;
	ls_sql+=" and clzt<'09'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcazyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
/*
*/

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


<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">���ɼҾӶ������٣���ĿרԱ��<%=xmzymc%>��</div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
  <tr align="center"> 
    <td width="6%" > 
      <div align="center"><b>�� ��</b></div>
    </td>
    <td width="9%" > 
      <div align="center">��������&nbsp;</div>
    </td>
    <td width="9%" > 
      <div align="center">��������&nbsp;</div>
    </td>
    <td width="9%" >ǩ��ͬ����</td>
    <td width="9%" >�������</td>
    <td width="12%" >��װ/�ͻ�����</td>
    <td width="12%" > 
      <div align="center">��װ/�ͻ�����</div>
    </td>
    <td width="9%" >ȡ������</td>
  </tr>
  <tr align="center"> 
    <td width="10%" > 
      <div align="center">ľ��</div>
    </td>
    <td width="9%" ><a href="ViewMmCcmx.jsp" target="_blank"><%=mmccyq%>��</a></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" ><a href="ViewMmHtmx.jsp" target="_blank"><%=mmhtyq%>��</a></td>
    <td width="9%" ><a href="ViewMmRkmx.jsp" target="_blank"><%=mmrkyq%>��</a></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" ><a href="ViewMmAzmx.jsp" target="_blank"><%=mmazyq%>��</a></td>
    <td width="9%" ><a href="ViewMmTdmx.jsp" target="_blank"><%=mmqxdds%>��</a></td>
  </tr>
  <tr align="center"> 
    <td width="10%" >����</td>
    <td width="9%" ><a href="ViewCgCcmx.jsp" target="_blank"><%=cgccyq%>��</a></td>
    <td width="9%" ><a href="ViewCgFcmx.jsp" target="_blank"><%=cgfcyq%>��</a></td>
    <td width="9%" ><a href="ViewCgHtmx.jsp" target="_blank"><%=cghtyq%>��</a></td>
    <td width="9%" ><a href="ViewCgRkmx.jsp" target="_blank"><%=cgrkyq%>��</a></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" ><a href="ViewCgAzmx.jsp" target="_blank"><%=cgazyq%>��</a></td>
    <td width="9%" ><a href="ViewCgTdmx.jsp" target="_blank"><%=cgqxdds%>��</a></td>
  </tr>
  <tr align="center"> 
    <td width="10%" >�Ҿ�</td>
    <td width="9%" ><a href="ViewJjCcmx.jsp" target="_blank"><%=jjccyq%>��</a></td>
    <td width="9%" ><a href="ViewJjFcmx.jsp" target="_blank"><%=jjfcyq%>��</a></td>
    <td width="9%" ><a href="ViewJjHtmx.jsp" target="_blank"><%=jjhtyq%>��</a></td>
    <td width="9%" ><a href="ViewJjRkmx.jsp" target="_blank"><%=jjrkyq%>��</a></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" ><a href="ViewJjAzmx.jsp" target="_blank"><%=jjazyq%>��</a></td>
    <td width="9%" ><a href="ViewJjTdmx.jsp" target="_blank"><%=jjqxdds%>��</a></td>
  </tr>
  <tr align="center"> 
    <td width="10%" >����</td>
    <td width="9%" ><a href="ViewZcCcmx.jsp" target="_blank"><%=zcccyq%>��</a></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" ><a href="ViewZcAzTxmx.jsp" target="_blank"><%=zcaztx%>��</a></td>
    <td width="9%" ><a href="ViewZcAzmx.jsp" target="_blank"><%=zcazyq%>��</a></td>
    <td width="9%" ><a href="ViewZcTdmx.jsp" target="_blank"><%=zcqxdds%>��</a></td>
  </tr>
</table>

</body>
</html>
