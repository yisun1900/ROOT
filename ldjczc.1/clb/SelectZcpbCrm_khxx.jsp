<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�±���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������


%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">���Ի�������Ȳ�ѯ</div>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right" width="18%"> �ֹ�˾ </td>
      <td width="32%"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
      </select>      </td>
      <td width="18%" align="right"> ǩԼ���� </td>
      <td width="32%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"> �ͻ���� </td>
      <td><input type="text" name="khbh" size="20" maxlength="7" >      </td>
      <td align="right"> ��ͬ�� </td>
      <td><input type="text" name="hth" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
      <td><input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >      </td>
      <td align="right">�ͻ�����</td>
      <td><input type="text" name="crm_khxx_khxm2" size="14" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font></td>
      <td><input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" >      </td>
      <td align="right">��ϵ��ʽ</td>
      <td><input type="text" name="crm_khxx_lxfs2" size="14" maxlength="20" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
      <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >      </td>
      <td align="right">���ݵ�ַ</td>
      <td><input type="text" name="crm_khxx_fwdz2" size="14" maxlength="100" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">����Ա</td>
      <td><input name="clgw" type="text" id="clgw" value="" size="20" maxlength="20" ></td>
      <td align="right"> �ͻ����� </td>
      <td><input name="zjxm" type="text" id="zjxm" value="" size="20" maxlength="20" >      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">����ҵ��</td>
      <td><input type="text" name="khjl" value="" size="20" maxlength="20" ></td>
      <td align="right"> ���ʦ </td>
      <td><input type="text" name="sjs" value="" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"> ǩԼ���� �� </td>
      <td><input type="text" name="qyrq" size="20" maxlength="10" value='<%=cf.firstDay()%>' onDblClick="JSCalendar(this)">      </td>
      <td align="right"> �� </td>
      <td><input type="text" name="qyrq2" size="20" maxlength="10" value='<%=cf.lastDay()%>' onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"> ¼��ʱ�� �� </td>
      <td><input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right"> �� </td>
      <td><input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">����ҵ��ʱ��</td>
      <td><input type="text" name="yjjzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
      <td align="right">��</td>
      <td><input type="text" name="yjjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">ʩ�����Ƿ����</td>
      <td><select name="gdjsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd order by gdjsjd","");
%>
      </select></td>
      <td align="right">�ͻ��Ƿ����</td>
      <td><input type="radio" name="khjsbz" value="Y">
����
  <input type="radio" name="khjsbz" value="N">
δ����</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��Ϣ¼����</td>
      <td><input type="text" name="lrr" size="20" maxlength="20" ></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right">��ѯ�������</td>
      <td colspan="3"> ��һ��
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
            <option value="qyrq desc">ǩԼ����</option>
            <option value="sjs" >���ʦ</option>
            <option value="clgw">����Ա</option>
            <option value="zjxm">�ͻ�����</option>
            <option value="khjl">����ҵ��</option>
            <option value="crm_khxx.dwbh" selected>����</option>
          </select>
        �ڶ���
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
            <option value="qyrq desc">ǩԼ����</option>
            <option value="sjs" selected>���ʦ</option>
            <option value="clgw">����Ա</option>
            <option value="zjxm">�ͻ�����</option>
            <option value="khjl">����ҵ��</option>
            <option value="crm_khxx.dwbh">����</option>
        </select>
        ������
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
            <option value="qyrq desc">ǩԼ����</option>
            <option value="sjs">���ʦ</option>
            <option value="clgw">����Ա</option>
            <option value="zjxm">�ͻ�����</option>
            <option value="khjl">����ҵ��</option>
            <option value="crm_khxx.dwbh">����</option>
        </select>
      </td>
    </tr>
    
    <tr> 
      <td align="right" width="18%" >��ʾ���</td>
      <td  colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td  colspan="4"> 
          <input type="button"  value="ͳ��" onClick="f_do(selectform)"  name="tj" >
          <input type="reset"  value="����">        </td>
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
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.yjjzsj, "����ҵ��ʱ�� "))) {
		return false;
	}
	if(!(isDatetime(FormName.yjjzsj2, "����ҵ��ʱ�� "))) {
		return false;
	}

	FormName.action="Crm_khxxZcpbList.jsp";
	FormName.target="";
	FormName.submit();
	FormName.tj.disabled=true;
	return true;
}


//-->
</SCRIPT>