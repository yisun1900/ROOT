<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//���ӱ����м�����
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//���ӱ����и߼�����
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//���ӱ��۸߼�����

String dqbm=request.getParameter("dqbm");
String[] xmbh = request.getParameterValues("xmbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="" name="selectform" target="_blank">
		  <p> 
            <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
<%
	for (int i=0;i<xmbh.length ;i++ )
	{
		out.println("<input type=\"hidden\" name=\"xmbh\" value=\""+xmbh[i]+"\" >");
	}
%> 
			1�������޸Ĺ��̱���
          <table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="32%" height="2" align="right">ѡ�����޸ļ۸�</td>
              <td width="68%" height="2"> 
                <select name="jgzd" onChange="jggs.value=''">
                  <option value=""></option>
                  <option value="bj"><%=dzbjzjmc%>����</option>
                  <option value="bbj"><%=dzbjzgjmc%>����</option>
                  <option value="cbj"><%=dzbjgjmc%>����</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td rowspan="2" align="right" width="32%">�����޸Ĺ�ʽ</td>
              <td width="68%"> 
                <select name="jgfh">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">��</option>
                  <option value="/">��</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="bj"><%=dzbjzjmc%>����</option>
                  <option value="bbj"><%=dzbjzgjmc%>����</option>
                  <option value="cbj"><%=dzbjgjmc%>����</option>
                </select>
                <input type="text" name="jgxs" size="14">
                <input type="button"  value="����" onClick="jggs.value+=jgfh.value+jgxs.value" name="button4">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="68%"> 
                <input type="text" name="jggs" size="30" readonly="true">
                <input type="button"  value="�޸ļ۸�" onClick="f_jg(selectform)" name="button32">
              </td>
            </tr>
          </table>
          <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">�޸Ĳ��Ϸ�</div>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="43%" height="2" align="right">���޸Ĳ��Ϸ� 
                <select name="clfzd" onChange="clfgs.value=''">
                  <option value=""></option>
                  <option value="clf"><%=dzbjzjmc%>���Ϸ�</option>
                  <option value="bclf"><%=dzbjzgjmc%>���Ϸ�</option>
                  <option value="cclf"><%=dzbjgjmc%>���Ϸ�</option>
                </select>
                = </td>
              <td width="57%" height="2"> 
                <input type="text" name="clfgs" size="30" readonly="true">
                <input type="button"  value="�޸�" onClick="f_clf(selectform)" name="button3">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="43%" align="right">�޸Ĺ�ʽ��</td>
              <td width="57%"> 
                <select name="clffh">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">��</option>
                  <option value="/">��</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="clf"><%=dzbjzjmc%>���Ϸ�</option>
                  <option value="bclf"><%=dzbjzgjmc%>���Ϸ�</option>
                  <option value="cclf"><%=dzbjgjmc%>���Ϸ�</option>
                   <option value="bj"><%=dzbjzjmc%>����</option>
                  <option value="bbj"><%=dzbjzgjmc%>����</option>
                  <option value="cbj"><%=dzbjgjmc%>����</option>
               </select>
                <input type="text" name="clfxs" size="12">
                <input type="button"  value="����" onClick="clfgs.value+=clffh.value+clfxs.value" name="button">
              </td>
            </tr>
          </table>
          <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">�޸����ķ�</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" height="2" align="right">���޸������� 
                <select name="clylzd" onChange="clylgs.value=''">
                  <option value=""></option>
                  <option value="zcf"><%=dzbjzjmc%>���ķ�</option>
                  <option value="bzcf"><%=dzbjzgjmc%>���ķ�</option>
                  <option value="czcf"><%=dzbjgjmc%>���ķ�</option>
                </select>
                = </td>
              <td width="53%" height="2"> 
                <input type="text" name="clylgs" size="30" readonly="true">
                <input type="button"  value="�޸�" onClick="f_clyl(selectform)" name="button3">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" align="right">�޸Ĺ�ʽ��</td>
              <td width="53%"> 
                <select name="clylfh">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">��</option>
                  <option value="/">��</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="zcf"><%=dzbjzjmc%>���ķ�</option>
                  <option value="bzcf"><%=dzbjzgjmc%>���ķ�</option>
                  <option value="czcf"><%=dzbjgjmc%>���ķ�</option>
                </select>
                <input type="text" name="clylxs" size="11">
                <input type="button"  value="����" onClick="clylgs.value+=clylfh.value+clylxs.value" name="button">
              </td>
            </tr>
          </table>
		  <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">�޸��˹���</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" height="2" align="right">���޸��˹��� 
                <select name="rgf" onChange="rgf1.value=''">
                  <option value=""></option>
                  <option value="rgf"><%=dzbjzjmc%>�˹���</option>
                  <option value="brgf"><%=dzbjzgjmc%>�˹���</option>
                  <option value="crgf"><%=dzbjgjmc%>�˹���</option>
                </select>
                = </td>
              <td width="53%" height="2"> 
                <input type="text" name="rgf1" size="30" readonly="true">
                <input type="button"  value="�޸�" onClick="f_rgf(selectform)" name="button9">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" align="right">�޸Ĺ�ʽ��</td>
              <td width="53%"> 
                <select name="cly">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">��</option>
                  <option value="/">��</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="rgf"><%=dzbjzjmc%>�˹���</option>
                  <option value="brgf"><%=dzbjzgjmc%>�˹���</option>
                  <option value="crgf"><%=dzbjgjmc%>�˹���</option>
                </select>
                <input type="text" name="cl" size="11">
                <input type="button"  value="����" onClick="rgf1.value+=cly.value+cl.value" name="button">
              </td>
            </tr>
          </table>
		  <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">�޸Ļ�е��</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" height="2" align="right">���޸Ļ�е��
                <select name="jjf" onChange="jjf1.value=''">
                  <option value=""></option>
                  <option value="jjf"><%=dzbjzjmc%>��е��</option>
                  <option value="bjjf"><%=dzbjzgjmc%>��е��</option>
                  <option value="cjjf"><%=dzbjgjmc%>��е��</option>
                </select>
                = </td>
              <td width="53%" height="2"> 
                <input type="text" name="jjf1" size="30" readonly="true">
                <input type="button"  value="�޸�" onClick="f_jjf(selectform)" name="button13">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" align="right">�޸Ĺ�ʽ��</td>
              <td width="53%"> 
                <select name="cl2">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">��</option>
                  <option value="/">��</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="jjf"><%=dzbjzjmc%>��е��</option>
                  <option value="bjjf"><%=dzbjzgjmc%>��е��</option>
                  <option value="cjjf"><%=dzbjgjmc%>��е��</option>
                </select>
                <input type="text" name="jl" size="11">
                <input type="button"  value="����" onClick="jjf1.value+=cl2.value+jl.value" name="button">
              </td>
            </tr>
          </table>
		   <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">�޸Ĺ���Ѱٷֱ�</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" height="2" align="right">����Ѱٷֱ�
                <select name="glfbl" onChange="glfbl1.value=''">
                  <option value=""></option>
                  <option value="glfbl"><%=dzbjzjmc%>����Ѱٷֱ�</option>
                  <option value="bglfbl"><%=dzbjzgjmc%>����Ѱٷֱ�</option>
                  <option value="cglfbl"><%=dzbjgjmc%>����Ѱٷֱ�</option>
                </select>
                = </td>
              <td width="53%" height="2"> 
                <input type="text" name="glfbl1" size="30" readonly="true">
                <input type="button"  value="�޸�" onClick="f_glfbl(selectform)" name="button14">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" align="right">�޸Ĺ�ʽ��</td>
              <td width="53%"> 
                <select name="cl3">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">��</option>
                  <option value="/">��</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="glfbl"><%=dzbjzjmc%>����Ѱٷֱ�</option>
                  <option value="bglfbl"><%=dzbjzgjmc%>����Ѱٷֱ�</option>
                  <option value="cglfbl"><%=dzbjgjmc%>����Ѱٷֱ�</option>
                </select>
                <input type="text" name="jl2" size="11">
                <input type="button"  value="����" onClick="glfbl1.value+=cl3.value+jl2.value" name="button">
              </td>
            </tr>
          </table>
		  <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">�޸�����ٷֱ�</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" height="2" align="right">����ٷֱ�
                <select name="lrbl" onChange="lrbl1.value=''">
                  <option value=""></option>
                  <option value="lrbl"><%=dzbjzjmc%>����ٷֱ�</option>
                  <option value="blrbl"><%=dzbjzgjmc%>����ٷֱ�</option>
                  <option value="clrbl"><%=dzbjgjmc%>����ٷֱ�</option>
                </select>
                = </td>
              <td width="53%" height="2"> 
                <input type="text" name="lrbl1" size="30" readonly="true">
                <input type="button"  value="�޸�" onClick="f_lrbl(selectform)" name="button15">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" align="right">�޸Ĺ�ʽ��</td>
              <td width="53%"> 
                <select name="cl4">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">��</option>
                  <option value="/">��</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="lrbl"><%=dzbjzjmc%>����ٷֱ�</option>
                  <option value="blrbl"><%=dzbjzgjmc%>����ٷֱ�</option>
                  <option value="clrbl"><%=dzbjgjmc%>����ٷֱ�</option>
                </select>
                <input type="text" name="jl5" size="11">
                <input type="button"  value="����" onClick="lrbl1.value+=cl4.value+jl5.value" name="button">
              </td>
            </tr>
          </table>
          <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">ȫ���滻���ղ���</div>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="40%" align="right" height="38" bgcolor="#CCFFFF"> 
                <div align="right">���޸Ĺ��ղ��� </div>
              </td>
              <td width="60%" height="38"> 
                <select name="xzgycl"  style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="a"><%=dzbjzjmc%>���ղ���</option>
                  <option value="b"><%=dzbjzgjmc%>���ղ���</option>
                  <option value="c"><%=dzbjgjmc%>���ղ���</option>
                  <option value="all">ȫ�����ղ���</option>
                </select>
              </td>
            </tr>
            <tr valign="middle" bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="38"> 
                <div align="center">�¹��ղ��� 
                  <textarea name="gycl" cols="77" rows="8"></textarea>
                </div>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center"> 
                  <input type="button"  value="�޸�" onClick="f_gycl(selectform)" name="button22">
                  <input type="reset"  value="����" name="reset2">
                </div>
              </td>
            </tr>
          </table>
          <table width="59%" border="1"  style="FONT-SIZE:14">
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">�����滻���ղ���</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="50%" align="right" height="38">���滻���ղ���</td>
              <td width="50%" height="38"> 
                <select name="bfxzgycl"  style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="a"><%=dzbjzjmc%>���ղ���</option>
                  <option value="b"><%=dzbjzgjmc%>���ղ���</option>
                  <option value="c"><%=dzbjgjmc%>���ղ���</option>
                  <option value="all">ȫ�����ղ���</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="50%" align="right" height="38"> 
                <div align="center">���滻�ַ� 
                  <textarea name="oldgycl" cols="36" rows="3"></textarea>
                </div>
              </td>
              <td width="50%" height="38"> 
                <div align="center">�滻���ַ� 
                  <textarea name="newgycl" cols="36" rows="3"></textarea>
                </div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center"> 
                  <input type="button"  value="�޸�" onClick="f_bfgycl(selectform)" name="button2">
                  <input type="reset"  value="����" name="reset">
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
function f_rgf(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.rgf)=="") {
		alert("������[ѡ�����޸ļ۸�]��");
		FormName.rgf.focus();
		return false;
	}
	if(	javaTrim(FormName.cly)=="") {
		alert("������[�۸��޸Ĺ�ʽ]��");
		FormName.cly.focus();
		return false;
	}

	FormName.action="Updatergf.jsp";
	FormName.submit();
	return true;
}
function f_lrbl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.lrbl)=="") {
		alert("������[ѡ�����޸ļ۸�]��");
		FormName.lrbl.focus();
		return false;
	}
	if(	javaTrim(FormName.cl4)=="") {
		alert("������[�۸��޸Ĺ�ʽ]��");
		FormName.cl4.focus();
		return false;
	}

	FormName.action="Updatelrbl.jsp";
	FormName.submit();
	return true;
}
function f_glfbl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.glfbl)=="") {
		alert("������[ѡ�����޸ļ۸�]��");
		FormName.glfbl.focus();
		return false;
	}
	if(	javaTrim(FormName.cl3)=="") {
		alert("������[�۸��޸Ĺ�ʽ]��");
		FormName.cl3.focus();
		return false;
	}

	FormName.action="Updatglfb.jsp";
	FormName.submit();
	return true;
}
function f_jjf(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jjf)=="") {
		alert("������[ѡ�����޸ļ۸�]��");
		FormName.jjf.focus();
		return false;
	}
	if(	javaTrim(FormName.cl2)=="") {
		alert("������[�۸��޸Ĺ�ʽ]��");
		FormName.cl2.focus();
		return false;
	}

	FormName.action="Updatejjf.jsp";
	FormName.submit();
	return true;
}
function f_jg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jgzd)=="") {
		alert("������[ѡ�����޸ļ۸�]��");
		FormName.jgzd.focus();
		return false;
	}
	if(	javaTrim(FormName.jggs)=="") {
		alert("������[�۸��޸Ĺ�ʽ]��");
		FormName.jggs.focus();
		return false;
	}

	FormName.action="UpdateTj.jsp";
	FormName.submit();
	return true;
}
function f_clf(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.clfzd)=="") {
		alert("������[���޸Ĳ��Ϸ� ]��");
		FormName.clfzd.focus();
		return false;
	}
	if(	javaTrim(FormName.clfgs)=="") {
		alert("������[���Ϸ��޸Ĺ�ʽ]��");
		FormName.clfgs.focus();
		return false;
	}

	FormName.action="UpdateClf.jsp";
	FormName.submit();
	return true;
}
function f_clyl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.clylzd)=="") {
		alert("������[�޸Ĳ������� ]��");
		FormName.clylzd.focus();
		return false;
	}
	if(	javaTrim(FormName.clylgs)=="") {
		alert("������[���������޸Ĺ�ʽ]��");
		FormName.clylgs.focus();
		return false;
	}

	FormName.action="UpdateClyl.jsp";
	FormName.submit();
	return true;
}
function f_gycl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xzgycl)=="") {
		alert("������[���޸Ĺ��ղ���]��");
		FormName.xzgycl.focus();
		return false;
	}
	if(	javaTrim(FormName.gycl)=="") {
		alert("������[�¹��ղ���]��");
		FormName.gycl.focus();
		return false;
	}

	FormName.action="UpdateGycl.jsp";
	FormName.submit();
	return true;
}
function f_bfgycl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.bfxzgycl)=="") {
		alert("������[���滻���ղ���]��");
		FormName.bfxzgycl.focus();
		return false;
	}
	if(	javaTrim(FormName.oldgycl)=="") {
		alert("������[���滻]��");
		FormName.oldgycl.focus();
		return false;
	}
	if(	javaTrim(FormName.newgycl)=="") {
		alert("������[�滻��]��");
		FormName.newgycl.focus();
		return false;
	}

	FormName.action="UpdateBfGycl.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
