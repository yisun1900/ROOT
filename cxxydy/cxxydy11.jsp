<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 18px;
	font-weight: bold;
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
String fwytbm=null;
String cxhdbm="";
String cxhdbmxq="";
String cxhdbmzh="";



String fgsmc="";
String sfzhm="";
String fwmj="";
String hxmc="";
String dianz="";
String qdr="";
String dwmc="";

double dj=0;
	
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,lxfs,hth,fwytbm,cxhdbm,cxhdbmxq,cxhdbmzh,crm_zxkhxx.ssfgs,sfzhm,fwmj,hxmc,dianz,qdr,dwmc";
	ls_sql+=" FROM crm_zxkhxx,dm_hxbm,sq_dwxx";
    ls_sql+=" where crm_zxkhxx.hxbm=dm_hxbm.hxbm(+) and crm_zxkhxx.zxdm=sq_dwxx.dwbh(+)  ";
    ls_sql+=" and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	    sjs=cf.fillNull(rs.getString("sjs"));
	  
		hth=cf.fillNull(rs.getString("hth"));
		fwytbm=cf.fillNull(rs.getString("fwytbm"));

	    cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxmc=cf.fillNull(rs.getString("hxmc"));
		dianz=cf.fillNull(rs.getString("dianz"));
		qdr=cf.fillNull(rs.getString("qdr"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	double ssdj=0;
	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ls_sql+=" and fklxbm in('51')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssdj=rs.getDouble(1);
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


	
	//��ȡ��˾�������ע
	 ls_sql="select  dj";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  cxhdmc='"+cxhdbm+"' and  fgsbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dj=rs.getDouble("dj");
	}
	rs.close();
	ps.close();
	

	if (ssdj<dj)
	{
		out.println("����ʵ�ն����㣬ʵ�գ�"+ssdj+"��Ӧ�գ�"+dj);
		return;
	}


	
	
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
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
       <tr bgcolor="#FFFFFF"> 
   
    <td align="left"  height="35" colspan="4"><div align="center" class="STYLE2">�����ڴ�<%=fgsmc%>�����Э����</u></strong> </div>
      </div></td>
   </tr> 
    
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="2">ί�з�(�׷�)��<u><%=khxm%></u></td>
    <td colspan="2">��ϵ�绰��<u><%=lxfs%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="2">���֤�ţ�<strong><u><%=sfzhm%></u></strong></td>
    <td height="35">���ͽṹ��<u><%=hxmc%></u></td>
    <td height="35">���������<u><%=fwmj%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="4">�׷����̵�ַ��<u><%=fwdz%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="4">�нӷ����ҷ����������ڴ�<%=fgsmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="25%" height="35">Ӫҵ����<u><%=dianz%></u></td>
    <td width="20%">Ǣ̸��Ա��<u><%=qdr%></u></td>
    <td width="33%">ǩԼ���棺<u><%=dwmc%></u></td>
    <td width="22%">ǩԼʱ�䣺<u><%=cf.today()%></u></td>
  </tr>
</table>
<BR>  
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  
  <tr bgcolor="#FFFFFF">
    <td height="35" >
      &nbsp;&nbsp;&nbsp;&nbsp;�𾴵Ŀͻ�����л��ѡ�������ڴ�װ�Σ�Ϊ�������ܸ����ʵķ��񣬷������μӴ������    </td>
  </tr>


  <tr bgcolor="#FFFFFF">
    <td height="35" >��������ע���¼��㣺</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="35" >һ�����δ������������<U><B>&nbsp;<%=cxhdbm%>&nbsp;</B></U>�����������������ڴ﹫˾����ϸ��Ϊ׼��</td>
  </tr>
  
  <tr  bgcolor="#FFFFFF">
  <td height="35" >�����׷�����μ��ҷ���<U><B>&nbsp;<%=cxhdbm%>&nbsp;</B></U>������������ɴ��������<U><B>&nbsp;��<%=cf.formatDouble(dj,"###")%>&nbsp;</B></U>Ԫ��</td>
  </tr>

  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��Ϊ�׷��μӱ��δ�������ʸ�֤��</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >�����ҷ�������Ա���Ų�����Ϻ��ڲ���<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�պ�Ϊ�׷�����������ͼֽ��</td>
  </tr>
 
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�ġ���׷����ҷ���Ʒ��������⣬�ɼ�ʱ���ҷ�����Ӫҵ����������������Ա��</td>
  </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">�塢��������װ�޹����깤���ּ�װ��ͬβ� </p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">�������պ�ͬ���涨�������ɺ����˻���</p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">�ߡ��׷�ȷ�ϲμӵĴ�������ҷ��Ѱ�������������óﻮ�������׷��������κ����ɽ��и����� </p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">�ˡ��׷����뽫����ֱ�ӽ����ҷ����񲿣���ȡ����ʽ�տ�ƾ֤���տ�ƾ֤������տ�ר���£�</p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">�š����δ�����Ľ���Ȩ�������ڴ﹫˾���У� </p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >ʮ����Э��һʽ���ݣ�����˫����ִһ�ݣ�˫����������ʱ��ӦЭ�̽�������������ҷ����ڵ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">&nbsp;&nbsp;&nbsp;&nbsp;����Ժ��Ͻ��</p></td>
   </tr>
</table>

<BR>  
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="35" >�׷�ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	   <td width="50%"  height="35" >�ҷ�����ǩ�֣����£���<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
   <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="35" >��&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	   <td width="50%"  height="35" >��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
</table>

</body>
</html>
 


