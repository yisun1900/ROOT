<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String kp_xjgdjl_xjjlh=null;
String kp_xjgdjl_khbh=null;
String kp_xjgdjl_xjr=null;
String kp_xjgdjl_xjsj=null;
String kp_xjgdjl_xjlxbm=null;
String dm_xjjgbm_xjjgmc=null;
String kp_xjgdjl_lrr=null;
String kp_xjgdjl_lrsj=null;
String kp_xjgdjl_bz=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String kpbz=null;
String cfspbz=null;
String kpjlh=null;
String spyj=null;
String spr=null;
String spsj=null;
String xjjlh=null;
xjjlh=cf.GB2Uni(request.getParameter("xjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select kp_xjgdjl.spsj,kp_xjgdjl.spr,kp_xjgdjl.spyj,kp_xjgdjl.kpjlh,kp_xjgdjl.cfspbz,kp_xjgdjl.kpbz,kp_xjgdjl.xjjlh as kp_xjgdjl_xjjlh,kp_xjgdjl.khbh as kp_xjgdjl_khbh,kp_xjgdjl.xjr as kp_xjgdjl_xjr,kp_xjgdjl.xjsj as kp_xjgdjl_xjsj,kp_xjgdjl.xjlxbm as kp_xjgdjl_xjlxbm,dm_xjjgbm.xjjgmc as dm_xjjgbm_xjjgmc,kp_xjgdjl.lrr as kp_xjgdjl_lrr,kp_xjgdjl.lrsj as kp_xjgdjl_lrsj,kp_xjgdjl.bz as kp_xjgdjl_bz,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm ";
	ls_sql+=" from  crm_khxx,dm_xjjgbm,kp_xjgdjl";
	ls_sql+=" where kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm and kp_xjgdjl.khbh=crm_khxx.khbh and  (kp_xjgdjl.xjjlh='"+xjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		spsj=cf.fillNull(rs.getDate("spsj"));
		spr=cf.fillNull(rs.getString("spr"));
		spyj=cf.fillNull(rs.getString("spyj"));
		kpjlh=cf.fillNull(rs.getString("kpjlh"));
		cfspbz=cf.fillNull(rs.getString("cfspbz"));
		kpbz=cf.fillNull(rs.getString("kpbz"));
		kp_xjgdjl_xjjlh=cf.fillNull(rs.getString("kp_xjgdjl_xjjlh"));
		kp_xjgdjl_khbh=cf.fillNull(rs.getString("kp_xjgdjl_khbh"));
		kp_xjgdjl_xjr=cf.fillNull(rs.getString("kp_xjgdjl_xjr"));
		kp_xjgdjl_xjsj=cf.fillNull(rs.getDate("kp_xjgdjl_xjsj"));
		kp_xjgdjl_xjlxbm=cf.fillNull(rs.getString("kp_xjgdjl_xjlxbm"));
		dm_xjjgbm_xjjgmc=cf.fillNull(rs.getString("dm_xjjgbm_xjjgmc"));
		kp_xjgdjl_lrr=cf.fillNull(rs.getString("kp_xjgdjl_lrr"));
		kp_xjgdjl_lrsj=cf.fillNull(rs.getDate("kp_xjgdjl_lrsj"));
		kp_xjgdjl_bz=cf.fillNull(rs.getString("kp_xjgdjl_bz"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));

		if (spr.equals(""))
		{
			spr=yhdlm;
		}
		if (spsj.equals(""))
		{
			spsj=cf.today();
		}
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
<title>ʩ���Ӵ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">ʩ���Ӵ�����Ѳ���¼�ţ�<%=xjjlh%>��</div>
<form method="post" action="SaveSpKp_xjgdjl.jsp" name="insertform" >
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">����������־</td>
      <td width="32%"> 
        <select name="cfspbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getKpxm(insertform)">
          <option value=""></option>
          <%
	cf.selectToken(out,"3+�������账��&4+���������账��","");
%> 
        </select>
      </td>
      <td width="18%" align="right">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">������</td>
      <td width="32%"> 
        <input type="text" name="spr" value="<%=spr%>" size="20" maxlength="20" readonly>
      </td>
      <td width="18%" align="right">����ʱ��</td>
      <td width="32%"> 
        <input type="text" name="spsj" value="<%=spsj%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">�������</td>
      <td colspan="3"> 
        <textarea name="spyj" rows="3" cols="71"><%=spyj%></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="xjjlh" value="<%=xjjlh%>" size="20" maxlength="9" readonly>
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">�ͻ�����</td>
      <td width="32%"><%=crm_khxx_khxm%></td>
      <td width="18%" align="right">��ͬ��</td>
      <td width="32%"><%=crm_khxx_hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">���ݵ�ַ</td>
      <td colspan="3"><%=crm_khxx_fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="32%"><%=crm_khxx_lxfs%> </td>
      <td width="18%"> 
        <div align="right">���ʦ</div>
      </td>
      <td width="32%"> <%=crm_khxx_sjs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">ʩ����</div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_khxx_sgd,true);
%> </td>
      <td width="18%"> 
        <div align="right">�ʼ�</div>
      </td>
      <td width="32%"> <%=crm_khxx_zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">ǩԼ����</div>
      </td>
      <td width="32%"> <%=crm_khxx_qyrq%> </td>
      <td width="18%"> 
        <div align="right">ǩԼ����</div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",crm_khxx_dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">������־</td>
      <td width="32%"><%
	cf.selectToken(out,"N+δ����&Y+�ѿ���",kpbz,true);
%></td>
      <td width="18%" align="right">������¼��</td>
      <td width="32%"><%=kpjlh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">Ѳ����</div>
      </td>
      <td width="32%"> <%=kp_xjgdjl_xjr%> </td>
      <td width="18%"> 
        <div align="right">Ѳ��ʱ��</div>
      </td>
      <td width="32%"> <%=kp_xjgdjl_xjsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">Ѳ������</div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",kp_xjgdjl_xjlxbm,true);
%> </td>
      <td width="18%"> 
        <div align="right">Ѳ����</div>
      </td>
      <td width="32%"> <%=dm_xjjgbm_xjjgmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">¼����</div>
      </td>
      <td width="32%"> <%=kp_xjgdjl_lrr%> </td>
      <td width="18%"> 
        <div align="right">¼��ʱ��</div>
      </td>
      <td width="32%"> <%=kp_xjgdjl_lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">Ѳ�챸ע</td>
      <td colspan="3"><%=kp_xjgdjl_bz%></td>
    </tr>
  </table>
</form>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">Ѳ�����</td>
	<td  width="15%">Ѳ����Ŀ</td>
	<td  width="8%">Ѳ����</td>
	<td  width="10%">�۷�</td>
	<td  width="14%">Ѳ�촦��</td>
	<td  width="30%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT kp_kpdlbm.kpdlmc as kp_kpdlbm_kpdlmc,kp_gckpxm.kpxmmc as kp_gckpxm_kpxmmc, DECODE(kp_xjgdmx.kpjg,'1','��΢Υ��','2','����Υ��','3','�ر�����') as kpjgmc,kpkfmc,kp_kpcfbm.kpcfmc as kp_kpcfbm_kpcfmc,kp_xjgdmx.bz  ";
	ls_sql+=" FROM kp_xjgdmx,kp_gckpxm,kp_kpdlbm,kp_kpcfbm,kp_kpkfbm  ";
    ls_sql+=" where kp_xjgdmx.kpxmbm=kp_gckpxm.kpxmbm and kp_xjgdmx.kpjg=kp_gckpxm.kpjg and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm";
    ls_sql+=" and kp_xjgdmx.kpcfbm=kp_kpcfbm.kpcfbm(+) and kp_xjgdmx.kpkfbm=kp_kpkfbm.kpkfbm(+)";
    ls_sql+=" and kp_xjgdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_xjgdmx.kpxmbm,kp_xjgdmx.kpjg";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_kpdlbm_kpdlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cfspbz)=="") {
		alert("������[����������־]��");
		FormName.cfspbz.focus();
		return false;
	}

	if(	javaTrim(FormName.spr)=="") {
		alert("������[������]��");
		FormName.spr.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("������[����ʱ��]��");
		FormName.spsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.spsj, "����ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
