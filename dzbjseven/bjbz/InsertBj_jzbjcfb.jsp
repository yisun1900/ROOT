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
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");

String yhmc=(String)session.getAttribute("yhmc");


String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String xmdlbm=cf.executeQuery("select xmdlbm from bj_jzbjb where bjjbbm='"+bjjbbm+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'");
String xmxlbm=cf.executeQuery("select xmxlbm from bj_jzbjb where bjjbbm='"+bjjbbm+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'");

%>

<body bgcolor="#FFFFFF">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">��Ŀ���</td>
	<td  width="16%">��Ŀ����</td>
	<td  width="5%">��λ</td>
	<td  width="5%">���ķ�</td>
	<td  width="5%">���ķ�</td>
	<td  width="5%">�˹���</td>
	<td  width="5%">�����</td>
	<td  width="5%">��е��</td>
	<td  width="5%">��ķ�</td>
	<td  width="5%">������</td>
	<td  width="7%">����Ԥ���</td>
	<td  width="29%">���ղ��ϼ��</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT bj_jzbjcfb.xmbh,bj_jzbjcfb.xmmc,jdm_jldwbm.jldwmc,bj_jzbjcfb.clbj,bj_jzbjcfb.zcf,bj_jzbjcfb.rgbj,bj_jzbjcfb.ysf,bj_jzbjcfb.jxbj,bj_jzbjcfb.shf,bj_jzbjcfb.qtf,bj_jzbjcfb.bj,gycl";
	ls_sql+=" FROM bj_jzbjcfb,jdm_jldwbm   ";
	ls_sql+=" where bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_jzbjcfb.fxmbh='"+xmbh+"' "; 
	ls_sql+=" and bj_jzbjcfb.bjbbh='"+bjbbh+"' "; 
	ls_sql+=" and bj_jzbjcfb.bjjbbm='"+bjjbbm+"' "; 
	ls_sql+=" and bj_jzbjcfb.dqbm='"+dqbm+"' "; 
	ls_sql+=" order by bj_jzbjcfb.xmbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","EditBj_jzbjcfb.jsp?bjbbh="+bjbbh+"&dqbm="+dqbm+"&bjjbbm="+bjjbbm+"&fxmbh="+xmbh,"DeleteBj_jzbjcfb.jsp?bjbbh="+bjbbh+"&dqbm="+dqbm+"&bjjbbm="+bjjbbm+"&fxmbh="+xmbh);
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("ɾ��");
	pageObj.setViewStr("�޸�");

//	pageObj.alignStr[7]="align='left'";
//	pageObj.alignStr[8]="align='left'";

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��ֱ��ۣ�¼�� </div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">���۰汾��</font></td>
              <td colspan="3"><input type="text" name="bjbbh" value="<%=bjbbh%>" size="73" maxlength="50" readonly>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">����</font></td>
              <td width="34%">
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
              </select>              </td>
              <td width="16%" align="right"><font color="#CC0000">*</font><font color="#0000CC">���ۼ���</font></td>
              <td width="34%">
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font><font color="#0000CC">����Ŀ���</font></td>
              <td bgcolor="#FFFFFF"><input type="text" name="fxmbh" size="20" maxlength="16"  value="<%=xmbh%>" readonly></td>
              <td align="right"><font color="#CC0000">*</font>��Ŀ���</td>
              <td><input type="text" name="xmbh" size="20" maxlength="16"  value="" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font>��Ŀ����              </td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
              </select>              </td>
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font>��ĿС��              </td>
              <td width="34%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" ><font color="#CC0000">*</font>��Ŀ����</td>
              <td colspan="3"  > 
                <input type="text" name="xmmc" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" ><font color="#CC0000">*</font>������λ</td>
              <td width="34%" ><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%>
              </select></td>
              <td width="16%" align="right" >����</td>
              <td width="34%" ><select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%>
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF"><strong>���ⱨ��</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>���ķ�</td>
              <td bgcolor="#CCCCFF"><input type="text" name="clbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>���ķ�</td>
              <td bgcolor="#CCCCFF"><input type="text" name="zcf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�˹���</td>
              <td bgcolor="#CCCCFF"><input type="text" name="rgbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>�����</td>
              <td bgcolor="#CCCCFF"><input type="text" name="ysf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>��е��</td>
              <td bgcolor="#CCCCFF"><input type="text" name="jxbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>��ķ�</td>
              <td bgcolor="#CCCCFF"><input type="text" name="shf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>������</td>
              <td bgcolor="#CCCCFF"><input type="text" name="qtf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font><font color="#0000CC">����Ԥ���</font></td>
              <td bgcolor="#CCCCFF"><input type="text" name="bj" value="����¼���Զ�����" size="20" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF">&nbsp;</td>
              <td colspan="3" bgcolor="#CCCCFF"><font color="#0000CC"><strong>ע�⣺����Ԥ���<font color="#FF0000">(<font color="#0000CC"><strong>�Զ�����</strong></font>)</font>�����ķ�+���ķѣ��˹��ѣ�����ѣ���е�ѣ���ķѣ�������</strong></font></td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" >���ղ��ϼ��</td>
              <td colspan="3"  > 
                <textarea name="gycl" cols="71" rows="3"></textarea>              </td>
            </tr>
             <tr bgcolor="#FFFFFF">
              <td align="right">�������ƹ��</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="2"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>              </td>
            </tr>
           <tr align="center"> 
             <td colspan="4"> 
                <input type="hidden" name="lrr" value="<%=yhmc%>" >
                <input type="hidden" name="lrsj" value="<%=cf.today()%>" >
              <input type="button"  value="����" onClick="f_do(insertform)" name="bc"></td>
            </tr>
        </table>
</form>    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
 
function f_jsjg(FormName)//����FormName:Form������
{
	var bj=FormName.clbj.value*1+FormName.rgbj.value*1+FormName.jxbj.value*1+FormName.zcf.value*1+FormName.shf.value*1+FormName.ysf.value*1+FormName.qtf.value*1;
	bj=round(bj,2);
	FormName.bj.value=bj;
}

function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("������[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}


	if(	javaTrim(FormName.fxmbh)=="") {
		alert("������[����Ŀ���]��");
		FormName.fxmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	

	if(	javaTrim(FormName.clbj)=="") {
		alert("������[���ķ�]��");
		FormName.clbj.focus();
		return false;
	}
	if(!(isFloat(FormName.clbj, "���ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgbj)=="") {
		alert("������[�˹���]��");
		FormName.rgbj.focus();
		return false;
	}
	if(!(isFloat(FormName.rgbj, "�˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.jxbj)=="") {
		alert("������[��е��]��");
		FormName.jxbj.focus();
		return false;
	}
	if(!(isFloat(FormName.jxbj, "��е��"))) {
		return false;
	}
	if(	javaTrim(FormName.zcf)=="") {
		alert("������[���ķ�]��");
		FormName.zcf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcf, "���ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.shf)=="") {
		alert("������[��ķ�]��");
		FormName.shf.focus();
		return false;
	}
	if(!(isFloat(FormName.shf, "��ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("������[�����]��");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.qtf)=="") {
		alert("������[������]��");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.bj)=="") {
		alert("������[����Ԥ���]��");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "����Ԥ���"))) {
		return false;
	}


	FormName.action="SaveInsertBj_jzbjcfb.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
