<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");

String hflxbm=null;
String khbh=null;

String sjfa=null;
String hqfw=null;
String jdqk=null;

String zjyfw=null;
String zjydw=null;
String zjyjz=null;

String fwsz=null;
String sgzl=null;
String grsz=null;

String sjshfnr=null;
String zjyhfnr=null;
String sgdhfnr=null;
String sfjxhf=null;
String xchfrq=null;
String xchflxbm=null;
String clfs=null;
String jglxbm=null;
String bz=null;
String wherehfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
String ssfgs=null;
String dwbh=null;

String jcjjsjs=null;
String jsjjgw=null;
String jcxmzy=null;
String jcshaz=null;
String jccpzl=null;
String jchfnr=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select bz,jglxbm,hflxbm,khbh,sjfa,hqfw,jdqk,zjyfw,zjydw,zjyjz,fwsz,sgzl,grsz,sjshfnr,zjyhfnr,sgdhfnr,sfjxhf,xchfrq,xchflxbm,clfs,jcjjsjs,jsjjgw,jcxmzy,jcshaz,jccpzl,jchfnr ";
	ls_sql+=" from  crm_hfjl";
	ls_sql+=" where  (hfjlh="+wherehfjlh+")  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bz=cf.fillNull(rs.getString("bz"));
		jglxbm=cf.fillNull(rs.getString("jglxbm"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjfa=cf.fillNull(rs.getString("sjfa"));
		hqfw=cf.fillNull(rs.getString("hqfw"));
		jdqk=cf.fillNull(rs.getString("jdqk"));
		zjyfw=cf.fillNull(rs.getString("zjyfw"));
		zjydw=cf.fillNull(rs.getString("zjydw"));
		zjyjz=cf.fillNull(rs.getString("zjyjz"));
		fwsz=cf.fillNull(rs.getString("fwsz"));
		sgzl=cf.fillNull(rs.getString("sgzl"));
		grsz=cf.fillNull(rs.getString("grsz"));
		sjshfnr=cf.fillNull(rs.getString("sjshfnr"));
		zjyhfnr=cf.fillNull(rs.getString("zjyhfnr"));
		sgdhfnr=cf.fillNull(rs.getString("sgdhfnr"));
		sfjxhf=cf.fillNull(rs.getString("sfjxhf"));
		xchfrq=cf.fillNull(rs.getDate("xchfrq"));
		xchflxbm=cf.fillNull(rs.getString("xchflxbm"));
		clfs=cf.fillNull(rs.getString("clfs"));

		jcjjsjs=cf.fillNull(rs.getString("jcjjsjs"));
		jsjjgw=cf.fillNull(rs.getString("jsjjgw"));
		jcxmzy=cf.fillNull(rs.getString("jcxmzy"));
		jcshaz=cf.fillNull(rs.getString("jcshaz"));
		jccpzl=cf.fillNull(rs.getString("jccpzl"));
		jchfnr=cf.fillNull(rs.getString("jchfnr"));

	}

	//������λ
	ls_sql="select fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString(1);
	}
	rs.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

String khxm=cf.executeQuery("select khxm from crm_khxx where khbh='"+khbh+"'");

%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center"><b>��<%=khxm%>��</b>�绰�طã��طü�¼�ţ�<%=wherehfjlh%>��</div>

<table width="100%">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="SaveEditCrm_hfjl.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">���ʦ</td>
              <td width="37%" bgcolor="#FFFFCC">��Ʒ���<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sjfa",sjfa);
%><br>
                ���ڷ���<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","hqfw",hqfw);
%><br>
                �������<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jdqk",jdqk);
%></td>
              <td width="14%" align="right">���ʦ�ط�����</td>
              <td width="36%"> 
                <textarea name="sjshfnr" rows="3" cols="33"><%=sjshfnr%></textarea>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="13%" align="right">���̵���</td>
              <td width="37%">����<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyfw",zjyfw);
%><br>
                ��λ<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjydw",zjydw);
%><br>
                ����<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyjz",zjyjz);
%></td>
              <td width="14%" align="right">���̵����ط�����</td>
              <td width="36%"> 
                <textarea name="zjyhfnr" rows="3" cols="33"><%=zjyhfnr%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">ʩ����</td>
              <td width="37%">��������<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","fwsz",fwsz);
%><br>
                ʩ������<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sgzl",sgzl);
%><br>
                ��������<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","grsz",grsz);
%></td>
              <td width="14%" align="right">ʩ���ӻط�����</td>
              <td width="36%"> 
                <textarea name="sgdhfnr" rows="3" cols="33"><%=sgdhfnr%></textarea>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="13%" align="right" bgcolor="#E8E8FF">���ɼҾ�</td>
              <td width="37%"> �Ҿ����ʦ <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcjjsjs",jcjjsjs);
%> <br>
                �Ҿӹ��ʣ� <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jsjjgw",jsjjgw);
%> <br>
                ��ĿרԱ�� <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcxmzy",jcxmzy);
%> <br>
                �ͻ���װ�� <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcshaz",jcshaz);
%> <br>
                ��Ʒ������ <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jccpzl",jccpzl);
%> </td>
              <td width="14%" align="right">���ɼҾӻط�����</td>
              <td width="36%"> 
                <textarea name="jchfnr" rows="5" cols="33"><%=jchfnr%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="13%" align="right">��ע</td>
              <td colspan="3"> 
                <input type="text" name="bz" maxlength="100" size="89" value="<%=bz%>">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="13%" align="right"><font color="#FF0000">*</font>���λط�����</td>
              <td width="37%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' and hflxbm='"+hflxbm+"'",hflxbm);
%> 
                </select>
                <input type="hidden" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
                <input type="hidden" name="wherehfjlh"  value="<%=wherehfjlh%>" >              </td>
              <td width="14%" align="right">&nbsp;</td>
              <td width="36%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="13%" align="right"><font color="#FF0000">*</font>�طý��</td>
              <td width="37%"> 
                <select name="jglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select jglxbm,jglxmc from dm_jglxbm order by jglxbm",jglxbm);
%> 
                </select>              </td>
              <td width="14%" rowspan="5" align="right" bgcolor="#E8E8FF"> 
                ��������</td>
              <td rowspan="5" bgcolor="#E8E8FF" width="36%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:252PX" size="9" multiple>
                  <option value=""></option>
                  <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.mutilSelectItem(out,sql,"select dwbh from crm_gchffkbm where hfjlh="+wherehfjlh);

%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="13%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>����ʽ</td>
              <td width="37%" bgcolor="#E8E8FF"> 
                <select name="clfs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f2(insertform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+���账��&1+������ز���",clfs);
%> 
                </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="13%" align="right"><font color="#FF0000">*</font>�����´λط�ʱ��</td>
              <td width="37%">
				<input type="radio" name="sfjxhf"  value="Y" <% if(sfjxhf.equals("Y")) out.print("checked");%> onClick="f1(insertform)">
				���� 
				<input type="radio" name="sfjxhf"  value="N" <% if(sfjxhf.equals("N")) out.print("checked");%> onClick="f1(insertform)">
				������ 
				<input type="radio" name="sfjxhf"  value="F" <% if(sfjxhf.equals("F")) out.print("checked");%> onClick="f1(insertform)">
				���»ط�
			</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="13%" align="right">�´λط�����</td>
              <td width="37%"> 
                <select name="xchflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hflxbm='"+xchflxbm+"'",xchflxbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="13%" align="right">�´λط�����</td>
              <td width="37%" bgcolor="#FFFFFF"> 
                <input type="text" name="xchfrq" size="20" maxlength="10"  value="<%=xchfrq%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr> 
              <td width="13%" height="2">&nbsp;</td>
              <td width="37%" height="2" align="right"><input name="button" type="button" onClick="f_do(insertform)"  value="����"></td>
              <td width="14%" height="2">&nbsp;</td>
              <td width="36%" height="2"> 
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//����Ajax
	cf.ajax(out);
%>

function f1(FormName)//����FormName:Form������
{
	if (FormName.sfjxhf[0].checked)
	{
		FormName.xchflxbm.length=1;
		FormName.xchflxbm.options[0].value="";
		FormName.xchflxbm.options[0].text="";

		var actionStr="/gcgl/hfjl/InsertCx.jsp?ssfgs=<%=ssfgs%>";

//		window.open(actionStr);
		openAjax(actionStr);
	}
	else if (FormName.sfjxhf[1].checked)
	{
		FormName.xchflxbm.length=1;
		FormName.xchflxbm.options[0].value="";
		FormName.xchflxbm.options[0].text="";

		FormName.xchfrq.value='';
	}
	else if (FormName.sfjxhf[2].checked)
	{
		FormName.xchflxbm.length=1;
		FormName.xchflxbm.options[0].value=FormName.hflxbm.options[0].value;
		FormName.xchflxbm.options[0].text=FormName.hflxbm.options[0].text;
	}
}

function getAjax(ajaxRetStr) 
{
	var value1=getStrValue(ajaxRetStr,1);
	strToSelect(insertform.xchflxbm,value1);
}

function f2(FormName)//����FormName:Form������
{
	if (FormName.clfs.value=='0')
	{
		notAll(FormName.dwbh);
	}
}

function f_do(FormName)//����FormName:Form������
{
	f2(FormName);

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("��ѡ��[���λط�����]��");
		FormName.hflxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jglxbm)=="") {
		alert("��ѡ��[�طý��]��");
		FormName.jglxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.clfs)=="") {
		alert("��ѡ��[����ʽ]��");
		FormName.clfs.focus();
		return false;
	}
	if (FormName.clfs.value=='1')
	{
		if (!selectChecked(FormName.dwbh)){
			alert("��ѡ��[��������]��");
			FormName.dwbh.focus();
			return false;
		}
	}

	
	if(	!radioChecked(FormName.sfjxhf)) {
		alert("��ѡ��[�����´λط�ʱ��]��");
		FormName.sfjxhf[0].focus();
		return false;
	}

	if (FormName.sfjxhf[0].checked || FormName.sfjxhf[2].checked)
	{
		if(	javaTrim(FormName.xchflxbm)=="") {
			alert("��ѡ��[�´λط�����]��");
			FormName.xchflxbm.focus();
			return false;
		}

		if(	javaTrim(FormName.xchfrq)=="") {
			alert("��ѡ��[�´λط�����]��");
			FormName.xchfrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.xchfrq, "�´λط�����"))) {
			return false;
		}
	}
	

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
