<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	String zt=cf.GB2Uni(request.getParameter("zt"));
%>

<body bgcolor="#FFFFFF" onLoad="selectform.khxm.focus();">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�����տ�</DIV>
    </td>
  </tr>
  <tr>
    <td width="100%" height="173" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC">
              <td width="16%" align="right">�ͻ�����</td>
              <td width="34%">
<%
	cf.radioToken(out, "zt","1+ǩ���ͻ�&2+��ǩ���ͻ�",zt,true);
%>			  </td>
              <td width="14%">&nbsp;</td>
              <td width="36%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="16%" align="right"> 
                �ֹ�˾              </td>
              <td width="34%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
				%> 
				</select>			  </td>
              <td width="14%" align="right"> 
                ǩԼ����              </td>
              <td width="36%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
				  <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
					%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��ͬ��</td>
              <td width="34%"> 
                <input type="text" name="hth" size="20" maxlength="20" >              </td>
              <td width="14%" align="right">�ͻ����</td>
              <td width="36%"> 
                <input type="text" name="khbh" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><span class="STYLE1"> 
              �ͻ�����              </span></td>
              <td width="34%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >              </td>
              <td width="14%" align="right">�ͻ�����</td>
              <td width="36%"><input type="text" name="khxm2" size="18" maxlength="50" >
��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">��ϵ��ʽ</span></td>
              <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
              <td align="right">��ϵ��ʽ</td>
              <td><input type="text" name="lxfs2" size="18" maxlength="50" >
              ��ģ����ѯ��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><span class="STYLE1">���ݵ�ַ</span></td>
              <td width="34%"><input type="text" name="fwdz" size="20" maxlength="100" ></td>
              <td width="14%" align="right">���ݵ�ַ</td>
              <td width="36%"> 
                <input type="text" name="fwdz2" size="18" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4" > 
                  <input type="button"  value="����" onClick="f_do(selectform)">
                  <input type="reset"  value="����">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//����AJAX
%>


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if ("<%=zt%>"=="1")
	{
		if(	javaTrim(FormName.hth)=="") {
			alert("������[��ͬ��]��");
			FormName.hth.focus();
			return false;
		}

		FormName.action="Crm_khxxCxList.jsp";
	}
	else {
		if(	javaTrim(FormName.khbh)=="") {
			alert("������[�ͻ����]��");
			FormName.khbh.focus();
			return false;
		}

		FormName.action="Crm_zxkhxxCxList.jsp";
	}


	FormName.submit();
	return true;
}

//-->
</SCRIPT>