<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

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
String bz=null;
String zbj=null;
String tdbz=null;
String tdkssj=null;
String tdzzsj=null;
String bzs=null;
String cxbz=null;
String jjlxr=null;
String lxrdh=null;
String sfzhm=null;
String hjszd=null;
String ssfgs=null;
String dqbm=null;
String duihao=null;
String sgdjbbm=null;
String jcf=null;
String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select jcf,duihao,sgdjbbm,dqbm,ssfgs,dwbh,dwmc,dwjc,ssdw,dwlx,dwdz,dwfzr,dwdh,dwcz,email,bz,zbj,tdbz,tdkssj,tdzzsj,bzs,cxbz,jjlxr,lxrdh,sfzhm,hjszd";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where  (dwbh='"+wheredwbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jcf=cf.fillNull(rs.getString("jcf"));
		duihao=cf.fillNull(rs.getString("duihao"));
		sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
		zbj=cf.fillNull(rs.getString("zbj"));
		tdbz=cf.fillNull(rs.getString("tdbz"));
		tdkssj=cf.fillNull(rs.getDate("tdkssj"));
		tdzzsj=cf.fillNull(rs.getDate("tdzzsj"));
		bzs=cf.fillNull(rs.getString("bzs"));
		cxbz=cf.fillNull(rs.getString("cxbz"));
		hjszd=cf.fillNull(rs.getString("hjszd"));
		jjlxr=cf.fillNull(rs.getString("jjlxr"));
		lxrdh=cf.fillNull(rs.getString("lxrdh"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
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
		if (stmt != null) stmt.close(); 
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

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">ʩ���ӱ��</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="dwbh" size="20" maxlength="5"  value="<%=dwbh%>" readonly>
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">ʩ��������</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"S0+ʩ����&S1+ֱ��ʩ����",dwlx);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">ʩ��������</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="dwmc" size="20" maxlength="100"  value="<%=dwmc%>" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">��������</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF">�����ֹ�˾</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') order by dwbh",ssfgs);
%> 
                </select>
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">�ϼ���λ</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",ssdw);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF">ʩ���ӵ绰</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="dwdh" size="71" maxlength="50"  value="<%=dwdh%>" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF">�ӳ���ͥ��ַ</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="dwdz" size="71" maxlength="100"  value="<%=dwdz%>" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">�������ڵ�</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="hjszd" value="<%=hjszd%>" size="72" maxlength="50" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">������ϵ��</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="jjlxr" value="<%=jjlxr%>" size="20" maxlength="20" >
              </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">��ϵ�˵绰</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="lxrdh" value="<%=lxrdh%>" size="20" maxlength="50" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF" align="right">��Ŀ�������֤��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="sfzhm" value="<%=sfzhm%>" size="20" maxlength="20" >
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">��Ŀ������</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="dwcz" size="20" maxlength="20"  value="<%=dwcz%>" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF">�Ӻ�</td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <input type="text" name="duihao" value="<%=duihao%>" size="20" maxlength="20" >
              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF">����</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm",sgdjbbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">�ʱ���</td>
              <td width="35%"> 
                <input type="text" name="zbj" size="20" maxlength="10"  value="<%=zbj%>" >
              </td>
              <td width="15%" align="right">������</td>
              <td width="35%"> 
                <input type="text" name="bzs" size="20" maxlength="10"  value="<%=bzs%>" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">����������</td>
              <td width="35%"> 
                <input type="text" name="jcf" size="20" maxlength="10"  value="<%=jcf%>" >
              </td>
              <td width="15%" align="right">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">ͣ����־</td>
              <td width="35%"> 
                <select name="tdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"N+��ͣ��&Y+ͣ��",tdbz);
%> 
                </select>
              </td>
              <td width="15%" align="right">������־</td>
              <td width="35%"> 
                <select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"Y+�ѳ���&N+δ����",cxbz);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">ͣ����ʼʱ��</td>
              <td width="35%"> 
                <input type="text" name="tdkssj" size="20" maxlength="10"  value="<%=tdkssj%>" >
              </td>
              <td width="15%" align="right">ͣ����ֹʱ��</td>
              <td width="35%"> 
                <input type="text" name="tdzzsj" size="20" maxlength="10"  value="<%=tdzzsj%>" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <p> 
                    <input type="button"  value="����" onClick="f_do(editform)">
                    <input type="reset"  value="����">
                  </p>
                </div>
              </td>
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[ʩ���ӱ��]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwmc)=="") {
		alert("������[ʩ��������]��");
		FormName.dwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdw)=="") {
		alert("��ѡ��[����ʩ����]��");
		FormName.ssdw.focus();
		return false;
	}
	if(	javaTrim(FormName.dwlx)=="") {
		alert("��ѡ��[ʩ��������]��");
		FormName.dwlx.focus();
		return false;
	}
	if(	javaTrim(FormName.zbj)=="") {
		alert("��ѡ��[�ʱ���]��");
		FormName.zbj.focus();
		return false;
	}
	if(!(isNumber(FormName.zbj, "�ʱ���"))) {
		return false;
	}
	if(!(isNumber(FormName.jcf, "����������"))) {
		return false;
	}
	if(	javaTrim(FormName.bzs)=="") {
		alert("��ѡ��[������]��");
		FormName.bzs.focus();
		return false;
	}
	if(!(isNumber(FormName.bzs, "������"))) {
		return false;
	}

	if (FormName.tdbz.value=="Y")
	{
		if(	javaTrim(FormName.tdkssj)=="") {
			alert("������[ͣ����ʼʱ��]��");
			FormName.tdkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.tdkssj, "ͣ����ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.tdzzsj)=="") {
			alert("������[ͣ����ֹʱ��]��");
			FormName.tdzzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.tdzzsj, "ͣ����ֹʱ��"))) {
			return false;
		}
	}
	else{
		FormName.tdkssj.value="";
		FormName.tdzzsj.value="";
	}

	FormName.action="SaveEditSgdSq_dwxx.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
