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
	String yhjs=(String)session.getAttribute("yhjs");
	String lrr=(String)session.getAttribute("yhmc");
	String lrbm=(String)session.getAttribute("dwbh");

	String dqbm=request.getParameter("dqbm");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 
        <p>��¼������</p>
        <p>ע�⣺��ά��ľ�ż۸�ʱ����ά�������۸������ŵ��ۡ�˫������ÿ�׵��ۡ���������ÿ�׵���</p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>ľ���ͺ�</div>
              </td>
              <td width="30%"> 
                <select name="mmxh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmxh c1,mmxh||'('||dqmc||')' c2 from jc_mmxhb,dm_dqbm where jc_mmxhb.dqbm=dm_dqbm.dqbm(+) and jc_mmxhb.dqbm='"+dqbm+"' order by jc_mmxhb.dqbm,mmxh","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"></div>
              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>����</td>
              <td colspan="3"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:515PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>ǽ��۸�����</div>
              </td>
              <td width="30%"> 
                <select name="qhjgqjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select qhjgqjbm,qhjgqj from jdm_qhjgqj where mmdglxbm='01' order by qhjgqjbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font>�����ŵ���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="ztmdj" size="20" maxlength="17" onKeyUp="keyGo(mtjg)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#0000CC">�����ȼ۸�</font></td>
              <td width="30%"> 
                <input type="text" name="dmsjg" value="0" size="20" maxlength="17" onKeyUp="keyGo(dmtjg)" readonly>
              </td>
              <td width="19%" align="right"><font color="#0000CC">�����׼۸�</font></td>
              <td width="31%"> 
                <input type="text" name="dmtjg" value="0" size="20" maxlength="17" onKeyUp="keyGo(mtjg)" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>˫������ÿ�׵���</td>
              <td width="30%"> 
                <input type="text" name="mtjg" size="20" maxlength="17" onKeyUp="keyGo(dkmtjg)">
              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>��������ÿ�׵���</td>
              <td width="31%"> 
                <input type="text" name="dkmtjg" size="20" maxlength="17" onKeyUp="keyGo(zmmjg)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>��ĸ�żӼ���</td>
              <td width="30%"> 
                <input type="text" name="zmmjg" value="1.67" size="20" maxlength="17" onKeyUp="keyGo(zdmjjl)">
              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>�۵��żӼ���</td>
              <td width="31%"> 
                <input type="text" name="zdmjjl" value="1.2" size="20" maxlength="17" onKeyUp="keyGo(yksmjjl)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�ƿ���ľ���ɲļӼ���</td>
              <td width="30%"> 
                <input type="text" name="yksmjjl" value="1.1" size="20" maxlength="17" onKeyUp="keyGo(bz)">
              </td>
              <td width="19%" align="right"><font color="#0000CC">���������Ӽ���</font></td>
              <td width="31%"> 
                <input type="text" name="ysbljjl" value="1" size="20" maxlength="17" onKeyUp="keyGo(bz)" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">������ÿƽ�׵���</font></td>
              <td width="30%"> 
                <input type="text" name="tlmpmdj" value="0" size="20" maxlength="17" readonly>
              </td>
              <td width="19%">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼����</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼��ʱ��</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼�벿��</font></td>
              <td width="30%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>
              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��������</font></td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" rows="3" cols="70"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <input type="button"  value="����--ľ�ű���" onClick="f_dc(insertform)">
                <input type="button"  value="����--ľ�ű���" onClick="f_dr(insertform)">
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
	if(	javaTrim(FormName.mmxh)=="") {
		alert("��ѡ��[ľ���ͺ�]��");
		FormName.mmxh.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("��ѡ��[����");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.qhjgqjbm)=="") {
		alert("��ѡ��[ǽ��۸�����]��");
		FormName.qhjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ztmdj)=="") {
		alert("������[�����ŵ���]��");
		FormName.ztmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.ztmdj, "�����ŵ���"))) {
		return false;
	}

	if (parseFloat(FormName.ztmdj.value)==0)
	{
		alert("[�����ŵ���]����Ϊ0��");
		FormName.ztmdj.select();
		return false;
	}

	if(	javaTrim(FormName.dmsjg)=="") {
		alert("������[�����ȼ۸�]��");
		FormName.dmsjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dmsjg, "�����ȼ۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.dmtjg)=="") {
		alert("������[�����׼۸�]��");
		FormName.dmtjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dmtjg, "�����׼۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.mtjg)=="") {
		alert("������[˫������ÿ�׵���]��");
		FormName.mtjg.focus();
		return false;
	}
	if(!(isFloat(FormName.mtjg, "˫������ÿ�׵���"))) {
		return false;
	}

	if (parseFloat(FormName.mtjg.value)==0)
	{
		alert("[˫������ÿ�׵���]����Ϊ0��");
		FormName.mtjg.select();
		return false;
	}

	if(	javaTrim(FormName.dkmtjg)=="") {
		alert("������[��������ÿ�׵���]��");
		FormName.dkmtjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dkmtjg, "��������ÿ�׵���"))) {
		return false;
	}

	if (parseFloat(FormName.dkmtjg.value)==0)
	{
		alert("[��������ÿ�׵���]����Ϊ0��");
		FormName.dkmtjg.select();
		return false;
	}

	if(	javaTrim(FormName.zmmjg)=="") {
		alert("������[��ĸ�żӼ���]��");
		FormName.zmmjg.focus();
		return false;
	}
	if(!(isFloat(FormName.zmmjg, "��ĸ�żӼ���"))) {
		return false;
	}

	if (parseFloat(FormName.zmmjg.value)==0)
	{
		alert("[��ĸ�żӼ���]����Ϊ0��");
		FormName.zmmjg.select();
		return false;
	}

	if(	javaTrim(FormName.zdmjjl)=="") {
		alert("������[�۵��żӼ���]��");
		FormName.zdmjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.zdmjjl, "�۵��żӼ���"))) {
		return false;
	}

	if (parseFloat(FormName.zdmjjl.value)==0)
	{
		alert("[�۵��żӼ���]����Ϊ0��");
		FormName.zdmjjl.select();
		return false;
	}

	if(	javaTrim(FormName.yksmjjl)=="") {
		alert("������[�ƿ���ľ���ɲļӼ���]��");
		FormName.yksmjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.yksmjjl, "�ƿ���ľ���ɲļӼ���"))) {
		return false;
	}

	if (parseFloat(FormName.yksmjjl.value)==0)
	{
		alert("[�ƿ���ľ���ɲļӼ���]����Ϊ0��");
		FormName.yksmjjl.select();
		return false;
	}

	if(	javaTrim(FormName.ysbljjl)=="") {
		alert("������[���������Ӽ���]��");
		FormName.ysbljjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ysbljjl, "���������Ӽ���"))) {
		return false;
	}

	if(	javaTrim(FormName.tlmpmdj)=="") {
		alert("������[������ÿƽ�׵���]��");
		FormName.tlmpmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tlmpmdj, "������ÿƽ�׵���"))) {
		return false;
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="SaveInsertJc_mmbjb.jsp";
	FormName.submit();
	return true;
}

function f_dr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ChooseDate.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ExpMmbj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

