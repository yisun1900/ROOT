<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸ļ���¼��ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");
String ssfgs=request.getParameter("ssfgs");

String jcjlh=request.getParameter("jcjlh");
String xmbm=cf.GB2Uni(request.getParameter("xmbm"));
String xmmc=null;
String xmdlbm=null;
String xmdlmc=null;
String xmxlbm=null;
String xmxlmc=null;
String wgjbbm=null;
String wgjbmc=null;
String xzzwbm=null;
String ygbh=null;
String yhmc=null;
String ygkf=null;
String ygfkje=null;
String zgyq=null;
String sgdkf=null;
String sgdfkje=null;
String wzcs=null;
String bz=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select xmmc,xmdlbm,xmdlmc,xmxlbm,xmxlmc,wgjbbm,wgjbmc,xzzwbm,ygbh,yhmc,ygkf,ygfkje,zgyq,sgdkf,sgdfkje,wzcs,bz ";
	ls_sql+=" from  gdm_jcjlmx";
	ls_sql+=" where jcjlh='"+jcjlh+"' and xmbm='"+xmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmdlmc=cf.fillNull(rs.getString("xmdlmc"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		xmxlmc=cf.fillNull(rs.getString("xmxlmc"));
		wgjbbm=cf.fillNull(rs.getString("wgjbbm"));
		wgjbmc=cf.fillNull(rs.getString("wgjbmc"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		ygkf=cf.fillNull(rs.getString("ygkf"));
		ygfkje=cf.fillNull(rs.getString("ygfkje"));
		zgyq=cf.fillNull(rs.getString("zgyq"));
		sgdkf=cf.fillNull(rs.getString("sgdkf"));
		sgdfkje=cf.fillNull(rs.getString("sgdfkje"));
		wzcs=cf.fillNull(rs.getString("wzcs"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khbh";
	ls_sql+=" from  gdm_gdjcjl";
	ls_sql+=" where jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
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

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14" >
  <tr>
    <td width="100%" height="4"> 
      <div align="center">�޸ļ���¼��ϸ��<font color="#0000CC">��¼�ţ�<%=jcjlh%></font>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditGdm_jcjlmx.jsp" name="insertform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFFF" align="right" width="18%"><font color="#CC0000">*</font>��Ŀ����</td>
              <td width="32%"> 
                <select name="xmdlbm" style="FONT-SIZE:14PX;WIDTH:152PX" onChange="changeDl(insertform)">
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from gdm_xmdlbm where xmdlbm='"+xmdlbm+"'","");
%> 
                </select>
                 </td>
              <td align="right" width="18%"><font color="#CC0000">*</font>��ĿС��</td>
              <td width="32%">
			  <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeXl(insertform)">
                <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from gdm_xmxlbm where xmxlbm='"+xmxlbm+"'","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" ><font color="#CC0000">*</font>�����Ŀ</td>
              <td height="2" colspan="3" valign="top">
			  <select name="xmbm" style="FONT-SIZE:14PX;WIDTH:522PX">
                <%
	cf.selectItem(out,"select xmbm,xmmc from gdm_gcxm where xmbm='"+xmbm+"'","");
%>
              </select>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" ><font color="#CC0000">*</font>Υ�漶��</td>
              <td width="32%" height="2" valign="top"> 
                <select name="wgjbbm" style="FONT-SIZE:14PX;WIDTH:152PX" onChange="changeJb(insertform)">
                <option value=""></option>
    <%
	cf.selectItem(out,"select wgjbbm,wgjbmc from gdm_wgjbbm order by wgjbbm",wgjbbm);
%>
                </select>			  </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>Υ�´���</td>
              <td width="32%"><input type="text" name="wzcs" value="1" size="20" maxlength="16" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>������Աְ��</td>
              <td>
				<select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeZw(insertform)">
				<option value=""></option>
			<%
				cf.selectItem(out,"select xzzwbm c1,xzzwbm c2 from gdm_cfry where wgjbbm='"+wgjbbm+"'  order by xzzwbm",xzzwbm);
			%>
				</select>				</td>
              <td align="right">������Ա</td>
              <td>
			  <select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
				<option value=""></option>
			<%
				cf.selectItem(out,"select ygbh,yhmc||'('||dwmc||')' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.sfzszg in('Y','N') and sq_yhxx.ssfgs='"+ssfgs+"' and sq_yhxx.xzzwbm='"+xzzwbm+"' order by sq_yhxx.dwbh,yhmc",ygbh);
			%>
              </select>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����Ҫ��</td>
              <td>
			  <select name="zgyq" style="FONT-SIZE:14PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select zgyq c1,zgyq c2 from gdm_zgyq order by zgyq",zgyq);
%>
              </select>			  </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000CC">Ա���۷�</font></td>
              <td width="32%"> 
                <input type="text" name="ygkf" value="<%=ygkf%>" size="20" maxlength="16" readonly>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000CC">Ա��������</font></td>
              <td width="32%"> 
                <input type="text" name="ygfkje" value="<%=ygfkje%>" size="20" maxlength="16" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font><font color="#0000CC">ʩ���ӿ۷�</font></td>
              <td><input type="text" name="sgdkf" value="<%=sgdkf%>" size="20" maxlength="16" readonly>
              </td>
              <td align="right"><font color="#CC0000">*</font><font color="#0000CC">ʩ���ӷ�����</font></td>
              <td><input type="text" name="sgdfkje" value="<%=sgdfkje%>" size="20" maxlength="16" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFFF" align="right" width="18%">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3" ></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
			<input type="hidden" name="jcjlh" value="<%=jcjlh%>"  > 
			<input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">              </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//����Ajax
	cf.ajax(out);
%>

var czlx;

function changeDl(FormName)
{
	FormName.xmxlbm.length=1;
	FormName.xmbm.length=1;
	FormName.xzzwbm.length=1;
	FormName.ygbh.length=1;

	if (FormName.xmdlbm.value=="")
	{
		return;
	}

	czlx=1;



	var sql="select trim(xmxlbm),xmxlmc from gdm_xmxlbm where xmdlbm='"+FormName.xmdlbm.value+"' order by xmxlbm";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}

function changeXl(FormName)
{
	FormName.xmbm.length=1;
	FormName.xzzwbm.length=1;
	FormName.ygbh.length=1;

	if (FormName.xmxlbm.value=='')
	{
		return;
	}

	czlx=2;


	var sql="select trim(xmbm),xmmc from gdm_gcxm where xmxlbm='"+FormName.xmxlbm.value+"' order by xmbm";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}

function changeJb(FormName)
{
	FormName.xzzwbm.length=1;
	FormName.ygbh.length=1;

	if (FormName.wgjbbm.value=='')
	{
		return;
	}

	if(	javaTrim(FormName.xmbm)=="") {
		alert("��ѡ��[�����Ŀ]��");
		FormName.xmbm.focus();
		FormName.wgjbbm.value="";
		return false;
	}

	czlx=3;


	var sql="select xzzwbm c1,xzzwbm c2 from gdm_cfry where wgjbbm='"+FormName.wgjbbm.value+"' order by xzzwbm";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}

function changeZw(FormName)
{
	FormName.ygbh.length=1;

	if (FormName.xzzwbm.value=='')
	{
		return;
	}

	if(	javaTrim(FormName.wgjbbm)=="") {
		alert("��ѡ��[Υ�漶��]��");
		FormName.wgjbbm.focus();
		FormName.xzzwbm.length=1;
		return false;
	}

	czlx=4;

	var sql="select ygbh,yhmc||'('||dwmc||')' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.sfzszg in('Y','N') and sq_yhxx.ssfgs='<%=ssfgs%>' and sq_yhxx.xzzwbm='"+FormName.xzzwbm.value+"' order by sq_yhxx.dwbh,yhmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}

function getFk(FormName)
{
	if (FormName.xzzwbm.value=='')
	{
		return;
	}


	czlx=5;

	var sql="select ygfkje||'*'||ygkf||'*'||sgdfkje||'*'||sgdkf from gdm_gcxmcfbz where xmbm='"+FormName.xmbm.value+"' and wgjbbm='"+FormName.wgjbbm.value+"'  and xzzwbm='"+FormName.xzzwbm.value+"'";
	var actionStr="/ajax/getValue.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		strToSelect(insertform.xmxlbm,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(insertform.xmbm,ajaxRetStr);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.xzzwbm,ajaxRetStr);
	}
	else if (czlx==4)
	{
		strToSelect(insertform.ygbh,ajaxRetStr);

		getFk(insertform);
	}
	else if (czlx==5)
	{
		var str=ajaxRetStr;

		while (true)
		{
			if (str.substring(0,1)=="\r")
			{
				str=str.substring(1);
			}
			else if (str.substring(0,1)=="\n")
			{
				str=str.substring(1);
			}
			else{
				break;
			}
		}

		var dateArray=str.split("*");

		insertform.ygfkje.value=dateArray[0];
		insertform.ygkf.value=dateArray[1];
		insertform.sgdfkje.value=dateArray[2];
		insertform.sgdkf.value=dateArray[3];
	}
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("������[����¼��]��");
		FormName.jcjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.jcjlh, "����¼��"))) {
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbm)=="") {
		alert("��ѡ��[�����Ŀ]��");
		FormName.xmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wgjbbm)=="") {
		alert("��ѡ��[Υ�漶��]��");
		FormName.wgjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wzcs)=="") {
		alert("��ѡ��[Υ�´���]��");
		FormName.wzcs.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcs, "Υ�´���"))) {
		return false;
	}
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("��ѡ��[������Աְ��]��");
		FormName.xzzwbm.focus();
		return false;
	}

/*	
	if(	javaTrim(FormName.ygbh)=="") {
		alert("��ѡ��[������Ա]��");
		FormName.ygbh.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.ygkf)=="") {
		alert("��ѡ��[Ա���۷�]��");
		FormName.ygkf.focus();
		return false;
	}
	if(!(isFloat(FormName.ygkf, "Ա���۷�"))) {
		return false;
	}
	if(	javaTrim(FormName.ygfkje)=="") {
		alert("��ѡ��[Ա��������]��");
		FormName.ygfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.ygfkje, "Ա��������"))) {
		return false;
	}

	if(	javaTrim(FormName.sgdkf)=="") {
		alert("��ѡ��[ʩ���ӿ۷�]��");
		FormName.sgdkf.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdkf, "ʩ���ӿ۷�"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfkje)=="") {
		alert("��ѡ��[ʩ���ӷ�����]��");
		FormName.sgdfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfkje, "ʩ���ӷ�����"))) {
		return false;
	}



	FormName.submit();
	return true;
}
//-->
</SCRIPT>
