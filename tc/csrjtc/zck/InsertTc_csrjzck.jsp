<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTc_csrjzck.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
	%>
  </select></td>
  <td align="right">���ۼ���</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">��Ʒ����</font></td> 
  <td width="32%"> 
    <input type="text" name="cpbm" value="0" size="20" maxlength="13" readonly>  </td>
  <td align="right" width="18%">�ڲ�����</td> 
  <td width="32%"><input type="text" name="nbbm" value="" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"> 
    <select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlbm c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select>  </td>
  <td align="right" width="18%">��ƷС��</td> 
  <td width="32%"> 
    <select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clxlbm c1,clxlmc c2 from jxc_clxlbm order by clxlmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input type="text" name="bzmc" value="" size="20" maxlength="50" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="cpmc" value="" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">�ͺ�</td> 
  <td width="32%"> 
    <input type="text" name="xh" value="" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���</td> 
  <td width="32%"> 
    <input type="text" name="gg" value="" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">Ʒ��</td> 
  <td width="32%"> 
    <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ��</td> 
  <td width="32%"> 
    <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
%>
    </select>  </td>
  <td align="right" width="18%">������λ</td> 
  <td width="32%"> 
    <select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�µ�������λ</td> 
  <td width="32%"> 
    <select name="xdjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
  <td align="right" width="18%">�µ���</td> 
  <td width="32%"> 
    <input type="text" name="xdb" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���</td> 
  <td width="32%"> 
    <input type="text" name="sh" value="" size="10" maxlength="9" >
    %  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ��账��С��</td>
  <td colspan="3"><input type="radio" name="sfxclxs"  value="1">
    ����ȡ��
      <input type="radio" name="sfxclxs"  value="2">
      ����ȡ��
      <input type="radio" name="sfxclxs"  value="3">
      4��5��
      <input type="radio" name="sfxclxs"  value="4">
      ������</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>ԭ�����</strong></td> 
  <td width="32%"> 
    <input type="text" name="yjsj" value="" size="20" maxlength="17" >  </td>
  <td width="18%" align="right"><font color="#0000CC">�����</font></td>
  <td width="32%"><input type="text" name="jsj" value="" size="20" maxlength="17" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><strong>ԭ�ͻ����۵���</strong></td>
  <td><input type="text" name="ykhxsdj" value="" size="20" maxlength="17" ></td>
  <td align="right"><font color="#0000CC">�ͻ����۵���</font></td>
  <td><input type="text" name="khxsdj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>ԭʩ���ӵ���</strong></td> 
  <td width="32%"> 
    <input type="text" name="ysgddj" value="" size="20" maxlength="17" >  </td>
  <td width="18%" align="right"><font color="#0000CC">ʩ���ӵ���</font></td>
  <td width="32%"><input type="text" name="sgddj" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><input type="radio" name="lx"  value="1">
    ��׼�ײ���
      <input type="radio" name="lx"  value="2">
      �ײ���</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ���Ч</td>
  <td><input type="radio" name="sfyx"  value="1">
    ��Զ��Ч
    <input type="radio" name="sfyx"  value="2">
    ��Ч
    <input type="radio" name="sfyx"  value="3">
    �׶���Ч </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ч��ʼʱ��</td>
  <td><input type="text" name="yxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��Ч����ʱ��</td>
  <td><input type="text" name="yxjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>  </td>
  </tr>
</table>


<BR>
<div align="center">
<table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td height="27" colspan="7" align="center" bgcolor="#CCCCCC"><strong>�����������</strong></td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="15%" height="27" bgcolor="#CCCCCC"><strong>���ۼ���</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>ԭ�����շѼ�</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>�����շѼ�</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>�Ƿ����</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>���ۿ�ʼʱ��</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>���۽���ʱ��</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>���������շѼ�</strong></td>
</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getbjjbbm=null;
	String getbjjbmc=null;

	ls_sql="select bjjbbm,bjjbmc";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where lx='2'";
	ls_sql+=" order by yxj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		getbjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		%>
		<tr bgcolor="#FFFFFF">
		  <td align="right"><input type="hidden" name="getbjjbbm" size="10" maxlength="10"  value="<%=getbjjbbm%>" >
			<%=getbjjbmc%>		  </td>
		  <td><input type="text" name="ysjsfj" size="10" maxlength="10"  value="" ></td>
		  <td><input type="text" name="sjsfj" size="10" maxlength="10"  value="" ></td>
		  <td><select name="sfdz" style="FONT-SIZE:12PX;WIDTH:82PX">
              <%
	cf.selectToken(out,"1+���ۿ�&2+����","");
%>
            </select></td>
		  <td><input type="text" name="dzkssj" size="10" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
		  <td><input type="text" name="dzjzsj" size="10" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
		  <td><input type="text" name="dzsjsfj" size="10" maxlength="10"  value="" ></td>
	  </tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

    <tr align="center"> 
      <td colspan="7"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset" onClick="bc.disabled=false">    
	<input type="button" onClick="f_dr(insertform)"  value="���뱨��">
	<input type="button" onClick="f_dc(insertform)"  value="��������">
	<P>
	<A HREF="CSH21-�ײ���������.xls"><B>����Ҽ�����Ϊ������Excel����ģ��</B></A> </td>
    </tr>
</table>
</div>
</form>
</body>
</html>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cpbm)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.tccpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��ƷС��]��");
		FormName.tccplbbm.focus();
		return false;
	}

	if(	javaTrim(FormName.cpmc)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("��ѡ��[��Ӧ��]��");
		FormName.gysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.xdjldw)=="") {
		alert("��ѡ��[�µ�������λ]��");
		FormName.xdjldw.focus();
		return false;
	}
	if(	javaTrim(FormName.xdb)=="") {
		alert("������[�µ���]��");
		FormName.xdb.focus();
		return false;
	}
	if(!(isFloat(FormName.xdb, "�µ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sh)=="") {
		alert("������[���]��");
		FormName.sh.focus();
		return false;
	}
	if(!(isFloat(FormName.sh, "���"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxclxs)) {
		alert("��ѡ��[�Ƿ��账��С��]��");
		FormName.sfxclxs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.yjsj)=="") {
		alert("������[ԭ�����]��");
		FormName.yjsj.focus();
		return false;
	}
	if(!(isFloat(FormName.yjsj, "ԭ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.ykhxsdj)=="") {
		alert("������[ԭ�ͻ����۵���]��");
		FormName.ykhxsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.ykhxsdj, "ԭ�ͻ����۵���"))) {
		return false;
	}
	if(	javaTrim(FormName.ysgddj)=="") {
		alert("������[ԭʩ���ӵ���]��");
		FormName.ysgddj.focus();
		return false;
	}
	if(!(isFloat(FormName.ysgddj, "ԭʩ���ӵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.jsj)=="") {
		alert("������[�����]��");
		FormName.jsj.focus();
		return false;
	}
	if(!(isFloat(FormName.jsj, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.khxsdj)=="") {
		alert("������[�ͻ����۵���]��");
		FormName.khxsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.khxsdj, "�ͻ����۵���"))) {
		return false;
	}
	if(	javaTrim(FormName.sgddj)=="") {
		alert("������[ʩ���ӵ���]��");
		FormName.sgddj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgddj, "ʩ���ӵ���"))) {
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
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyx)) {
		alert("��ѡ��[�Ƿ���Ч]��");
		FormName.sfyx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yxkssj, "��Ч��ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxjzsj, "��Ч����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}

function f_dr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ExpBj_tczcbj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>