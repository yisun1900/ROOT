<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=null;
String khbh=null;
String clgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String bz=null;

double wdzje=0;
double hkze=0;
double zczkl=0;
String dzyy=null;
double htcxhdje=0;
double zjxcxhdje=0;
double zqzjhze=0;
double zjhze=0;



String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;
String ztjjgw=null;


double zcyfk=0;
double zcfk=0;
String sqdj="";

try {
	conn=cf.getConnection();

	ls_sql="select wdzje,hkze,zczkl,dzyy,htcxhdje,zjxcxhdje,zqzjhze,zjhze   ,ztjjgw,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		zczkl=rs.getDouble("zczkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");

		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	//Ԥ����
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' and gysbh='"+ppbm+"'";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (zcfk < (hkze-1))
	{
		out.println("<B><font color=\"#FF0000\">���ѣ�����㣬ʵ�����"+zcfk+"������ͬ�ܶ��"+hkze+"��</B></font><P>");
	}

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
<title>����ȷ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��Ȩȷ�ϣ�������ţ�<%=ddbh%>�� </div>

<form method="post" action="" name="editform" >
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><b>�����ۿ�</b></td>
      <td width="29%"><%=zczkl%> </td>
      <td width="21%" align="right">&nbsp;</td>
      <td width="29%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>����ԭ��</b></td>
      <td colspan="3"><%=dzyy%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>��ǰ����ͬ��</b></td>
      <td width="29%"><%=wdzje%></td>
      <td width="21%" align="right"><b>�ۺ󣭺�ͬ��</b></td>
      <td width="29%"><%=hkze%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>��ǰ����������</b></td>
      <td width="29%"><%=zqzjhze%></td>
      <td width="21%" align="right"><b>�ۺ���������</b></td>
      <td width="29%"><%=zjhze%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <div align="right"><b>��ǰ���������ܶ�</b></div>
      </td>
      <td width="29%"><%=cf.formatDouble(wdzje+zqzjhze)%> </td>
      <td width="21%" align="right"> 
        <div align="right"><b>�ۺ��������ܶ�</b></div>
      </td>
      <td width="29%"><%=cf.formatDouble(hkze+zjhze)%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>��ͬ�����������</b></td>
      <td width="29%"><%=htcxhdje%></td>
      <td width="21%" align="right"><b>����������������</b></td>
      <td width="29%"><%=zjxcxhdje%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">����Ԥ����</font></b></td>
      <td width="29%"><%=zcyfk%></td>
      <td width="21%" align="right"><b><font color="#0000FF">[<%=ppbm%>]����</font></b></td>
      <td width="29%"><%=zcfk%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%"> 
        <div align="right">����ȷ����</div>
      </td>
      <td width="29%"> 
        <input type="text" name="ddqrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td width="21%"> 
        <div align="right">����ȷ��ʱ��</div>
      </td>
      <td width="29%"> 
        <input type="text" name="ddqrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2">
        <div align="center"> 
          <input type="hidden" name="ddbh" value="<%=ddbh%>" >
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����" name="reset">
          <input type="button" value="�鿴�ͻ��绰" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')">
        </div>
      </td>
    </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" bgcolor="#CCCCFF"> 
      <div align="right">�ͻ����</div>
    </td>
    <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="19%" bgcolor="#CCCCFF"> 
      <div align="right">��ͬ��</div>
    </td>
    <td width="31%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">�ͻ�����</td>
    <td width="31%"><%=khxm%></td>
    <td width="19%" align="right">�ʼ�</td>
    <td width="31%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
    <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="19%" bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
    <td width="31%" bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%"> 
      <div align="right">ʩ����</div>
    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td width="19%"> 
      <div align="right">�೤</div>
    </td>
    <td width="31%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%"> 
      <div align="right">��װǩԼ����</div>
    </td>
    <td width="31%"> <%=qyrq%> </td>
    <td width="19%"> 
      <div align="right">��װǩԼ��</div>
    </td>
    <td width="31%"><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">��ͬ��������</td>
    <td width="31%"><%=kgrq%></td>
    <td width="19%" align="right">��ͬ��������</td>
    <td width="31%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">�μӴ����</td>
    <td width="31%"> <%=cxhdbm%> </td>
    <td width="19%" align="right">Ʒ��</td>
    <td width="31%"><%=ppbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">�ͻ���������</td>
    <td width="31%"><%
	cf.radioToken(out, "1+δ����&2+ȫ��&3+�����������&4+Ԥ�������&5+�˻������",jkxz,true);
%></td>
    <td width="19%" align="right">����ص�</td>
    <td width="31%"><%
	cf.radioToken(out, "1+�������ֳ������&2+�����տ�&3+��˾�����տ�",jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">פ��Ҿӹ���</div>
    </td>
    <td width="31%"> <%=clgw%> </td>
    <td width="19%"> 
      <div align="right">չ���Ҿӹ���</div>
    </td>
    <td width="31%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">��ĿרԱ</td>
    <td width="31%"><%=xmzy%></td>
    <td width="19%" align="right">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">�������־</td>
    <td width="31%"><%
	cf.selectToken(out,"1+�������&2+�ȴ�����֪ͨ&3+������֪ͨ&4+�Ѳ���",xclbz,true);
%></td>
    <td width="19%" align="right">�ƻ�����ʱ��</td>
    <td width="31%"><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">�ȴ��ͻ�֪ͨ</div>
    </td>
    <td width="31%"><%
	cf.selectToken(out,"1+�������&2+����δ֪ͨ&3+������֪ͨ",ddshbz,true);
%> </td>
    <td width="19%"> 
      <div align="right">��ͬ�ͻ�ʱ��</div>
    </td>
    <td width="31%"><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">ǩ��ͬʱ��</div>
    </td>
    <td width="31%"><%=qhtsj%> </td>
    <td width="19%"> 
      <div align="right">�ɼ����ֹʱ��</div>
    </td>
    <td width="31%"><%=kjxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">����</td>
	<td  width="5%">��������</td>
	<td  width="6%">ϵ��</td>
	<td  width="5%">�ͺ�</td>
	<td  width="7%">���</td>
	<td  width="5%" bgcolor="#CC99FF">��װλ��</td>
	<td  width="5%" bgcolor="#CC99FF">��ɫ</td>
	<td  width="5%" bgcolor="#CC99FF">ѡ��۸�</td>
	<td  width="3%">����</td>
	<td  width="3%">��λ</td>
	<td  width="4%">��ͬ����</td>
	<td  width="5%">��ͬ���Ϸ�</td>
	<td  width="4%">��ͬԶ�̷�</td>
	<td  width="4%">��ͬ������</td>
	<td  width="5%" bgcolor="#CC99FF">����������</td>
	<td  width="5%" bgcolor="#CC99FF">��������Ϸ�</td>
	<td  width="4%" bgcolor="#CC99FF">������Զ�̷�</td>
	<td  width="4%" bgcolor="#CC99FF">������������</td>
	<td  width="4%">�����</td>
	<td  width="4%" bgcolor="#CC99FF">��������</td>
	<td  width="5%">�������</td>
	<td  width="5%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql ="SELECT DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����') lx,zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm";
	ls_sql+=" ,jc_zcddmx.zcysbm,DECODE(xzjg,'1','���ۼ�','2','<font color=\"#FF0000\">������</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj";
	ls_sql+=" ,jldwbm,jc_zcddmx.sl,jc_zcddmx.je,ycf,qtfyje,zjhsl,zjhje,zjhycf,zjhqtfy";
	ls_sql+=" ,jc_zcddmx.pjts*jc_zcddmx.zjhsl pjzs";
	ls_sql+=" ,cxhdbl||'%' cxhdbl,cxhdje,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' ";
    ls_sql+=" order by jc_zcddmx.lx,jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.ddqrr)=="") {
		alert("��ѡ��[����ȷ����]��");
		FormName.ddqrr.focus();
		return false;
	}
	if(	javaTrim(FormName.ddqrsj)=="") {
		alert("��ѡ��[����ȷ��ʱ��]��");
		FormName.ddqrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ddqrsj, "����ȷ��ʱ��"))) {
		return false;
	}


	FormName.action="SaveQrJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
