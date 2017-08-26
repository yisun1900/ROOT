<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

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
String sgd=null;
String zjxm=null;
String jzbz=null;
String zjxwcbz=null;
double wdzgce=0;
double zkl=0;
double qye=0;
String cxhdbm=null;
String fgsbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String kkjlh=null;
try {
	conn=cf.getConnection();

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

	int count=0;
	ls_sql="select NVL(max(substr(kkjlh,6,4)),0)";
	ls_sql+=" from  cw_kqtkjl";
	ls_sql+=" where sgd='"+sgd+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	kkjlh=sgd+cf.addZero(count+1,4);
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><strong>ʩ���ӿۿ��¼���ۿ��¼�ţ�<%=kkjlh%>��</strong></div>
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

<form method="post" action="SaveInsertCw_kqtkjl.jsp" name="insertform" target="_blank">
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
              <td width="17%" align="right"><font color="#CC0000">*</font>ʩ����</td>
              <td width="33%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd);
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#CC0000">*</font>�ۿ���Ŀ</td>
              <td width="33%"> 
                <select name="qtkkbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select qtkkbm,qtkkmc from dm_qtkkbm order by qtkkbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>�ۿ���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="kkje" value="" size="20" maxlength="17" >
              </td>
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>¼����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>¼��ʱ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>¼�벿��</div>
              </td>
              <td width="33%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="kkjlh" value="<%=kkjlh%>" >
                <input type="button" name="bc" value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
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
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
