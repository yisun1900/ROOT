<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ȫȨά��ʩ����<span class="STYLE1">���ɽ��������޸ġ�ɾ����</span></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_sgdQqList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">�����ֹ�˾</td>
              <td bgcolor="#FFFFCC"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') order by dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') and dwbh='"+ssfgs+"'","");
	}
%>
              </select></td>
              <td align="right" bgcolor="#FFFFCC">��������</td>
              <td bgcolor="#FFFFCC"><select name="sq_sgd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
	}
	else 
	{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  where dqbm='"+dqbm+"'","");
	}
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������־</td>
              <td><select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ����</option>
                  <option value="Y">�ѳ���</option>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�������</div>              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_sgd" size="20" maxlength="5" >              </td>
              <td width="19%"> 
                <div align="right">��������</div>              </td>
              <td width="31%"> 
                <select name="sq_sgd_sgdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="S0">ʩ����</option>
                  <option value="S1">ֱ��ʩ����</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��������</div>              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="100" >              </td>
              <td width="19%"> 
                <div align="right">�����绰</div>              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_dh" size="20" maxlength="30" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�Ӻ�</td>
              <td width="31%"> 
                <input type="text" name="duihao" value="" size="20" maxlength="20" >              </td>
              <td width="19%" align="right">����</td>
              <td width="31%"> 
                <select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm","");
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">������ͥ��ַ</td>
              <td colspan="3"> 
                <input type="text" name="sq_sgd_dz" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��������</div>              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="sq_sgd_cz" size="20" maxlength="50" >              </td>
              <td width="19%"> 
                <div align="right">����EMail</div>              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_email" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������ ��</td>
              <td bgcolor="#FFFFFF"><input type="text" name="grs" size="20" maxlength="10"  value="" ></td>
              <td align="right">��</td>
              <td><input type="text" name="grs2" size="20" maxlength="10"  value="" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ְʱ�� ��</td>
              <td bgcolor="#FFFFFF"><input type="text" name="rzsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
              <td align="right">��</td>
              <td><input type="text" name="rzsj2" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ְʱ�� �� </td>
              <td bgcolor="#FFFFFF"><input type="text" name="lzsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
              <td align="right">��</td>
              <td><input type="text" name="lzsj2" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="px" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="sq_sgd.sgdjbbm">ʩ���Ӽ���</option>
                  <option value="sq_sgd.duihao">�Ӻ�</option>
                  <option value="sq_sgd.sgdmc">ʩ��������</option>
                  <option value="sq_sgd.sgd">ʩ���ӱ��</option>
                </select>              </td>
              <td width="19%" align="right">�Ƿ�ǩ�Ͷ���ͬ</td>
              <td width="31%">
                <input type="radio" name="sfqldht" value="Y">
                �� 
                <input type="radio" name="sfqldht" value="N">
                ��</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>



<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.grs, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.grs2, "������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "��ְʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rzsj2, "��ְʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzsj, "��ְʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzsj2, "��ְʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
