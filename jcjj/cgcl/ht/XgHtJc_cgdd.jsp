<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String qhtr=null;
String qhtsj=null;
String htbz=null;
String sdks =null;
String xtbc=null;
String cghs=null;
String tmpp=null;
String tmhs=null;
String blcz=null;
String jiaolian=null;
String kjxsj=null;
String jhazrq=null;
String dqpp=null;
String dqxh=null;

double gtbfje=0;
double tmbfje=0;
double wjhtze=0;
double dqhtze=0;
double htze=0;

double zqgtbfje=0;
double zqtmbfje=0;
double zqwjhtze=0;
double zqdqhtze=0;
double wdzje=0;

double cgzkl=0;
double tmzkl=0;
double wjzkl=0;
double dqzkl=0;
String dzyy=null;
String khbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select jc_cgdd.khbh,qhtr,qhtsj,htbz,gtbfje,tmbfje,wjhtze,dqhtze,htze,zqgtbfje,zqtmbfje,zqwjhtze,zqdqhtze,wdzje,sdks,xtbc,cghs,tmpp,tmhs,blcz,jiaolian,kjxsj,jhazrq";
	ls_sql+=" ,jc_cgdd.cgzkl,jc_cgdd.tmzkl,jc_cgdd.wjzkl,jc_cgdd.dqzkl,jc_cgdd.dzyy,jc_cgdd.dqpp,jc_cgdd.dqxh ";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		qhtr=cf.fillNull(rs.getString("qhtr"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		htbz=cf.fillNull(rs.getString("htbz"));
		gtbfje=rs.getDouble("gtbfje");
		tmbfje=rs.getDouble("tmbfje");
		wjhtze=rs.getDouble("wjhtze");
		dqhtze=rs.getDouble("dqhtze");
		htze=rs.getDouble("htze");
		zqgtbfje=rs.getDouble("zqgtbfje");
		zqtmbfje=rs.getDouble("zqtmbfje");
		zqwjhtze=rs.getDouble("zqwjhtze");
		zqdqhtze=rs.getDouble("zqdqhtze");
		wdzje=rs.getDouble("wdzje");
		sdks=cf.fillNull(rs.getString("sdks"));
		xtbc=cf.fillNull(rs.getString("xtbc"));
		cghs=cf.fillNull(rs.getString("cghs"));
		tmpp=cf.fillNull(rs.getString("tmpp"));
		tmhs=cf.fillNull(rs.getString("tmhs"));
		blcz=cf.fillNull(rs.getString("blcz"));
		jiaolian=cf.fillNull(rs.getString("jiaolian"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		dqpp=cf.fillNull(rs.getString("dqpp"));
		dqxh=cf.fillNull(rs.getString("dqxh"));

		cgzkl=rs.getDouble("cgzkl");
		tmzkl=rs.getDouble("tmzkl");
		wjzkl=rs.getDouble("wjzkl");
		dqzkl=rs.getDouble("dqzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();
	ps.close();


	String jjwjbz="";
	ls_sql="select crm_khxx.jjwjbz";
	ls_sql+=" from  crm_khxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
	}
	rs.close();
	ps.close();

	if (jjwjbz.equals("Y"))
	{
		out.println("���󣡿ͻ��Ҿ�����ᣬ������¼�붩��");
		return;
	}

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgzjx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		%>
		<BR>
		<div align="center"><font color="#FF0033"><b>���󣡱������ѷ�����������������޸�</b></font> 
		</div>
		<%
		return;
	}
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
<title>ǩ����ͬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">�޸ĺ�ͬ�������ţ�<%=ddbh%>����<font color="#0000FF"><b>ע�⣺<font color="#FF0000">*</font>�����</b></font>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>�����ʽ</td>
              <td width="30%"> 
              <input type="text" name="sdks" size="20" maxlength="50"  value="<%=sdks%>"  >              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font>������</td>
              <td width="30%"> 
              <input type="text" name="xtbc" size="20" maxlength="50"  value="<%=xtbc%>"  >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>����ɫ</td>
              <td width="30%"> 
              <input type="text" name="cghs" size="20" maxlength="50"  value="<%=cghs%>"  >              </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>̨��Ʒ��</td>
              <td width="30%"> 
              <input type="text" name="tmpp" size="20" maxlength="50"  value="<%=tmpp%>" >              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font>̨�滨ɫ</td>
              <td width="30%"> 
              <input type="text" name="tmhs" size="20" maxlength="50"  value="<%=tmhs%>"  >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>����Ʒ��</td>
              <td><input type="text" name="dqpp" size="20" maxlength="50"  value="<%=dqpp%>" ></td>
              <td align="right"><font color="#FF0033">*</font>�����ͺ�</td>
              <td><input type="text" name="dqxh" size="20" maxlength="50"  value="<%=dqxh%>"  ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF">��������</td>
              <td width="30%"> 
              <input type="text" name="blcz" size="20" maxlength="50"  value="<%=blcz%>"  >              </td>
              <td width="20%" align="right">����</td>
              <td width="30%"> 
              <input type="text" name="jiaolian" size="20" maxlength="50"  value="<%=jiaolian%>"  >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="right" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�����ۿ���</td>
              <td><input type="text" name="cgzkl" size="8" maxlength="8" value="<%=cgzkl%>" onChange="f_jsjg(insertform)">
                  <b><font color="#0000FF">��>0��<=10��</font></b></td>
              <td align="right"><font color="#FF0000">*</font>̨���ۿ���</td>
              <td><input type="text" name="tmzkl" size="8" maxlength="8" value="<%=tmzkl%>" onChange="f_jsjg(insertform)">
                  <b><font color="#0000FF">��>0��<=10��</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">����ۿ���</font></td>
              <td><input type="text" name="wjzkl" size="8" maxlength="8" value="<%=wjzkl%>" readonly onChange="f_jsjg(insertform)">
                  <b><font color="#0000FF">��>0��<=10��</font></b></td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�����ۿ���</font></td>
              <td><input type="text" name="dqzkl" size="8" maxlength="8" value="<%=dqzkl%>" readonly onChange="f_jsjg(insertform)">
                  <b><font color="#0000FF">��>0��<=10��</font></b></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF">����ԭ��</td>
              <td colspan="3" bgcolor="#FFFFFF"><textarea name="dzyy" cols="71" rows="3"><%=dzyy%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font>�����ͬ���-��ǰ</td>
              <td><input type="text" name="zqgtbfje" size="20" maxlength="20"  value="<%=zqgtbfje%>" onChange="f_jsjg(insertform)" ></td>
              <td align="right"><font color="#FF0033">*</font><font color="#0000CC">�����ͬ���-�ۺ�</font></td>
              <td><input type="text" name="gtbfje" size="20" maxlength="20"  value="<%=gtbfje%>" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="20%" align="right"><font color="#FF0033">*</font>̨���ͬ���-��ǰ</td> 
              <td width="30%"><input type="text" name="zqtmbfje" size="20" maxlength="20"  value="<%=zqtmbfje%>"  onChange="f_jsjg(insertform)">              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font><font color="#0000CC">̨���ͬ���-�ۺ�</font></td>
              <td width="30%"> 
              <input type="text" name="tmbfje" size="20" maxlength="20"  value="<%=tmbfje%>"  readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="20%" align="right"><font color="#FF0033">*</font>����ͬ�ܶ�-��ǰ</td> 
              <td width="30%"><input type="text" name="zqwjhtze" size="20" maxlength="20"  value="<%=zqwjhtze%>" onChange="f_jsjg(insertform)" >              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font><font color="#0000CC">����ͬ�ܶ�-�ۺ�</font></td>
              <td width="30%"> 
              <input type="text" name="wjhtze" size="20" maxlength="20"  value="<%=wjhtze%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font>������ͬ�ܶ�-��ǰ</td>
              <td><input type="text" name="zqdqhtze" size="20" maxlength="20"  value="<%=zqdqhtze%>" onChange="f_jsjg(insertform)" ></td>
              <td align="right"><font color="#FF0033">*</font><font color="#0000CC">������ͬ�ܶ�-�ۺ�</font></td>
              <td><input type="text" name="dqhtze" size="20" maxlength="20"  value="<%=dqhtze%>" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font><font color="#0000CC">δ���۽��</font></td>
              <td width="30%"> 
              <input type="text" name="wdzje" size="20" maxlength="20"  value="<%=wdzje%>" readonly>              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font><font color="#0000CC">��ͬ�ܶ�</font></td>
              <td width="30%"> 
              <input type="text" name="htze" size="20" maxlength="20"  value="<%=htze%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>�ƻ���װ����</td>
              <td width="30%"> 
              <input type="text" name="jhazrq" size="20" maxlength="10"  value="<%=jhazrq%>"  ondblclick="JSCalendar(this)">              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font>�ɼ����ֹʱ��</td>
              <td width="30%"> 
              <input type="text" name="kjxsj" size="20" maxlength="10"  value="<%=kjxsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font><font color="#0000CC">ǩ��ͬ��</font></td>
              <td width="30%"> 
              <input type="text" name="qhtr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font>ǩ��ͬʱ��</td>
              <td width="30%"> 
              <input type="text" name="qhtsj" size="20" maxlength="10"  value="<%=qhtsj%>" onDblClick="JSCalendar(this)" onBlur="f_getrq(insertform)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ͬ��ע</td>
              <td colspan="3"> 
                <textarea name="htbz" cols="71" rows="3"><%=htbz%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="����">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="button" onClick="window.open('LoadData.jsp?ddbh=<%=ddbh%>')"  value="������ϸ">
                  <input type="button" onClick="window.open('/jcjj/cgdd/ViewJc_cgdtmx.jsp?ddbh=<%=ddbh%>')"  value="�鿴��ϸ" name="button">
                  <input type="button" onClick="window.open('DeleteLoadData.jsp?ddbh=<%=ddbh%>')"  value="ɾ����ϸ" name="scmx" >
                  <p> 
                    <input type="button"  value="¼�������ϸ" onClick="f_lrmm(insertform)" name="lrmm" disabled>
                    <input type="button"  value="�鿴������ϸ" onClick="f_ckmm(insertform)" name="ckmm" disabled>
                  </p>
                  <p> 
                    <input type="button"  value="¼�������ϸ" onClick="f_lrwj(insertform)" name="lrwj" disabled>
                    <input type="button"  value="�鿴�����ϸ" onClick="f_ckwj(insertform)" name="ckwj" disabled>
                  </p>
                  <p> 
                    <input type="button"  value="¼�������ϸ" onClick="f_lrbl(insertform)" name="lrbl" disabled>
                    <input type="button"  value="�鿴������ϸ" onClick="f_ckbl(insertform)" name="ckbl" disabled>
                  </p>
                </div>              </td>
            </tr>
          </table>

	  
	  </div>
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
function f_getrq(FormName)
{
	FormName.kjxsj.value=addDay(FormName.qhtsj.value,7);
}

function f_jsjg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgzkl)=="") {
		alert("������[�����ۿ���]��");
		FormName.cgzkl.focus();
		return false;
	}
	if(	javaTrim(FormName.tmzkl)=="") {
		alert("������[̨���ۿ���]��");
		FormName.tmzkl.focus();
		return false;
	}
	if(	javaTrim(FormName.wjzkl)=="") {
		alert("������[����ۿ���]��");
		FormName.wjzkl.focus();
		return false;
	}
	if(	javaTrim(FormName.dqzkl)=="") {
		alert("������[�����ۿ���]��");
		FormName.dqzkl.focus();
		return false;
	}

	var gtbfje=0;
	gtbfje=FormName.zqgtbfje.value*FormName.cgzkl.value/10;
	gtbfje=round(gtbfje,2);
	FormName.gtbfje.value=gtbfje;

	var tmbfje=0;
	tmbfje=FormName.zqtmbfje.value*FormName.tmzkl.value/10;
	tmbfje=round(tmbfje,2);
	FormName.tmbfje.value=tmbfje;

	var wjhtze=0;
	wjhtze=FormName.zqwjhtze.value*FormName.wjzkl.value/10;
	wjhtze=round(wjhtze,2);
	FormName.wjhtze.value=wjhtze;

	var dqhtze=0;
	dqhtze=FormName.zqdqhtze.value*FormName.dqzkl.value/10;
	dqhtze=round(dqhtze,2);
	FormName.dqhtze.value=dqhtze;

	var je=0;
	je=FormName.zqgtbfje.value*1.0+FormName.zqtmbfje.value*1.0+FormName.zqwjhtze.value*1.0+FormName.zqdqhtze.value*1.0;
	je=round(je,2);
	FormName.wdzje.value=je;

	je=0;
	je=FormName.gtbfje.value*1.0+FormName.tmbfje.value*1.0+FormName.wjhtze.value*1.0+FormName.dqhtze.value*1.0;
	je=round(je,2);
	FormName.htze.value=je;
}

function f_do(FormName)//����FormName:Form������
{
	f_getrq(FormName);
	f_jsjg(FormName);

	if(	javaTrim(FormName.sdks )=="") {
		alert("������[�����ʽ]��");
		FormName.sdks .focus();
		return false;
	}
	if(	javaTrim(FormName.xtbc )=="") {
		alert("������[������]��");
		FormName.xtbc .focus();
		return false;
	}
	if(	javaTrim(FormName.cghs )=="") {
		alert("������[����ɫ]��");
		FormName.cghs .focus();
		return false;
	}
	if(	javaTrim(FormName.tmpp )=="") {
		alert("������[̨��Ʒ��]��");
		FormName.tmpp .focus();
		return false;
	}
	if(	javaTrim(FormName.tmhs )=="") {
		alert("������[̨�滨ɫ]��");
		FormName.tmhs .focus();
		return false;
	}
	if(	javaTrim(FormName.dqpp )=="") {
		alert("������[����Ʒ��]��");
		FormName.dqpp .focus();
		return false;
	}
	if(	javaTrim(FormName.dqxh )=="") {
		alert("������[�����ͺ�]��");
		FormName.dqxh .focus();
		return false;
	}

	if(	javaTrim(FormName.cgzkl)=="") {
		alert("������[�����ۿ���]��");
		FormName.cgzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.cgzkl, "�����ۿ���"))) {
		return false;
	}
	if (FormName.cgzkl.value<=0 || FormName.cgzkl.value>10)
	{
		alert("����[�����ۿ���]Ӧ����0��10֮�䣡");
		FormName.cgzkl.select();
		return false;
	}

	if(	javaTrim(FormName.tmzkl)=="") {
		alert("������[̨���ۿ���]��");
		FormName.tmzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.tmzkl, "̨���ۿ���"))) {
		return false;
	}
	if (FormName.tmzkl.value<=0 || FormName.tmzkl.value>10)
	{
		alert("����[̨���ۿ���]Ӧ����0��10֮�䣡");
		FormName.tmzkl.select();
		return false;
	}

	if(	javaTrim(FormName.wjzkl)=="") {
		alert("������[����ۿ���]��");
		FormName.wjzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.wjzkl, "����ۿ���"))) {
		return false;
	}
	if (FormName.wjzkl.value<=0 || FormName.wjzkl.value>10)
	{
		alert("����[����ۿ���]Ӧ����0��10֮�䣡");
		FormName.wjzkl.select();
		return false;
	}

	if(	javaTrim(FormName.dqzkl)=="") {
		alert("������[�����ۿ���]��");
		FormName.dqzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.dqzkl, "�����ۿ���"))) {
		return false;
	}
	if (FormName.dqzkl.value<=0 || FormName.dqzkl.value>10)
	{
		alert("����[�����ۿ���]Ӧ����0��10֮�䣡");
		FormName.dqzkl.select();
		return false;
	}

	
	if (FormName.cgzkl.value!=10 || FormName.tmzkl.value!=10 || FormName.wjzkl.value!=10 || FormName.dqzkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("������[����ԭ��]��");
			FormName.dzyy.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.gtbfje)=="") {
		alert("������[���岿�ֽ��-�ۺ�]��");
		FormName.gtbfje.focus();
		return false;
	}
	if(!(isFloat(FormName.gtbfje, "���岿�ֽ��-�ۺ�"))) {
		return false;
	}
	if (parseFloat(FormName.gtbfje.value)==0)
	{
		alert("[���岿�ֽ��-�ۺ�]����Ϊ0��");
		FormName.gtbfje.select();
		return false;
	}

	if(	javaTrim(FormName.tmbfje)=="") {
		alert("������[̨���ͬ���-�ۺ�]��");
		FormName.tmbfje.focus();
		return false;
	}
	if(!(isFloat(FormName.tmbfje, "̨���ͬ���-�ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.wjhtze)=="") {
		alert("������[����ͬ�ܶ�-�ۺ�]��");
		FormName.wjhtze.focus();
		return false;
	}
	if(!(isFloat(FormName.wjhtze, "����ͬ�ܶ�-�ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.dqhtze)=="") {
		alert("������[������ͬ�ܶ�-�ۺ�]��");
		FormName.dqhtze.focus();
		return false;
	}
	if(!(isFloat(FormName.dqhtze, "������ͬ�ܶ�-�ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.htze)=="") {
		alert("������[��ͬ�ܶ�]��");
		FormName.htze.focus();
		return false;
	}
	if(!(isFloat(FormName.htze, "��ͬ�ܶ�"))) {
		return false;
	}
	if (parseFloat(FormName.htze.value)==0)
	{
		alert("[��ͬ�ܶ�]����Ϊ0��");
		FormName.htze.select();
		return false;
	}

	if(	javaTrim(FormName.zqgtbfje)=="") {
		alert("������[���岿�ֽ��-��ǰ]��");
		FormName.zqgtbfje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqgtbfje, "���岿�ֽ��-��ǰ"))) {
		return false;
	}
	if (parseFloat(FormName.zqgtbfje.value)==0)
	{
		alert("[���岿�ֽ��-��ǰ]����Ϊ0��");
		FormName.zqgtbfje.select();
		return false;
	}

	if(	javaTrim(FormName.zqtmbfje)=="") {
		alert("������[̨���ͬ���-��ǰ]��");
		FormName.zqtmbfje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqtmbfje, "̨���ͬ���-��ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zqwjhtze)=="") {
		alert("������[����ͬ�ܶ�-��ǰ]��");
		FormName.zqwjhtze.focus();
		return false;
	}
	if(!(isFloat(FormName.zqwjhtze, "����ͬ�ܶ�-��ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zqdqhtze)=="") {
		alert("������[������ͬ�ܶ�-��ǰ]��");
		FormName.zqdqhtze.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdqhtze, "������ͬ�ܶ�-��ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("������[δ���۽��]��");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "δ���۽��"))) {
		return false;
	}
	if (parseFloat(FormName.wdzje.value)<parseFloat(FormName.htze.value))
	{
		alert("[δ���۽��]����С��[��ͬ�ܶ�]��");
		FormName.htze.select();
		return false;
	}

	if(	javaTrim(FormName.jhazrq)=="") {
		alert("������[�ƻ���װ����]��");
		FormName.jhazrq.focus();
		return false;
	}

	if(!(isDatetime(FormName.jhazrq, "�ƻ���װ����"))) {
		return false;
	}

	if(	javaTrim(FormName.kjxsj)=="") {
		alert("������[�ɼ����ֹʱ��]��");
		FormName.kjxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kjxsj, "�ɼ����ֹʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qhtr)=="") {
		alert("������[ǩ��ͬ��]��");
		FormName.qhtr.focus();
		return false;
	}
	if(	javaTrim(FormName.qhtsj)=="") {
		alert("������[ǩ��ͬʱ��]��");
		FormName.qhtsj.focus();
		return false;
	}
		if(!(isDatetime(FormName.qhtsj, "ǩ��ͬʱ��"))) {
		return false;
	}

	FormName.action="SaveXgHtJc_cgdd.jsp";
	FormName.submit();
	return true;
}
function f_ckjg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="CkjgJc_cgdd.jsp";
	FormName.submit();
	return true;
}
function f_lrmm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgddmxMain.jsp";
	FormName.submit();
	return true;
}

function f_ckmm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgddmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrwj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_cgwjddmx.jsp";
	FormName.submit();
	return true;
}

function f_ckwj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgwjddmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrbl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_cgdqddmx.jsp";
	FormName.submit();
	return true;
}

function f_ckbl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgdqddmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
