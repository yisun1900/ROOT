<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���̼���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String tjrq=request.getParameter("tjrq");
	String tjrq2=request.getParameter("tjrq2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

	String ls_sql=null;
%>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<center>
<form method="post"  name="selectform" target="">
<input type="hidden" name="fgs" value="<%=fgs%>">
<input type="hidden" name="dwbh" value="<%=dwbh%>">
<input type="hidden" name="tjrq" value="<%=tjrq%>">
<input type="hidden" name="tjrq2" value="<%=tjrq2%>">
  ���������б���ͬ�������ڣ�<%=tjrq%>----<%=tjrq2%>�� 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
    <tr align="center"> 
        <td> 
          <select name="px" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="f_ck(selectform)">
			  <option value=""></option>
			  <option value="crm_khxx.sgd">ʩ����</option>
			  <option value="crm_khxx.zjxm">�ʼ�</option>
			  <option value="crm_khxx.sjs">���ʦ</option>
			  <option value="crm_khxx.qyrq">ǩԼ����</option>
			  <option value="crm_khxx.kgrq">��ͬ��������</option>
			  <option value="crm_khxx.sjkgrq">ʵ��������</option>
			  <option value="yqts desc">��������</option>
          </select>
          <input type="button" value="����" onclick="f_ck(selectform)">
      </td>
    </tr>
    <tr align="center" valign="top"> 
      <td height="540">
	  <iframe width="100%" height="100%" src="WkgmxList.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&tjrq=<%=tjrq%>&tjrq2=<%=tjrq2%>" name="childFrame" marginwidth="0" marginheight="0" scrolling="YES" FrameBorder="0"> 
	  </iframe>
	  </td>
    </tr>
  </table>
</form>
</center>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_ck(FormName)
{               
	FormName.target="childFrame";
	FormName.action="WkgmxList.jsp";
	FormName.submit();	
}                                                                                                                
//-->
</SCRIPT>
