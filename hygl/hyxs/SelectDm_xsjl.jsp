<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String) session.getAttribute("dwbh");
String yhjs=(String) session.getAttribute("yhjs");
String tjxz=request.getParameter("tjxz");
%>
<%
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx not in('5','6','7') order by ssdw,dwbh");
%>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr> 
    <td width="93%" height="258"> 
      <div align="center"> 
        <form method="post" action="Dm_xsjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">Ƭ��</td>
              <td width="35%"> 
                <select name="pq" style="FONT-SIZE:12px;WIDTH:152px" onChange="selectItem(pq,dwbh,<%=dwstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc,ssdw from sq_dwxx where dwlx in('0','1','2','4') order by dwbh","");
%> 
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��λ����</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12px;WIDTH:152px">
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ywxh" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">�������� ��</td>
              <td width="35%"> 
                <input type="text" name="xsrq" size="20" maxlength="10"  onKeyUp="keyGo(xsrq2)">
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="xsrq2" size="20" maxlength="10" >
                <input type="hidden" name="tjxz" value="<%=tjxz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">¼������ ��</td>
              <td width="35%"> 
                <input type="text" name="lrrq" size="20" maxlength="10"  onKeyUp="keyGo(lrrq2)">
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="lrrq2" size="20" maxlength="10" >
                <input type="hidden" name="tjxz" value="<%=tjxz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ա���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="35%"> 
                <select name="khlx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value="1">��Ա</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cpbm" size="20" maxlength="13" >
              </td>
              <td width="15%"> 
                <div align="right">���׷�ʽ</div>
              </td>
              <td width="35%"> 
                <select name="jyfs" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <option value="0">����</option>
                  <option value="1">���ֽ�</option>
                  <option value="2">�ڹ�</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">Ʒ������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="plbm" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">Ʒ�����</div>
              </td>
              <td width="35%"> 
                <select name="pmbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select pmbm,pmmc from xt_pmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��λ����</td>
              <td width="35%"> 
                <select name="jwbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jwbm,jwmc  from xt_jwbm order by jwbm","");
%> 
                </select>
              </td>
              <td width="15%" align="right">���۲�������</td>
              <td width="35%"> 
                <input type="text" name="xsbddbh" size="20" maxlength="11" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�����</td>
              <td width="35%"> 
                <input type="text" name="bkbh" size="20" maxlength="11" >
              </td>
              <td width="15%" align="right">��Ʒ���</td>
              <td width="35%"> 
                <select name="cplb" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"B+�ؽ�&A+��Ƕ","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFCC">��ʯ���� ��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zszl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zszl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF">��ʯ���� ��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="pszl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="pszl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">����(��) ��</td>
              <td width="35%"> 
                <input type="text" name="jlzl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="jlzl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">���ۼ�(Ԫ) ��</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="lsj" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">��</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="lsj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFCC">��ǩ��(Ԫ) ��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="bqj" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="bqj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ʵ���� ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sxj" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sxj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ʵ���ۿ���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjzkl" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">����ۿ���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zkl" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����Ա</div>
              </td>
              <td width="35%"> 
                <input type="text" name="czy" size="20" maxlength="16" >
              </td>
              <td width="15%"> 
                <div align="right">�Ƿ����</div>
              </td>
              <td width="35%"> 
                <select name="sfjs" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+δ����&1+����","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ۿ۳���</div>
              </td>
              <td width="35%"> 
                <select name="zkcx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+δ����&1+����","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">��˱�־</div>
              </td>
              <td width="35%"> 
                <select name="shbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+δͨ��&1+ͨ��&9+δ���","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ԭ��</div>
              </td>
              <td width="35%"> 
                <select name="gmyy" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,gmyy from hy_gmyydmb  order by xh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�������</div>
              </td>
              <td width="35%"> 
                <select name="gmyjbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gmyjbm,gmyjmc from hy_gmyjbm  order by gmyjbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�����</td>
              <td width="35%"> 
                <input type="text" name="shr" size="20" maxlength="16" >
              </td>
              <td width="15%" align="right">�������</td>
              <td width="35%"> 
                <input type="text" name="shrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="��ѯ��ϸ" onClick="f_mxb(selectform)">
                <input type="reset"  value="����">
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

function f_mxb(FormName)//����FormName:Form������
{
/*
	if(	javaTrim(FormName.xsrq)=="") {
		alert("������[��������]��");
		FormName.xsrq.focus();
		return false;
	}
*/
	if(!(isDatetime(FormName.xsrq, "��������"))) {
		return false;
	}
/*
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("������[��������]��");
		FormName.xsrq2.focus();
		return false;
	}
*/
	if(!(isDatetime(FormName.xsrq2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zkl, "����ۿ���"))) {
		return false;
	}
	if(!(isFloat(FormName.sjzkl, "ʵ���ۿ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "�Ƿ����"))) {
		return false;
	}
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
