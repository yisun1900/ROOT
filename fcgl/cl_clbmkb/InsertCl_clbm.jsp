<%@ page contentType="text/html;charset=GBK" %>
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
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">¼����ϱ����<br>
	  <font color="red" size="+1"><b>ע:¼���²��Ϻ�,Ӧ��ʱ֪ͨ���ֹ�˾�����Ա,�Ա�����۸�</b></font> </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCl_clbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="red">*</font>���ϱ���              </td>
              <td width="32%"> 
              <input type="text" name="clbm" value="" size="20" maxlength="20" ></td>
              <td width="18%" align="right"><font color="red">*</font>���ϴ���</td>
              <td width="32%"><select name="cldlmc" style="FONT-SIZE:12px;WIDTH:152px">
                <option value=""></option>
                <%
				cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm","");
				%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="red">*</font>�������� </td>
              <td colspan="3"><input type="text" name="clmc" value="" size="73" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="red">*</font>������λ</td>
              <td width="32%"><select name="jldwmc" style="FONT-SIZE:12px;WIDTH:152px">
                <option value=""></option>
                <%
				cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
				%>
              </select></td>
              <td width="18%" align="right">���Ϲ��</td>
              <td width="32%"> 
                <input type="text" name="clgg" value="" size="20" maxlength="50" >              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <input type="text" name="paixu" value="" size="20" maxlength="8" >              </td>
              <td width="18%" align="right">���� </td>
              <td width="32%"> 
                <input type="radio" name="lx" value="1">
                ���� 
                <input type="radio" name="lx" value="2" checked>
              �ǳ��� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" width="18%">ά����</td>
              <td width="32%">
                <input type="text" name="wxr" value="<%=yhmc%>" size="20" maxlength="20">              </td>
              <td width="18%" rowspan="3" align="right"><font color="red">*</font>���ۼ���</td>
              <td width="32%" rowspan="3">
			  <select name="bjjb" size="7" multiple style="FONT-SIZE:12px;WIDTH:152px">
         	   <option value=""></option>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
      		</select>	  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font><font color="#0000CC">��Ϣ¼����</font></td>
              <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font></td>
              <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                ��ע              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="2"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="lrjsfs" value="1" >
                <input type="hidden" name="lrbfb" value="" size="20" maxlength="10">
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset"> 
				<input type="button"  value="����" name="dr" onClick="window.open('ImpAddData.jsp')"></td>
            </tr>
        </table>
</form>
	  
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
 
	if(	javaTrim(FormName.clbm)=="") {
		alert("������[���ϱ���]��");
		FormName.clbm.focus();
		return false;
	}

	if(	javaTrim(FormName.clmc)=="") {
		alert("������[��������]��");
		FormName.clmc.focus();
		return false;
	}

	if(	javaTrim(FormName.jldwmc)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlmc)=="") {
		alert("��ѡ��[���ϴ���]��");
		FormName.cldlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.lrjsfs)=="") {
		alert("��ѡ��[������㷽ʽ]��");
		FormName.lrjsfs.focus();
		return false;
	}
	if (FormName.lrjsfs.value==2 && javaTrim(FormName.lrbfb)=="")
	{
		alert("��ѡ����[�ٷֱȷ�ʽ]����¼��[����ٷֱ�]");
		FormName.lrbfb.focus();
		return false;
	}
	if (!(isFloat(FormName.lrbfb,"����ٷֱ�"))){
		FormName.lrbfb.focus();     
		return      
	} 
	if (!(isNumber(FormName.paixu,"����"))){
		FormName.paixu.focus();     
		return      
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


	if(	!selectChecked(FormName.bjjb)) {
		alert("������[���ۼ���]��");
		FormName.bjjb.focus();
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
