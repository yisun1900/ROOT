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
String clxlbmstr=cf.getItemData("select zcxlmc c1,zcxlmc c2,zcdlmc from jdm_clxlbm order by zcdlmc,clxlbm");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");

String ppstr=null;
if (yhjs.equals("A0") || yhjs.equals("A1"))
{
	ppstr=cf.getItemData("select sq_gysxx.gysmc c1,sq_gysxx.gysmc||'('||dwmc||')' c2,zclb from sq_gysxx,sq_dwxx where sq_gysxx.ssdw=sq_dwxx.ppmc(+) and sq_gysxx.gyslb='4' order by sq_gysxx.zclb,sq_gysxx.gysmc,sq_gysxx.ssfgs");
}
else{
	ppstr=cf.getItemData("select sq_gysxx.gysmc c1,sq_gysxx.gysmc||'('||dwmc||')' c2,zclb from sq_gysxx,sq_dwxx where sq_gysxx.ssdw=sq_dwxx.ppmc(+) and sq_gysxx.gyslb='4' and sq_gysxx.dqbm='"+dqbm+"' order by sq_gysxx.ssfgs,sq_gysxx.zclb,sq_gysxx.gysmc");
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���Ĵ���</td>
              <td width="32%"> 
                <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(cldlbm,clxlbm,<%=clxlbmstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_cldlbm  order by cldlbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">����С��</td>
              <td width="33%"> 
                <select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange=" selectItem(clxlbm,ppbm,<%=ppstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_clxlbm  order by clxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">Ʒ��</td>
              <td width="32%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>
              </td>
              <td width="17%" align="right"><font color="#0000CC">��������</font></td>
              <td width="33%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="18%" bgcolor="#FFFFFF" align="right">Ʒ��</td>
              <td width="32%">
                <input type="text" name="ppbm2" size="20" maxlength="50" >
              </td>
              <td width="17%">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���ı���</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_clbm" size="20" maxlength="7" >
              </td>
              <td width="17%"> 
                <div align="right">��������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_clmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���/ϵ��</td>
              <td colspan="3"> 
                <input type="text" name="cllbbm" value="" size="72" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ͺ�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_xh" size="20" maxlength="100" >
              </td>
              <td width="17%"> 
                <div align="right">���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_gg" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">��ɫ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="clysbm" value="" size="20" maxlength="100" >
              </td>
              <td width="17%"> 
                <div align="right">������λ</div>
              </td>
              <td width="33%"> 
                <select name="jc_zcjgb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�г���� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_lsj" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_lsj2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���ۼ� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_xsj" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_xsj2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�Ƿ�������</div>
              </td>
              <td width="32%"><%
	cf.radioToken(out, "jc_zcjgb_sfbhpj","Y+����&N+������","");
%> </td>
              <td width="17%"> 
                <div align="right">��Ƭ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_zp" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">������� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_pjts" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_pjts2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�Ƿ��д���</td>
              <td width="32%"><%
	cf.radioToken(out, "sfycx","N+û����&Y+�д���","");
%></td>
              <td width="17%" align="right">�Ƿ��л�</td>
              <td width="33%"> 
                <input type="radio" name="sfyh" value="Y">
                �л� 
                <input type="radio" name="sfyh" value="N">
                �޻�</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">������ʼʱ�� ��</td>
              <td width="32%"> 
                <input type="text" name="cxkssj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="cxkssj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��������ʱ�� ��</td>
              <td width="32%"> 
                <input type="text" name="cxjzsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="cxjzsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�������</td>
              <td colspan="3"> 
                <select name="jgpx" style="FONT-SIZE:14PX;WIDTH:515PX">
                  <option value=""></option>
                  <option  value="jc_zcjgb.clbm">���ı���</option>
                  <option  value="jc_zcjgb.cldlbm,jc_zcjgb.ppmc,jc_zcjgb.cllbbm,jc_zcjgb.xh,jc_zcjgb.clbm">����,Ʒ��,���ϵ�У��ͺ�</option>
                  <option  value="jc_zcjgb.cldlbm,jc_zcjgb.ppmc,jc_zcjgb.cllbbm,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.clbm">����,Ʒ��,���ϵ�У��ͺţ����</option>
                  <option  value="jc_zcjgb.cldlbm,jc_zcjgb.ppmc,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.clbm">����,Ʒ�ƣ��ͺţ����</option>
                  <option  value="jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.clbm">�ͺţ����</option>
                  <option  value="jc_zcjgb.xh,jc_zcjgb.clbm">�ͺ�</option>
                  <option  value="jc_zcjgb.clmc">��������</option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
                <p> 
                  <input type="button"  value="�������ı��۵���ʱ��" onClick="f_back(selectform)" name="button" >
                  <input type="button"  value="����ʱ�⻹ԭ���ı���" onClick="f_restore(selectform)" name="button2" >
                </p>
                <p> 
                  <input type="button"  value="����������������" onClick="f_dc(selectform)" name="button">
                  <input type="button"  value="�޸��������ı���" onClick="f_gx(selectform)" name="button">
                </p>
                <p> 
                  <input type="button"  value="����ȫ�����ı���" onClick="f_drall(selectform)" name="button3">
                  <input type="button"  value="�����µ����ı���" onClick="f_drnew(selectform)" name="button32">
                </p>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}

	if(!(isFloat(FormName.jc_zcjgb_lsj, "�г�ͳһ�޼�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_lsj2, "�г�ͳһ�޼�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_xsj, "�Żݼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_xsj2, "�Żݼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts2, "�������"))) {
		return false;
	}

	if(!(isDatetime(FormName.cxkssj, "������ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxkssj2, "������ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxjzsj, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxjzsj2, "��������ʱ��"))) {
		return false;
	}

	FormName.target="";
	FormName.action="Jc_zcjgbList.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ�������ı�����?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ExpData.jsp";
		FormName.submit();
		return true;
	}
}
function f_back(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ���ݱ��۱���?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="DbToBack.jsp";
		FormName.submit();
		return true;
	}
}
function f_restore(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ��ԭ���ݱ�����?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ChooseBack.jsp";
		FormName.submit();
		return true;
	}
}
function f_drall(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ[�滻ȫ�����ı���]��?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ImpData.jsp";
		FormName.submit();
		return true;
	}
}
function f_drnew(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ[�����µ����ı���]��?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ImpAddData.jsp";
		FormName.submit();
		return true;
	}
}
function f_gx(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ�������ı�����?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="UpdateData.jsp";
		FormName.submit();
		return true;
	}
}
//-->
</SCRIPT>
