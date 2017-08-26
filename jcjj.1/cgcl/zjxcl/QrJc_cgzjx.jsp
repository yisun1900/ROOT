<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=null;
String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_zjxm=null;
String cgzjxyybm=null;
String gtzjxje=null;
String tmzjxje=null;
String wjzjxje=null;
String dqzjxje=null;
String zjxze=null;
String qrsj=null;
String qrr=null;
String srksj=null;
String rkr=null;
String rksm=null;
String jhazsj=null;
String azwcsj=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String dwbh=null;
String bz=null;

String zjxxh=null;
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jc_cgzjx.ddbh,jc_cgzjx.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.zjxm as crm_khxx_zjxm,mmzjxyymc as cgzjxyybm,jc_cgzjx.gtzjxje as gtzjxje,jc_cgzjx.tmzjxje as tmzjxje,jc_cgzjx.wjzjxje as wjzjxje,jc_cgzjx.dqzjxje as dqzjxje,jc_cgzjx.zjxze as zjxze,jc_cgzjx.qrsj as qrsj,jc_cgzjx.qrr as qrr,jc_cgzjx.srksj as srksj,jc_cgzjx.rkr as rkr,jc_cgzjx.rksm as rksm,jc_cgzjx.jhazsj as jhazsj,jc_cgzjx.azwcsj as azwcsj,jc_cgzjx.clzt as clzt,jc_cgzjx.lrr as lrr,jc_cgzjx.lrsj as lrsj,jc_cgzjx.dwbh as dwbh,jc_cgzjx.bz as bz ";
	ls_sql+=" from  crm_khxx,jc_cgzjx,jdm_mmzjxyybm";
	ls_sql+=" where jc_cgzjx.khbh=crm_khxx.khbh and jc_cgzjx.zjxxh='"+zjxxh+"' and jc_cgzjx.cgzjxyybm=jdm_mmzjxyybm.mmzjxyybm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		cgzjxyybm=cf.fillNull(rs.getString("cgzjxyybm"));
		gtzjxje=cf.fillNull(rs.getString("gtzjxje"));
		tmzjxje=cf.fillNull(rs.getString("tmzjxje"));
		wjzjxje=cf.fillNull(rs.getString("wjzjxje"));
		dqzjxje=cf.fillNull(rs.getString("dqzjxje"));
		zjxze=cf.fillNull(rs.getString("zjxze"));
		qrsj=cf.fillNull(rs.getDate("qrsj"));
		qrr=cf.fillNull(rs.getString("qrr"));
		srksj=cf.fillNull(rs.getDate("srksj"));
		rkr=cf.fillNull(rs.getString("rkr"));
		rksm=cf.fillNull(rs.getString("rksm"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		azwcsj=cf.fillNull(rs.getDate("azwcsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
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
<title>����������---����ȷ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" >
<div align="center"> ����������---����ȷ��</div>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="22%">ȷ��ʱ��</td>
      <td width="28%"> 
        <input type="text" name="qrsj" size="20" maxlength="20" value="<%=cf.today()%>" readonly>
      </td>
      <td width="23%" align="right">ȷ����</td>
      <td width="27%"> 
        <input type="text" name="qrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="39" bgcolor="#E8E8FF"> 
        <div align="center"> 
          <p> 
            <input type="button"  value="ȷ��" onClick="f_do(selectform)" name="button">
            <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
            <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
          </p>
        </div>
      </td>
    </tr>
  </table>
</form>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ������� </td>
    <td width="30%"> <%=ddbh%> </td>
    <td align="right" width="22%"> ��������� </td>
    <td width="28%"> <%=zjxxh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> �ͻ���� </td>
    <td width="30%"> <%=khbh%> </td>
    <td align="right" width="22%"> �ͻ����� </td>
    <td width="28%"> <%=crm_khxx_khxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ���ݵ�ַ </td>
    <td width="30%"> <%=crm_khxx_fwdz%> </td>
    <td align="right" width="22%"> ��ϵ��ʽ </td>
    <td width="28%"> <%=crm_khxx_lxfs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ��ͬ�� </td>
    <td width="30%"> <%=crm_khxx_hth%> </td>
    <td align="right" width="22%"> ���ʦ </td>
    <td width="28%"> <%=crm_khxx_sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> �ʼ� </td>
    <td width="30%"> <%=crm_khxx_zjxm%> </td>
    <td align="right" width="22%"> ������ԭ�� </td>
    <td width="28%"> <%=cgzjxyybm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ������������ </td>
    <td width="30%"> <%=gtzjxje%> </td>
    <td align="right" width="22%"> ̨���������� </td>
    <td width="28%"> <%=tmzjxje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ����������� </td>
    <td width="30%"> <%=wjzjxje%> </td>
    <td align="right" width="22%"> ������������ </td>
    <td width="28%"> <%=dqzjxje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> �������ܶ� </td>
    <td width="30%"> <%=zjxze%> </td>
    <td align="right" width="22%">&nbsp; </td>
    <td width="28%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ȷ��¼���� </td>
    <td width="30%"> <%=qrr%> </td>
    <td align="right" width="22%">ȷ��ʱ�� </td>
    <td width="28%"><%=qrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ���¼���� </td>
    <td width="30%"> <%=rkr%> </td>
    <td align="right" width="22%">ʵ���ʱ�� </td>
    <td width="28%"><%=srksj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%">���˵��</td>
    <td colspan="3"><%=rksm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> �ƻ���װʱ�� </td>
    <td width="30%"> <%=jhazsj%> </td>
    <td align="right" width="22%"> ��װ���ʱ�� </td>
    <td width="28%"> <%=azwcsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ����״̬ </td>
    <td width="30%"> <%
	cf.selectToken(out,"00+¼��δ���&01+¼�������&02+������ȷ��&04+��װ���",clzt,true);
%> </td>
    <td align="right" width="22%"> ¼���� </td>
    <td width="28%"> <%=lrr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ¼��ʱ�� </td>
    <td width="30%"> <%=lrsj%> </td>
    <td align="right" width="22%"> ¼�벿�� </td>
    <td width="28%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') order by dwbh",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ��ע </td>
    <td colspan="3"> <%=bz%> </td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">����</td>
	<td  width="23%">������Ŀ</td>
	<td  width="8%">��������</td>
	<td  width="8%">����</td>
	<td  width="12%">�������</td>
	<td  width="40%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT DECODE(lx,'1','����','2','̨��','3','���','4','����'),zjxm,zjsl,TO_CHAR(dj),zjje,bz  ";
	ls_sql+=" FROM jc_cgzjxmx  ";
    ls_sql+=" where zjxxh='"+zjxxh+"'";
    ls_sql+=" order by xh";
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

	if(	javaTrim(FormName.qrsj)=="") {
		alert("������[ȷ��ʱ��]��");
		FormName.qrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qrsj, "ȷ��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qrr)=="") {
		alert("������[ȷ����]��");
		FormName.qrr.focus();
		return false;
	}

	FormName.action="SaveQrJc_cgzjx.jsp";
	FormName.submit();
	return true;

}



//-->
</SCRIPT>
