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
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_khpjxmTjList.jsp" name="selectform">
<div align="center">ͳ��-�ͻ����۱�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%"> 
        <div align="right">�ֹ�˾</div>
      </td>
      <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td width="18%"> 
        <div align="right">ǩԼ����</div>
      </td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">��ͬ��</td>
      <td width="32%"> 
        <input type="text" name="hth" size="20" maxlength="20">
      </td>
      <td width="18%" align="right">�ͻ����</td>
      <td width="32%"> 
        <input type="text" name="khbh" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">�ͻ�����</div>
      </td>
      <td width="32%"> 
        <input type="text" name="khxm" size="20" maxlength="50">
      </td>
      <td width="18%"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="32%"> 
        <input type="text" name="lxfs" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ݵ�ַ</td>
      <td width="32%"> 
        <input type="text" name="fwdz" size="20" maxlength="100">
      </td>
      <td align="right" width="18%">ʩ����</td>
      <td width="32%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' order by sgdmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ʦ</td>
      <td width="32%"> 
        <input type="text" name="sjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">���̵���</td>
      <td width="32%"> 
        <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��������Ա</td>
      <td width="32%"> 
        <select name="spjry" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select spjry c1,spjry c2 from crm_spjrybm order by spjrybm","");
%> 
        </select>
      </td>
      <td align="right" width="18%">��Ŀ����</td>
      <td width="32%"> 
        <select name="xmfl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmfl c1,xmfl c2 from crm_xmflbm order by xmflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������Ŀ</td>
      <td colspan="3"> 
        <select name="pjxm" style="FONT-SIZE:12PX;WIDTH:522PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select pjxm c1,pjxm||'��'||spjry||'����'||xmfl||'��' c2 from crm_pjxmbm order by spjrybm,xmflbm,pjxmbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���۽��</td>
      <td width="32%"> 
		<input type="radio" name="pjjgbm" value="1">
		�� 
		<input type="radio" name="pjjgbm" value="2">
		��
		<input type="radio" name="pjjgbm" value="9">
		��</td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">��ʾ���</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">ͳ�Ʊ�</td>
      <td colspan="3"> ��һ�� 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">���̵���</option>
          <option value="sgdmc">ʩ����</option>
          <option value="spjry">��������Ա</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
        �ڶ��� 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">���̵���</option>
          <option value="sgdmc">ʩ����</option>
          <option value="spjry">��������Ա</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
        ������ 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">���̵���</option>
          <option value="sgdmc">ʩ����</option>
          <option value="spjry">��������Ա</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
        <BR>
        ������ 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">���̵���</option>
          <option value="sgdmc">ʩ����</option>
          <option value="spjry">��������Ա</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
        ������ 
        <input type="hidden" name="tj5name" value="">
        <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">���̵���</option>
          <option value="sgdmc">ʩ����</option>
          <option value="spjry">��������Ա</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
        ������ 
        <input type="hidden" name="tj6name" value="">
        <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">���̵���</option>
          <option value="sgdmc">ʩ����</option>
          <option value="spjry">��������Ա</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="ͳ��" onClick="f_do(selectform)">
        <input type="reset"  value="����">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.lrsj, "¼��ʱ�� "))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ�� "))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
