<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String kfgssq=(String)session.getAttribute("kfgssq");
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
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%" align="center"> 
      <div align="center">ʧ�ܿͻ�����ط�</td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_zxkhxxSjHfList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center">
              <td colspan="4"><input type="button"  value="��ѯ" onClick="f_do(selectform)">
                  <input type="reset"  value="����">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"> 
                �ͻ������ֹ�˾              </td>
              <td width="33%" bgcolor="#FFFFCC"> 
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
              <td width="17%" align="right"> 
                ��ѯ����              </td>
              <td width="33%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="17%" align="right"> 
                �ͻ����              </td>
              <td width="33%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >              </td>
              <td width="17%" align="right">�ͻ�����</td>
              <td width="33%"><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                ¼��ʱ�� ��              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right"> 
                ��              </td>
              <td width="33%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">�ͻ�����</font></b></td>
              <td width="33%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >              </td>
              <td width="17%" align="right"> 
                �ͻ�����              </td>
              <td width="33%"> 
                <input type="text" name="khxm2" size="10" maxlength="50" >
              ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">��ϵ��ʽ</font></b></td>
              <td width="33%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >              </td>
              <td width="17%" align="right">��ϵ��ʽ</td>
              <td width="33%"> 
                <input type="text" name="lxfs2" size="10" maxlength="50" >
              ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">���ݵ�ַ</font></b></td>
              <td width="33%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >              </td>
              <td width="17%" align="right">���ݵ�ַ</td>
              <td width="33%"> 
                <input type="text" name="fwdz2" size="10" maxlength="100" >
              ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">ҵ��Ա</td>
              <td width="33%"> 
                <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="100" <% if (!ywy.equals("")) out.println("readonly");%>>              </td>
              <td width="17%" align="right">���ʦ</td>
              <td width="33%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">С������</td>
              <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
              </select></td>
              <td align="right">�ͻ���Դ����</td>
              <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">�Ƿ�ǩ��</td>
              <td><input type="radio" name="sfqd" value="1">
                δǩ��
                <input type="radio" name="sfqd" value="2">
                ǩ��
                <input type="radio" name="sfqd" value="3">
                ʧ�� </td>
              <td align="right">�Ƿ���ط�</td>
              <td><input type="radio" name="sfxhf" value="Y" >
��ط�
  <input type="radio" name="sfxhf" value="N" >
����ط�</td>
            </tr>
            
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">Ӧ�ط����� ��</td>
              <td width="33%" bgcolor="#E8E8FF"> 
                <input type="text" name="hfrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="hfrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            
            
            <tr bgcolor="#FFFFCC">
              <td align="right">ǩ��ƺ�ͬʱ�� ��</td>
              <td><input type="text" name="qsjhtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right">��</td>
              <td><input type="text" name="qsjhtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">ǩ��ƺ�ͬ��־</td>
              <td bgcolor="#FFFFCC"><input type="radio" name="qsjhtbz" value="N">
δǩ
  <input type="radio" name="qsjhtbz" value="Y">
ǩ��ͬ</td>
              <td align="right" bgcolor="#E8E8FF">�����������־</td>
              <td bgcolor="#E8E8FF"><input type="radio" name="lfdjbz" value="N">
δ������
  <input type="radio" name="lfdjbz" value="Y">
�ѽ�����
<input type="radio" name="lfdjbz" value="T">
�˶���</td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">����������ʱ�� ��</td>
              <td><input type="text" name="jlfdjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#E8E8FF">��</td>
              <td><input type="text" name="jlfdjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right">�������ʱ�� ��</td>
              <td><input type="text" name="jhddjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right">��</td>
              <td><input type="text" name="jhddjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">�Ƿ񽻻����</td>
              <td bgcolor="#FFFFCC"><input type="radio" name="hddjbz" value="N">
δ��
  <input type="radio" name="hddjbz" value="Y">
�ѽ�
<input type="radio" name="hddjbz" value="T">
�˶��� </td>
              <td align="right" bgcolor="#E8E8FF">��Ʒѱ�־</td>
              <td bgcolor="#E8E8FF"><input type="radio" name="sjfbz" value="N">
δ��
  <input type="radio" name="sjfbz" value="Y">
�ѽ�
<input type="radio" name="sjfbz" value="T">
����Ʒ� </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">����Ʒ�ʱ�� ��</td>
              <td><input type="text" name="jsjfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#E8E8FF">��</td>
              <td><input type="text" name="jsjfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"> ��ƽ��ͼʱ�� �� </td>
              <td><input name="ctsj" type="text" id="ctsj" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
              <td align="right"> �� </td>
              <td><input name="ctsj2" type="text" id="ctsj2" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">��ƽ��ͼ��־</td>
              <td bgcolor="#FFFFCC"><input type="radio" name="ctbz" value="N">
δ��ͼ
  <input type="radio" name="ctbz" value="Y">
�ѳ�ͼ</td>
              <td align="right" bgcolor="#E8E8FF">������־</td>
              <td bgcolor="#E8E8FF"><input type="radio" name="lfbz" value="N">
δ����
<input type="radio" name="lfbz" value="Y">
������ </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"> ����ʱ�� �� </td>
              <td><input name="lfsj" type="text" id="lfsj" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
              <td align="right"> �� </td>
              <td><input name="lfsj2" type="text" id="lfsj2" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> �������ʱ�� �� </td>
              <td><input name="zjsmsj" type="text" id="zjsmsj" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
              <td align="right"> �� </td>
              <td><input name="zjsmsj2" type="text" id="zjsmsj2" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> ԤԼ����ʱ�� �� </td>
              <td><input name="xclfsj" type="text" id="xclfsj" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
              <td align="right"> �� </td>
              <td><input name="xclfsj2" type="text" id="xclfsj2" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
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

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.qsjhtsj, "ǩ��ƺ�ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.qsjhtsj2, "ǩ��ƺ�ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq, "Ӧ�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq2, "Ӧ�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jlfdjsj, "����������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jlfdjsj2, "����������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhddjsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhddjsj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsjfsj, "����Ʒ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsjfsj2, "����Ʒ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ctsj, "��ƽ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ctsj2, "��ƽ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lfsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lfsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zjsmsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zjsmsj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xclfsj, "ԤԼ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xclfsj2, "ԤԼ����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
