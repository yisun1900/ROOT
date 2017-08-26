<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xqmc=null;
String yjfy=null;
String yjcc=null;
String sjfy=null;
String sjcc=null;
String spjl=null;
String spr=null;
String spsj=null;
String spyj=null;
String lrr=null;
String lrsj=null;
String fgsbh=null;
String bz=null;
String scbfzr=null;
String scbfzrdh=null;
String scbzrs=null;
String scbsffz=null;
String gjjzgwrs=null;
String ryydl=null;
String kfql=null;
String kfxs=null;
String wherexqmc=cf.getParameter(request,"xqmc");
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));


String dqbm=null;
String cqbm=null;
String dz=null;
String jw=null;
String xz=null;
String wyxs=null;
String zlhx=null;
String zlhxmj=null;
String lxsj=null;
String fyssj=null;
String jfhs=null;
String xqfzr=null;
String xqfzrdh=null;
String kfs=null;
String kfslxr=null;
String kfslxrzw=null;
String kfslxrdh=null;
String wygsmc=null;
String wydh=null;
String wylxr=null;
String wylxrzw=null;

String dwdz=null;
String dwdh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yjfy,yjcc,sjfy,sjcc,spjl,spr,spsj,spyj,lrr,lrsj,fgsbh,bz,scbfzr,scbfzrdh,scbzrs,scbsffz,gjjzgwrs,ryydl,kfql,kfxs ";
	ls_sql+=" from  yx_xqcxhdgl";
	ls_sql+=" where  (xqmc='"+wherexqmc+"') and  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yjfy=cf.fillNull(rs.getString("yjfy"));
		yjcc=cf.fillNull(rs.getString("yjcc"));
		sjfy=cf.fillNull(rs.getString("sjfy"));
		sjcc=cf.fillNull(rs.getString("sjcc"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bz=cf.fillNull(rs.getString("bz"));
		scbfzr=cf.fillNull(rs.getString("scbfzr"));
		scbfzrdh=cf.fillNull(rs.getString("scbfzrdh"));
		scbzrs=cf.fillNull(rs.getString("scbzrs"));
		scbsffz=cf.fillNull(rs.getString("scbsffz"));
		gjjzgwrs=cf.fillNull(rs.getString("gjjzgwrs"));
		ryydl=cf.fillNull(rs.getString("ryydl"));
		kfql=cf.fillNull(rs.getString("kfql"));
		kfxs=cf.fillNull(rs.getString("kfxs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dwdz,dwdh,dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwdz=cf.fillNull(rs.getString("dwdz"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select xqmc,cqbm,dz,jw,xz,wyxs,zlhx,zlhxmj,lxsj,fyssj,jfhs,xqfzr,xqfzrdh,kfs,kfslxr,kfslxrzw,kfslxrdh,wygsmc,wydh,wylxr,wylxrzw ";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where  (dqbm='"+dqbm+"') and  (xqmc='"+wherexqmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xqmc=cf.fillNull(rs.getString("xqmc"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		dz=cf.fillNull(rs.getString("dz"));
		jw=cf.fillNull(rs.getString("jw"));
		xz=cf.fillNull(rs.getString("xz"));
		wyxs=cf.fillNull(rs.getString("wyxs"));
		zlhx=cf.fillNull(rs.getString("zlhx"));
		zlhxmj=cf.fillNull(rs.getString("zlhxmj"));
		lxsj=cf.fillNull(rs.getDate("lxsj"));
		fyssj=cf.fillNull(rs.getDate("fyssj"));
		jfhs=cf.fillNull(rs.getString("jfhs"));
		xqfzr=cf.fillNull(rs.getString("xqfzr"));
		xqfzrdh=cf.fillNull(rs.getString("xqfzrdh"));
		kfs=cf.fillNull(rs.getString("kfs"));
		kfslxr=cf.fillNull(rs.getString("kfslxr"));
		kfslxrzw=cf.fillNull(rs.getString("kfslxrzw"));
		kfslxrdh=cf.fillNull(rs.getString("kfslxrdh"));
		wygsmc=cf.fillNull(rs.getString("wygsmc"));
		wydh=cf.fillNull(rs.getString("wydh"));
		wylxr=cf.fillNull(rs.getString("wylxr"));
		wylxrzw=cf.fillNull(rs.getString("wylxrzw"));
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditYx_xqcxhdgl.jsp" name="editform">
<div align="center">�޸Ļ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">С������</td>
      <td width="33%"><%=xqmc%></td>
      <td align="right" width="18%">��ַ</td>
      <td width="32%"><%=dz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">������</td>
      <td width="33%"><%=kfs%></td>
      <td align="right" width="18%">�绰</td>
      <td width="32%"><%=kfslxrdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��������ϵ��</td>
      <td width="33%"><%=kfslxr%> </td>
      <td align="right" width="18%">��������ϵ��ְ��</td>
      <td width="32%"><%=kfslxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ҵ��˾����</td>
      <td colspan="3"><%=wygsmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ҵ��ϵ��</td>
      <td width="33%"><%=wylxr%> </td>
      <td align="right" width="18%">��ҵ��ϵ��ְ��</td>
      <td width="32%"><%=wylxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ҵ�绰</td>
      <td width="33%"><%=wydh%> </td>
      <td align="right" width="18%">����ʱ��</td>
      <td width="32%"><%=lxsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��Կ��ʱ��</td>
      <td width="33%"><%=fyssj%> </td>
      <td align="right" width="18%">��������</td>
      <td width="32%"><%=jfhs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��������</td>
      <td width="33%"><%=zlhx%> </td>
      <td align="right" width="18%">�����������</td>
      <td width="32%"><%=zlhxmj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ҵ��ʽ</td>
      <td width="33%"><%=wyxs%> </td>
      <td align="right" width="18%">��λ</td>
      <td width="32%"><%=jw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">С��������</td>
      <td width="33%"><%=xqfzr%> </td>
      <td align="right" width="18%">С�������˵绰</td>
      <td width="32%"><%=xqfzrdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">¥������</td>
      <td width="33%"><%=xz%> </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��˾</td>
      <td width="33%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ַ</td>
      <td width="33%"><%=dwdz%></td>
      <td align="right" width="18%">�绰</td>
      <td width="32%"><%=dwdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�г���������</td>
      <td width="33%"> 
        <input type="text" name="scbfzr" size="20" maxlength="20"  value="<%=scbfzr%>" >
      </td>
      <td align="right" width="18%">�г��������˵绰</td>
      <td width="32%"> 
        <input type="text" name="scbfzrdh" size="20" maxlength="20"  value="<%=scbfzrdh%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�г���������</td>
      <td width="33%"> 
        <input type="text" name="scbzrs" size="20" maxlength="8"  value="<%=scbzrs%>" >
      </td>
      <td align="right" width="18%">�г����Ƿ����</td>
      <td width="32%"><%
	cf.radioToken(out, "scbsffz","N+δ����&Y+����",scbsffz);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�߼���װ��������</td>
      <td width="33%"> 
        <input type="text" name="gjjzgwrs" size="20" maxlength="8"  value="<%=gjjzgwrs%>" >
      </td>
      <td align="right" width="18%">��Ա�춯��</td>
      <td width="32%"> 
        <input type="text" name="ryydl" size="20" maxlength="9"  value="<%=ryydl%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">Ԥ�Ʒ���</td>
      <td width="33%"> 
        <input type="text" name="yjfy" size="20" maxlength="16"  value="<%=yjfy%>" >
      </td>
      <td align="right" width="18%">Ԥ�Ʋ���</td>
      <td width="32%"> 
        <input type="text" name="yjcc" size="20" maxlength="16"  value="<%=yjcc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">����Ǳ��</td>
      <td width="33%"> 
<%
	cf.radioToken(out, "kfql","A+A&B+B&C+C",kfql);
%>
      </td>
      <td align="right" width="18%">������ʽ</td>
      <td width="32%"> 
        <input type="text" name="kfxs" size="20" maxlength="20"  value="<%=kfxs%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">¼����</td>
      <td width="33%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="18%">¼��ʱ��</td>
      <td width="32%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wherexqmc"  value="<%=wherexqmc%>" >
    <input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yjfy)=="") {
		alert("������[Ԥ�Ʒ���]��");
		FormName.yjfy.focus();
		return false;
	}
	if(!(isNumber(FormName.yjfy, "Ԥ�Ʒ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yjcc)=="") {
		alert("������[Ԥ�Ʋ���]��");
		FormName.yjcc.focus();
		return false;
	}
	if(!(isNumber(FormName.yjcc, "Ԥ�Ʋ���"))) {
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[��˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isNumber(FormName.scbzrs, "�г���������"))) {
		return false;
	}
	if(!(isNumber(FormName.gjjzgwrs, "�߼���װ��������"))) {
		return false;
	}
	if(!(isFloat(FormName.ryydl, "��Ա�춯��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
