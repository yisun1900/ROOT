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
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");

String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String bjjbbm=cf.executeQuery("select bjjb from crm_zxkhxx where khbh='"+khbh+"'");
String ssfgs=cf.executeQuery("select ssfgs from crm_zxkhxx where khbh='"+khbh+"'");
String zdyxmyxq=cf.executeQuery("select TO_CHAR(ADD_MONTHS(SYSDATE,zdyxmyxq),'YYYY-MM-DD') from sq_dwxx where dwbh='"+ssfgs+"'");

%>

<body bgcolor="#FFFFFF">

<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">״̬</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="5%">���ۼ���</td>
	<td  width="8%">��Ŀ���</td>
	<td  width="17%">��Ŀ����</td>
	<td  width="5%">������λ</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="45%">������</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT DECODE(bj_zdyxmb.shbz,'N','�������','S','��������','Y',' ���ͨ��','W','δͨ��','C','��������') shbz,bj_zdyxmb.lrsj,bjjbmc,bj_zdyxmb.xmbh,bj_zdyxmb.xmmc,jdm_jldwbm.jldwmc,bj_zdyxmb.bj,bj_zdyshjl.shyj";
	ls_sql+=" FROM bj_zdyxmb,jdm_jldwbm,bdm_bjjbbm,bj_zdyshjl   ";
	ls_sql+=" where bj_zdyxmb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zdyxmb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_zdyxmb.sqjl=bj_zdyshjl.sqjl(+)";
	ls_sql+=" and bj_zdyxmb.lrr='"+yhdlm+"' and bj_zdyxmb.shbz='W'";//N; ������ˣ�S:�������룻Y:���ͨ����W:���δͨ����C:��������
	ls_sql+=" order by bj_zdyxmb.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","CEditBj_zdyxmb.jsp?lrr="+yhdlm);
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("������");//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[7]="align='left'";

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

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ¼���Զ�����Ŀ&nbsp;<font color="#0000FF">����Ŀ����Զ����ɣ�</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button"  value="�ӱ�׼��Ŀ����" onClick=window.open("SelectDrBj_jzbjb1.jsp?dqbm=<%=dqbm%>&khbh=<%=khbh%>&bjjbbm=<%=bjjbbm%>","_self","toolbar=no,menubar=no")>
	  </div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">����</font></td>
              <td width="34%">
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
				cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
              </select>              </td>
              <td width="16%" align="right"><font color="#CC0000">*</font>���ۼ���</td>
              <td width="34%">
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font>��Ŀ����              </td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
              </select>              </td>
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font>��ĿС��              </td>
              <td width="34%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" >��Ŀ����</td>
              <td colspan="3"  ><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm","");
%>
              </select></td>
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
              <td width="16%" align="right" ><font color="#CC0000">*</font><font color="#0000CC">�Զ�����Ŀ��Ч��</font></td>
              <td width="34%" ><input type="text" name="zdyxmyxq" value="<%=zdyxmyxq%>" size="20" maxlength="10" readonly></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�ͻ�����</td>
              <td bgcolor="#CCCCFF"><input type="text" name="bj" value="" size="20" maxlength="17" ></td>
              <td bgcolor="#CCCCFF" align="right">&nbsp;</td>
              <td bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" >���ղ��ϼ��</td>
              <td colspan="3"  > 
                <textarea name="gycl" cols="71" rows="3"></textarea>              </td>
            </tr>
           <tr align="center"> 
             <td colspan="4">
				<input type="hidden" name="sfxycl" value="N" >
				<input type="hidden" name="sfxyyjd" value="N" >
				<input type="hidden" name="clbj" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="zcf" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="rgbj" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="ysf" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="jxbj" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="shf" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="qtf" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="flmcgg" value="" >
                 <input type="hidden" name="bz" value="" >
               <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
                <input type="button"  value="�������" onClick="bc.disabled=false;">
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="clcb" value="0" >
                <input type="hidden" name="rgcb" value="0" >
                <input type="hidden" name="jxcb" value="0" >
                <input type="hidden" name="cbenj" value="0" >
                <input type="hidden" name="sgdbj" value="0" >
                <input name="sgcbj" type="hidden"  value="0" >
                <input type="hidden" name="lrr" value="<%=yhdlm%>" >
                <input type="hidden" name="lrsj" value="<%=cf.today()%>" ></td>
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
//	var bj=FormName.clbj.value*1+FormName.rgbj.value*1+FormName.jxbj.value*1+FormName.zcf.value*1+FormName.shf.value*1+FormName.ysf.value*1+FormName.qtf.value*1;
//	bj=round(bj,2);
//	FormName.bj.value=bj;
}

function f_do(FormName)//����FormName:Form������
{
//	f_jsjg(FormName);

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
	
	if(	javaTrim(FormName.clcb)=="") {
		alert("������[���ϳɱ�]��");
		FormName.clcb.focus();
		return false;
	}
	if(!(isFloat(FormName.clcb, "���ϳɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgcb)=="") {
		alert("������[�˹��ɱ�]��");
		FormName.rgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.rgcb, "�˹��ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jxcb)=="") {
		alert("������[��е�ɱ�]��");
		FormName.jxcb.focus();
		return false;
	}
	if(!(isFloat(FormName.jxcb, "��е�ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.cbenj)=="") {
		alert("������[�ɱ���]��");
		FormName.cbenj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbenj, "�ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbj)=="") {
		alert("������[ʩ���ɱ���]��");
		FormName.sgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "ʩ���ɱ���"))) {
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
		alert("������[�ͻ�����]��");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "�ͻ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdbj)=="") {
		alert("������[���̻�������]��");
		FormName.sgdbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdbj, "���̻�������"))) {
		return false;
	}

	
	if(	javaTrim(FormName.zdyxmyxq)=="") {
		alert("������[�Զ�����Ŀ��Ч��]��");
		FormName.zdyxmyxq.focus();
		return false;
	}
	if(!(isDatetime(FormName.zdyxmyxq, "�Զ�����Ŀ��Ч��"))) {
		return false;
	}
/*
	if(	!radioChecked(FormName.sfxycl)) {
		alert("��ѡ��[�Ƿ���Ҫ����]��");
		FormName.sfxycl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxyyjd)) {
		alert("��ѡ��[�Ƿ���ҪԤ����]��");
		FormName.sfxyyjd[0].focus();
		return false;
	}
*/	
	FormName.action="SaveInsertBj_zdyxmb1.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}

//-->
</SCRIPT>
