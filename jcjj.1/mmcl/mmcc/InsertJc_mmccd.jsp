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
String yddbh=request.getParameter("yddbh");
String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ľ�ų��ⵥ��<font color="#FF6699">ע�⣺Ӱ�쵽�۸񲿷֣�[��/��/����/���Ǹ�]����[�زĺ�]</font>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_mmccd.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">Ԥ�������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="18%"> 
                <div align="right">��������</div>
              </td>
              <td width="32%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDglx(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">������</div>
              </td>
              <td width="29%" bgcolor="#FFFFFF"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform);tx(mlx)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mlx,mlxmc||':'||tx from jdm_mlx order by mlx","");
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right">��ɫ</div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" bgcolor="#FFCCFF" align="right">ľ���ͺ�</td>
              <td colspan="3" bgcolor="#FFCCFF"> 
                <select name="mmxh" style="FONT-SIZE:12PX;WIDTH:452PX" onChange="getMmxh(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmxh,trim(mmxh)||'('||mxmc||','||myt||')' from jc_mmxhb,jdm_mxbm,jdm_mytbm where jc_mmxhb.mxbm=jdm_mxbm.mxbm and jc_mmxhb.mytbm=jdm_mytbm.mytbm and jc_mmxhb.dqbm='"+dqbm+"' and jc_mmxhb.mmxh in(select distinct mmxh from jc_mmbjb where dqbm='"+dqbm+"') order by mmxh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" bgcolor="#FFCCFF"> 
                <div align="right">����</div>
              </td>
              <td colspan="3" bgcolor="#FFCCFF"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:452PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��װλ��</div>
              </td>
              <td width="29%"> 
                <select name="azwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select azwzbm,azwzmc from jdm_azwzbm order by azwzbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">��������</div>
              </td>
              <td width="32%"> 
                <select name="kqfxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">����,�ƿ�,���ף�������</td>
              <td width="29%"> 
                <select name="mtxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mtxbm,mtxmc from jdm_mtxbm order by mtxbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">����,�ƿ�,���ף���о��</td>
              <td width="32%"> 
                <select name="mxxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mxxbm,mxxmc from jdm_mxxbm order by mxxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">�ز�����</td>
              <td width="29%"> 
                <select name="dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(dczlbm,dbh);getDj(insertform);">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dczlbm,dczlmc||'�����:'||dzhd from jdm_dczlbm order by dczlbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">�����ͺ�</td>
              <td width="32%"> 
                <select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select blxhbm,blxh from jc_blbj order by blxhbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFCCFF">��/��/ƽ̨�Ͽ�/����ǽ��</td>
              <td width="29%" bgcolor="#FFCCFF"> 
                <input type="text" name="qh" value="" size="14" maxlength="8"  onChange="getDj(insertform)">
                ��mm�� </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">�زĺ�</td>
              <td width="32%"> 
                <input type="text" name="dbh" value="" size="14" maxlength="8"  onChange="getDj(insertform)" >
                ��mm�� </td>
            </tr>
            <tr bgcolor="#FFCCFF"> 
              <td width="21%" align="right"> ��/��/ƽ̨�Ͽ�/���ǿ�</td>
              <td width="29%"> 
                <input type="text" name="mdk" value="" size="14" maxlength="8"  onChange="getDj(insertform)">
                ��mm�� </td>
              <td width="18%" align="right"> ��/��/����/���Ǹ�</td>
              <td width="32%"> 
                <input type="text" name="mdg" value="" size="14" maxlength="8"  onChange="getDj(insertform)">
                ��mm�� ��<b><font color="#0000FF">�����زĺ�</font></b>��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">���ȿ�</td>
              <td width="29%"> 
                <input type="text" name="msk" value="" size="14" maxlength="8">
                ��mm�� </td>
              <td width="18%" align="right">���ȸ�</td>
              <td width="32%"> 
                <input type="text" name="msg" value="" size="14" maxlength="8">
                ��mm����<b><font color="#0000FF">�����زĺ�</font></b>��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��˫��</td>
              <td width="29%"> 
                <input type="radio" name="dsk" value="1">
                ���� 
                <input type="radio" name="dsk" value="2">
                ˫�� </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#FFFFFF" align="right">�Ƿ��ж���</td>
              <td width="29%" bgcolor="#FFFFFF"> 
                <input type="radio" name="sfydc" value="Y">
                �ж��� 
                <input type="radio" name="sfydc" value="N">
                �޶���</td>
              <td width="18%" bgcolor="#FFFFFF" align="right">����/�ƿڲ���</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <select name="sfsmjcc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��ľ���ɲ�&N+����ľ���ɲ�","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">����/���ױ���</div>
              </td>
              <td width="29%"> 
                <select name="ctbs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <option value="3">����</option>
                  <option value="4">�ı�</option>
                </select>
              </td>
              <td width="18%"> 
                <div align="right">�߽���/ŷʽ��ñ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tjx" value="" size="12" maxlength="8"  onChange="getDj(insertform)">
                ���� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="sl" value="" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">��׼���ۣ�Ԫ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="dj" value="" size="20" maxlength="9" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="jjfs" value="" >
                <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
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
function tx(mlx)//����FormName:Form������
{
	var tx=getSubStr(mlx);
	if (tx!="")
	{
		alert("ע�⣡"+tx);
	}
}

function addItem(f1,text,value)
{
	var op1=document.createElement("OPTION");
	op1.text=text;
	op1.value=value;
	f1.add(op1);
}

function getDglx(FormName)
{
	FormName.mmxh.value="";
	FormName.ysbm.value="";
	FormName.jjfs.value="";

	if (FormName.mmdglxbm.value=='')
	{
		return;
	}


	var str="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp?getlx=1&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getMmxh(FormName)
{
	if (FormName.mmdglxbm.value=='')
	{
		return;
	}
	if (FormName.mmxh.value=='')
	{
		return;
	}

	FormName.ysbm.value="";

	var str="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp?getlx=2&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value+"&mmxh="+FormName.mmxh.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getDj(FormName)
{
	FormName.dj.value="";

	if (FormName.mmdglxbm.value=='')
	{
		return;
	}
	if (FormName.jjfs.value=='')
	{
		return;
	}

	var getjjfs=FormName.jjfs.value;

	if (getjjfs=='11')//11��ľ��
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
		if (FormName.dbh.value=='')
		{
			return;
		}
	}
	//12��˫���ƿڣ�13��˫�ڴ��ף�14�������ƿڣ�15�����ڴ���
	else if (getjjfs=="12" || getjjfs=="13" || getjjfs=="14" || getjjfs=="15" )
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//21��������;22���Ŷ���
	else if (getjjfs=="21" || getjjfs=="22")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//31����Ʈ������
	else if (getjjfs=="31" )
	{
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//32����Ʈ��ƽ̨�Ͽ�
	else if (getjjfs=="32" )
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//41��ƽ���׼Ƽ�
	else if (getjjfs=="41")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
	}
	//42�����׼Ƽ�
	else if (getjjfs=="42")
	{
		if (FormName.tjx.value=='')
		{
			return;
		}
	}
	//43���ֶ�ƽ���׼Ƽ�
	else if (getjjfs=="43")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//44���ֶ����׼Ƽ�
	else if (getjjfs=="44")
	{
		if (FormName.qh.value=='')
		{
			return;
		}
		if (FormName.tjx.value=='')
		{
			return;
		}
	}
	//45���ֶΰ����ȼƼ�
	else if (getjjfs=="45")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
	}

	var str="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp?getlx=3&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value+"&mlx="+FormName.mlx.value+"&dbh="+FormName.dbh.value;
	str+="&mmxh="+FormName.mmxh.value+"&ysbm="+FormName.ysbm.value+"&ctbs="+FormName.ctbs.value;
	str+="&mdk="+FormName.mdk.value+"&mdg="+FormName.mdg.value+"&qh="+FormName.qh.value+"&tjx="+FormName.tjx.value;
	str+="&sfsmjcc="+FormName.sfsmjcc.value+"&mtxbm="+FormName.mtxbm.value+"&mxxbm="+FormName.mxxbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


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

	if(	javaTrim(FormName.jjfs)=="") {
		alert("[�Ƽ۷�ʽ]Ϊ�գ�����ϵϵͳ����Ա��");
		FormName.jjfs.focus();
		return false;
	}

	var getjjfs=FormName.jjfs.value;

	if (getjjfs=='11')//11��ľ��
	{
		if(	javaTrim(FormName.mlx)=="") {
			alert("��ѡ��[������]��");
			FormName.mlx.focus();
			return false;
		}
		if(	javaTrim(FormName.azwzbm)=="") {
			alert("��ѡ��[��װλ��]��");
			FormName.azwzbm.focus();
			return false;
		}
		if(	javaTrim(FormName.kqfxbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.kqfxbm.focus();
			return false;
		}

		if(	javaTrim(FormName.dczlbm)=="") {
			alert("������[�ز�����]��");
			FormName.dczlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.dbh)=="") {
			alert("������[�زĺ�]��");
			FormName.dbh.focus();
			return false;
		}
		if(!(isNumber(FormName.dbh, "�زĺ�"))) {
			return false;
		}

		if(	javaTrim(FormName.qh)=="") {
			alert("������[ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[��/������]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "��/������"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[��/������]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "��/������"))) {
			return false;
		}
		if(!(isNumber(FormName.msk, "���ȿ�"))) {
		return false;
		}
		if(!(isNumber(FormName.msg, "���ȸ�"))) {
			return false;
		}
	}
	//12��˫���ƿڣ�13��˫�ڴ��ף�14�������ƿڣ�15�����ڴ���;21��������;22���Ŷ���
	else if (getjjfs=="12" || getjjfs=="13" || getjjfs=="14" || getjjfs=="15" || getjjfs=="21" || getjjfs=="22")
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("������[ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.ctbs)=="") {
			alert("������[����/���ױ���]��");
			FormName.ctbs.focus();
			return false;
		}
	}
	//31����Ʈ������
	else if (getjjfs=="31" )
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("������[����ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "����ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[���ڸ�]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "���ڸ�"))) {
			return false;
		}
	}
	//32����Ʈ��ƽ̨�Ͽ�
	else if (getjjfs=="32" )
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("������[ƽ̨�Ͽ�ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ƽ̨�Ͽ�ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[ƽ̨�Ͽڿ�]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "ƽ̨�Ͽڿ�"))) {
			return false;
		}
	}
	//41��ƽ���׼Ƽ�
	else if (getjjfs=="41")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "�Ŷ���"))) {
			return false;
		}
	}
	//42�����׼Ƽ�
	else if (getjjfs=="42")
	{
		if(	javaTrim(FormName.tjx)=="") {
			alert("������[�߽���/ŷʽ��ñ]��");
			FormName.tjx.focus();
			return false;
		}
		if(!(isFloat(FormName.tjx, "�߽���/ŷʽ��ñ"))) {
			return false;
		}
	}
	//43���ֶ�ƽ���׼Ƽ�
	else if (getjjfs=="43")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.qh)=="") {
			alert("������[ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ǽ��"))) {
			return false;
		}
	}
	//44���ֶ����׼Ƽ�
	else if (getjjfs=="44")
	{
		if(	javaTrim(FormName.tjx)=="") {
			alert("������[�߽���/ŷʽ��ñ]��");
			FormName.tjx.focus();
			return false;
		}
		if(!(isFloat(FormName.tjx, "�߽���/ŷʽ��ñ"))) {
			return false;
		}
		if(	javaTrim(FormName.qh)=="") {
			alert("������[ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ǽ��"))) {
			return false;
		}
	}
	//45���ֶΰ����ȼƼ�
	else if (getjjfs=="45")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[���]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "���"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[�߶�]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "�߶�"))) {
			return false;
		}
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "��������"))) {
		return false;
	}

	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
