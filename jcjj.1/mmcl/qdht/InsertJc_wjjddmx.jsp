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
      <div align="center"> ��¼������������ϸ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_wjjddmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">Ԥ�������</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="14%"> 
                <div align="right"></div>
              </td>
              <td width="36%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">������</td>
              <td width="33%"> 
                <select name="wjjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getWjjbm(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wjjbm,wjjmc from jdm_wjjbm order by wjjbm","");
%> 
                </select>
              </td>
              <td width="14%" align="right">������</td>
              <td width="36%"> 
                <select name="mmsbsbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getBm()">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmsbsbm,mmsbsmc||':'||bm from jdm_mmsbsbm order by mmsbsbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">����</td>
              <td colspan="3"> 
                <select name="xh" style="FONT-SIZE:12PX;WIDTH:510PX" onChange="getDj(insertform)">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�ͺ�</td>
              <td colspan="3"> 
                <input type="text" name="xinghao" value="" size="71" maxlength="30" >
                <input type="hidden" name="xinghao1" value="" size="20" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">��׼����</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="dj" value="" size="20" maxlength="9" readonly>
              </td>
              <td width="14%"> 
                <div align="right">��������</div>
              </td>
              <td width="36%"> 
                <input type="text" name="sl" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="3"></textarea>
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
function getWjjbm(FormName)
{
	FormName.mmsbsbm.value="";
	FormName.dj.value="";
	FormName.sl.value="";

	var str="Jc_wjjbjCx.jsp?dqbm=<%=dqbm%>&wjjbm="+FormName.wjjbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}
function getDj(FormName)
{

	var str="Jc_wjjbjCx.jsp?dqbm=<%=dqbm%>&xh="+FormName.xh.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


function addItem(f1,text,value)
{
	var op1=document.createElement("OPTION");
	op1.text=text;
	op1.value=value;
	f1.add(op1);
}

function getBm()//����FormName:Form������
{
	if ((insertform.mmsbsbm.value!="") && (insertform.xinghao1.value.indexOf("**")!=-1))
	{
		insertform.xinghao.value=replace(insertform.xinghao1.value,"**",getSubStr(insertform.mmsbsbm));
	}
	else{
		insertform.xinghao.value=insertform.xinghao1.value;
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.wjjbm)=="") {
		alert("��ѡ��[������]��");
		FormName.wjjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("��ѡ��[����]��");
		FormName.xh.focus();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.sl.value)<=0)
	{
		alert("����[����]�������0��");
		FormName.sl.select();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
