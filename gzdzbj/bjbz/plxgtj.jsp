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
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String yhjs=(String)session.getAttribute("yhjs");
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//���ӱ����м�����
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//���ӱ����и߼�����
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//���ӱ��۸߼�����

String dqbm=request.getParameter("bj_gzbjb_dqbm");

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �����޸ı���</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF" align="center"> 
              <td height="37" colspan="4"><b>ѡ���޸�����</b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">��������</td>
              <td> 
                <select name="bjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">��׼��Ŀ</option>
                </select>
              </td>
              <td align="right"></td>
              <td> 
               </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��Ŀ����</div>
              </td>
              <td width="31%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)" size="8" multiple>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">��ĿС��</div>
              </td>
              <td width="29%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����</div>
              </td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">����</div>
              </td>
              <td width="29%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF" align="center"> 
              <td colspan="4" height="42"><b>��ν��е���</b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%">&nbsp;</td>
              <td colspan="3">
                <input type="radio" name="jgqz" value="Y">
                ���ȡ�� 
                <input type="radio" name="jgqz" value="N">
                �����ȡ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%">&nbsp;</td>
              <td colspan="3"> 
                <p>���۰ٷֱ� 
                  <input type="text" name="tjbfb" size="10">
                  %&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000"><b>ע�⣺�����Ӽ�10����Ӧ����110���������10����Ӧ����90</b></font></p>
                <p>
                  <input type="button" name="Button" value="��<%=dzbjzjmc%>����" onClick="plxg(selectform,'A')" >
                  <input type="button" name="Button2" value="��<%=dzbjzgjmc%>����" onClick="plxg(selectform,'B')" >
                  <input type="button" name="Button3" value="��<%=dzbjgjmc%>����" onClick="plxg(selectform,'C')" >
                </p>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4">&nbsp; </td>
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
function plxg(FormName,lx)//����FormName:Form������
{
	if(	!radioChecked(FormName.jgqz)) {
		alert("��ѡ��[���ȡ��]��");
		FormName.jgqz[0].focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tjbfb)=="") {
		alert("������[���۰ٷֱ�]��");
		FormName.tjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.tjbfb, "���۰ٷֱ�"))) {
		return false;
	}


	if (!confirm("ȷʵҪ�޸���?") )	
	{
		return;
	}

	FormName.action="plxg.jsp?bjjb="+lx;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
