<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");
String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");
String dwstr1=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where ((ssfgs='"+ssfgs+"') or dwlx in('A0','A1'))  and cxbz='N' order by ssfgs,dwbh");
%>
<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

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

<form method="post" action="Xz_gwglCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�����ֹ�˾</td>
              <td width="32%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fbfgs,fbbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"  onChange=\"selectItem(fbfgs,fbbm,"+dwstr1+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ((dwbh='"+ssfgs+"' and dwlx='F0') or dwlx='A0') ","");
        out.println("        </select>");
	}

	%></td>
              <td width="16%" align="right">��������</td>
              <td width="34%"> 
                <select name="fbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') order by dwbh","");
	}
	else
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ((ssfgs='"+ssfgs+"') or dwlx in('A0','A1'))  and cxbz='N' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���ı��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_gwgl_gwbh" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">���ĸ���</div>
              </td>
              <td width="34%"> 
                <input type="text" name="xz_gwgl_gwfj" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">��������</td>
              <td width="32%"> 
                <input type="text" name="xz_gwgl_gwmc" size="20" maxlength="100" >
              </td>
              <td align="right" width="16%">������Χ</td>
              <td width="34%"> 
                <input type="radio" name="fbfw" value="1">
                ����˾ 
                <input type="radio" name="fbfw" value="2">
                ���� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="fbr" size="20" maxlength="20" >
              </td>
              <td align="right" width="16%">¼����</td>
              <td width="34%"> 
                <input type="text" name="xz_gwgl_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">¼��ʱ�� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_gwgl_lrsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">��</div>
              </td>
              <td width="34%"> 
                <div align="left"> 
                  <input type="text" name="xz_gwgl_lrsj2" size="20" maxlength="10" >
                </div>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">����ʱ�� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_gwgl_fbsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">��</div>
              </td>
              <td width="34%"> 
                <input type="text" name="xz_gwgl_fbsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">��ѯ�������</td>
              <td colspan="3"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="xz_gwgl.fbsj desc">����ʱ��</option>
                  <option value="xz_gwgl.gwmc">��������</option>
                  <option value="xz_gwgl.gwbh">���ı��</option>
                  <option value="xz_gwgl.fbr">������</option>
                  <option value="xz_gwgl.fbbm">��������</option>
                  <option value="xz_gwgl.fbfgs">�����ֹ�˾</option>
                  <option value="xz_gwgl.fbfw">������Χ</option>
                  <option value="xz_gwgl.lrr">¼����</option>
                  <option value="xz_gwgl.lrsj">¼��ʱ��</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="xz_gwgl.fbsj desc">����ʱ��</option>
                  <option value="xz_gwgl.gwmc">��������</option>
                  <option value="xz_gwgl.gwbh">���ı��</option>
                  <option value="xz_gwgl.fbr">������</option>
                  <option value="xz_gwgl.fbbm">��������</option>
                  <option value="xz_gwgl.fbfgs">�����ֹ�˾</option>
                  <option value="xz_gwgl.fbfw">������Χ</option>
                  <option value="xz_gwgl.lrr">¼����</option>
                  <option value="xz_gwgl.lrsj">¼��ʱ��</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="xz_gwgl.fbsj desc">����ʱ��</option>
                  <option value="xz_gwgl.gwmc">��������</option>
                  <option value="xz_gwgl.gwbh">���ı��</option>
                  <option value="xz_gwgl.fbr">������</option>
                  <option value="xz_gwgl.fbbm">��������</option>
                  <option value="xz_gwgl.fbfgs">�����ֹ�˾</option>
                  <option value="xz_gwgl.fbfw">������Χ</option>
                  <option value="xz_gwgl.lrr">¼����</option>
                  <option value="xz_gwgl.lrsj">¼��ʱ��</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">ÿҳ��ʾ����</td>
              <td colspan="3"> 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
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
	if(!(isDatetime(FormName.xz_gwgl_fbsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gwgl_fbsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gwgl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gwgl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>