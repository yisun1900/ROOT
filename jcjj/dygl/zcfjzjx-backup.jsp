<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");
String zjxbh=request.getParameter("zjxbh");
String ddbh=null;
double zjxze=0;
String htshsj=null;

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
String clzt=null;
String lrsj=null;
String zjxfssj=null;
double hkze=0;
String bz=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ddbh,zjxze,jc_zczjx.htshsj,clzt,lrsj,zjxfssj,bz";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where jc_zczjx.zjxbh='"+zjxbh+"'";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zjxze=rs.getDouble("zjxze");
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		bz=cf.fillNull(rs.getString("bz"));
	 }
	 rs.close();
	 ps.close();

	ls_sql="select crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
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
		if (!clzt.equals("02") && !clzt.equals("03") && !clzt.equals("04"))//02����ȷ�ϣ�03�����ͻ�
		{
			out.println("����δȷ�ϵĺ�ͬ���ܴ�ӡ");
			return;
		}
	}
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
<html>
<head>
<title>�����������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr align="right">
    <td>
      <div align="left">���ĺ�ͬ����</div>
    </td>
  </tr>
  <tr align="right"> 
    <td>
      <div align="center"><strong>���Ķ������������ϸ��������ţ�<%=ddbh%>��</strong></div>
    </td>
  </tr>
  <tr align="right"> 
    <td width="34%" height="19"> 
        
      <table width="100%" border="0">
        <tr> 
          <td width="33%" align="right"> 
            <div align="left">�ͻ�������<b><%=khxm%></b></div>
          </td>
          <td width="33%" align="right"> 
            <div align="left">��ϵ��ʽ��<b><%=lxfs%></b></div>
          </td>
          <td width="34%" align="right"> 
            <div align="left">��ͬ�ţ�<b><%=hth%></b></div>
          </td>
        </tr>
        <tr> 
          <td colspan="2">��ַ��<b><%=fwdz%></b></td>
          <td width="34%">ǩԼ����/��װ���ʦ��<b><%=dwmc%>/<%=sjs%></b></td>
        </tr>
        <tr> 
          <td colspan="2">ʩ���೤��<b><%=sgbz%> <%=bzdh%></b></td>
          <td width="34%">�μӴ������<b><%=cxhdbm%></b></td>
        </tr>
        <tr> 
          <td align="right" width="33%"> 
            <div align="left">��ĿרԱ��<b><%=xmzy%></b></div>
          </td>
          <td align="right" width="33%"> 
            <div align="left">��ĿרԱ�绰��<b><%=xmzydh%></b></div>
          </td>
          <td align="right" width="34%"> 
            <div align="left">��ͬ�ͻ���װ���ڣ�<b><%=htshsj%></b></div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="8%">Ʒ��</td>
	<td  width="7%">ϵ��</td>
	<td  width="7%">�ͺ�</td>
	<td  width="8%">���</td>
	<td  width="5%">����λ��</td>
	<td  width="5%">��ɫ</td>
	<td  width="5%">ѡ��۸�</td>
	<td  width="4%">����</td>
	<td  width="4%">������λ</td>
	<td  width="6%">��������</td>
	<td  width="8%">�������Ϸ�</td>
	<td  width="6%">����Զ�̷�</td>
	<td  width="5%">��������</td>
	<td  width="6%">���������ѽ��</td>
	<td  width="5%">�Ƿ�μӻ</td>
	<td  width="4%" bgcolor="#CC99FF">�������</td>
	<td  width="6%">��ע</td>
</tr>
<%

	ls_sql ="SELECT jc_zcddmx.dwbh,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'1','���ۼ�','2','<font color=\"#FF0000\">������</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,jldwmc,jc_zczjxmx.zjsl,jc_zczjxmx.zjje,jc_zczjxmx.zjycf,DECODE(qtfy,'1','��װ��','2','�ӹ���','3','�����շ�'),jc_zczjxmx.zjqtfy, DECODE(jc_zcddmx.cxhdbz,'Y','<font color=\"#FF0000\">�μ�</font>','N','���μ�') cxhdbz,cxhdbl||'%' cxhdbl,jc_zczjxmx.bz  ";
	ls_sql+=" FROM jc_zcddmx,jdm_jldwbm,jc_zczjxmx  ";
    ls_sql+=" where jc_zcddmx.xh=jc_zczjxmx.xh";
    ls_sql+=" and jc_zczjxmx.zjxbh='"+zjxbh+"' and jc_zcddmx.jldwbm=jdm_jldwbm.jldwbm(+) ";
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
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr valign="top"> 
    <td height="60">��ע��<%=bz%></td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="34%" height="2">�ϼƽ�Сд����<%=zjxze%></td>
    <td width="37%" height="2">&nbsp;</td>
    <td width="29%" height="2"><b></b></td>
  </tr>
  <tr> 
    <td colspan="3">�ϼƽ���д����<%=cf.NumToRMBStr(zjxze)%></td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <p><b></b></p>
    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td colspan="2">�ͻ�ǩ�֣�</td>
          <td width="544">�����ˣ�</td>
        </tr>
        <tr> 
          <td colspan="2">ǩ�����ڣ�<%=zjxfssj%></td>
          <td width="544">ǩ�����ڣ�<%=zjxfssj%></td>
        </tr>
      </table>
    </td>
</table>
</body>
</html>



