<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE3 {
	font-size: 30px;
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
	
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT bxkssj,bxjzsj,sjkgrq,sjjgrq,khxm,lxfs,fwdz,sjs,lxfs,hth,cxhdbm,cxhdbmxq,cxhdbmzh,crm_khxx.fgsbh,sfzhm,fwmj,hxmc,dianz,qdr,dwmc";
	ls_sql+=" FROM crm_khxx,dm_hxbm,sq_dwxx";
    ls_sql+=" where crm_khxx.hxbm=dm_hxbm.hxbm(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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
<div align="center" class="STYLE3">��װ���̱��޵�</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
        
    
       <tr bgcolor="#FFFFFF">
         <td height="44" align="right">�׷�</td>
         <td height="44"><%=khxm%></td>
         <td height="44" align="right">��ͬ�ţ�</td>
         <td height="44"><%=hth%></td>
       </tr>
  <tr bgcolor="#FFFFFF">
    <td height="43" align="right">�׷�������</td>
    <td width="30%" height="43">&nbsp;</td>
    <td width="20%" align="right">��ϵ�绰��</td>
    <td width="30%"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="44" align="right">�ҷ���</td>
    <td height="44" colspan="3">�����ڴ�<%=fgsmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td align="right">���������ˣ�</td>
    <td><strong>&nbsp;</strong></td>
    <td align="right">��ϵ�绰��</td>
    <td>8008106655</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td  align="right">��װ���̵�ַ</td>
    <td  colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td align="right">��������</td>
    <td><%=cf.formatDate(sjkgrq)%></td>
    <td align="right">��������</td>
    <td><%=cf.formatDate(sjjgrq)%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td width="20%" align="right">��������</td>
    <td colspan="3">��&nbsp;<%=cf.formatDate(bxkssj)%>&nbsp;&nbsp;&nbsp;��&nbsp;<%=cf.formatDate(bxjzsj)%></td>
  </tr>
</table>

<BR>
<BR>  
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
  
  <tr bgcolor="#FFFFFF">
    <td ><p>��ע�� </p></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td >1���Կ�������֮���𣬼���װ��װ�ޱ�����Ϊ���꣬�з�ˮҪ��ĳ��������������</td>
  </tr>
  
  <tr  bgcolor="#FFFFFF">
    <td >&nbsp;&nbsp;&nbsp;©���̱�����Ϊ���ꣻ������ĿΪ��ͬԼ��ʩ����Ŀ�������������Ŀ���ڱ���</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td >&nbsp;&nbsp;&nbsp;��Χ�ڣ�</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
  <td >2�������������ҷ�ʩ�������ϲ�����ԭ����ɵ�װ��װ���������⣬�ҷ��뼰ʱ���� </td>
  </tr>

  <tr  bgcolor="#FFFFFF">
    <td  >&nbsp;&nbsp;&nbsp;������ά�ޣ�</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td  >3������������׷�ʹ�á�ά��������������𻵻�������ʹ�ã��ҷ������շ�ά�ޣ� </td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td  >4�����������ڣ��ҷ��������б�����ȡά�޷��á�</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td  >5�������޵���Ϊ�ۺ�ά�޵�Ψһƾ֤��</td>
  </tr>
</table>


</body>
</html>
 


