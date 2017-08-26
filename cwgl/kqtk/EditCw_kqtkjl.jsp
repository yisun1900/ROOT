<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kkjlh=null;
String khbh=null;
String sgd=null;
String kkje=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String qtkkbm=null;
String wherekkjlh=cf.GB2Uni(request.getParameter("kkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String hth=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String dwbh=null;
String zjxm=null;
String jzbz=null;
String zjxwcbz=null;
double wdzgce=0;
double zkl=0;
double qye=0;
String cxhdbm=null;
String fgsbh=null;

try {
	conn=cf.getConnection();
	ls_sql="select kkjlh,khbh,sgd,kkje,lrr,lrsj,lrbm,bz,qtkkbm ";
	ls_sql+=" from  cw_kqtkjl";
	ls_sql+=" where  (kkjlh='"+wherekkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kkjlh=cf.fillNull(rs.getString("kkjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		kkje=cf.fillNull(rs.getString("kkje"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		qtkkbm=cf.fillNull(rs.getString("qtkkbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select fgsbh,cxhdbm,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,zkl,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		qye=rs.getDouble("qye");

		jzbz=cf.fillNull(rs.getString("jzbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸Ŀ���������Ϣ���ۿ��¼�ţ�<%=kkjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="9%">�ۿ��¼��</td>
		<td  width="7%">ʩ����</td>
		<td  width="12%">�ۿ���Ŀ</td>
		<td  width="10%">�ۿ���</td>
		<td  width="7%">¼����</td>
		<td  width="10%">¼��ʱ��</td>
		<td  width="6%">����</td>
		<td  width="39%">��ע</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT cw_kqtkjl.kkjlh,sq_sgd.sgdmc,qtkkmc,cw_kqtkjl.kkje,cw_kqtkjl.lrr,cw_kqtkjl.lrsj, DECODE(cw_kqtkjl.jsbz,'N','δ����','Y','�ѽ���'),cw_kqtkjl.bz  ";
	ls_sql+=" FROM cw_kqtkjl,sq_sgd,dm_qtkkbm  ";
    ls_sql+=" where cw_kqtkjl.sgd=sq_sgd.sgd";
    ls_sql+=" and cw_kqtkjl.qtkkbm=dm_qtkkbm.qtkkbm(+)";
    ls_sql+=" and cw_kqtkjl.khbh='"+khbh+"'";
    ls_sql+=" order by cw_kqtkjl.kkjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

<form method="post" action="SaveEditCw_kqtkjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">�ͻ����</td>
              <td width="33%"><%=khbh%></td>
              <td align="right" width="17%">��ͬ��</td>
              <td width="33%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="33%"><%=khxm%> </td>
              <td width="17%"> 
                <div align="right">�ʼ�����</div>
              </td>
              <td width="33%"><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="17%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="33%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">ǩԼ����</td>
              <td width="33%"><%=qyrq%></td>
              <td align="right" width="17%">ʵ���������</td>
              <td width="33%"><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">��ͬ��������</td>
              <td width="33%"><%=kgrq%></td>
              <td align="right" width="17%">��ͬ��������</td>
              <td width="33%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">ʵ�ʿ�������</td>
              <td width="33%"><%=sjkgrq%></td>
              <td align="right" width="17%">ʵ�ʿ�������</td>
              <td width="33%"><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�μӴ����</td>
              <td width="33%"><%=cxhdbm%></td>
              <td width="17%" align="right">����ǩԼ��</td>
              <td width="33%"><%=qye%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>ʩ����</div>
              </td>
              <td width="33%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>�ۿ���Ŀ</div>
              </td>
              <td width="33%"> 
                <select name="qtkkbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select qtkkbm,qtkkmc from dm_qtkkbm order by qtkkbm",qtkkbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>�ۿ���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="kkje" size="20" maxlength="17"  value="<%=kkje%>" >
              </td>
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>¼����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>¼��ʱ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>¼�벿��</div>
              </td>
              <td width="33%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <div align="center"> 
                  <input type="hidden" name="wherekkjlh"  value="<%=wherekkjlh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.qtkkbm)=="") {
		alert("��ѡ��[�ۿ���Ŀ]��");
		FormName.qtkkbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kkje)=="") {
		alert("������[�ۿ���]��");
		FormName.kkje.focus();
		return false;
	}
	if(!(isFloat(FormName.kkje, "�ۿ���"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("��ѡ��[��ע]��");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
