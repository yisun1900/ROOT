<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");

String shdbh=request.getParameter("shdbh");
String ddbh=request.getParameter("ddbh");
String bzdh="";
String sgd="";

String khxm=null;
String cxhdbm=null;
String sjs="";
String dwmc="";
String sgbz=null;
String hth=null;
String jc_mmydd_jhazsj=null;
String qhtsj=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String sgddh=null;
String fgsbh=null;
String xmzy=null;
String xmzydh=null;
String bz=null;
String ppbm=null;
String clzt=null;
String tdsj=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double hkze=0;
double wdzje=0;
double zczkl=0;
double zqzjhze=0;
double zjhze=0;
try {
	conn=cf.getConnection();


	ls_sql="SELECT ddbh";
	ls_sql+=" FROM jc_zcshd ";
	ls_sql+=" where shdbh='"+shdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
	 }
	 rs.close();
	 ps.close();


	ls_sql="select jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.tdsj,jc_zcdd.clzt,jc_zcdd.ppbm,jc_zcdd.bz,crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,jc_zcdd.zczkl,jc_zcdd.wdzje,jc_zcdd.hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ppbm=cf.fillHtml(rs.getString("ppbm"));
		bz=cf.fillHtml(rs.getString("bz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		zczkl=rs.getDouble("zczkl");
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("htshsj"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
	 }
	 rs.close();
	 ps.close();

	 if (clzt.equals("99"))
	 {
		 hkze=-1*(hkze+zjhze);
		 wdzje=-1*(wdzje+zqzjhze);
	 }

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select bgdh from sq_yhxx";
	ls_sql+=" where yhmc='"+xmzy+"' and ssfgs ='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzydh=cf.fillHtml(rs.getString("bgdh"));
	}
	rs.close();
	ps.close();

	if (yhjs.equals("G0"))
	{
		sjs="&nbsp;";
	}

%>

<html>
<head>
<title>���ĸ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="24%">&nbsp;</td>
<%
	if (clzt.equals("99"))
	 {
		%>
		<td colspan="3"><strong>(<%=ppbm%>)���ĺ�ͬ����---�����˻���ϸ��<b>������ţ�<%=ddbh%></b>��</strong></td>
		<%
	 }
	 else{
		%>
		<td colspan="3"><strong>(<%=ppbm%>)���ĺ�ͬ����---�����ͻ���ϸ��<b>������ţ�<%=ddbh%></b>��</strong></td>
		<%
	 }
%>
  </tr>
  <tr> 
    <td height="20" align="right" colspan="2"> 
      <div align="left">�ͻ�������<b><%=khxm%></b></div>
    </td>
    <td width="33%" align="right" height="20"> 
      <div align="left">��ϵ��ʽ��<b><%=lxfs%></b></div>
    </td>
    <td width="34%" align="right" height="20"> 
      <div align="left">��ͬ�ţ�<b><%=hth%></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="4">��ַ��<b><%=fwdz%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ǩԼ����/��װ���ʦ��<b><%=dwmc%>/<%=sjs%></b></td>
  </tr>
  <tr> 
    <td colspan="4">ʩ���೤��<b><%=sgbz%> <%=bzdh%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�μӴ������<b><%=cxhdbm%></b></td>
  </tr>
  <tr> 
    <td align="right" colspan="2"> 
<%
	 if (clzt.equals("99"))
	 {
		%>
		<div align="left">�˵�ʱ�䣺<b><%=tdsj%></b></div>
		<%
	 }
	 else{
		%>
		<div align="left">��ͬ�ͻ���װ���ڣ�<b><%=jc_mmydd_jhazsj%></b></div>
		<%
	 }

%>
    </td>
    <td align="right" width="33%">&nbsp;
    </td>
    <td align="right" width="34%"> 
      &nbsp;
    </td>
  </tr>
</table> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="18%">���ƣ�ϵ��</td>
	<td  width="13%">�ͺţ����</td>

	<td  width="11%">����λ�ã���ɫ</td>
	<td  width="5%">�۸�</td>
	<td  width="6%">����</td>
	<td  width="4%">�ͻ�����</td>

	<td  width="18%">��ע</td>
</tr>
<%

	ls_sql ="SELECT zcmc||'��'||zclbbm,jc_zcddmx.xinghao||'��'||jc_zcddmx.gg,zcpzwzbm||'��'||jc_zcddmx.zcysbm,DECODE(xzjg,'1','���ۼ�','2','<font color=\"#FF0000\">������</font>') xzjg,jc_zcddmx.dj||'/'||jldwbm,jc_zcshmx.shsl,jc_zcshmx.bz  ";
	ls_sql+=" FROM jc_zcddmx,jc_zcshmx";
	ls_sql+=" where jc_zcddmx.xh=jc_zcshmx.xh and jc_zcshmx.shdbh='"+shdbh+"'";

    ls_sql+=" order by jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 

</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 16px'>
  <tr valign="top"> 
    <td height="60"><b>��ע��</b><%=bz%></td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="34%" height="2"><b>�ۼƽ�<%=hkze%>Ԫ��Сд��</b></td>
    <td width="37%" height="2"><b>��ǰ��<%=wdzje%>Ԫ���ۿ�<%=zczkl%>��</b></td>
    <td width="29%" height="2"><b>ʵ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ԫ��Сд��</b></td>
  </tr>
  <tr> 
    <td colspan="3"><b>����д����<%=cf.NumToRMBStr(hkze)%>��</b></td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <p><b></b></p>    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td colspan="2">�ͻ�ǩ�֣�</td>
          <td width="544">�����ˣ�</td>
        </tr>
        <tr> 
          <td colspan="2">ǩ�����ڣ�<%=qhtsj%></td>
          <td width="544">ǩ�����ڣ�<%=qhtsj%></td>
        </tr>
      </table>    </td>
</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception:2 " + e);
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


