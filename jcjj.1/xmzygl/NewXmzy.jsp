<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>������ĿרԱ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String[] ddbhstr=request.getParameterValues("ddbh");
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="UpdateXmzy.jsp" name="selectform">
  <table width="100%" border="1">
    <tr> 
      <td colspan="2" height="50"> 
        <div align="center">ѡ������ĿרԱ</div>
      </td>
    </tr>
    <tr> 
      <td width="50%" align="right" height="58">����ĿרԱ</td>
      <td width="50%" height="58"> 
<%
	for (int i=0;i<ddbhstr.length ;i++ )
	{
         %>
		  <input type="hidden" name="ddbh" value="<%=cf.GB2Uni(ddbhstr[i])%>">
		 <%
	}

%>

        <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select yhmc,yhmc||'��'||dwmc||'��' from sq_yhxx,sq_dwxx where sq_yhxx.ssfgs=sq_dwxx.dwbh and zwbm='10' and sfzszg in('Y','N')  order by sq_yhxx.ssfgs,yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='10' and sfzszg in('Y','N') order by yhmc","");
	}
%> 
		</select>
	  
	  </td>
    </tr>
    <tr> 
      <td colspan="2" height="54"> 
        <div align="center">
          <input type="button"  value="����" onClick="f_do(selectform,'gccx')">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.xmzy)=="") {
		alert("��ѡ��[����ĿרԱ]��");
		FormName.xmzy.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
