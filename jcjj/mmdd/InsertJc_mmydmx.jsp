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
String yddbh=request.getParameter("yddbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ľ��Ԥ����ϸ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_mmydmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">Ԥ�������</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">��������</div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mlx,mlxmc from jdm_mlx order by mlx","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">ľ���ͺ�</div>
              </td>
              <td width="33%"> 
                <select name="mmxh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmxh,trim(mmxh)||'('||mxmc||','||myt||')' from jc_mmxhb,jdm_mxbm,jdm_mytbm where jc_mmxhb.mxbm=jdm_mxbm.mxbm and jc_mmxhb.mytbm=jdm_mytbm.mytbm order by mmxh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ɫ</div>
              </td>
              <td width="35%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">����</div>
              </td>
              <td width="33%"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">��װλ��</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="azwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select azwzbm,azwzmc from jdm_azwzbm order by azwzbm","");
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">��������</div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <select name="kqfxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">�����ͺ�</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select blxhbm,blxh from jc_blbj order by blxhbm","");
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">�ز�����</div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <select name="dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dczlbm,dczlmc from jdm_dczlbm order by dczlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF" align="right">����/�ƿڲ���</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="radio" name="sfsmjcc" value="Y">
                ��ľ���ɲ� 
                <input type="radio" name="sfsmjcc" value="N">
                ����ľ���ɲ� </td>
              <td width="17%" bgcolor="#FFFFFF" align="right">�Ƿ��ж���</td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <input type="radio" name="sfydc" value="Y">
                �ж��� 
                <input type="radio" name="sfydc" value="N">
                �޶��� </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF" align="right">����/���ױ���</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="ctbs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="3">����</option>
                  <option value="4">�ı�</option>
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFFF" align="right">��������</td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <input type="text" name="sl" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF">��ע</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("��ѡ��[ľ�Ŷ�������]��");
		FormName.mmdglxbm.focus();
		return false;
	}
	
	if(	javaTrim(FormName.sl)=="") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "��������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
