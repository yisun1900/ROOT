<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dqbm=(String)session.getAttribute("dqbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jc_cpjjbjList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��Ʒ�Ҿ߱�ţ�4λ��</td>
      <td width="30%"> 
        <input type="text" name="jc_cpjjbj_cpjjbh" size="20" maxlength="4" >
      </td>
      <td align="right" width="20%">���</td>
      <td width="30%"> 
        <select name="jc_cpjjbj_cpjjfg" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjfg c1,cpjjfg c2 from jdm_cpjjfg order by cpjjfg","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">����</td>
      <td width="30%"> 
        <select name="jc_cpjjbj_cpjjmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjmc c1,cpjjmc c2 from jdm_cpjjmc order by cpjjmc","");
%> 
        </select>
      </td>
      <td align="right" width="20%">�ͺ�</td>
      <td width="30%"> 
        <input type="text" name="jc_cpjjbj_xh" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">���</td>
      <td width="30%"> 
        <input type="text" name="jc_cpjjbj_gg" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">ϵ������</td>
      <td width="30%"> 
        <select name="jc_cpjjbj_cpjjxl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjxl c1,cpjjxl c2 from jdm_cpjjxl order by cpjjxl","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">����</td>
      <td width="30%"> 
        <select name="jc_cpjjbj_cpjjcz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjcz c1,cpjjcz c2 from jdm_cpjjcz order by cpjjcz","");
%> 
        </select>
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">����</td>
      <td width="30%"> 
        <input type="text" name="jc_cpjjbj_dj" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">�ο�ͼƬ</td>
      <td width="30%"> 
        <input type="text" name="jc_cpjjbj_cktp" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��ƷͼƬ</td>
      <td width="30%"> 
        <input type="text" name="jc_cpjjbj_cptp" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">����</td>
      <td width="30%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"jc_cpjjbj_dqbm\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"jc_cpjjbj_dqbm\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
        out.println("        </select>");
	}

%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�������</td>
      <td colspan="3"> 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_cpjjbj.cpjjbh desc">��Ʒ�Ҿ߱��</option>
          <option value="jc_cpjjbj.dj ">����</option>
          <option value="jc_cpjjbj.cktp">�ο�ͼƬ</option>
          <option value="jc_cpjjbj.cptp">��ƷͼƬ</option>
        </select>
        ÿҳ��ʾ���� 
        <input type="text" name="myxssl" size="7" maxlength="13" value="30">
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
	if(!(isFloat(FormName.jc_cpjjbj_dj, "����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
