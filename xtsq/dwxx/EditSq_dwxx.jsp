<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010102")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String dwbh=null;
String dwmc=null;
String dwjc=null;
String ssdw=null;
String dwlx=null;
String dwdz=null;
String dwfzr=null;
String dwdh=null;
String dwcz=null;
String email=null;
String dqbm=null;
String bz=null;
String sfjms=null;
String hthqz=null;
String cxbz=null;
String ssfgs=null;
String bianma=null;
String ssdqbm=null;
String dwflbm=null;
String ssfw=null;
String dwjb=null;
String kdsj=null;
String gdsj=null;
String dmxs=null;
String bzrs=null;

String kfdh=null;
String xuhao=null;
String dhqh=null;



String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String dzbjbz=null;

try {
	conn=cf.getConnection();



	ls_sql="select kfdh,dwjb,ssfw,dwbh,dwmc,dwjc,ssdw,dwlx,dwdz,dwfzr,dwdh,dwcz,email,bz,dqbm,sfjms,hthqz,cxbz,ssfgs,bianma,ssdqbm,dwflbm,kdsj,gdsj,dmxs,bzrs";
	ls_sql+=" ,xuhao,dhqh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+wheredwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dhqh=cf.fillNull(rs.getString("dhqh"));

		xuhao=cf.fillNull(rs.getString("xuhao"));
		kfdh=cf.fillNull(rs.getString("kfdh"));

		dwjb=cf.fillNull(rs.getString("dwjb"));
		ssfw=cf.fillNull(rs.getString("ssfw"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwjc=cf.fillNull(rs.getString("dwjc"));
		ssdw=cf.fillNull(rs.getString("ssdw"));
		dwlx=cf.fillNull(rs.getString("dwlx"));
		dwdz=cf.fillNull(rs.getString("dwdz"));
		dwfzr=cf.fillNull(rs.getString("dwfzr"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		email=cf.fillNull(rs.getString("email"));
		bz=cf.fillNull(rs.getString("bz"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		sfjms=cf.fillNull(rs.getString("sfjms"));
		hthqz=cf.fillNull(rs.getString("hthqz"));
		cxbz=cf.fillNull(rs.getString("cxbz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bianma=cf.fillNull(rs.getString("bianma"));
		ssdqbm=cf.fillNull(rs.getString("ssdqbm"));
		dwflbm=cf.fillNull(rs.getString("dwflbm"));
		kdsj=cf.fillNull(rs.getDate("kdsj"));
		gdsj=cf.fillNull(rs.getDate("gdsj"));
		dmxs=cf.fillNull(rs.getString("dmxs"));
		bzrs=cf.fillNull(rs.getString("bzrs"));

	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center" > 
                  <input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input type="button"  value="¼����ĿרԱ" onClick="f_lrxmzy(editform)" name="lr">
                  <input type="button"  value="�鿴��ĿרԱ" onClick="f_ck(editform)" name="ck"></td>
            </tr>
            <tr>
              <td bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font><font color="#0000FF">��λ���</font> </td>
              <td bgcolor="#CCCCFF"><input type="text" name="dwbh" size="20" maxlength="5"  value="<%=dwbh%>" readonly></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��λ����</td>
              <td bgcolor="#CCCCFF"><input type="text" name="dwmc" size="20" maxlength="100"  value="<%=dwmc%>" ></td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��λ����</td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <select name="dwlx" style="FONT-SIZE:12PX;WIDTH:152PX"   onChange="changelx(editform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"A0+�ܲ�&A1+�ܲ�������&F0+�ֹ�˾&F1+�ֹ�˾������&F2+����&F3+���С��&F4+�г�С��&F5+����С��",dwlx);
%> 
                </select>              </td>
              <td width="18%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��λ����</td>
              <td width="34%" bgcolor="#CCCCFF"> 
                <select name="dwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwflbm,dwflmc from dm_dwflbm order by dwflbm",dwflbm);
%> 
                </select>              </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��������</td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm",dqbm);
%> 
                </select>              </td>
              <td width="18%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��������</td>
              <td width="34%" bgcolor="#CCCCFF"> 
                <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm",ssdqbm);
%> 
                </select>              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>�����ֹ�˾</td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefgs(editform)">
                  <%
	if (dwlx.equals("A0"))//A0:�ܲ�; A1:�ܲ�����; F0:�ֹ�˾��F1:�ֹ�˾���ţ�F2���ֹ�˾���棻F3������С��
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
	else if (dwlx.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') and cxbz='N'  order by dwbh",ssfgs);
	}
%> 
                </select>              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>�ϼ���λ</td>
              <td width="34%" bgcolor="#CCCCFF"> 
                <select name="ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (dwlx.equals("A0"))//A0:�ܲ�; A1:�ܲ�����; F0:�ֹ�˾��F1:�ֹ�˾���ţ�F2���ֹ�˾���棻F3������С��
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw);
	}
	else if (dwlx.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw);
	}
	else if (dwlx.equals("F0"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw);
	}
	else if (dwlx.equals("F1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw);
	}
	else if (dwlx.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw);
	}
	else if (dwlx.equals("F3") || dwlx.equals("F4") || dwlx.equals("F5"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F1','F2') and cxbz='N'  order by dwlx,dwbh",ssdw);
	}
%> 
                </select>              </td>
            </tr>
            
            <tr> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>��˾����</td>
              <td bgcolor="#CCCCFF">
              <%
	cf.radioToken(out, "sfjms","N+ֱӪ��˾&Y+���˹�˾&Q+������˾",sfjms);
%></td>
              <td align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>�����־</td>
              <td bgcolor="#CCCCFF"><select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	cf.selectToken(out,"Y+�ѳ���&N+δ����",cxbz);
%>
              </select></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">����</td>
              <td width="30%"> 
                <input type="text" name="bianma" value="<%=bianma%>" size="6" maxlength="2" >
                <font color="#FF0000"><strong>�ֹ�˾��¼</strong></font>(����ʩ���ӱ���)</td>
              <td width="18%" align="right">�绰����</td>
              <td width="34%"><input name="dhqh" type="text" value="<%=dhqh%>" size="10" maxlength="10">
                <font color="#FF0000"><strong>�ֹ�˾����¼��</strong></font></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCCCFF">��ͬ��ǰ׺</td>
              <td colspan="3" bgcolor="#CCCCFF"> 
                <input type="text" name="hthqz" value="<%=hthqz%>" size="20" maxlength="20" >
                <strong><font color="#FF0000">����Ӧ¼�롾��ͬ��ǰ׺���������޷������ͬ��</font></strong> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">������ʽ</td>
              <td width="30%"> 
                <select name="dmxs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dmxs,dmxsmc from dm_dmxs order by dmxs",dmxs);
%> 
                </select>              </td>
              <td width="18%" align="right">��׼����</td>
              <td width="34%"> 
                <input type="text" name="bzrs" value="<%=bzrs%>" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">������λ</td>
              <td width="30%"> 
                <select name="ssfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssfw,ssfwmc from dm_ssfw order by ssfw",ssfw);
%> 
                </select>              </td>
              <td width="18%" align="right">��λ����</td>
              <td width="34%"> 
                <select name="dwjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwjb,dwjbmc from dm_dwjb order by dwjb",dwjb);
%> 
                </select>              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF">��λ��ַ</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="dwdz" size="74" maxlength="100"  value="<%=dwdz%>" >              </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right">��λ�绰</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="dwdh" size="74" maxlength="100"  value="<%=dwdh%>" >              </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right">�ͷ��绰</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="kfdh" size="74" maxlength="50"  value="<%=kfdh%>" >              </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right">��λ����</td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <input type="text" name="dwcz" size="20" maxlength="50"  value="<%=dwcz%>" >              </td>
              <td width="18%" bgcolor="#FFFFFF" align="right">���</td>
              <td width="34%" bgcolor="#FFFFFF"><input name="xuhao" type="text" value="<%=xuhao%>" size="20" maxlength="8" ></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                ��λ������              </td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <input type="text" name="dwfzr" size="20" maxlength="20"  value="<%=dwfzr%>" >              </td>
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                ��λEMail              </td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <input type="text" name="email" size="20" maxlength="50"  value="<%=email%>" >              </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right">����ʱ��</td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <input type="text" name="kdsj" value="<%=kdsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" bgcolor="#FFFFFF" align="right">�ص�ʱ��</td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <input type="text" name="gdsj" value="<%=gdsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                ��ע              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="72" rows="2"><%=bz%></textarea>              </td>
            </tr>
            
            <tr> 
              <td colspan="4" align="center" > 
                  <input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input type="button"  value="¼����ĿרԱ" onClick="f_lrxmzy(editform)" name="lr">
                  <input type="button"  value="�鿴��ĿרԱ" onClick="f_ck(editform)" name="ck"></td>
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
	cf.ajax(out);//����AJAX
%>

var czlx;

function changelx(FormName) 
{
	FormName.ssdw.length=0;
	FormName.ssfgs.length=0;

	if(	javaTrim(FormName.dwlx)=="") 
	{
		return false;
	}


	czlx=1;

	var sql;

	if (FormName.dwlx.value=="A0")//A0:�ܲ�; A1:�ܲ�����; F0:�ֹ�˾��F1:�ֹ�˾���ţ�F2���ֹ�˾���棻F3������С��
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="A1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0') and cxbz='N'  order by dwbh";
	}


	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);

	openAjax(actionStr);
}

function changefgs(FormName) 
{
	if(	javaTrim(FormName.dwlx)=="") 
	{
		alert("��ѡ��[��λ����]��");
		FormName.dwlx.focus();
		return false;
	}

	FormName.ssdw.length=0;

	if(	javaTrim(FormName.ssfgs)=="") 
	{
		return false;
	}

	czlx=2;

	var sql;

	if (FormName.dwlx.value=="A0")//A0:�ܲ�; A1:�ܲ�����; F0:�ֹ�˾��F1:�ֹ�˾���ţ�F2���ֹ�˾���棻F3������С��
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="A1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="F0")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="F1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='"+FormName.ssfgs.value+"' order by dwbh";
	}
	else if (FormName.dwlx.value=="F2")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='"+FormName.ssfgs.value+"' order by dwbh";
	}
	else if (FormName.dwlx.value=="F3" || FormName.dwlx.value=="F4" || FormName.dwlx.value=="F5")
	{
		sql="select dwbh,dwmc from sq_dwxx where ssfgs='"+FormName.ssfgs.value+"' and dwlx in('F1','F2') and cxbz='N'  order by dwlx,dwbh";
	}



	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	if (czlx==1)
	{
		strToSelect(editform.ssfgs,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(editform.ssdw,ajaxRetStr);
	}

}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwmc)=="") {
		alert("������[��λ����]��");
		FormName.dwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dwlx)=="") {
		alert("��ѡ��[��λ����]��");
		FormName.dwlx.focus();
		return false;
	}

	if(	javaTrim(FormName.dwflbm)=="") {
		alert("��ѡ��[��λ����]��");
		FormName.dwflbm.focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdw)=="") {
		alert("��ѡ��[�ϼ���λ]��");
		FormName.ssdw.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.ssdqbm.focus();
		return false;
	}

	
	
	if(	!radioChecked(FormName.sfjms)) {
		alert("��ѡ��[��˾����]��");
		FormName.sfjms[0].focus();
		return false;
	}
	if(!(isNumber(FormName.bzrs, "��׼����"))) {
		return false;
	}
	if(!(isDatetime(FormName.kdsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdsj, "�ص�ʱ��"))) {
		return false;
	}


	if (FormName.dwlx.value=="F0")//�ֹ�˾
	{
		if(	javaTrim(FormName.dhqh)=="") {
			alert("������[�绰����]��");
			FormName.dhqh.focus();
			return false;
		}
		if(!(isNumber(FormName.dhqh, "�绰����"))) {
			return false;
		}
		if(	javaTrim(FormName.bianma)=="") {
			alert("��ѡ��[����]��");
			FormName.bianma.focus();
			return false;
		}
		if (FormName.bianma.value.length!=2)
		{
			alert("����[����]����ӦΪ2λ��д��ĸ��");
			FormName.bianma.focus();
			return false;
		}
	}


	if(!(isInt(FormName.xuhao, "���"))) {
		return false;
	}


	FormName.action="SaveEditSq_dwxx.jsp";
	FormName.submit();
	return true;
}

function f_lrxmzy(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="InsertSq_xmzy.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="Sq_xmzyList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











