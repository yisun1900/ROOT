<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ztstr=cf.getItemData("select ztbm,ztmc||'  ��'||DECODE(rs_ztbm.ztlx,'01','��Ƹ','02','��ѵ','03','�䶯','04','��������','06','������ְ','07','��������','08','�Ӱ�����','09','���ڿ�������','10','��ٵ�','11','��������','12','�����λ����','13','��ְ����','14','�˻���Ա����')||'��',ztlx from rs_ztbm order by ztlx,ztbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_shztlcList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">״̬����</td>
      <td colspan="3"> 
        <select name="ztlx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(ztlx,rs_shztlc_ztbm,<%=ztstr%>);selectItem(ztlx,rs_shztlc_xyztbm,<%=ztstr%>);">
          <option value=""></option>
          <option value="01">��Ƹ</option>
          <option value="02">��ѵ</option>
          <option value="03">�䶯</option>
          <option value="04">��������</option>
          <option value="06">������ְ</option>
          <option value="07">��������</option>
          <option value="08">�Ӱ�����</option>
          <option value="09">���ڿ�������</option>
          <option value="10">��ٵ�</option>
          <option value="11">��������</option>
          <option value="12">�����λ����</option>
          <option value="13">��ְ����</option>
          <option value="14">�˻���Ա����</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">���״̬</td>
      <td colspan="3"> 
        <select name="rs_shztlc_ztbm" style="FONT-SIZE:12PX;WIDTH:352PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc||'  ��'||DECODE(rs_ztbm.ztlx,'01','��Ƹ','02','��ѵ','03','�䶯','04','��������','06','������ְ','07','��������','08','�Ӱ�����','09','���ڿ�������','10','��ٵ�','11','��������','12','�����λ����','13','��ְ����','14','�˻���Ա����')||'��' from rs_ztbm order by ztlx,ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��˽���</td>
      <td colspan="3"> 
        <select name="rs_shztlc_shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��һ״̬</td>
      <td colspan="3"> 
        <select name="rs_shztlc_xyztbm" style="FONT-SIZE:12PX;WIDTH:352PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc||'  ��'||DECODE(rs_ztbm.ztlx,'01','��Ƹ','02','��ѵ','03','�䶯','04','��������','06','������ְ','07','��������','08','�Ӱ�����','09','���ڿ�������','10','��ٵ�','11','��������','12','�����λ����','13','��ְ����','14','�˻���Ա����')||'��' from rs_ztbm order by ztlx,ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
