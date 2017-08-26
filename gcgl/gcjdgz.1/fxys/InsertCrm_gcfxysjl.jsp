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

String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String gj=null;
String dd=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String pdclzt=null;
String kgsjqd=null;
String fgsbh=null;
String sybgcrq=null;
String szqsj=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ysjlh=null;

try {
	conn=cf.getConnection();
	ls_sql="select crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,crm_khxx.dwbh,dwmc,sgd,sgbz,zjxm,gj,dd,pdclzt,kgsjqd,fgsbh,sybgcrq,szqsj";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.khbh='"+khbh+"'";
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
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));
		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(ysjlh,8,3)),0)";
	ls_sql+=" from  crm_gcfxysjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	ysjlh=khbh+cf.addZero(count+1,3);
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

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_gcfxysjl.jsp" name="insertform" target="_blank">
<div align="center">�������գ��Ǽǣ����ռ�¼�ţ�<%=ysjlh%>��</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">���ռ�¼��</td>
	<td  width="6%">��Ƭ��</td>
	<td  width="34%">������Ŀ</td>
	<td  width="10%">����ʱ��</td>
	<td  width="8%">������</td>
	<td  width="8%">���ս��</td>
	<td  width="8%">���յ÷�</td>
	<td  width="8%">��������</td>
	<td  width="8%">�ͻ�ǩ��</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_gcfxysjl.ysjlh,zpsl,gcysxmmc,crm_gcfxysjl.yssj,crm_gcfxysjl.ysr,DECODE(crm_gcfxysjl.ysjg,'1','�ϸ�','2','���ϸ�'),crm_gcfxysjl.ysdf,DECODE(crm_gcfxysjl.sffszg,'1','��','2','��'),DECODE(crm_gcfxysjl.sfkhbrqz,'Y','��','N','��') ";
	ls_sql+=" FROM crm_gcfxysjl  ";
    ls_sql+=" where crm_gcfxysjl.khbh='"+khbh+"'  ";
	ls_sql+=" order by crm_gcfxysjl.ysjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ysjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/gcgl/gcjdgz/fxys/ViewCrm_gcfxysjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ysjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                �ͻ�����              </td>
              <td width="30%"> <%=khxm%></td>
              <td width="19%" align="right"> 
                ��ͬ��              </td>
              <td width="32%"><%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">���ݵ�ַ</td>
              <td width="30%"><%=fwdz%></td>
              <td width="19%" align="right">���̵���</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                ǩԼ����              </td>
              <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="19%" align="right"> 
                ���ʦ              </td>
              <td width="32%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                ǩԼ����              </td>
              <td width="30%"><%=qyrq%> </td>
              <td width="19%" align="right"> 
                ����ǩԼ��              </td>
              <td width="32%"> <%=qye%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                ʩ����              </td>
              <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="19%" align="right"> 
                �೤              </td>
              <td width="32%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">�ܼ�</td>
              <td><%=gj%></td>
              <td align="right">����</td>
              <td><%=dd%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">��ͬ��������</td>
              <td width="30%"><font color="#000000"><%=kgrq%></font></td>
              <td width="19%" align="right">��ͬ��������</td>
              <td width="32%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">ʵ�ʿ�������</td>
              <td width="30%"><font color="#000000"><%=sjkgrq%></font></td>
              <td width="19%" align="right">ʵ�ʿ�������</td>
              <td width="32%"><font color="#000000"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">���ι����������</td>
              <td width="30%"><font color="#000000"><%=sybgcrq%></font></td>
              <td width="19%" align="right">������������</td>
              <td width="32%"><font color="#000000"><%=szqsj%></font></td>
            </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td> 
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>������Ŀ����</td> 
  <td width="30%"> 
    <select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeYsxmflbm(insertform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm order by ysxmflbm","");
%>
    </select>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>������Ŀ</td> 
  <td colspan="3"><select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
    <option value="">������ѡ��������Ŀ���ࡿ</option>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>������</td>
  <td><input type="text" name="ysr" value="<%=zjxm%>" size="20" maxlength="20" ></td>
  <td align="right"><font color="#FF0000">*</font>����ʱ��</td>
  <td><input type="text" name="yssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���ս��</td>
  <td>
	<input type="radio" name="ysjg"  value="1">�ϸ�
	<input type="radio" name="ysjg"  value="2">���ϸ�  </td>
  <td align="right"><font color="#FF0000">*</font>���յ÷�</td>
  <td><input type="text" name="ysdf" value="" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�������</td>
  <td><input type="radio" name="sffszg"  value="2">
    ��
      <input type="radio" name="sffszg"  value="1">
      ��</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�ͻ�����ǩ��</td>
  <td><input type="radio" name="sfkhbrqz"  value="Y">
    ��
    <input type="radio" name="sfkhbrqz"  value="N">
    �� </td>
  <td align="right">��ǩ���Ƿ�����Ȩ</td>
  <td><input type="radio" name="dqzysq"  value="Y">
    ��
    <input type="radio" name="dqzysq"  value="N">
    ����Ȩ </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">����˵��</td> 
  <td colspan="3"><textarea name="yssm" cols="72" rows="3"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">¼����</font> </td> 
  <td width="30%"> 
	  <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
  <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font> </td> 
  <td width="32%"> 
	  <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font> </td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="ysjlh" value="<%=ysjlh%>" >
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="button"  value="����" onClick="f_do(insertform)" name="bc">
	<input type="button"  value="�ϴ���Ƭ" onClick="f_lr(insertform)" name="lr" disabled>
    <input type="button"  value="�鿴��Ƭ" onClick="f_ck(insertform)" name="ck" disabled>
	<input name="cl" type="button" onClick="f_new(insertform)"  value="¼����һ��" disabled>
    <input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//����AJAX
%>


function changeYsxmflbm(FormName) 
{
	FormName.gcysxmbm.length=1;

	if (FormName.ysxmflbm.value=="")
	{
		return;
	}

	var sql;
	sql="select gcysxmbm,gcysxmmc||DECODE(sfhf,'Y','����طã�','N','') from dm_gcysxm where ysxmflbm='"+FormName.ysxmflbm.value+"' order by gcysxmbm";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.gcysxmbm,ajaxRetStr);
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ysxmflbm)=="") {
		alert("��ѡ��[������Ŀ����]��");
		FormName.ysxmflbm.focus();
		return false;
	}
	if(	FormName.gcysxmbm.value=="") {
		alert("��ѡ��[������Ŀ]��");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysr)=="") {
		alert("������[������]��");
		FormName.ysr.focus();
		return false;
	}
	if(	javaTrim(FormName.yssj)=="") {
		alert("������[����ʱ��]��");
		FormName.yssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yssj, "����ʱ��"))) {
		return false;
	}

	if(	!radioChecked(FormName.ysjg)) {
		alert("��ѡ��[���ս��]��");
		FormName.ysjg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ysdf)=="") {
		alert("������[���յ÷�]��");
		FormName.ysdf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysdf, "���յ÷�"))) {
		return false;
	}


	if(	!radioChecked(FormName.sffszg)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sffszg[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfkhbrqz)) {
		alert("��ѡ��[�Ƿ�ͻ�����ǩ��]��");
		FormName.sfkhbrqz[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfkhbrqz)) {
		alert("��ѡ��[�Ƿ�ͻ�����ǩ��]��");
		FormName.sfkhbrqz[0].focus();
		return false;
	}

	if (FormName.sfkhbrqz[1].checked)
	{
		if(	!radioChecked(FormName.dqzysq)) {
			alert("��ѡ��[��ǩ���Ƿ�����Ȩ]��");
			FormName.dqzysq[0].focus();
			return false;
		}
	}
	else{
		FormName.dqzysq[0].checked=false;
		FormName.dqzysq[1].checked=false;
	}

	if (FormName.ysjg[1].checked)
	{
		if(	javaTrim(FormName.yssm)=="") {
			alert("���ս�����ϸ�������[����˵��]��");
			FormName.yssm.focus();
			return false;
		}
	}
	if (FormName.sffszg[1].checked)
	{
		if(	javaTrim(FormName.yssm)=="") {
			alert("�������ģ�������[����˵��]��");
			FormName.yssm.focus();
			return false;
		}
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

	
	FormName.action="SaveInsertCrm_gcfxysjl.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	FormName.cl.disabled=false;
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}

function f_new(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_gcfxysjl.jsp";
	FormName.target="";
	FormName.submit();

	FormName.bc.disabled=false;
	FormName.lr.disabled=true;
	FormName.ck.disabled=true;
	FormName.cl.disabled=true;
	return true;
}

//-->
</SCRIPT>
