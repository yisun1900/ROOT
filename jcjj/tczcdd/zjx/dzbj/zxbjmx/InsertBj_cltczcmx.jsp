<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<%
String lx=cf.GB2Uni(request.getParameter("lx"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
String jgwzbm=cf.getParameter(request,"jgwzbm");
String zjxxh=request.getParameter("zjxxh");
String yhmc=(String)session.getAttribute("yhmc");
String ppmc=cf.executeQuery("select ppmc from bj_khcltcmxh where zjxxh='"+zjxxh+"'  and lx='"+lx+"' and sfbpx='Y' and rownum<2");
String gysmc=cf.executeQuery("select gysmc from bj_khcltcmxh where zjxxh='"+zjxxh+"'  and lx='"+lx+"' and sfbpx='Y' and rownum<2");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform"  >
<div align="center">¼�룭�����ײ���ϸ�����������:<%=zjxxh%>��</div>
<table width="101%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>����</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE1">*</span>�ṹλ��</td>
    <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm where jgwzmc='"+jgwzbm+"'","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>�ײ�����</td>
    <td colspan="3">

<select name="tcmc" style="FONT-SIZE:12PX;WIDTH:522PX">
      <option value="<%=tcmc%>"><%=tcmc%></option>
    </select>	</td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ʒ����</td> 
  <td colspan="3"><input type="text" name="cpmc" value="" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ͺ�</td>
  <td colspan="3"><input type="text" name="xh" value="" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���</td>
  <td colspan="3"><input type="text" name="gg" value="" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>Ʒ��</td> 
  <td colspan="3"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value="<%=ppmc%>"><%=ppmc%></option>
  </select></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������λ</td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"><input type="text" name="sl" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"><input type="text" name="tcdj" value="" size="20" maxlength="17" ></td>
  <%--<td align="right" width="18%"><span class="STYLE1">*</span>�����</td> 
  <td width="32%"><input type="text" name="jsj" value="0" size="20" maxlength="17" ></td>--%>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="gysmc" value="<%=gysmc%>">
	  <input type="hidden" name="zjxxh" value="<%=zjxxh%>">
	  <input type="hidden" name="khbh" value="<%=khbh%>">
	  <input type="hidden" name="lx" value="<%=lx%>">
	  <input type="hidden" name="ydj" value="0" size="20" maxlength="17" >
	  <input type="hidden" name="sjzj" value="0" size="20" maxlength="17" >
	  <input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset"></td>
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

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("��ѡ��[�ṹλ��]��");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpmc)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("������[�ͺ�]��");
		FormName.xh.focus();
		return false;
	}

	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.ydj)=="") {
		alert("������[ԭ����]��");
		FormName.ydj.focus();
		return false;
	}
	if(!(isFloat(FormName.ydj, "ԭ����"))) {
		return false;
	}
	if(	javaTrim(FormName.tcdj)=="") {
		alert("������[����]��");
		FormName.tcdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tcdj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzj)=="") {
		alert("������[�����ۼ�]��");
		FormName.sjzj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzj, "�����ۼ�"))) {
		return false;
	}
	//if(	javaTrim(FormName.jsj)=="") {
//		alert("������[�����]��");
//		FormName.jsj.focus();
//		return false;
//	}
//	if(!(isFloat(FormName.jsj, "�����"))) {
//		return false;
//	}
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

	FormName.action="SaveInsertBj_cltczcmx.jsp";
	FormName.submit();
	return true;
}

function f_drmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>