<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");

String khbh=null;
String sfxmbm=null;
double dj=0;
double sfbfb=0;
double sl=0;
String jldw=null;
double zqsfje=0;
double dxzkl=0;
double sfje=0;
String sflx=null;
String bz=null;
String dqbm=null;
String djmark=null;
String slmark=null;
String sfbfbmark=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wheresfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,sfxmbm,DECODE(sflx,'1','����ֱ�ӷѰٷֱȣ����ɸģ�','A','����ֱ�ӷѰٷֱȣ��ɸģ�','2','�̶����ɸģ�','3','˰���ۺ󰴻������㣩','8','˰���ۺ��ۿۼ��㣩','4','�̶������ɸģ�','5','�����','6','��˾�����İٷֱ�','7','�Թ����İٷֱ�','9','���ٷֱ�����Ʒ�') sflx,dj,sfbfb,jldw,sl,zqsfje,dxzkl,sfje,bz ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sfxmbm='"+wheresfxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
		dj=rs.getDouble("dj");
		sfbfb=rs.getDouble("sfbfb");
		sl=rs.getDouble("sl");
		jldw=cf.fillNull(rs.getString("jldw"));
		zqsfje=rs.getDouble("zqsfje");
		dxzkl=rs.getDouble("dxzkl");
		sfje=rs.getDouble("sfje");
		sflx=cf.fillNull(rs.getString("sflx"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (sflx.equals("�̶����ɸģ�"))
	{
		djmark="";
		slmark="";
		sfbfbmark="readonly";
	}
	else if (sflx.equals("�̶������ɸģ�"))
	{
		djmark="readonly";
		slmark="";
		sfbfbmark="readonly";
	}
	else if (sflx.equals("����ֱ�ӷѰٷֱȣ��ɸģ�"))
	{
		djmark="readonly";
		slmark="readonly";
		sfbfbmark="";
	}
	else
	{
		djmark="readonly";
		slmark="readonly";
		sfbfbmark="readonly";
	}

	ls_sql="select dqbm";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxkhxx.ssfgs=sq_dwxx.dwbh and  (khbh='"+wherekhbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
      <div align="center"> ���޸������շ���Ŀ
	  </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditBj_sfxmmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�ͻ����</td>
              <td width="32%"> 
              <input type="text" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" readonly></td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#FF0000">*</font>�շ���Ŀ</td>
              <td colspan="3"> 
                <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:522PX" onChange="getSfxm(insertform)">
                  <%
	cf.selectItem(out,"select sfxmbm,sfxmmc||DECODE(sfbxx,'1','����ѡ��','2','') from bdm_sfxmbm where dqbm='"+dqbm+"' and (sfxsq='1' OR (sfxsq='2' and sfxmbm in(select sfxmbm from sq_sfxmsq where ygbh='"+ygbh+"'))) order by sfxmbm",sfxmbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�շѼ��㷽ʽ</font></td>
              <td colspan="3"><input name="sflx" type="text" id="sflx" value="<%=sflx%>" size="73" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������λ</font></td>
              <td><input type="text" name="jldw" value="<%=jldw%>" size="20" maxlength="17" readonly>
                <strong><font color="#0000FF">�����޸�</font></strong></td>
              <td align="right"><font color="#FF0000">*</font>����</td>
              <td><input type="text" name="sl" value="<%=sl%>" size="20" maxlength="17" <%=slmark%> onChange="getJe(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#FF0000">*</font>����</td>
              <td> 
                <input type="text" name="dj" value="<%=dj%>" size="20" maxlength="17" <%=djmark%>  onchange="getJe(insertform)">
              <input type="hidden" name="bzdj" value="<%=dj%>" ></td>
              <td align="right"><font color="#FF0000">*</font>�շѰٷֱ�</td>
              <td><input name="sfbfb" type="text" value="<%=sfbfb%>" size="20" maxlength="8" <%=sfbfbmark%>>
%</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�շѽ��</font></td>
              <td colspan="3"><input type="text" name="zqsfje" size="20" maxlength="17"  value="<%=zqsfje%>" readonly>
                <strong><font color="#0000FF">�����޸�</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="hidden" name="wheresfxmbm"  value="<%=wheresfxmbm%>" >
            <tr> 
              <td colspan="4" align="center" > 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����">              </td>
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

function getSfxm(FormName)
{

	var str="Bj_sfxmmxCx.jsp?dqbm=<%=dqbm%>&sfxmbm="+FormName.sfxmbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getJe(FormName)
{
	if (FormName.sflx.value=='�̶����ɸģ�')
	{
		var zqsfje=0;
		zqsfje=FormName.dj.value*FormName.sl.value
		zqsfje=round(zqsfje,2);
		FormName.zqsfje.value=zqsfje;
	}
	else if (FormName.sflx.value=='�̶������ɸģ�')
	{
		var zqsfje=0;
		zqsfje=FormName.dj.value*FormName.sl.value
		zqsfje=round(zqsfje,2);
		FormName.zqsfje.value=zqsfje;
	}
	else{
		FormName.zqsfje.value="����¼�룬�Զ�����";
	}
}


function f_do(FormName)//����FormName:Form������
{
	getJe(FormName);

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("��ѡ��[�շ���Ŀ]��");
		FormName.sfxmbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") 
	{
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}

	if(!(isFloat(FormName.sl, "����"))) 
	{
		return false;
	}

	if(	javaTrim(FormName.sl)=="" || FormName.sl.value=='0') {
		alert("��¼��[����]��");
		FormName.sl.select();
		return false;
	}

	if (FormName.sflx.value=='�̶����ɸģ�')
	{
		if(	javaTrim(FormName.dj)=="") {
			alert("������[����]��");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "����"))) {
			return false;
		}

		if(	javaTrim(FormName.dj)=="" || FormName.dj.value=='0') {
			alert("��¼��[����]��");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="") {
			alert("������[�շѽ��]��");
			FormName.zqsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.zqsfje, "�շѽ��"))) {
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="" || FormName.zqsfje.value=='0') {
			alert("��¼��[�շѽ��]��");
			FormName.zqsfje.select();
			return false;
		}

		FormName.sfbfb.value="";
	}
	else if (FormName.sflx.value=='�̶������ɸģ�')
	{
		if(FormName.dj.value!=FormName.bzdj.value) 
		{
			alert("���󣡲����޸�[����]��");
			FormName.dj.value=FormName.bzdj.value;
			return false;
		}


		if(	javaTrim(FormName.dj)=="") {
			alert("������[����]��");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "����"))) {
			return false;
		}

		if(	javaTrim(FormName.dj)=="" || FormName.dj.value=='0') {
			alert("��¼��[����]��");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="") {
			alert("������[�շѽ��]��");
			FormName.zqsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.zqsfje, "�շѽ��"))) {
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="" || FormName.zqsfje.value=='0') {
			alert("��¼��[�շѽ��]��");
			FormName.zqsfje.select();
			return false;
		}

		FormName.sfbfb.value="";
	}
	else if (FormName.sflx.value=='����ֱ�ӷѰٷֱȣ��ɸģ�')
	{
		if(	javaTrim(FormName.sfbfb)=="") {
			alert("������[�շѰٷֱ�]��");
			FormName.sfbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.sfbfb, "�շѰٷֱ�"))) {
			return false;
		}

		FormName.dj.value="";
		FormName.zqsfje.value="";
	}
	else{
		FormName.dj.value="";
		FormName.zqsfje.value="";
		FormName.sfbfb.value="";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
