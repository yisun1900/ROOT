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
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");

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
String spzt=null;
String scbfzr=null;
String scbfzrdh=null;
String scbzrs=null;
String scbsffz=null;
String gjjzgwrs=null;
String ryydl=null;
String kfql=null;
String fasfwc=null;
String kfxs=null;

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


String xqbh=cf.getParameter(request,"xqbh");
String xqhdmc=cf.getParameter(request,"xqhdmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select xqmc,yjfy,yjcc,sjfy,sjcc,spjl,spr,spsj,spyj,lrr,lrsj,fgsbh,bz,spzt,scbfzr,scbfzrdh,scbzrs,scbsffz,gjjzgwrs,ryydl,kfql,fasfwc,kfxs ";
	ls_sql+=" from  yx_xqcxhdgl";
	ls_sql+=" where  (xqbh='"+xqbh+"') and  (xqhdmc='"+xqhdmc+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xqmc=cf.fillNull(rs.getString("xqmc"));
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
		spzt=cf.fillNull(rs.getString("spzt"));
		scbfzr=cf.fillNull(rs.getString("scbfzr"));
		scbfzrdh=cf.fillNull(rs.getString("scbfzrdh"));
		scbzrs=cf.fillNull(rs.getString("scbzrs"));
		scbsffz=cf.fillNull(rs.getString("scbsffz"));
		gjjzgwrs=cf.fillNull(rs.getString("gjjzgwrs"));
		ryydl=cf.fillNull(rs.getString("ryydl"));
		kfql=cf.fillNull(rs.getString("kfql"));
		fasfwc=cf.fillNull(rs.getString("fasfwc"));
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
	ls_sql+=" where  (dqbm='"+dqbm+"') and  (xqbh='"+xqbh+"')  ";
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

<body bgcolor="#FFFFFF">
  <div align="center">¼��С�������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="8" align="center"><b>�������</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">��˾</td>
      <td width="14%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%> </td>
      <td align="right" width="12%">��ַ</td>
      <td colspan="3"><%=dwdz%></td>
      <td width="11%" align="right">�绰</td>
      <td width="14%"><%=dwdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">�г���������</td>
      <td width="14%"><%=scbfzr%></td>
      <td align="right" width="12%">�绰</td>
      <td colspan="3"><%=scbfzrdh%></td>
      <td width="11%" align="right">&nbsp;</td>
      <td width="14%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">�г���������</td>
      <td width="14%"><%=scbzrs%> </td>
      <td align="right" width="12%">�г����Ƿ����</td>
      <td width="13%"><%
	cf.radioToken(out, "N+δ����&Y+����",scbsffz,true);
%></td>
      <td width="12%" align="right">�߼���װ��������</td>
      <td width="13%"><%=gjjzgwrs%></td>
      <td width="11%" align="right">��Ա�춯��</td>
      <td width="14%"><%=ryydl%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">С������</td>
      <td colspan="2"><%=xqmc%> </td>
      <td align="right" width="13%">��ַ</td>
      <td colspan="2"><%=dz%></td>
      <td width="11%" align="right">����ʱ��</td>
      <td width="14%"><%=lxsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">������</td>
      <td width="14%"><%=kfs%></td>
      <td align="right" width="12%">��������ϵ��</td>
      <td width="13%"><%=kfslxr%></td>
      <td width="12%" align="right">��������ϵ��ְ��</td>
      <td width="13%"><%=kfslxrzw%></td>
      <td width="11%" align="right">�绰</td>
      <td width="14%"><%=kfslxrdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">��ҵ��˾����</td>
      <td width="14%"><%=wygsmc%> </td>
      <td align="right" width="12%">��ҵ��ϵ��</td>
      <td width="13%"><%=wylxr%></td>
      <td width="12%" align="right">��ҵ��ϵ��ְ��</td>
      <td width="13%"><%=wylxrzw%></td>
      <td width="11%" align="right">��ҵ�绰</td>
      <td width="14%"><%=wydh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">��Կ��ʱ��</td>
      <td width="14%"><%=fyssj%> </td>
      <td align="right" width="12%">��������</td>
      <td width="13%"><%=jfhs%></td>
      <td width="12%" align="right">��������</td>
      <td width="13%"><%=zlhx%></td>
      <td width="11%" align="right">�����������</td>
      <td width="14%"><%=zlhxmj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">��ҵ��ʽ</td>
      <td width="14%"><%=wyxs%> </td>
      <td align="right" width="12%">��λ</td>
      <td width="13%"><%=jw%></td>
      <td width="12%" align="right">С��������</td>
      <td width="13%"><%=xqfzr%></td>
      <td width="11%" align="right">С�������˵绰</td>
      <td width="14%"><%=xqfzrdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">¥������</td>
      <td width="14%"><%=xz%> </td>
      <td align="right" width="12%">����Ǳ��</td>
      <td width="13%"><%=kfql%></td>
      <td width="12%" align="right">������ʽ</td>
      <td width="13%"><%=kfxs%></td>
      <td width="11%">&nbsp;</td>
      <td width="14%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">Ԥ�Ʒ���</td>
      <td width="14%"><%=yjfy%> </td>
      <td align="right" width="12%">Ԥ�Ʋ���</td>
      <td width="13%"><%=yjcc%></td>
      
    <td width="12%" align="right">ʵ�ʷ���</td>
      
    <td width="13%"><%=sjfy%></td>
    <td width="11%" align="right">ʵ�ʲ���</td>
      
    <td width="14%"><%=sjcc%> </td>
    </tr>
  </table>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">��������</td>
	<td  width="4%">Ԥ���ܲ�ֵ�ֽ�</td>
	<td  width="4%">����ʵ�ʲ�ֵ</td>
	<td  width="4%">���ڿ�������</td>
	<td  width="4%">ƽ������</td>
	<td  width="9%">���ڻ</td>
	<td  width="4%">С��ռ����</td>
	<td  width="7%">��������1</td>
	<td  width="4%">��������1ռ����</td>
	<td  width="7%">��������2</td>
	<td  width="4%">��������2ռ����</td>
	<td  width="7%">��������3</td>
	<td  width="4%">��������3ռ����</td>
	<td  width="5%">��������</td>
	<td  width="6%">ʵ�ʷ�������</td>
	<td  width="4%">����ʵ�ʷ���</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="10%">��ע</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	ls_sql="SELECT khzq,yjzczfj,dqsjcz,dqkfhs,pjde,dqhd,xqzyl,jzds1,jzds1zyl,jzds2,jzds2zyl,jzds3,jzds3zyl,kfjd,sjfylx,dqsjfy,lrr,lrsj,bz  ";
	ls_sql+=" FROM yx_xqhdfygl  ";
	ls_sql+=" where  (xqbh='"+xqbh+"') and  (xqhdmc='"+xqhdmc+"')  ";
	ls_sql+=" order by khzq  ";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

 <form method="post" action="SaveInsertYx_xqhdfygl.jsp" name="insertform" >
 <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="30" colspan="4"><b>���ȼ�����</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���������Ƿ����</td>
      <td width="32%"><%
	cf.radioToken(out, "fasfwc","N+δ���&Y+���",fasfwc);
%></td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE2">��������</span></td>
      <td width="32%"> 
        <input name="khzq" type="text" value="" size="20" maxlength="50" >      </td>
      <td align="right" width="18%"><span class="STYLE2">Ԥ���ܲ�ֵ�ֽ�</span></td>
      <td width="32%"> 
        <input name="yjzczfj" type="text" value="" size="20" maxlength="16" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE2">����ʵ�ʲ�ֵ</span></td>
      <td width="32%"> 
        <input name="dqsjcz" type="text" value="" size="20" maxlength="16" >      </td>
      <td align="right" width="18%"><span class="STYLE2">���ڿ�������</span></td>
      <td width="32%"> 
        <input name="dqkfhs" type="text" value="" size="20" maxlength="8" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right">�������ǩ����</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE2">ƽ������</span></td>
      <td width="32%"> 
        <input name="pjde" type="text" value="" size="20" maxlength="16" >      </td>
      <td align="right" width="18%"><span class="STYLE2">���ڻ</span></td>
      <td width="32%"> 
        <input name="dqhd" type="text" value="" size="20" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE1">С��ռ����</span></td>
      <td width="32%"> 
        <input type="text" name="xqzyl" value="" size="20" maxlength="9" >      </td>
      <td align="right" width="18%"><span class="STYLE2">�Զ�����</span></td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��������</td>
      <td colspan="3"><textarea name="kfjd" cols="71" rows="3" id="kfjd"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��������1</td>
      <td width="32%"> 
        <input type="text" name="jzds1" value="" size="20" maxlength="50" >      </td>
      <td align="right" width="18%">��������1ռ����</td>
      <td width="32%"> 
        <input type="text" name="jzds1zyl" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��������2</td>
      <td width="32%"> 
        <input type="text" name="jzds2" value="" size="20" maxlength="50" >      </td>
      <td align="right" width="18%">��������2ռ����</td>
      <td width="32%"> 
        <input type="text" name="jzds2zyl" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��������3</td>
      <td width="32%"> 
        <input type="text" name="jzds3" value="" size="20" maxlength="50" >      </td>
      <td align="right" width="18%">��������3ռ����</td>
      <td width="32%"> 
        <input type="text" name="jzds3zyl" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">ʵ�ʷ�������</td>
      <td width="32%"> 
        <select name="sjfylx" style="FONT-SIZE:12PX;WIDTH:152PX" >
        </select>      </td>
      <td align="right" width="18%">����ʵ�ʷ���</td>
      <td width="32%"> 
        <input type="text" name="dqsjfy" value="" size="20" maxlength="16" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">����ʹ��˵��</td>
      <td colspan="3"><textarea name="fysysm" cols="71" rows="3" id="fysysm"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼����</td>
      <td width="32%"> 
		<input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%">¼��ʱ��</td>
      <td width="32%"> 
		<input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
		<input type="hidden" name="xqbh"  value="<%=xqbh%>" >
		<input type="hidden" name="xqmc"  value="<%=xqmc%>" >
		<input type="hidden" name="xqhdmc"  value="<%=xqhdmc%>" >
		<input type="hidden" name="fgsbh"  value="<%=fgsbh%>" >
       <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[��˾����]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("������[С������]��");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.khzq)=="") {
		alert("������[��������]��");
		FormName.khzq.focus();
		return false;
	}
	if(!(isNumber(FormName.yjzczfj, "Ԥ���ܲ�ֵ�ֽ�"))) {
		return false;
	}
	if(!(isNumber(FormName.dqsjcz, "����ʵ�ʲ�ֵ"))) {
		return false;
	}
	if(!(isNumber(FormName.dqkfhs, "���ڿ�������"))) {
		return false;
	}
	if(!(isNumber(FormName.pjde, "ƽ������"))) {
		return false;
	}
	if(!(isFloat(FormName.xqzyl, "С��ռ����"))) {
		return false;
	}
	if(!(isFloat(FormName.jzds1zyl, "��������1ռ����"))) {
		return false;
	}
	if(!(isFloat(FormName.jzds2zyl, "��������2ռ����"))) {
		return false;
	}
	if(!(isFloat(FormName.jzds3zyl, "��������3ռ����"))) {
		return false;
	}
	if(!(isNumber(FormName.dqsjfy, "����ʵ�ʷ���"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
