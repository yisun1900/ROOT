<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String dqbm=null;
String fgsbh=null;
String kh_dwbh=null;
double kh_zjxje=0;
double kh_zhzjxje=0;
double kh_zqguanlif=0;
double kh_guanlifbfb=0;
double kh_guanlif=0;
double kh_zqzjxguanlif=0;
double kh_zjxguanlif=0;
double kh_suijin=0;
double kh_suijinbfb=0;
double kh_zjxsuijin=0;
double kh_kglf=0;
double kh_kqtk=0;

String cxhdbmxq=null;
String cxhdbmzh=null;
String cxhdbm=null;
String kh_sjsjsbz=null;
String kh_gdjsjd=null;
String kh_gckkspbz=null;
String kh_gcjdbm=null;
String kh_zjxxh=null;
String kh_zjxm=null;
String kh_qyrq=null;

double kh_wdzgce=0;
double kh_qye=0;
double kh_zkl=0;
String kh_hth=null;
String kh_khxm=null;
String kh_lxfs=null;
String kh_sgd=null;
String kh_sgbz=null;
String kh_fwdz=null;
String kh_sjs=null;
String kh_jzbz=null;
String kh_zjxwcbz=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
double cwsfke=0;

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";


int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,zjxje,zhzjxje,zqguanlif,guanlif,zqzjxguanlif,zjxguanlif  ,suijin,suijinbfb,zjxsuijin  ,kglf,kqtk";
	ls_sql+=" ,cxhdbm,cxhdbmxq,cxhdbmzh,sjsjsbz,gdjsjd,gckkspbz,gcjdbm,zjxxh,zjxm,qyrq";
	ls_sql+=" ,wdzgce,qye,zkl,hth,khxm,lxfs,sgd,sgbz,fwdz,sjs,jzbz,zjxwcbz,kgrq,jgrq,sjkgrq,sjjgrq,cwsfke";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		kh_dwbh=cf.fillNull(rs.getString("dwbh"));
		kh_zjxje=rs.getDouble("zjxje");
		kh_zhzjxje=rs.getDouble("zhzjxje");
		kh_zqguanlif=rs.getDouble("zqguanlif");
		kh_guanlif=rs.getDouble("guanlif");
		kh_zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		kh_zjxguanlif=rs.getDouble("zjxguanlif");

		kh_suijin=rs.getDouble("suijin");
		kh_suijinbfb=rs.getDouble("suijinbfb");
		kh_zjxsuijin=rs.getDouble("zjxsuijin");

		kh_kglf=rs.getDouble("kglf");
		kh_kqtk=rs.getDouble("kqtk");

		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		kh_sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		kh_gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		kh_gckkspbz=cf.fillNull(rs.getString("gckkspbz"));//���̿ۿ�������־
		kh_gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//���̽���
		kh_zjxxh=cf.fillNull(rs.getString("zjxxh"));
		kh_zjxm=cf.fillNull(rs.getString("zjxm"));
		kh_qyrq=cf.fillNull(rs.getDate("qyrq"));


		kh_wdzgce=rs.getDouble("wdzgce");
		kh_qye=rs.getDouble("qye");
		kh_zkl=rs.getDouble("zkl");
		kh_hth=cf.fillNull(rs.getString("hth"));
		kh_khxm=cf.fillNull(rs.getString("khxm"));
		kh_lxfs=cf.fillNull(rs.getString("lxfs"));
		kh_sgd=cf.fillNull(rs.getString("sgd"));
		kh_sgbz=cf.fillNull(rs.getString("sgbz"));
		kh_fwdz=cf.fillNull(rs.getString("fwdz"));
		kh_sjs=cf.fillNull(rs.getString("sjs"));
		kh_jzbz=rs.getString("jzbz");
		kh_zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		cwsfke=rs.getDouble("cwsfke");

	}
	else{
		out.println("���󣡿ͻ�������");
		return;
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">���ڿ�������Ǽ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td><div align="right"><font color="#0000FF">��ͬ��</font></div></td>
  <td><%=kh_hth%> </td>
  <td><div align="right"><font color="#0000CC">�ͻ�����</font></div></td>
  <td><%=kh_khxm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right"><font color="#0000CC">���ݵ�ַ</font></div></td>
  <td><%=kh_fwdz%> </td>
  <td><div align="right"><font color="#0000CC">���̵���</font></div></td>
  <td><%=kh_zjxm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">ǩԼ����</font></td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+kh_dwbh+"'",kh_dwbh,false);
%></td>
  <td align="right"><font color="#0000CC">���ʦ</font></td>
  <td><%=kh_sjs%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right"><font color="#0000FF">ʩ����</font></div></td>
  <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+kh_sgd+"'",kh_sgd,false);
%>  </td>
  <td><div align="right"><font color="#0000CC">ʩ������</font></div></td>
  <td><%=kh_sgbz%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">����ԭ����</font></td>
  <td><%=kh_wdzgce%></td>
  <td align="right"><font color="#0000CC">����ǩԼ��</font></td>
  <td><%=kh_qye%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" height="2"><font color="#0000CC">��ͬ˰��</font></td>
  <td height="2"><%=kh_suijin%></td>
  <td align="right" height="2"><font color="#0000CC">�ۿ�</font></td>
  <td height="2"><font color="#0000CC"><%=kh_zkl%></font></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" height="2"><font color="#0000CC">��ͬ�����-��ǰ</font></td>
  <td height="2"><%=kh_zqguanlif%></td>
  <td align="right" height="2"><font color="#0000CC">��ͬ�����-�ۺ�</font></td>
  <td height="2"><%=kh_guanlif%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" height="2"><b>��ͬ����</b></td>
  <td height="2"><%=kgrq%></td>
  <td align="right" height="2">&nbsp;</td>
  <td height="2"><%=jgrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" height="2"><b>ʵ�ʹ���</b></td>
  <td height="2"><%=sjkgrq%></td>
  <td align="right" height="2">&nbsp;</td>
  <td height="2"><%=sjjgrq%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">�μӹ�˾�����</font></td>
  <td colspan="3"><%=cxhdbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">�μ�С�������</font></td>
  <td colspan="3"><%=cxhdbmxq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">�μ�չ������</font></td>
  <td colspan="3"><%=cxhdbmzh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>һ�ڿ�ʵ�ս��</td>
  <td><input type="text" name="yqkje" value="<%=cwsfke%>" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><font color="#FF0000">*</font>���ڿ�Ӧ��ʱ��</td> 
  <td width="33%"> 
    <input type="text" name="eqksj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>���ڿ�Ӧ�ս��</td> 
  <td width="32%"> 
    <input type="text" name="eqkje" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><font color="#FF0000">*</font>ʵ��Ӧ�ս��</td> 
  <td width="33%"> 
    <input type="text" name="sjysje" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000FF">¼����</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000FF">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><font color="#FF0000">*</font><font color="#0000FF">¼�벿��</font></td> 
  <td width="33%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="73" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input type="hidden" name="khbh" value="<%=khbh%>">
	<input name="lr" type="button" onClick="f_lr(insertform)"  value="¼����ϸ" disabled>
	<input name="ck" type="button" onClick="f_ck(insertform)"  value="�鿴��ϸ" disabled>
	</td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.yqkje)=="") {
		alert("������[һ�ڿ�ʵ�ս��]��");
		FormName.yqkje.focus();
		return false;
	}
	if(!(isFloat(FormName.yqkje, "һ�ڿ�ʵ�ս��"))) {
		return false;
	}
	if(	javaTrim(FormName.eqksj)=="") {
		alert("������[���ڿ�Ӧ��ʱ��]��");
		FormName.eqksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.eqksj, "���ڿ�Ӧ��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.eqkje)=="") {
		alert("������[���ڿ�Ӧ�ս��]��");
		FormName.eqkje.focus();
		return false;
	}
	if(!(isFloat(FormName.eqkje, "���ڿ�Ӧ�ս��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjysje)=="") {
		alert("������[ʵ��Ӧ�ս��]��");
		FormName.sjysje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjysje, "ʵ��Ӧ�ս��"))) {
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

	FormName.action="SaveInsertCw_zqkzjxdj.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCw_zqkzjxmx.jsp";
	FormName.submit();

	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="EditCw_zqkzjxmx.jsp";
	FormName.submit();

	return true;
}


//-->
</SCRIPT>
