<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String sgd=null;
String cw_gdjsjl_jzbz=null;
String cw_gdjsjl_wdzgce=null;
String cw_gdjsjl_qye=null;
String cw_gdjsjl_zkl=null;
String cw_gdjsjl_zjxje=null;
String cw_gdjsjl_khjskze=null;
String cw_gdjsjl_khsskze=null;
String cw_gdjsjl_sjcb=null;
String cw_gdjsjl_sj=null;
String cw_gdjsjl_tdjs=null;
String cw_gdjsjl_glftd=null;
String cw_gdjsjl_glf=null;
String cw_gdjsjl_wxj=null;
String cw_gdjsjl_clf=null;
String cw_gdjsjl_zgclf=null;
String cw_gdjsjl_jkje=null;
String cw_gdjsjl_fakuan=null;
String cw_gdjsjl_kwxf=null;
String cw_gdjsjl_gckk=null;
String cw_gdjsjl_ksdf=null;
String cw_gdjsjl_kqtk=null;
String cw_gdjsjl_bk=null;
String cw_gdjsjl_gdjskze=null;
String cw_gdjsjl_jsr=null;
String cw_gdjsjl_jssj=null;
String cw_gdjsjl_jsdw=null;
String cw_gdjsjl_jsjd=null;
String cw_gdjsjl_fkbz=null;
String cw_gdjsjl_bz=null;
String cw_gdjsjl_gdjsjlh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_sjs=null;
String crm_khxx_hth=null;
String crm_khxx_zjxm=null;
String cw_gdjsjl_spjl=null;
String cw_gdjsjl_spyj=null;
String cw_gdjsjl_spr=null;
String cw_gdjsjl_spsj=null;
String cw_gdjsjl_fksj=null;
String cw_gdjsjl_fkr=null;
String cw_gdjsjl_tdjsje=null;
String cw_gdjsjl_cwjsr=null;
String cw_gdjsjl_cwjssj=null;
String cw_gdjsjl_cwjssm=null;
String cw_gdjsjl_sqgz=null;
String sjsfy=null;
String sgdfy=null;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String dejsje=null;

String wxjbfb=null;
String zjxxh=null;

String gdjsjlh=null;
gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select zjxxh,wxjbfb,cw_gdjsjl.khbh as khbh,cw_gdjsjl.sgd as sgd,cw_gdjsjl.jzbz as cw_gdjsjl_jzbz,cw_gdjsjl.wdzgce as cw_gdjsjl_wdzgce,cw_gdjsjl.qye as cw_gdjsjl_qye,cw_gdjsjl.zkl as cw_gdjsjl_zkl,cw_gdjsjl.zjxje as cw_gdjsjl_zjxje,cw_gdjsjl.khjskze as cw_gdjsjl_khjskze,cw_gdjsjl.khsskze as cw_gdjsjl_khsskze,cw_gdjsjl.sjcb as cw_gdjsjl_sjcb,cw_gdjsjl.sj as cw_gdjsjl_sj,cw_gdjsjl.tdjs as cw_gdjsjl_tdjs,cw_gdjsjl.glftd as cw_gdjsjl_glftd,cw_gdjsjl.glf as cw_gdjsjl_glf,cw_gdjsjl.wxj as cw_gdjsjl_wxj,cw_gdjsjl.clf as cw_gdjsjl_clf,cw_gdjsjl.zgclf as cw_gdjsjl_zgclf,cw_gdjsjl.jkje as cw_gdjsjl_jkje,cw_gdjsjl.fakuan as cw_gdjsjl_fakuan,cw_gdjsjl.kwxf as cw_gdjsjl_kwxf,cw_gdjsjl.gckk as cw_gdjsjl_gckk,cw_gdjsjl.ksdf as cw_gdjsjl_ksdf,cw_gdjsjl.kqtk as cw_gdjsjl_kqtk,cw_gdjsjl.bk as cw_gdjsjl_bk,cw_gdjsjl.gdjskze as cw_gdjsjl_gdjskze,cw_gdjsjl.jsr as cw_gdjsjl_jsr,cw_gdjsjl.jssj as cw_gdjsjl_jssj,cw_gdjsjl.jsdw as cw_gdjsjl_jsdw,cw_gdjsjl.jsjd as cw_gdjsjl_jsjd,cw_gdjsjl.fkbz as cw_gdjsjl_fkbz,cw_gdjsjl.bz as cw_gdjsjl_bz,cw_gdjsjl.gdjsjlh as cw_gdjsjl_gdjsjlh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.hth as crm_khxx_hth,crm_khxx.zjxm as crm_khxx_zjxm,cw_gdjsjl.spjl as cw_gdjsjl_spjl,cw_gdjsjl.spyj as cw_gdjsjl_spyj,cw_gdjsjl.spr as cw_gdjsjl_spr,cw_gdjsjl.spsj as cw_gdjsjl_spsj,cw_gdjsjl.fksj as cw_gdjsjl_fksj,cw_gdjsjl.fkr as cw_gdjsjl_fkr,cw_gdjsjl.tdjsje as cw_gdjsjl_tdjsje,cw_gdjsjl.cwjsr as cw_gdjsjl_cwjsr,cw_gdjsjl.cwjssj as cw_gdjsjl_cwjssj,cw_gdjsjl.cwjssm as cw_gdjsjl_cwjssm,cw_gdjsjl.sqgz as cw_gdjsjl_sqgz,cw_gdjsjl.sjsfy,cw_gdjsjl.sgdfy,cw_gdjsjl.zjfy,cw_gdjsjl.gsfy,cw_gdjsjl.qtfy,cw_gdjsjl.dejsje ";
	ls_sql+=" from  crm_khxx,cw_gdjsjl";
	ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh and  (cw_gdjsjl.gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		wxjbfb=cf.fillNull(rs.getString("wxjbfb"));

		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		cw_gdjsjl_jzbz=cf.fillNull(rs.getString("cw_gdjsjl_jzbz"));
		cw_gdjsjl_wdzgce=cf.fillNull(rs.getString("cw_gdjsjl_wdzgce"));
		cw_gdjsjl_qye=cf.fillNull(rs.getString("cw_gdjsjl_qye"));
		cw_gdjsjl_zkl=cf.fillNull(rs.getString("cw_gdjsjl_zkl"));
		cw_gdjsjl_zjxje=cf.fillNull(rs.getString("cw_gdjsjl_zjxje"));
		cw_gdjsjl_khjskze=cf.fillNull(rs.getString("cw_gdjsjl_khjskze"));
		cw_gdjsjl_khsskze=cf.fillNull(rs.getString("cw_gdjsjl_khsskze"));
		cw_gdjsjl_sjcb=cf.fillNull(rs.getString("cw_gdjsjl_sjcb"));
		cw_gdjsjl_sj=cf.fillNull(rs.getString("cw_gdjsjl_sj"));
		cw_gdjsjl_tdjs=cf.fillNull(rs.getString("cw_gdjsjl_tdjs"));
		cw_gdjsjl_glftd=cf.fillNull(rs.getString("cw_gdjsjl_glftd"));
		cw_gdjsjl_glf=cf.fillNull(rs.getString("cw_gdjsjl_glf"));
		cw_gdjsjl_wxj=cf.fillNull(rs.getString("cw_gdjsjl_wxj"));
		cw_gdjsjl_clf=cf.fillNull(rs.getString("cw_gdjsjl_clf"));
		cw_gdjsjl_zgclf=cf.fillNull(rs.getString("cw_gdjsjl_zgclf"));
		cw_gdjsjl_jkje=cf.fillNull(rs.getString("cw_gdjsjl_jkje"));
		cw_gdjsjl_fakuan=cf.fillNull(rs.getString("cw_gdjsjl_fakuan"));
		cw_gdjsjl_kwxf=cf.fillNull(rs.getString("cw_gdjsjl_kwxf"));
		cw_gdjsjl_gckk=cf.fillNull(rs.getString("cw_gdjsjl_gckk"));
		cw_gdjsjl_ksdf=cf.fillNull(rs.getString("cw_gdjsjl_ksdf"));
		cw_gdjsjl_kqtk=cf.fillNull(rs.getString("cw_gdjsjl_kqtk"));
		cw_gdjsjl_bk=cf.fillNull(rs.getString("cw_gdjsjl_bk"));
		cw_gdjsjl_gdjskze=cf.fillNull(rs.getString("cw_gdjsjl_gdjskze"));
		cw_gdjsjl_jsr=cf.fillNull(rs.getString("cw_gdjsjl_jsr"));
		cw_gdjsjl_jssj=cf.fillNull(rs.getDate("cw_gdjsjl_jssj"));
		cw_gdjsjl_jsdw=cf.fillNull(rs.getString("cw_gdjsjl_jsdw"));
		cw_gdjsjl_jsjd=cf.fillNull(rs.getString("cw_gdjsjl_jsjd"));
		cw_gdjsjl_fkbz=cf.fillNull(rs.getString("cw_gdjsjl_fkbz"));
		cw_gdjsjl_bz=cf.fillNull(rs.getString("cw_gdjsjl_bz"));
		cw_gdjsjl_gdjsjlh=cf.fillNull(rs.getString("cw_gdjsjl_gdjsjlh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_hth=cf.fillHtml(rs.getString("crm_khxx_hth"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		cw_gdjsjl_spjl=cf.fillNull(rs.getString("cw_gdjsjl_spjl"));
		cw_gdjsjl_spyj=cf.fillNull(rs.getString("cw_gdjsjl_spyj"));
		cw_gdjsjl_spr=cf.fillNull(rs.getString("cw_gdjsjl_spr"));
		cw_gdjsjl_spsj=cf.fillNull(rs.getDate("cw_gdjsjl_spsj"));
		cw_gdjsjl_fksj=cf.fillNull(rs.getDate("cw_gdjsjl_fksj"));
		cw_gdjsjl_fkr=cf.fillNull(rs.getString("cw_gdjsjl_fkr"));
		cw_gdjsjl_tdjsje=cf.fillNull(rs.getString("cw_gdjsjl_tdjsje"));
		cw_gdjsjl_cwjsr=cf.fillNull(rs.getString("cw_gdjsjl_cwjsr"));
		cw_gdjsjl_cwjssj=cf.fillNull(rs.getDate("cw_gdjsjl_cwjssj"));
		cw_gdjsjl_cwjssm=cf.fillNull(rs.getString("cw_gdjsjl_cwjssm"));
		cw_gdjsjl_sqgz=cf.fillNull(rs.getString("cw_gdjsjl_sqgz"));
		sjsfy=cf.fillNull(rs.getString("sjsfy"));
		sgdfy=cf.fillNull(rs.getString("sgdfy"));
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		dejsje=cf.fillNull(rs.getString("dejsje"));
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #000099;
	font-weight: bold;
}
.STYLE2 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<tr>
    <td width="100%"> 
      <div align="center"> ���ӽ����¼�������¼�ţ�<%=cw_gdjsjl_gdjsjlh%>��</div>    </td>
  </tr>
  <tr>
    
  <td width="100%" > 
    <table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
      <tr align="center"> 
        <td colspan="4"> <%
if (zjxxh.equals(""))
{
	%> 
          <input name="button" type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>')" value="���̽��㵥">
          <%
}
else{
	%> 
          <input name="button" type="button" onClick="window.open('/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxHList.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')" value="���̽��㵥">
          <%
}


%> 
          <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="�ͻ��տ���Ϣ">
          <input type="button" onClick="window.open('/cwgl/sgdjs/JkjlList.jsp?khbh=<%=khbh%>')" value="����¼">
          <input type="button" onClick="window.open('/cwgl/sgdjs/WxjlList.jsp?gdjsjlh=<%=gdjsjlh%>')" value="ά�޼�¼">
          <input type="button" onClick="window.open('/cwgl/sgdjs/FkjlList.jsp?gdjsjlh=<%=gdjsjlh%>')" value="�����¼">
          <input type="button" onClick="window.open('/cwgl/sgdjs/KqtkList.jsp?gdjsjlh=<%=gdjsjlh%>')" value="��������">
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">�������</td>
        <td bgcolor="#CCCCFF"><%
	cf.selectToken(out,"1+���㲿����&2+��������&3+�������",cw_gdjsjl_jsjd,true);
%></td>
        <td align="right" bgcolor="#CCCCFF">��������</td>
        <td bgcolor="#CCCCFF"><%
	cf.radioToken(out, "3+ͨ��&4+δͨ��",cw_gdjsjl_spjl,true);
%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="22%" bgcolor="#CCCCFF"> 
          <div align="right">�ͻ����</div>
        </td>
        <td width="28%" bgcolor="#CCCCFF"> <%=khbh%> </td>
        <td width="24%" bgcolor="#CCCCFF"> 
          <div align="right">��ͬ��</div>
        </td>
        <td width="26%" bgcolor="#CCCCFF"><%=crm_khxx_hth%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">���ݵ�ַ</td>
        <td colspan="3" bgcolor="#CCCCFF"><%=crm_khxx_fwdz%> </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td bgcolor="#CCCCFF"> 
          <div align="right">�ͻ�����</div>
        </td>
        <td bgcolor="#CCCCFF"><%=crm_khxx_khxm%></td>
        <td bgcolor="#CCCCFF"> 
          <div align="right">��ϵ��ʽ</div>
        </td>
        <td bgcolor="#CCCCFF"><%=crm_khxx_lxfs%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td bgcolor="#CCCCFF"> 
          <div align="right">���ʦ</div>
        </td>
        <td bgcolor="#CCCCFF"><%=crm_khxx_sjs%></td>
        <td bgcolor="#CCCCFF"> 
          <div align="right">�ʼ�</div>
        </td>
        <td bgcolor="#CCCCFF"><%=crm_khxx_zjxm%> </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#FFFFCC">ʩ����</td>
        <td bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
        <td align="right" bgcolor="#FFFFCC">��װ��־</td>
        <td bgcolor="#FFFFCC"><%
	cf.selectToken(out,"1+��װ&2+��װ",cw_gdjsjl_jzbz,true);
%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="22%" bgcolor="#FFFFCC"> 
          <div align="right">����ǩԼ��</div>
        </td>
        <td width="28%" bgcolor="#FFFFCC"><%=cw_gdjsjl_qye%></td>
        <td width="24%" bgcolor="#FFFFCC"> 
          <div align="right">δ���۹��̶�</div>
        </td>
        <td width="26%" bgcolor="#FFFFCC"> <%=cw_gdjsjl_wdzgce%> </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="22%" bgcolor="#FFFFCC"> 
          <div align="right">��������</div>
        </td>
        <td width="28%" bgcolor="#FFFFCC"><%=cw_gdjsjl_zjxje%></td>
        <td width="24%" bgcolor="#FFFFCC"> 
          <div align="right">����ʵ�տ��ܶ�</div>
        </td>
        <td width="26%" bgcolor="#FFFFCC"><%=cw_gdjsjl_khsskze%> </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="22%" bgcolor="#FFFFCC"> 
          <div align="right">�ۿ���</div>
        </td>
        <td width="28%" bgcolor="#FFFFCC"><%=cw_gdjsjl_zkl%> </td>
        <td width="24%" bgcolor="#FFFFCC"> 
          <div align="right"></div>
        </td>
        <td width="26%" bgcolor="#FFFFCC">&nbsp; </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">�ͻ�������</td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_khjskze%></td>
        <td align="right" bgcolor="#CCCCFF">ʵ�ʳɱ�</td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_sjcb%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">������</td>
        <td bgcolor="#CCCCFF"><%
	cf.selectToken(out,"1+�ͻ�������&2+ʵ�տ�&3+ǩԼ��&4+ʵ�ʳɱ�&9+����",cw_gdjsjl_tdjs,true);
%></td>
        <td align="right" bgcolor="#CCCCFF">���������</td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_tdjsje%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">���̿ۿ�</td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_gckk%></td>
        <td align="right" bgcolor="#CCCCFF">���ʦ�е��ۿ�</td>
        <td bgcolor="#CCCCFF"><%=sjsfy%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">ʩ���ӳе��ۿ�</td>
        <td bgcolor="#CCCCFF"><%=sgdfy%></td>
        <td align="right" bgcolor="#CCCCFF">�ʼ�е��ۿ�</td>
        <td bgcolor="#CCCCFF"><%=zjfy%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">��˾�е��ۿ�</td>
        <td bgcolor="#CCCCFF"><%=gsfy%></td>
        <td align="right" bgcolor="#CCCCFF">�������е��ۿ�</td>
        <td bgcolor="#CCCCFF"><%=qtfy%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">��������</td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_glftd%>%</td>
        <td align="right" bgcolor="#CCCCFF">�����</td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_glf%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">ά�޽�ٷֱ�</td>
        <td bgcolor="#CCCCFF"><%=wxjbfb%>%</td>
        <td align="right" bgcolor="#CCCCFF">ά�޽�</td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_wxj%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">����</td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_bk%></td>
        <td align="right" bgcolor="#CCCCFF">���������</td>
        <td bgcolor="#CCCCFF"><%=dejsje%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#FFFFCC">��ά�޷�</td>
        <td bgcolor="#FFFFCC"><%=cw_gdjsjl_kwxf%></td>
        <td align="right" bgcolor="#FFFFCC">˰��</td>
        <td bgcolor="#FFFFCC"><%=cw_gdjsjl_sj%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#FFFFCC">�������Ϸ�</td>
        <td bgcolor="#FFFFCC"><%=cw_gdjsjl_clf%></td>
        <td align="right" bgcolor="#FFFFCC">�Թ����Ϸ�</td>
        <td bgcolor="#FFFFCC"><%=cw_gdjsjl_zgclf%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#FFFFCC">�����</td>
        <td bgcolor="#FFFFCC"><%=cw_gdjsjl_jkje%></td>
        <td align="right" bgcolor="#FFFFCC">������</td>
        <td bgcolor="#FFFFCC"><%=cw_gdjsjl_fakuan%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#FFFFCC">��������</td>
        <td bgcolor="#FFFFCC"><%=cw_gdjsjl_kqtk%></td>
        <td align="right" bgcolor="#FFFFCC">��ˮ���</td>
        <td bgcolor="#FFFFCC"><%=cw_gdjsjl_ksdf%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="22%" bgcolor="#FFFFCC"> 
          <div align="right">���ӽ�����ܶ�</div>
        </td>
        <td width="28%" bgcolor="#FFFFCC"> <%=cw_gdjsjl_gdjskze%> </td>
        <td width="24%" bgcolor="#FFFFCC"> 
          <div align="right">˰ǰ����</div>
        </td>
        <td width="26%" bgcolor="#FFFFCC"><%=cw_gdjsjl_sqgz%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">������</td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_jsr%></td>
        <td align="right" bgcolor="#CCCCFF">����ʱ��</td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_jssj%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td bgcolor="#CCCCFF" align="right">���㵥λ</td>
        <td bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_gdjsjl_jsdw+"'",cw_gdjsjl_jsdw,true);
%></td>
        <td bgcolor="#CCCCFF">&nbsp;</td>
        <td bgcolor="#CCCCFF">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td bgcolor="#CCCCFF"> 
          <div align="right">������</div>
        </td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_spr%> </td>
        <td bgcolor="#CCCCFF"> 
          <div align="right">����ʱ��</div>
        </td>
        <td bgcolor="#CCCCFF"><%=cw_gdjsjl_spsj%> </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">�������</td>
        <td colspan="3" bgcolor="#CCCCFF"><%=cw_gdjsjl_spyj%></td>
      </tr>
      <tr bgcolor="#CCCCFF"> 
        <td align="right">���������</td>
        <td><%=cw_gdjsjl_cwjsr%></td>
        <td align="right">�������ʱ��</td>
        <td><%=cw_gdjsjl_cwjssj%></td>
      </tr>
      <tr bgcolor="#CCCCFF"> 
        <td align="right">�������˵��</td>
        <td colspan="3"><%=cw_gdjsjl_cwjssm%></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td align="right" bgcolor="#CCCCFF">��ע</td>
        <td colspan="3" bgcolor="#CCCCFF"><%=cw_gdjsjl_bz%></td>
      </tr>
    </table>
</body>
</html>

