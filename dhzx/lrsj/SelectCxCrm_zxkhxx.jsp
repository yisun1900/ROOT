<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>


<%
String kkbbz=(String)session.getAttribute("kkbbz");//�ɿ���
String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}
String ysy=yhmc;
if (!zwbm.equals("20"))
{
	ysy="";
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF"  >

<form method="post" action="" name="selectform">
      <div align="center">��ѯ�ͻ�--��ѯ</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="22%" align="right" bgcolor="#FFFFCC"> 
                �����ֹ�˾              </td>
              <td width="28%">
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
			  </select>              </td>
              <td width="22%" align="right"> 
                ��ѯ����              </td>
              <td width="28%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
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
	          <td align="right" bgcolor="#FFFFFF">���ʦ</td>
	          <td bgcolor="#FFFFFF"><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
	          <td align="right" bgcolor="#FFFFFF">ҵ��Ա</td>
	          <td bgcolor="#FFFFFF"><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" <% if (!ywy.equals("")) out.println("readonly");%>></td>
            </tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right" bgcolor="#FFFFFF">�ͻ�����</td>
	  <td bgcolor="#FFFFFF"><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
	  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
	  <td bgcolor="#FFFFFF">&nbsp;</td>
	  </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right" bgcolor="#FFFFFF">¼�벿��</td>
              <td width="28%" bgcolor="#FFFFFF"> 
                <select name="zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('zxdjbm')">
					<option value=""></option>
              </select>              </td>
              <td width="22%" align="right" bgcolor="#FFFFFF">��Ϣ¼����</td>
              <td width="28%" bgcolor="#FFFFFF"> 
              <input type="text" name="lrr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"> ë��Ϣ¼��ʱ�� �� </td>
              <td bgcolor="#FFFFFF"><input type="text" name="mxxlrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFFF"> �� </td>
              <td bgcolor="#FFFFFF"><input type="text" name="mxxlrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF">ë��Ϣ¼��ǩ������ ��</td>
              <td bgcolor="#FFFFFF"><input name="mxxts" type="text" id="mxxts" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
              <td align="right" bgcolor="#FFFFFF">��</td>
              <td bgcolor="#FFFFFF"><input name="mxxts2" type="text" id="mxxts2" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="22%" align="right" bgcolor="#FFFFFF"> 
                ��ѯ�ͻ�¼��ʱ�� ��              </td>
              <td width="28%" bgcolor="#FFFFFF"> 
              <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="22%" align="right" bgcolor="#FFFFFF"> 
                ��              </td>
              <td width="28%" bgcolor="#FFFFFF"> 
              <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF">��ѯ�ͻ�¼��ǩ������ ��</td>
              <td bgcolor="#FFFFFF"><input name="zxts" type="text" id="zxts" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
              <td align="right" bgcolor="#FFFFFF">��</td>
              <td bgcolor="#FFFFFF"><input name="zxts2" type="text" id="zxts2" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"> ǩԼ���� �� </td>
              <td bgcolor="#FFFFFF"><input type="text" name="qyrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFFF"> �� </td>
              <td bgcolor="#FFFFFF"><input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" >��ʾ���</td>
              <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
                ��ҳ
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ����
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)" >
                <input type="reset"  value="����" name="reset">
                <input type="button"  value="�ͻ�ͳ��" onClick="f_tj(selectform)" >              </td>
            </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//����Ajax
	cf.ajax(out);
%>


function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}


	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}


function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.zxdm,ajaxRetStr);
}


function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.mxxlrsj, "ë��Ϣ¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.mxxlrsj2, "ë��Ϣ¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "��ѯ�ͻ�¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "��ѯ�ͻ�¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "ǩԼ����"))) {
		return false;
	}

	if(!(isNumber(FormName.mxxts, "ë��Ϣ¼��ǩ������"))) {
		return false;
	}
	if(!(isNumber(FormName.mxxts2, "ë��Ϣ¼��ǩ������"))) {
		return false;
	}
	if(!(isNumber(FormName.zxts, "��ѯ�ͻ�¼��ǩ������"))) {
		return false;
	}
	if(!(isNumber(FormName.zxts2, "��ѯ�ͻ�¼��ǩ������"))) {
		return false;
	}

	FormName.action="Crm_zxkhxxCxList.jsp";
	FormName.submit();
	return true;
}


function f_tj(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.mxxlrsj, "ë��Ϣ¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.mxxlrsj2, "ë��Ϣ¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "��ѯ�ͻ�¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "��ѯ�ͻ�¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "ǩԼ����"))) {
		return false;
	}

	if(!(isNumber(FormName.mxxts, "ë��Ϣ¼��ǩ������"))) {
		return false;
	}
	if(!(isNumber(FormName.mxxts2, "ë��Ϣ¼��ǩ������"))) {
		return false;
	}
	if(!(isNumber(FormName.zxts, "��ѯ�ͻ�¼��ǩ������"))) {
		return false;
	}
	if(!(isNumber(FormName.zxts2, "��ѯ�ͻ�¼��ǩ������"))) {
		return false;
	}

	FormName.action="Crm_zxkhxxTjList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
