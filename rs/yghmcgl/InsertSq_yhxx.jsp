<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String bianhao="";
try {
	conn=cf.getConnection();

	//����Ƿ�����ĩ��ת
	//���أ� -1:����;0:�����ѽ�ת��1:�����ѽ�ת������δ��ת;2:����δ��ת 
	int count=cf.checkQmjz(conn,"rs_ydjz",cf.today());

	if (count==2)
	{
		out.println("����û�н��С���ת����");
		return;
	}
	else if (count==-1)
	{
		out.println("����");
		return;
	}


	String bianma=null;
	ls_sql="select bianma";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bianma=cf.fillNull(rs.getString("bianma"));
	}
	rs.close();
	ps.close();
	if (bianma.equals(""))
	{
		out.println("�������ڵ�λ��Ϣ����¼�롺���롻");
		return;
	}

	ls_sql="select NVL(max(TO_NUMBER(substr(bianhao,4 ,4))),0)";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	bianhao=bianma+"-"+cf.addZero(count+1,4);

}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">Ա���ǼǱ�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>����</td>
      <td width="15%"> 
        <input type="text" name="yhmc" value="" 	size="15" maxlength="50" >      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>�Ա�</td>
      <td width="15%"> 
        <select name="xb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="M">��</option>
          <option value="W">Ů</option>
        </select>      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>��������</td>
      <td width="15%"> 
        <input type="text" name="csrq" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%"><span class="STYLE1">*</span>Ա��״̬ </td>
      <td width="15%"> 
        <select name="sfzszg" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="M">ʵϰ��</option>
          <option value="Y">ת��</option>
          <option value="N">������</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">����</td>
      <td width="15%"> 
        <input type="text" name="mz" value="" size="15" maxlength="20" >      </td>
      <td align="right" width="15%">���(cm)</td>
      <td width="15%"> 
        <input type="text" name="sg" value="" size="15" maxlength="8" >      </td>
      <td align="right" width="15%">����(KG)</td>
      <td width="15%"> 
        <input type="text" name="tz" value="" size="15" maxlength="8" >      </td>
      <td align="right" width="10%">Ѫ��</td>
      <td width="15%"> 
        <select name="xx" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="1">A��</option>
          <option value="2">B��</option>
          <option value="3">AB��</option>
          <option value="4">O��</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">����״��</td>
      <td width="15%"> 
        <select name="hf" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="N">δ��</option>
          <option value="Y">�ѻ�</option>
        </select>      </td>
      <td align="right" width="15%">������ò</td>
      <td width="15%"> 
        <select name="zzmm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="0">Ⱥ��</option>
          <option value="1">�й���Ա</option>
          <option value="2">������Ա</option>
          <option value="3">��������</option>
        </select>      </td>
      <td align="right" width="15%">����ְ��</td>
      <td width="15%"> 
        <select name="zcmc" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zcmc c1,zcmc c2 from dm_zcbm order by zcmc","");
%> 
        </select>      </td>
      <td align="right" width="10%">��Ҫ����֤��</td>
      <td width="15%"> 
        <select name="zyzzzs" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zzzs c1,zzzs c2 from dm_zzzs order by zzzs","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>�Ļ��̶�</td>
      <td width="15%"> 
        <select name="xlbm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xlbm,xueli from dm_xlbm order by xlbm","");
%> 
        </select>      </td>
      <td align="right" width="15%">��ѧרҵ</td>
      <td width="15%"> 
        <input type="text" name="zy" value="" size="15" maxlength="50" >      </td>
      <td align="right" width="15%">��ҵʱ��</td>
      <td width="15%"> 
        <input type="text" name="cjgzsj" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%">ѧλ</td>
      <td width="15%"> 
        <select name="xuewei" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="1">ѧʿѧλ</option>
          <option value="2">˶ʿѧλ</option>
          <option value="3">��ʿѧλ</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">��ҵԺУ</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="byyx" value="" size="50" maxlength="50" >      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>�Ƿ������</td>
      <td width="15%"> 
        <input type="radio" name="sfytj"  value="Y">
        �� 
        <input type="radio" name="sfytj"  value="N" checked>
        �� </td>
      <td align="right" width="10%">�������</td>
      <td width="15%"> 
        <input type="text" name="tjrq" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">����ϸסַ</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="zz" value="" size="50" maxlength="200" >      </td>
      <td align="right" width="15%">��������</td>
      <td width="15%"> 
        <input type="text" name="yzbm" value="" size="15" maxlength="6" >      </td>
      <td align="right" width="10%">email</td>
      <td width="15%"> 
        <input type="text" name="email" value="" size="15" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>�ֻ�</td>
      <td width="15%"> 
        <input type="text" name="dh" value="" size="15" maxlength="50" >      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>�칫�绰</td>
      <td width="15%"> 
        <input type="text" name="bgdh" value="" size="15" maxlength="50" >      </td>
      <td align="right" width="15%">��ͥ�绰</td>
      <td width="15%"> 
        <input type="text" name="jtdh" value="" size="15" maxlength="50" >      </td>
      <td align="right" width="10%">�绰�Ƿ񹫲�</td>
      <td width="15%"> 
        <select name="dhsfgb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value="1">����˾</option>
          <option value="2">������</option>
          <option value="9">������</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>���֤��</td>
      <td width="15%"> 
        <input type="text" name="sfzh" value="" size="15" maxlength="18" >      </td>
      <td align="right" width="15%">���֤��ַ</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="sfzdz" value="" size="50" maxlength="100" >      </td>
      <td align="right" width="10%">����</td>
      <td width="15%"> 
        <input type="text" name="bianhao" value="<%=bianhao%>" size="15" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">������ϵ��</td>
      <td width="15%"> 
        <input type="text" name="jjlxr" value="" size="15" maxlength="20" >      </td>
      <td align="right" width="15%">������ϵ��סַ</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="jjlxrdz" value="" size="50" maxlength="100" >      </td>
      <td align="right" width="10%">��ϵ�˵绰</td>
      <td width="15%"> 
        <input type="text" name="lxrdh" value="" size="15" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">�Ƿ�ȹ����ϵ</td>
      <td width="15%"> 
        <input type="radio" name="sfqs"  value="Y">
        �� 
        <input type="radio" name="sfqs"  value="N" checked>
        �� </td>
      <td align="right" width="15%">���</td>
      <td width="15%"><input name="xuhao" type="text" value="" size="15" maxlength="8" ></td>
      <td align="right" width="15%">���ں���</td>
      <td width="15%"> 
        <input type="text" name="kqhm" value="" size="15" maxlength="8" >      </td>
      <td width="10%" align="right">���ʦְ��</td>
      <td width="15%"> 
        <select name="sjsjb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">ҵ��ר��<br>
        ��������</td>
      <td colspan="7"> 
        <textarea name="zwpj" cols="118" rows="3"></textarea>      </td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td colspan="8"><b>*�����������*</b></td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>�������ڵ�</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="hjszd" value="" size="50" maxlength="100" >      </td>
      <td align="right" width="15%">������ŵ�</td>
      <td colspan="3"> 
        <input type="text" name="dacfd" value="" size="46" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">����ת��ʱ��</td>
      <td width="15%"> 
        <input type="text" name="dazrsj" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%">����ת��ʱ��</td>
      <td width="15%"> 
        <input type="text" name="dazcsj" size="15" maxlength="10"  value="" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%">����ת���δ�</td>
      <td width="15%"> 
        <input type="text" name="dazchc" size="15" maxlength="50"  value="">      </td>
      <td align="right" width="10%">�������ܷѽ���</td>
      <td width="15%"><%
	cf.radioToken(out, "dabgfjs","N+δ����&Y+����","");
%></td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td height="5" colspan="8"><b>*��ְ*</b></td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>������˾</td>
      <td width="15%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:114PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>��������</td>
      <td width="15%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:114PX" onChange="changeDwbh(insertform)">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
        </select>      </td>
      <td align="right" width="15%">��������С��</td>
      <td width="15%"> 
        <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
        </select>      </td>
      <td align="right" width="10%"><span class="STYLE1">*</span>����ְ��</td>
      <td width="15%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%" height="35"><span class="STYLE1">*</span>��ְ����</td>
      <td width="15%" height="35"> 
        <input type="text" name="rzsj" value="<%=cf.today()%>" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%" height="35"><span class="STYLE1">*</span>��ְ����</td>
      <td width="15%" height="35"> 
        <input type="text" name="rzcs" value="1" size="15" maxlength="8" >      </td>
      <td align="right" width="15%" height="35">���ý�������</td>
      <td width="15%" height="35"> 
        <input type="text" name="syjzrq" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%" height="35">��������</td>
      <td width="15%" height="35"> 
        <input type="text" name="gznx" value="" size="12" maxlength="8" >
        �� </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">δ����ʱ��</td>
      <td width="15%"> 
        <input type="text" name="wgzsj" value="" size="12" maxlength="9" >
        �� </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>�Ƿ��е�����</td>
      <td width="15%"> 
        <input type="radio" name="sfydbs"  value="Y">
        �� 
        <input type="radio" name="sfydbs"  value="N" checked>
        �� </td>
      <td align="right" width="15%">��ǰ��ѵ ��</td>
      <td width="15%"> 
        <input name="gqpxkssj" type="text" id="gqpxkssj" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%">��ǰ��ѵ ��</td>
      <td width="15%"> 
        <input name="gqpxjssj" type="text" id="gqpxjssj" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%" height="19">ǰ������λ</td>
      <td colspan="7" height="19"> 
        <input type="text" name="qgzdw" value="" size="117" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td colspan="8">&nbsp;</td>
    </tr>
    
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE2">¼����</span></td>
      <td width="15%"><input type="text" name="lrr" value="<%=yhmc%>" size="15" maxlength="20" readonly></td>
      <td align="right" width="15%"><span class="STYLE2">¼��ʱ��</span></td>
      <td width="15%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="15" maxlength="10" readonly></td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="15%">&nbsp;</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">��ע</td>
      <td colspan="7"><textarea name="bz" cols="116" rows="2"></textarea></td>
    </tr>
    <tr align="center"> 
      <td colspan="8"> 
        <input name="button" type="button" onClick="f_do(insertform)"  value="����">
        <input type="reset"  value="����" name="reset">
        <input type="button" value="¼���������" onClick="f_lrmx(insertform,'jyjl')" name="jyjl" disabled>
        <input type="button" value="¼�빤������" onClick="f_lrmx(insertform,'gzjl')" name="gzjl" disabled>
        <input type="button" value="¼���ͥ����" onClick="f_lrmx(insertform,'jtzl')" name="jtzl" disabled>
        <input type="button"  value="�ϴ���Ƭ" onClick="f_lrmx(insertform,'sczp')" name="sczp" disabled>
        <input type="button"  value="�鿴��Ƭ" onClick="f_lrmx(insertform,'ckzp')" name="ckzp" disabled>      </td>
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


function changeDwbh(FormName)
{
	FormName.sjsbh.length=1;

	if (FormName.dwbh.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F3','F4') and  cxbz='N' and ssdw='"+FormName.dwbh.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.sjsbh,ajaxRetStr);
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[Ա������]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xb)=="") {
		alert("������[�Ա�]��");
		FormName.xb.focus();
		return false;
	}
	if(!(isDatetime(FormName.csrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.sfzszg)=="") {
		alert("��ѡ��[Ա��״̬ ]��");
		FormName.sfzszg.focus();
		return false;
	}
	if(	javaTrim(FormName.xlbm)=="") {
		alert("������[�Ļ��̶�]��");
		FormName.xlbm.focus();
		return false;
	}
	if(!(isNumber(FormName.sg, "���(cm)"))) {
		return false;
	}
	if(!(isNumber(FormName.tz, "����(KG)"))) {
		return false;
	}
	if(	javaTrim(FormName.hjszd)=="") {
		alert("������[�������ڵ�]��");
		FormName.hjszd.focus();
		return false;
	}
	if(!(isDatetime(FormName.cjgzsj, "��ҵʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.gznx, "��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfytj)) {
		alert("��ѡ��[�Ƿ������]��");
		FormName.sfytj[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.tjrq, "�������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfqs)) {
		alert("��ѡ��[�Ƿ��빫˾��������������ϵ]��");
		FormName.sfqs[0].focus();
		return false;
	}

	if(	javaTrim(FormName.dh)=="") {
		alert("������[�ֻ�����]��");
		FormName.dh.focus();
		return false;
	}



	if(	javaTrim(FormName.bgdh)=="") {
		alert("������[�칫�绰]��");
		FormName.bgdh.focus();
		return false;
	}

	if(	javaTrim(FormName.dhsfgb)=="") {
		alert("��ѡ��[�绰�Ƿ񹫲�]��");
		FormName.dhsfgb.focus();
		return false;
	}
//	if(	javaTrim(FormName.dacfd)=="") {
//		alert("������[������ŵ�]��");
//		FormName.dacfd.focus();
//		return false;
//	}

/*
	if(	javaTrim(FormName.bianhao)=="") {
		alert("������[����]��");
		FormName.bianhao.focus();
		return false;
	}
*/

	if(	javaTrim(FormName.sfzh)=="") {
		alert("������[���֤]��");
		FormName.sfzh.focus();
		return false;
	}
	if(FormName.sfzh.value.length!=15 && FormName.sfzh.value.length!=18) 
	{
		alert("[���֤]����ֻ����15λ��18λ");
		FormName.sfzh.focus();
		return false;
	}

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��������]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("������[����ְ��]��");
		FormName.xzzwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rzsj)=="") {
		alert("������[��ְʱ��]��");
		FormName.rzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "��ְʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfydbs)) {
		alert("��ѡ��[�Ƿ��е�����]��");
		FormName.sfydbs[0].focus();
		return false;
	}
//	if(	javaTrim(FormName.wgzsj)=="") {
//		alert("������[δ����ʱ��(��)]��");
//		FormName.wgzsj.focus();
//		return false;
//	}
	if(!(isFloat(FormName.wgzsj, "δ����ʱ��(��)"))) {
		return false;
	}

	if (FormName.sfzszg.value=="N")
	{
		if(	javaTrim(FormName.syjzrq)=="") {
			alert("������[���ý�������]��");
			FormName.syjzrq.focus();
			return false;
		}

		if(!(isDatetime(FormName.syjzrq, "���ý�������"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.syjzrq)!="") {
			alert("������Ա��������¼��[���ý�������]��");
			FormName.syjzrq.select();
			return false;
		}
	}

	if(!(isNumber(FormName.kqhm, "���ں���"))) {
		return false;
	}
	if(	javaTrim(FormName.rzcs)=="") {
		alert("������[��ְ����]��");
		FormName.rzcs.focus();
		return false;
	}
	if(!(isNumber(FormName.rzcs, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.dazrsj, "����ת��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dazcsj, "����ת��ʱ��"))) {
		return false;
	}

	if(!(isInt(FormName.xuhao, "���"))) {
		return false;
	}

	FormName.action="SaveInsertSq_yhxx.jsp";
	FormName.submit();
	FormName.jyjl.disabled=false;
	FormName.gzjl.disabled=false;
	FormName.jtzl.disabled=false;
	FormName.sczp.disabled=false;
	FormName.ckzp.disabled=false;
	return true;
}

function f_lrmx(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.sfzh)=="") {
		alert("������[���֤]��");
		FormName.sfzh.focus();
		return false;
	}
	if(FormName.sfzh.value.length!=15 && FormName.sfzh.value.length!=18) 
	{
		alert("[���֤]����ֻ����15λ��18λ");
		FormName.sfzh.focus();
		return false;
	}

	FormName.action="lrmx.jsp?lx="+lx+"&sfzh="+FormName.sfzh.value;
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

