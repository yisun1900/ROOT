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
String ssbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;


String dqbm=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String dwbh=null;
String fgs=null;

String psph=null;

try { 
	conn=cf.getConnection();

	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,qye,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		qye=cf.fillNull(rs.getString("qye"));
		fgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select NVL(max(substr(psph,11,3)),0)";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	psph="P"+khbh+cf.today("YY")+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>

<body bgcolor="#FFFFFF">
<div align="center">�������͵����������ţ�<%=psph%>��</div>

  
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">��������</td>
	<td  width="7%">���͵�״̬</td>
	<td  width="6%">���ͷ�ʽ</td>
	<td  width="7%">�ƻ��ͻ�</td>
	<td  width="7%">����������</td>
	<td  width="8%">�����ܽ��</td>
	<td  width="7%">�����˷�</td>
	<td  width="7%">�����շ�</td>
	<td  width="7%">������</td>
	<td  width="7%">¼������</td>
	<td  width="28%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT jxc_clpsd.psph,DECODE(jxc_clpsd.psdzt,'0','�ȴ��ύ','1','�ȴ����','2','�ȴ�����','3','�ѳ���','4','�����') psdzt,DECODE(jxc_clpsd.psfs,'1','����','2','����','9','����') psfs,jxc_clpsd.jhshsj,jxc_clpsd.pszsl,jxc_clpsd.pszje,jxc_clpsd.yf,jxc_clpsd.qtsf,jxc_clpsd.fkje,jxc_clpsd.lrrq,jxc_clpsd.bz  ";
	ls_sql+=" FROM jxc_clpsd";
    ls_sql+=" where jxc_clpsd.khbh='"+khbh+"'";
    ls_sql+=" order by jxc_clpsd.lrrq";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"psph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_clpsd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("psph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%> 
</table>
  
 <form method="post" action="" name="insertform" target="_blank">
 <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">�ͻ����</font>     </td>
      <td width="32%"> <%=khbh%> </td>
      <td width="18%" align="right"> 
        <font color="#0000CC">��ͬ��</font>     </td>
      <td width="32%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">�ͻ�����</font>     </td>
      <td width="32%"> <%=khxm%> </td>
      <td width="18%" align="right"><font color="#0000CC">�ʼ�Ա</font></td>
      <td width="32%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">ǩԼ����</font></td>
      <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td width="18%" align="right"><font color="#0000CC">���ʦ</font></td>
      <td width="32%"><%=sjs%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">ʩ����</font>     </td>
      <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="18%" align="right"> 
        <font color="#0000CC">ʩ������</font>     </td>
      <td width="32%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td width="32%" bgcolor="#FFFFFF"> <%=kgrq%> </td>
      <td width="18%" align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td width="32%"> <%=jgrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>���ͷ�ʽ</td>
      <td width="32%"> 
        <input type="radio" name="psfs" value="1">
        ���� 
        <input type="radio" name="psfs" value="2">
        ���� 
        <input type="radio" name="psfs" value="9">
      ���� </td>
      <td align="right" width="18%">�ƻ��ͻ�ʱ��</td>
      <td width="32%"> 
      <input type="text" name="jhshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><font color="#CC0000">*</font>�����˷�</td>
      <td width="32%"> 
      <input type="text" name="yf" value="0" size="20" maxlength="10" >      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>�����շ�</td>
      <td width="32%"> 
      <input type="text" name="qtsf" value="0" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>������</td>
      <td width="32%"> 
      <input type="text" name="fkje" value="0" size="20" maxlength="14" >      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="32%">
	  <select name="ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼����</font></td>
      <td width="32%"> 
      <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="32%"> 
      <input type="text" name="lrrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="dqbm" value="<%=dqbm%>">
        <input type="hidden" name="psph" value="<%=psph%>">
        <input type="hidden" name="khbh" value="<%=khbh%>">
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="button"  value="���ò���¼��" onClick="f_pllr(insertform)" name="pllr" disabled>
        <input type="button"  value="ѡ��¼��" onClick="f_cklr(insertform)" name="cklr" disabled>
        <input type="button"  value="�鿴��ϸ" onClick="f_ck(insertform)" name="ckmx" disabled>
        <input type="button"  value=" �� �� " onClick="f_tj(insertform)" name="tj" disabled>
        <input type="reset"  value="����" name="reset">
        <input type="button"  value="��ӡ���͵�" onClick="f_print(insertform)" name="print"  disabled>		</td>
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
	if(	javaTrim(FormName.psph)=="") {
		alert("������[��������]��");
		FormName.psph.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.psfs)) {
		alert("��ѡ��[���ͷ�ʽ]��");
		FormName.psfs[0].focus();
		return false;
	}

	if (FormName.psfs[0].checked)
	{
		if(	javaTrim(FormName.jhshsj)=="") {
			alert("������[�ƻ��ͻ�ʱ��]��");
			FormName.jhshsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhshsj, "�ƻ��ͻ�ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.jhshsj.value="";
	}

	if(	javaTrim(FormName.fkje)=="") {
		alert("������[������]��");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "������"))) {
		return false;
	}

	
	if(	javaTrim(FormName.yf)=="") {
		alert("������[�����˷�]��");
		FormName.yf.focus();
		return false;
	}
	if(!(isFloat(FormName.yf, "�����˷�"))) {
		return false;
	}
	if(	javaTrim(FormName.qtsf)=="") {
		alert("������[�����շ�]��");
		FormName.qtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtsf, "�����շ�"))) {
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrrq)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrrq, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ssbm)=="") {
		alert("������[¼�벿��]��");
		FormName.ssbm.focus();
		return false;
	}


	FormName.action="SaveInsertJxc_clpsd.jsp";
	FormName.submit();

	FormName.pllr.disabled=false;
	FormName.cklr.disabled=false;
	FormName.print.disabled=false;
	return true;
}


function f_pllr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[��������]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="PlJxc_clpsmx.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}


function f_cklr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[��������]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_cljgb.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}


function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[��������]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="EditAllJxc_clpsmx.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[��������]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="tjpsd.jsp";
	FormName.submit();
	FormName.ckmx.disabled=true;
	FormName.cklr.disabled=true;
	FormName.pllr.disabled=true;
	return true;
}
function f_print(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[��������]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="/jxcdy/dypsd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
