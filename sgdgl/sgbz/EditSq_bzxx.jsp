<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
%>
<%

String bzmc=null;
String sgd=null;
String xb=null;
String dh=null;
String zz=null;
String sfzh=null;
String bz=null;
String sgdjbbm=null;
String grsl=null;
String tdbz=null;
double khmyd=0;
int zxzsgds=0;
int zdzsgds=0;
int mqzsgds=0;
double kjdzxz=0;
double kjdzdz=0;
String jjlxr=null;
String jjlxrdh=null;
String sfqldht=null;
String jjlxrdz=null;
int yygrsl=0;
int kygrsl=0;
String rzsj=null;
String lzsj=null;
String ssfgs=null;


String wherebzmc=cf.getParameter(request,"bzmc");
String wheresgd=request.getParameter("sgd");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select rzsj,lzsj,yygrsl,kygrsl,bzmc,sgd,xb,dh,zz,sfzh,bz,sgdjbbm,grsl,tdbz,sq_bzxx.khmyd,sq_bzxx.mqzsgds,sq_bzxx.zxzsgds,sq_bzxx.zdzsgds,sq_bzxx.kjdzxz,sq_bzxx.kjdzdz,jjlxr,jjlxrdh,sfqldht,jjlxrdz ";
	ls_sql+=" from  sq_bzxx";
	ls_sql+=" where  (bzmc='"+wherebzmc+"' and sgd='"+wheresgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		lzsj=cf.fillNull(rs.getDate("lzsj"));
		yygrsl=rs.getInt("yygrsl");
		kygrsl=rs.getInt("kygrsl");
		bzmc=cf.fillNull(rs.getString("bzmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		xb=cf.fillNull(rs.getString("xb"));
		dh=cf.fillNull(rs.getString("dh"));
		zz=cf.fillNull(rs.getString("zz"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		bz=cf.fillNull(rs.getString("bz"));
		sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		grsl=cf.fillNull(rs.getString("grsl"));
		tdbz=cf.fillNull(rs.getString("tdbz"));

		khmyd=rs.getDouble("khmyd");
		zxzsgds=rs.getInt("zxzsgds");
		zdzsgds=rs.getInt("zdzsgds");
		mqzsgds=rs.getInt("mqzsgds");
		kjdzxz=rs.getDouble("kjdzxz");
		kjdzdz=rs.getDouble("kjdzdz");
		jjlxr=cf.fillNull(rs.getString("jjlxr"));
		jjlxrdh=cf.fillNull(rs.getString("jjlxrdh"));
		sfqldht=cf.fillNull(rs.getString("sfqldht"));
		jjlxrdz=cf.fillNull(rs.getString("jjlxrdz"));
	}
	rs.close();
	ps.close();
	ls_sql="select ssfgs";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where  sgd='"+wheresgd+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditSq_bzxx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <div align="right"><font color="#FF0000">*</font>����ʩ����</div>              </td>
              <td width="32%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
<%
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sgdmc",sgd);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�೤����</td>
              <td width="32%"><input type="text" name="bzmc" size="20" maxlength="50"  value="<%=bzmc%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����</td>
              <td><select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm",sgdjbbm);
%>
              </select></td>
              <td align="right">��������</td>
              <td><input type="text" name="grsl" size="20" maxlength="50"  value="<%=grsl%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ù�������</td>
              <td><input name="yygrsl" type="text" value="<%=yygrsl%>" size="20" maxlength="50" ></td>
              <td align="right">���ù�������</td>
              <td><input name="kygrsl" type="text" value="<%=kygrsl%>" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC">�ͻ������</font></td>
              <td><%=khmyd%>%</td>
              <td align="right"><font color="#0000CC">Ŀǰ��ʩ������</font></td>
              <td><%=mqzsgds%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��С��ʩ������</td>
              <td><input type="text" name="zxzsgds" size="20" maxlength="50"  value="<%=zxzsgds%>" ></td>
              <td align="right">�����ʩ������</td>
              <td><input type="text" name="zdzsgds" size="20" maxlength="50"  value="<%=zdzsgds%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ɽӵ���Сֵ</td>
              <td><input type="text" name="kjdzxz" size="20" maxlength="50"  value="<%=kjdzxz%>" ></td>
              <td align="right">�ɽӵ����ֵ</td>
              <td><input type="text" name="kjdzdz" size="20" maxlength="50"  value="<%=kjdzdz%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>״̬</td>
              <td><%
	cf.radioToken(out, "tdbz","Y+ͣ��&N+����&K+����&L+��ְ",tdbz);
%></td>
              <td align="right">�Ա�</td>
              <td><%
	cf.radioToken(out, "xb","M+��&W+Ů",xb);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ְʱ��</td>
              <td><input name="rzsj" type="text" ondblclick="JSCalendar(this)" value="<%=rzsj%>" size="20" maxlength="10"></td>
              <td align="right">��ְʱ��</td>
              <td><input name="lzsj" type="text" ondblclick="JSCalendar(this)" value="<%=lzsj%>" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�绰</td>
              <td colspan="3"><input type="text" name="dh" size="73" maxlength="50"  value="<%=dh%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">סַ</td>
              <td colspan="3"><input type="text" name="zz" size="73" maxlength="100"  value="<%=zz%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������ϵ��</td>
              <td><input type="text" name="jjlxr" value="<%=jjlxr%>" size="20" maxlength="20" >              </td>
              <td align="right">��ϵ�˵绰</td>
              <td><input type="text" name="jjlxrdh" value="<%=jjlxrdh%>" size="20" maxlength="50" >              </td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">������ϵ�˵�ַ</td>
              <td colspan="3" bgcolor="#FFFFFF"><input name="jjlxrdz" type="text"  value="<%=jjlxrdz%>" size="72" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���֤��</td>
              <td width="32%"><input type="text" name="sfzh" size="20" maxlength="18"  value="<%=sfzh%>" ></td>
              <td width="18%" align="right">�Ƿ�ǩ�Ͷ���ͬ</td>
              <td width="32%"><%
					cf.radioToken(out, "sfqldht","Y+��&N+��",sfqldht);
			  %></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="wherebzmc"  value="<%=wherebzmc%>" >
            <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>              </td>
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[����ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.bzmc)=="") {
		alert("������[�೤����]��");
		FormName.bzmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.tdbz)) {
		alert("��ѡ��[״̬]��");
		FormName.tdbz[0].focus();
		return false;
	}

	if(!(isNumber(FormName.grsl, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.yygrsl, "���ù�������"))) {
		return false;
	}
	if(!(isNumber(FormName.kygrsl, "���ù�������"))) {
		return false;
	}

	if(!(isNumber(FormName.zxzsgds, "��С��ʩ������"))) {
		return false;
	}

	if(!(isNumber(FormName.zdzsgds, "�����ʩ������"))) {
		return false;
	}

	if(!(isFloat(FormName.kjdzxz, "�ɽӵ���Сֵ"))) {
		return false;
	}

	if(!(isFloat(FormName.kjdzdz, "�ɽӵ����ֵ"))) {
		return false;
	}

	if(!(isDatetime(FormName.rzsj, "��ְʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzsj, "��ְʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.dh)=="") {
		alert("������[�绰]��");
		FormName.dh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
