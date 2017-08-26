<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE3 {
	font-size: 28px;
	font-weight: bold;
	font-family: "����";
}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");


String khxm=null;
String xb=null;
String  fwdz=null;
String  lxfs=null;
String  yxtxdz=null;
String sjs=null;
String hth=null;
String zjxm=null;

String ssfgs=null;
String dwbh=null;
String cxhdbm="";
String cxhdbmxq="";
String cxhdbmzh="";
String sjkgrq="";
String sjjgrq="";

String bxkssj="";
String bxjzsj="";


String fgsmc="";
String sfzhm="";
String fwmj="";
String hxmc="";
String dianz="";
String qdr="";
String dwmc="";

double dj=0;
double qye=0;
double zjxje=0;
double ssk=0;
double sqk=0;
double zqk=0;
double jsje=0;
double wk=0;
	
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT qye,zjxje,bxkssj,bxjzsj,sjkgrq,sjjgrq,khxm,lxfs,fwdz,sjs,lxfs,hth,cxhdbm,cxhdbmxq,cxhdbmzh,crm_khxx.fgsbh,sfzhm,fwmj,hxmc,dianz,qdr,dwmc";
	ls_sql+=" FROM crm_khxx,dm_hxbm,sq_dwxx";
    ls_sql+=" where crm_khxx.hxbm=dm_hxbm.hxbm(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qye=rs.getDouble("qye");
		zjxje=rs.getDouble("zjxje");
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	    sjs=cf.fillNull(rs.getString("sjs"));
	  
		hth=cf.fillNull(rs.getString("hth"));

	    cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxmc=cf.fillNull(rs.getString("hxmc"));
		dianz=cf.fillNull(rs.getString("dianz"));
		qdr=cf.fillNull(rs.getString("qdr"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	jsje=cf.round(qye+zjxje,0);



	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ls_sql+=" and fklxbm in('11')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssk=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	wk=cf.round(qye+zjxje-ssk,0);
	
	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ls_sql+=" and fklxbm in('11') and fkcs=1";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ls_sql+=" and fklxbm in('11') and fkcs=2";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ls_sql+=" and fklxbm in('52','51')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select dwmc ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

}	
catch (Exception e) {
    out.print("Exception: " + e);
    out.print("<BR>SQL=" + ls_sql);
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
<body>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
   <tr bgcolor="#FFFFFF" >
     <td width="40%"  height="35" >&nbsp;</td>
     <td width="48%" ><span class="STYLE3">���̾��㵥</span></td>
     <td width="12%" ><span class="STYLE3">NO.</span></td>
   </tr>
   <tr bgcolor="#FFFFFF" >
     <td  height="35" colspan="3" >�𾴵�<U>&nbsp;<%=khxm%>&nbsp;</U>�ͻ����ã�����ͬ��ţ�<U>&nbsp;<%=hth%>&nbsp;</U>�� </td>
   </tr>
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="2" >ף�����ļ�װ����Բ�����գ�����Ϊ���Ĺ��̾��㵥�������˶ԣ�    </td>
       <td  height="35" align="right" >��λ��  Ԫ</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
        
    
       <tr bgcolor="#FFFFFF">
         <td width="16%" height="38" align="right">��ͬԤ����</td>
         <td width="19%" height="38"><%=cf.formatDouble(qye)%></td>
         <td height="38" colspan="2" align="right">������������+��-��</td>
         <td height="38" colspan="2"><%=cf.formatDouble(zjxje)%></td>
       </tr>
  <tr bgcolor="#FFFFFF">
    <td height="43" align="right">�깤������</td>
    <td height="43" colspan="5">��д��<U>&nbsp;<%=cf.NumToRMBStr(jsje)%>&nbsp;</U> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Сд��<U>&nbsp;<%=cf.formatDouble(jsje)%>Ԫ&nbsp;</U></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="38" align="right">�ѽ����</td>
    <td height="38" colspan="5"><%=cf.formatDouble(ssk)%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="38">
    <td height="35" align="right">����</td>
    <td height="35"><%=cf.formatDouble(dj)%></td>
    <td width="17%" height="35" align="right">���ڿ�</td>
    <td width="17%"><%=cf.formatDouble(sqk)%></td>
    <td width="15%" height="35" align="right">���ڿ�</td>
    <td width="16%"><%=cf.formatDouble(zqk)%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="38">
    <td  align="right">Ӧ��β��</td>
    <td  colspan="5">��д��<U>&nbsp;<%=cf.NumToRMBStr(wk)%>&nbsp;</U> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Сд��<U>&nbsp;<%=cf.formatDouble(wk)%>Ԫ&nbsp;</U></td>
  </tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
  
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="2" ><p>�������깤���ն����ڵ���˾���񲿽���β����ǻ�Ϊ����ʱ�����������������κ����⣬</p></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="2" >�����µ���񲿣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��лл������ϣ�</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="95%" height="35" align="right" >�����ڴ﹫˾(�Ǻ�ͬ��) </td>
    <td width="5%" align="right" >&nbsp;</td>
  </tr>
  
  <tr  bgcolor="#FFFFFF">
    <td height="35" align="right" ><%=cf.formatDate(cf.today())%></td>
    <td height="35" align="right" >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
  <td height="35" colspan="2" >�����̽��㵥һʽ�������������ͻ���������˾�浵��</td>
  </tr>
</table>


<Br>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
   <tr bgcolor="#FFFFFF" >
     <td width="40%"  height="35" >&nbsp;</td>
     <td width="48%" ><span class="STYLE3">���̾��㵥</span></td>
     <td width="12%" ><span class="STYLE3">NO.</span></td>
   </tr>
   <tr bgcolor="#FFFFFF" >
     <td  height="35" colspan="3" >�𾴵�<U>&nbsp;<%=khxm%>&nbsp;</U>�ͻ����ã�����ͬ��ţ�<U>&nbsp;<%=hth%>&nbsp;</U>�� </td>
   </tr>
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="2" >ף�����ļ�װ����Բ�����գ�����Ϊ���Ĺ��̾��㵥�������˶ԣ�    </td>
       <td  height="35" align="right" >��λ��  Ԫ</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
   <tr bgcolor="#FFFFFF">
	 <td width="16%" height="38" align="right">��ͬԤ����</td>
	 <td width="19%" height="38"><%=cf.formatDouble(qye)%></td>
	 <td height="38" colspan="2" align="right">������������+��-��</td>
	 <td height="38" colspan="2"><%=cf.formatDouble(zjxje)%></td>
   </tr>
  <tr bgcolor="#FFFFFF">
    <td height="43" align="right">�깤������</td>
    <td height="43" colspan="5">��д��<U>&nbsp;<%=cf.NumToRMBStr(jsje)%>&nbsp;</U> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Сд��<U>&nbsp;<%=cf.formatDouble(jsje)%>Ԫ&nbsp;</U></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="38" align="right">�ѽ����</td>
    <td height="38" colspan="5"><%=cf.formatDouble(ssk)%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="38">
    <td height="35" align="right">����</td>
    <td height="35"><%=cf.formatDouble(dj)%></td>
    <td width="17%" height="35" align="right">���ڿ�</td>
    <td width="17%"><%=cf.formatDouble(sqk)%></td>
    <td width="15%" height="35" align="right">���ڿ�</td>
    <td width="16%"><%=cf.formatDouble(zqk)%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="38">
    <td  align="right">Ӧ��β��</td>
    <td  colspan="5">��д��<U>&nbsp;<%=cf.NumToRMBStr(wk)%>&nbsp;</U> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Сд��<U>&nbsp;<%=cf.formatDouble(wk)%>Ԫ&nbsp;</U></td>
  </tr>
</table>


<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
  
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="3" ><p>�������깤���ն����ڵ���˾���񲿽���β����ǻ�Ϊ����ʱ�����������������κ����⣬</p></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="3" >�����µ���񲿣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��лл������ϣ�</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
  <td width="3%" height="35" >&nbsp;</td>
  <td width="92%" >�ͻ�ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�����ڣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  <td height="35" >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="2" align="right" >�����ڴ﹫˾(�Ǻ�ͬ��) </td>
    <td width="5%" align="right" >&nbsp;</td>
  </tr>
  
  <tr  bgcolor="#FFFFFF">
    <td height="35" colspan="2" align="right" ><%=cf.formatDate(cf.today())%></td>
    <td height="35" align="right" >&nbsp;</td>
  </tr>
</table>


</body>
</html>
 
