<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">���¼�������б�</font></B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">����</td>
	<td  width="10%">¼����</td>
	<td  width="12%">¼��ʱ��</td>
    <td width="13%">¼�뵥λ</td>
	<td  width="8%">������</td>
	<td  width="8%">����</td>
	<td  width="12%">����</td>
	<td  width="30%">��ע</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String yhjs=(String)session.getAttribute("yhjs");
	String fgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
	
	ls_sql="SELECT lrph,lrr,lrsj,dwmc,TO_CHAR(zdxh),sl, DECODE(lx,'1','��������','2','���ڿ�','3','�깤����','4','�蹤�̵���','5','�깤�ط�'),crm_lrph.bz  ";
	ls_sql+=" FROM crm_lrph,sq_dwxx  ";
    ls_sql+=" where crm_lrph.dwbh=sq_dwxx.dwbh and (lx='4')";
    ls_sql+=" and rownum<11";
	if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		ls_sql+=" and  (crm_lrph.dwbh in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";
	}
	else if (yhjs.equals("F2"))
	{
		ls_sql+=" and  (crm_lrph.dwbh='"+dwbh+"')";
	}
    ls_sql+=" order by lrph desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"lrph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/gcgl/ph/Crm_lrphmxCxList.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("lrph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
	pageObj.displayFoot();
%>

</table>

<CENTER >
  <B><font size="2">��ѡ���������</font></B> 
</CENTER>

<table width="100%" bgcolor="#000000"  style='FONT-SIZE: 12px' border="1" cellspacing="1">
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="8%">&nbsp;</td>
    <td width="8%">¼������</td>
    <td width="10%">�鿴ȫ��</td>
    <td width="8%">¼����</td>
    <td width="13%">¼��ʱ��</td>
    <td width="13%">¼�뵥λ</td>
    <td width="10%">��������</td>
    <td width="25%">��ע</td>
  </tr>
<%
String yhdlm=(String)session.getAttribute("yhdlm");

String lrph=null;
String lrr=null;
java.sql.Date lrsj=null;
String zdxh=null;
String sl=null;
String dwmc=null;
String bz=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

try {
	conn=cf.getConnection();
	ls_sql=" select lrph,lrr,lrsj,dwmc,zdxh,sl,crm_lrph.bz from crm_lrph,sq_dwxx  where crm_lrph.dwbh=sq_dwxx.dwbh and lx='4' and wcbz='N' and lrr='"+yhdlm+"'";
	ls_sql+=" order by lrph desc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	int count=0;
	while (rs.next())
	{
		count++;

		lrph=rs.getString("lrph");
		lrr=rs.getString("lrr");
		lrsj=rs.getDate("lrsj");
		zdxh=rs.getString("zdxh");
		sl=rs.getString("sl");
		dwmc=rs.getString("dwmc");
		bz=cf.fillNull(rs.getString("bz"));
%>
		<tr bgcolor="#FFFFFF" align="center" > 
		<td><A HREF="yrk_lrphxx.jsp?lrph=<%=lrph%>&dolx=old">��������</A></td>
		<td><%=lrph%></td>
		<td><A HREF="AllKhxmList.jsp?lrph=<%=lrph%>">�蹤�̵���</A></td>
		<td><%=lrr%></td>
		<td><%=lrsj%></td>
		<td><%=dwmc%></td>
		<td><%=sl%></td>
		<td><%=bz%></td>
		</tr>
<%
	}
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>

</table>


<form action="yrk_lrphxx.jsp" method="post">
  <table width="100%">
    <tr bgcolor="#FFFFFF" align="center" > 
      <td> 
        <input type="hidden" name="dolx" value="new">
        <input type="submit"  value="�����µ�¼������">
      </td>
    </tr>
  </table>
</form>
</body>
</html>