<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yx_xqcxhdgl_xqmc=null;
String yx_lsdcb_dqbm=null;
String yx_lsdcb_cqbm=null;
String yx_xqcxhdgl_yjfy=null;
String yx_xqcxhdgl_yjcc=null;
String yx_xqcxhdgl_sjfy=null;
String yx_xqcxhdgl_sjcc=null;
String yx_xqcxhdgl_spjl=null;
String yx_xqcxhdgl_spr=null;
String yx_xqcxhdgl_spsj=null;
String yx_xqcxhdgl_spyj=null;
String yx_xqcxhdgl_lrr=null;
String yx_xqcxhdgl_lrsj=null;
String yx_xqcxhdgl_fgsbh=null;
String yx_xqcxhdgl_bz=null;
String yx_lsdcb_kfs=null;
String yx_lsdcb_fyssj=null;
String yx_lsdcb_jw=null;
String yx_xqcxhdgl_spzt=null;
String yx_xqcxhdgl_scbfzr=null;
String yx_xqcxhdgl_scbfzrdh=null;
String yx_xqcxhdgl_scbzrs=null;
String yx_xqcxhdgl_scbsffz=null;
String yx_xqcxhdgl_gjjzgwrs=null;
String yx_xqcxhdgl_ryydl=null;
String yx_xqcxhdgl_kfql=null;
String yx_xqcxhdgl_fasfwc=null;
String yx_xqcxhdgl_kfxs=null;
String yx_lsdcb_xqmc=null;
String yx_lsdcb_dz=null;
String yx_lsdcb_lxsj=null;
String yx_lsdcb_kfslxr=null;
String yx_lsdcb_kfslxrzw=null;
String yx_lsdcb_kfslxrdh=null;
String yx_lsdcb_wygsmc=null;
String yx_lsdcb_wydh=null;
String yx_lsdcb_wylxr=null;
String yx_lsdcb_wylxrzw=null;
String yx_lsdcb_xz=null;
String yx_lsdcb_wyxs=null;
String yx_lsdcb_zlhx=null;
String yx_lsdcb_zlhxmj=null;
String yx_lsdcb_jfhs=null;
String yx_lsdcb_xqfzr=null;
String yx_lsdcb_xqfzrdh=null;
String yx_lsdcb_lrr=null;
String yx_lsdcb_lrsj=null;
String yx_lsdcb_fgsbh=null;
String kfmb=null;
String xqhdmc=null;

String whereyx_xqcxhdgl_xqmc=cf.getParameter(request,"xqmc");
String whereyx_xqcxhdgl_fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	ls_sql="select xqhdmc,kfmb,yx_xqcxhdgl.xqmc as yx_xqcxhdgl_xqmc,yx_lsdcb.dqbm as yx_lsdcb_dqbm,yx_lsdcb.cqbm as yx_lsdcb_cqbm,yx_xqcxhdgl.yjfy as yx_xqcxhdgl_yjfy,yx_xqcxhdgl.yjcc as yx_xqcxhdgl_yjcc,yx_xqcxhdgl.sjfy as yx_xqcxhdgl_sjfy,yx_xqcxhdgl.sjcc as yx_xqcxhdgl_sjcc,yx_xqcxhdgl.spjl as yx_xqcxhdgl_spjl,yx_xqcxhdgl.spr as yx_xqcxhdgl_spr,yx_xqcxhdgl.spsj as yx_xqcxhdgl_spsj,yx_xqcxhdgl.spyj as yx_xqcxhdgl_spyj,yx_xqcxhdgl.lrr as yx_xqcxhdgl_lrr,yx_xqcxhdgl.lrsj as yx_xqcxhdgl_lrsj,yx_xqcxhdgl.fgsbh as yx_xqcxhdgl_fgsbh,yx_xqcxhdgl.bz as yx_xqcxhdgl_bz,yx_lsdcb.kfs as yx_lsdcb_kfs,yx_lsdcb.fyssj as yx_lsdcb_fyssj,yx_lsdcb.jw as yx_lsdcb_jw,yx_xqcxhdgl.spzt as yx_xqcxhdgl_spzt,yx_xqcxhdgl.scbfzr as yx_xqcxhdgl_scbfzr,yx_xqcxhdgl.scbfzrdh as yx_xqcxhdgl_scbfzrdh,yx_xqcxhdgl.scbzrs as yx_xqcxhdgl_scbzrs,yx_xqcxhdgl.scbsffz as yx_xqcxhdgl_scbsffz,yx_xqcxhdgl.gjjzgwrs as yx_xqcxhdgl_gjjzgwrs,yx_xqcxhdgl.ryydl as yx_xqcxhdgl_ryydl,yx_xqcxhdgl.kfql as yx_xqcxhdgl_kfql,yx_xqcxhdgl.fasfwc as yx_xqcxhdgl_fasfwc,yx_xqcxhdgl.kfxs as yx_xqcxhdgl_kfxs,yx_lsdcb.xqmc as yx_lsdcb_xqmc,yx_lsdcb.dz as yx_lsdcb_dz,yx_lsdcb.lxsj as yx_lsdcb_lxsj,yx_lsdcb.kfslxr as yx_lsdcb_kfslxr,yx_lsdcb.kfslxrzw as yx_lsdcb_kfslxrzw,yx_lsdcb.kfslxrdh as yx_lsdcb_kfslxrdh,yx_lsdcb.wygsmc as yx_lsdcb_wygsmc,yx_lsdcb.wydh as yx_lsdcb_wydh,yx_lsdcb.wylxr as yx_lsdcb_wylxr,yx_lsdcb.wylxrzw as yx_lsdcb_wylxrzw,yx_lsdcb.xz as yx_lsdcb_xz,yx_lsdcb.wyxs as yx_lsdcb_wyxs,yx_lsdcb.zlhx as yx_lsdcb_zlhx,yx_lsdcb.zlhxmj as yx_lsdcb_zlhxmj,yx_lsdcb.jfhs as yx_lsdcb_jfhs,yx_lsdcb.xqfzr as yx_lsdcb_xqfzr,yx_lsdcb.xqfzrdh as yx_lsdcb_xqfzrdh,yx_lsdcb.lrr as yx_lsdcb_lrr,yx_lsdcb.lrsj as yx_lsdcb_lrsj,yx_lsdcb.fgsbh as yx_lsdcb_fgsbh ";
	ls_sql+=" from  yx_lsdcb,yx_xqcxhdgl";
	ls_sql+=" where yx_xqcxhdgl.xqmc=yx_lsdcb.xqmc and  (yx_xqcxhdgl.xqmc='"+whereyx_xqcxhdgl_xqmc+"') and  (yx_xqcxhdgl.fgsbh='"+whereyx_xqcxhdgl_fgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kfmb=cf.fillNull(rs.getString("kfmb"));
		xqhdmc=cf.fillNull(rs.getString("xqhdmc"));
		yx_xqcxhdgl_xqmc=cf.fillNull(rs.getString("yx_xqcxhdgl_xqmc"));
		yx_lsdcb_dqbm=cf.fillNull(rs.getString("yx_lsdcb_dqbm"));
		yx_lsdcb_cqbm=cf.fillNull(rs.getString("yx_lsdcb_cqbm"));
		yx_xqcxhdgl_yjfy=cf.fillNull(rs.getString("yx_xqcxhdgl_yjfy"));
		yx_xqcxhdgl_yjcc=cf.fillNull(rs.getString("yx_xqcxhdgl_yjcc"));
		yx_xqcxhdgl_sjfy=cf.fillNull(rs.getString("yx_xqcxhdgl_sjfy"));
		yx_xqcxhdgl_sjcc=cf.fillNull(rs.getString("yx_xqcxhdgl_sjcc"));
		yx_xqcxhdgl_spjl=cf.fillNull(rs.getString("yx_xqcxhdgl_spjl"));
		yx_xqcxhdgl_spr=cf.fillNull(rs.getString("yx_xqcxhdgl_spr"));
		yx_xqcxhdgl_spsj=cf.fillNull(rs.getDate("yx_xqcxhdgl_spsj"));
		yx_xqcxhdgl_spyj=cf.fillNull(rs.getString("yx_xqcxhdgl_spyj"));
		yx_xqcxhdgl_lrr=cf.fillNull(rs.getString("yx_xqcxhdgl_lrr"));
		yx_xqcxhdgl_lrsj=cf.fillNull(rs.getDate("yx_xqcxhdgl_lrsj"));
		yx_xqcxhdgl_fgsbh=cf.fillNull(rs.getString("yx_xqcxhdgl_fgsbh"));
		yx_xqcxhdgl_bz=cf.fillNull(rs.getString("yx_xqcxhdgl_bz"));
		yx_lsdcb_kfs=cf.fillNull(rs.getString("yx_lsdcb_kfs"));
		yx_lsdcb_fyssj=cf.fillNull(rs.getDate("yx_lsdcb_fyssj"));
		yx_lsdcb_jw=cf.fillNull(rs.getString("yx_lsdcb_jw"));
		yx_xqcxhdgl_spzt=cf.fillNull(rs.getString("yx_xqcxhdgl_spzt"));
		yx_xqcxhdgl_scbfzr=cf.fillNull(rs.getString("yx_xqcxhdgl_scbfzr"));
		yx_xqcxhdgl_scbfzrdh=cf.fillNull(rs.getString("yx_xqcxhdgl_scbfzrdh"));
		yx_xqcxhdgl_scbzrs=cf.fillNull(rs.getString("yx_xqcxhdgl_scbzrs"));
		yx_xqcxhdgl_scbsffz=cf.fillNull(rs.getString("yx_xqcxhdgl_scbsffz"));
		yx_xqcxhdgl_gjjzgwrs=cf.fillNull(rs.getString("yx_xqcxhdgl_gjjzgwrs"));
		yx_xqcxhdgl_ryydl=cf.fillNull(rs.getString("yx_xqcxhdgl_ryydl"));
		yx_xqcxhdgl_kfql=cf.fillNull(rs.getString("yx_xqcxhdgl_kfql"));
		yx_xqcxhdgl_fasfwc=cf.fillNull(rs.getString("yx_xqcxhdgl_fasfwc"));
		yx_xqcxhdgl_kfxs=cf.fillNull(rs.getString("yx_xqcxhdgl_kfxs"));
		yx_lsdcb_xqmc=cf.fillNull(rs.getString("yx_lsdcb_xqmc"));
		yx_lsdcb_dz=cf.fillNull(rs.getString("yx_lsdcb_dz"));
		yx_lsdcb_lxsj=cf.fillNull(rs.getDate("yx_lsdcb_lxsj"));
		yx_lsdcb_kfslxr=cf.fillNull(rs.getString("yx_lsdcb_kfslxr"));
		yx_lsdcb_kfslxrzw=cf.fillNull(rs.getString("yx_lsdcb_kfslxrzw"));
		yx_lsdcb_kfslxrdh=cf.fillNull(rs.getString("yx_lsdcb_kfslxrdh"));
		yx_lsdcb_wygsmc=cf.fillNull(rs.getString("yx_lsdcb_wygsmc"));
		yx_lsdcb_wydh=cf.fillNull(rs.getString("yx_lsdcb_wydh"));
		yx_lsdcb_wylxr=cf.fillNull(rs.getString("yx_lsdcb_wylxr"));
		yx_lsdcb_wylxrzw=cf.fillNull(rs.getString("yx_lsdcb_wylxrzw"));
		yx_lsdcb_xz=cf.fillNull(rs.getString("yx_lsdcb_xz"));
		yx_lsdcb_wyxs=cf.fillNull(rs.getString("yx_lsdcb_wyxs"));
		yx_lsdcb_zlhx=cf.fillNull(rs.getString("yx_lsdcb_zlhx"));
		yx_lsdcb_zlhxmj=cf.fillNull(rs.getString("yx_lsdcb_zlhxmj"));
		yx_lsdcb_jfhs=cf.fillNull(rs.getString("yx_lsdcb_jfhs"));
		yx_lsdcb_xqfzr=cf.fillNull(rs.getString("yx_lsdcb_xqfzr"));
		yx_lsdcb_xqfzrdh=cf.fillNull(rs.getString("yx_lsdcb_xqfzrdh"));
		yx_lsdcb_lrr=cf.fillNull(rs.getString("yx_lsdcb_lrr"));
		yx_lsdcb_lrsj=cf.fillNull(rs.getDate("yx_lsdcb_lrsj"));
		yx_lsdcb_fgsbh=cf.fillNull(rs.getString("yx_lsdcb_fgsbh"));
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> С�������</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> С������ </td>
    <td width="32%"> <%=yx_xqcxhdgl_xqmc%> </td>
    <td align="right" width="19%">��˾</td>
    <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",yx_xqcxhdgl_fgsbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">С�������</td>
    <td colspan="3"><%=xqhdmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ���� </td>
    <td width="32%"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",yx_lsdcb_cqbm,true);
%> </td>
    <td align="right" width="19%">��ַ</td>
    <td width="31%"><%=yx_lsdcb_dz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">������</td>
    <td width="32%"><%=yx_lsdcb_kfs%></td>
    <td align="right" width="19%">����ʱ��</td>
    <td width="31%"><%=yx_lsdcb_lxsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ��������ϵ�� </td>
    <td width="32%"> <%=yx_lsdcb_kfslxr%> </td>
    <td align="right" width="19%"> ��������ϵ��ְ�� </td>
    <td width="31%"> <%=yx_lsdcb_kfslxrzw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ��������ϵ�˵绰 </td>
    <td width="32%"> <%=yx_lsdcb_kfslxrdh%> </td>
    <td align="right" width="19%"> ��ҵ��˾���� </td>
    <td width="31%"> <%=yx_lsdcb_wygsmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ��ҵ�绰 </td>
    <td width="32%"> <%=yx_lsdcb_wydh%> </td>
    <td align="right" width="19%"> ��ҵ��ϵ�� </td>
    <td width="31%"> <%=yx_lsdcb_wylxr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ��ҵ��ϵ��ְ�� </td>
    <td width="32%"> <%=yx_lsdcb_wylxrzw%> </td>
    <td align="right" width="19%"> ¥������ </td>
    <td width="31%"> <%=yx_lsdcb_xz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ��ҵ��ʽ </td>
    <td width="32%"> <%=yx_lsdcb_wyxs%> </td>
    <td align="right" width="19%"> �������� </td>
    <td width="31%"> <%=yx_lsdcb_zlhx%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ����������� </td>
    <td width="32%"> <%=yx_lsdcb_zlhxmj%> </td>
    <td align="right" width="19%"> �������� </td>
    <td width="31%"> <%=yx_lsdcb_jfhs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> С�������� </td>
    <td width="32%"> <%=yx_lsdcb_xqfzr%> </td>
    <td align="right" width="19%"> С�������˵绰 </td>
    <td width="31%"> <%=yx_lsdcb_xqfzrdh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ��Կ��ʱ�� </td>
    <td width="32%"> <%=yx_lsdcb_fyssj%> </td>
    <td align="right" width="19%"> ��λ </td>
    <td width="31%"> <%=yx_lsdcb_jw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">�г��������� </td>
    <td width="32%"><%=yx_xqcxhdgl_scbfzr%> </td>
    <td align="right" width="19%">�г��������˵绰 </td>
    <td width="31%"><%=yx_xqcxhdgl_scbfzrdh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">�г��������� </td>
    <td width="32%"><%=yx_xqcxhdgl_scbzrs%> </td>
    <td align="right" width="19%">�г����Ƿ���� </td>
    <td width="31%"><%
	cf.radioToken(out, "N+δ����&Y+����",yx_xqcxhdgl_scbsffz,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">�߼���װ�������� </td>
    <td width="32%"><%=yx_xqcxhdgl_gjjzgwrs%> </td>
    <td align="right" width="19%">��Ա�춯�� </td>
    <td width="31%"><%=yx_xqcxhdgl_ryydl%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> </td>
    <td width="32%"> </td>
    <td align="right" width="19%">���������Ƿ���� </td>
    <td width="31%"><%
	cf.radioToken(out, "N+δ���&Y+���",yx_xqcxhdgl_fasfwc,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ����Ǳ�� </td>
    <td width="32%"> <%=yx_xqcxhdgl_kfql%> </td>
    <td align="right" width="19%">������ʽ </td>
    <td width="31%"><%=yx_xqcxhdgl_kfxs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">Ԥ�Ʒ���</td>
    <td width="32%"><%=yx_xqcxhdgl_yjfy%></td>
    <td align="right" width="19%">Ԥ�Ʋ��� </td>
    <td width="31%"><%=yx_xqcxhdgl_yjcc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">����Ŀ��</td>
    <td colspan="3"><%=kfmb%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">ʵ�ʷ��� </td>
    <td width="32%"><%=yx_xqcxhdgl_sjfy%> </td>
    <td align="right" width="19%">ʵ�ʲ��� </td>
    <td width="31%"><%=yx_xqcxhdgl_sjcc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">�������� </td>
    <td width="32%"><%
	cf.selectToken(out,"Y+ͬ��&N+��ͬ��",yx_xqcxhdgl_spjl,true);
%> </td>
    <td align="right" width="19%">����״̬ </td>
    <td width="31%"><%
	cf.selectToken(out,"1+δ����&2+����",yx_xqcxhdgl_spzt,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ������ </td>
    <td width="32%"> <%=yx_xqcxhdgl_spr%> </td>
    <td align="right" width="19%"> ����ʱ�� </td>
    <td width="31%"> <%=yx_xqcxhdgl_spsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ������� </td>
    <td colspan="3"> <%=yx_xqcxhdgl_spyj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">¼���� </td>
    <td width="32%"><%=yx_xqcxhdgl_lrr%> </td>
    <td align="right" width="19%">¼��ʱ�� </td>
    <td width="31%"><%=yx_xqcxhdgl_lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ��ע </td>
    <td colspan="3"> <%=yx_xqcxhdgl_bz%> </td>
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
	ls_sql+=" where xqmc='"+whereyx_xqcxhdgl_xqmc+"' and  fgsbh='"+whereyx_xqcxhdgl_fgsbh+"'";
	ls_sql+=" order by khzq  ";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>


</body>
</html>
