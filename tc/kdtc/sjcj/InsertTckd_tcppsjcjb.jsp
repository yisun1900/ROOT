<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");

String dqbm=null;
String bjjbbm=null;
String bjjbbm1=null;
String tccplbbm=null;
String jldw=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
bjjbbm1=cf.GB2Uni(request.getParameter("bjjbbm1"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
jldw=cf.GB2Uni(request.getParameter("jldw"));

%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<div align="center">¼�룭�ײ�Ʒ��������۱�</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">����</td>
	<td  width="13%">��Ʒ���</td>
	<td  width="10%">ԭ���ۼ���</td>
	<td  width="10%">�������ۼ���</td>
	<td  width="16%">Ʒ��</td>
	<td  width="8%">������λ</td>
	<td  width="10%">�������</td>
	<td  width="9%">��Ч��ʼʱ��</td>
	<td  width="9%">��Ч����ʱ��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql="SELECT tckd_tcppsjcjb.dqbm,dm_dqbm.dqmc,tckd_tcppsjcjb.bjjbbm,a.bjjbmc,tckd_tcppsjcjb.bjjbbm1,b.bjjbmc bjjbmc1,tckd_tcppsjcjb.tccplbbm,clxlmc,tckd_tcppsjcjb.ppmc,tckd_tcppsjcjb.jldw,tckd_tcppsjcjb.sjcj,yxkssj,yxjzsj ";
	ls_sql+=" FROM tckd_tcppsjcjb,dm_dqbm,jdm_bjjbbm a,jdm_bjjbbm b,jxc_clxlbm  ";
    ls_sql+=" where tckd_tcppsjcjb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcppsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and tckd_tcppsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and tckd_tcppsjcjb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tcppsjcjb.dqbm='"+dqbm+"' and tckd_tcppsjcjb.tccplbbm='"+tccplbbm+"' and tckd_tcppsjcjb.bjjbbm='"+bjjbbm+"' and tckd_tcppsjcjb.bjjbbm1='"+bjjbbm1+"'";
    ls_sql+=" order by tckd_tcppsjcjb.dqbm,tckd_tcppsjcjb.tccplbbm,tckd_tcppsjcjb.bjjbbm,tckd_tcppsjcjb.bjjbbm1,tckd_tcppsjcjb.ppmc";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","DeleteTckd_tcppsjcjb.jsp","EditTckd_tcppsjcjb.jsp");

//������ʾ��
	String[] disColName={"dqmc","clxlmc","bjjbmc","bjjbmc1","ppmc","jldw","sjcj","yxkssj","yxjzsj"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"dqbm","bjjbbm","bjjbbm1","tccplbbm","ppmc"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("ɾ��");
	pageObj.setViewBolt("");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">��Ʒ���</font></td>
    <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"' order by clxlmc","");
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">����</font></td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' ","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">ԭ���ۼ���</font></td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm where  bjjbbm='"+bjjbbm+"'","");
	%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�������ۼ���</font></td>
    <td><select name="bjjbbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm where  bjjbbm='"+bjjbbm1+"'","");
%>
    </select></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">������λ</font></td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm where jldwmc='"+jldw+"'",jldw);
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>��Ч��ʼʱ��</td>
    <td bgcolor="#E8E8FF"><input type="text" name="yxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>��Ч����ʱ��</td>
    <td bgcolor="#E8E8FF"><input type="text" name="yxjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>Ʒ��</td>
    <td bgcolor="#E8E8FF"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
    </select></td>
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>�������</td>
    <td bgcolor="#E8E8FF"><input type="text" name="sjcj" value="" size="20" maxlength="17" ></td>
  </tr>
  

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset"></td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��Ʒ���]��");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[ԭ���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm1)=="") {
		alert("��ѡ��[�������ۼ���]��");
		FormName.bjjbbm1.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}


	if(	javaTrim(FormName.yxkssj)=="") {
		alert("������[��Ч��ʼʱ��]��");
		FormName.yxkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxkssj, "��Ч��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yxjzsj)=="") {
		alert("������[��Ч����ʱ��]��");
		FormName.yxjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxjzsj, "��Ч����ʱ��"))) {
		return false;
	}
	if (FormName.yxkssj.value>FormName.yxjzsj.value)
	{
		alert("[��Ч��ʼʱ��]���ܴ���[��Ч����ʱ��]��");
		FormName.yxjzsj.select();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.sjcj)=="") {
		alert("������[�������]��");
		FormName.sjcj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjcj, "�������"))) {
		return false;
	}

	FormName.action="SaveInsertTckd_tcppsjcjb.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
